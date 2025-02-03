//
//  ScannerViewController.swift
//  SwiftUIExplorer
//
//  Created by Ömer Faruk Dikili on 3.02.2025.
//

import UIKit
import AVFoundation

enum CameraError: String {
    case inValidDeviceInput = "Could not create video capture device input"
    case invalidScannedValue = "Scanned value is invalid. This app scans EAN-8 and EAN-13 barcodes"
}

protocol ScannerViewControllerDelegate: AnyObject {
    func didFind(barcode : String)
    func didSurfaceError(error : CameraError)
}

final class ScannerViewController: UIViewController {
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    weak var scannerDelegate : ScannerViewControllerDelegate!
    
    init(scannerDelegate : ScannerViewControllerDelegate){
        super.init(nibName: nil, bundle: nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let previewLayer = previewLayer else { return }
        previewLayer.frame = view.layer.bounds
    }
    
    private func setupCaptureLayer() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            scannerDelegate?.didSurfaceError(error: .inValidDeviceInput)
            return  }
        
        
        let videoInput : AVCaptureDeviceInput
        
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
            
        }catch {
            scannerDelegate?.didSurfaceError(error: .inValidDeviceInput)

            return
        }
        
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        }else{
            scannerDelegate?.didSurfaceError(error: .inValidDeviceInput)

            return }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput){
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
            metadataOutput.metadataObjectTypes = [.ean8,.ean13]
        }else{
            scannerDelegate?.didSurfaceError(error: .inValidDeviceInput)

            return }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer!)
        captureSession.startRunning()
        
    }
}

extension ScannerViewController :  AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        guard let object = metadataObjects.first  else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return }
        
        guard let barcode = machineReadableObject.stringValue else {
            scannerDelegate?.didSurfaceError(error: .invalidScannedValue)
            return }
        captureSession.stopRunning()
        scannerDelegate?.didFind(barcode: barcode)
        
        
    }
}
