//
//  ScannerViewController.swift
//  WinCoBulkHelperPoC
//
//  Created by William Moody on 1/23/20.
//  Copyright © 2020 William Moody. All rights reserved.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rowNameTextField: UITextField!
    @IBOutlet weak var manualBarcodeImputButton: UIButton!
    
    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    var row: Row?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRowCheck()
        
        // Get the back-facing camera for capturing videos
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("Failed to get the camera device")
            return
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        captureSession.startRunning()
        
        // Move the message label and top bar to the front
        view.bringSubviewToFront(messageLabel)
        view.bringSubviewToFront(manualBarcodeImputButton)
        
        // Initialize QR Code Frame to highlight the QR code
        qrCodeFrameView = UIView()
        
        if let qrCodeFrameView = qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - New Row funtions
    @IBAction func addItemButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Imput Barcode", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let searchAction = UIAlertAction(title: "Add", style: .default) { (_) in
            let textfield = alertController.textFields?.first
            
            if let item = ItemController.shared.searchForItemWith(barcode: textfield?.text ?? "") {
                self.setItemLocation(item: item, row: self.row!)
            } else {
                self.manualBarCodeImputAlertController()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(searchAction)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Type barcode here"
            textfield.keyboardType = .numberPad
        }
        present(alertController, animated: true, completion: nil)
    }
    
    func manualBarCodeImputAlertController() {
        let alertController = UIAlertController(title: "Nothing Found", message: "Try again?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let searchAction = UIAlertAction(title: "Add", style: .default) { (_) in
            let textfield = alertController.textFields?.first
            
            if let item = ItemController.shared.searchForItemWith(barcode: textfield?.text ?? "") {
                self.setItemLocation(item: item, row: self.row!)
            } else {
                self.manualBarCodeImputAlertController()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(searchAction)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Type barcode here"
            textfield.keyboardType = .numberPad
        }
        present(alertController, animated: true, completion: nil)
    }
    
    func itemCreationAlertControllerWith(barCode: String) {
        let alertController = UIAlertController(title: "No Item found", message: "make new item?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            let nameTextfield = alertController.textFields?[0]
            let transportNameTextField = alertController.textFields?[1]
            
            if nameTextfield?.text?.isEmpty ?? true || transportNameTextField?.text?.isEmpty ?? true {
                self.itemCreationAlertControllerWith(barCode: barCode)
            } else {
                let item = Item(displayName: nameTextfield!.text!, transportName: transportNameTextField!.text!, barcode: barCode)
                self.setItemLocation(item: item, row: self.row!)
                ItemController.shared.addToItemList(item: item)
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Display Name"
            textfield.keyboardType = .default
        }
        alertController.addTextField { (textfield) in
            textfield.placeholder = "Storage Name"
            textfield.keyboardType = .default
        }
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveRow(_ sender: Any) {
        guard let row = row else {return}
        row.rowNumber = rowNameTextField.text ?? ""
        RowController.shared.saveToPersistntStore()
    }
    
    func newRowCheck() {
        if row?.rowNumber == "newRow" {
            guard let row = row else { return }
            RowController.shared.addRow(row: row)
        }
    }
    
    
    // MARK: - Helper methods
    
    func setItemLocation(item: Item, row: Row) {
        
        let alertController = UIAlertController(title: "Gravity Bin or Barrel?", message: item.displayName, preferredStyle: .alert)
        
        let gravBin = UIAlertAction(title: "Gravity Bin", style: .default) { (_) in
            RowController.shared.addRowGravBins(row: row, item: item)
        }
        let barrel = UIAlertAction(title: "Barrel", style: .default) { (_) in
            RowController.shared.addRowBarrels(row: row, item: item)
        }
        
        alertController.addAction(gravBin)
        alertController.addAction(barrel)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation) {
        layer.videoOrientation = orientation
        videoPreviewLayer?.frame = self.view.bounds
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let connection =  self.videoPreviewLayer?.connection  {
            let currentDevice: UIDevice = UIDevice.current
            let orientation: UIDeviceOrientation = currentDevice.orientation
            let previewLayerConnection : AVCaptureConnection = connection
            
            if previewLayerConnection.isVideoOrientationSupported {
                switch (orientation) {
                case .portrait:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                    break
                case .landscapeRight:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeLeft)
                    break
                case .landscapeLeft:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .landscapeRight)
                    break
                case .portraitUpsideDown:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portraitUpsideDown)
                    break
                default:
                    updatePreviewLayer(layer: previewLayerConnection, orientation: .portrait)
                    break
                }
            }
        }
    }
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                
                messageLabel.text = metadataObj.stringValue
                
                //search data base for item
                if let itemScanned = ItemController.shared.searchForItemWith(barcode: metadataObj.stringValue!) {
                    guard let row = row else {return}
                    setItemLocation(item: itemScanned, row: row)
                } else {
                    itemCreationAlertControllerWith(barCode: metadataObj.stringValue!)
                }
            }
        }
    }
}
