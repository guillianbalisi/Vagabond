//
//  View2.swift
//  Sparta
//
//  Created by Guillian Balisi on 2016-02-27.
//  Copyright © 2016 Sparta. All rights reserved.
//

import UIKit
import AVFoundation


class View2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let tags = ["dark", "bottle", "pencil", "desktop", "trash", "apple", "banana", "door", "cloud", "people", "audience", "chairs", "boy", "tired", "blurred", "dim", "screen", "wall", "shoes", "shirt", "elephant", "floor", "dog", "computer", "laptop", "pencil", "beautiful", "still life", "tasty", "sweet", "business", "pizza", "angry", "black", "yellow", "orange", "wallet", "chair", "youthful", "crate", "poster", "fun", "leather", "old", "empty", "fashion", "retro", "vintage", "card", "space", "sky", "evening", "tree", "school", "education", "glossy", "moon", "wall", "architecture", "indoors", "modern", "internet", "wireless", "World Wide Web", "safety", "electronics", "interior design", "entrance", "stone", "hallway", "fun", "fast", "contemporary", "abstract", "retro", "adult", "girl", "reflection", "shadow", "light", "man", "iron", "steel", "no person", "luxury", "eclipse", "astronomy", "bright", "broom", "clean", "tool", "dust", "housework", "wooden", "security", "fur", "nature", "cute", "mammal", "wild", "shadow", "Halloween", "no person", "insect", "biology", "recreation", "tropical", "fruit", "lemon", "chili", "spice", "hot", "warm", "bag", "phone", "cellphone", "closeup", "blooming", "single", "smile", "laugh", "teeth", "happy", "laughing", "sad", "wheel", "circle", "square", "triangle", "rectangle", "pyramid"]
    
    
    var actualScore = 0
    var user : User?
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    var result : [String] = []
    
    var tagList : [String] = []
    
    let systemSoundID: SystemSoundID = 1016

    
    private lazy var client : ClarifaiClient = ClarifaiClient(appID: clarifaiClientID, appSecret: clarifaiClientSecret)
    
    @IBOutlet var cameraView: UIView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View2")
        print(tagList)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        var error : NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil){
            
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput) != nil){
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
                
            }
            
            
        }
        
        
    }
    
    func didPressTakePhoto(){
        
        if let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {
                (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider  = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    let jpeg = UIImageJPEGRepresentation(image, 0.9)!
                    
                    self.client.recognizeJpegs([jpeg]) {
                        (results: [ClarifaiResult]?, error: NSError?) in
                        if error != nil {
                            print("Error: \(error)\n")
                        } else {
                            print(results![0].tags)
                            self.result = results![0].tags
                        }

                    }
                    
                    self.didMatch()
                    if (self.didMatch()) {
                        AppDelegate.score += 100
                        
                    }
                    self.tempImageView.image = image
                    self.tempImageView.hidden = false
                    
                    
                }
                
                
            })
        }
        
        
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
        if didTakePhoto == true{
            tempImageView.hidden = true
            didTakePhoto = false
            
        }
        else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
            
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        didPressTakeAnother()
    }
    
    func generateTags() {
        for i in 0...15 {
            let randomIndex = Int(arc4random_uniform(UInt32(tags.count)))
            tagList.append(tags[randomIndex])
        }
        //print(tagList)
    }
    
    func didMatch() -> Bool {
        for i in 0..<tagList.count {
            if result.contains(tagList[i]) {
//                User.score += 1
            //    print(tagList[i])
                AudioServicesPlaySystemSound (systemSoundID)
                tagList.removeAtIndex(i)
                return true
        
            }
        
        }
        return false

}
}
