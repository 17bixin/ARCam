//
//  ReplayKitRecorder.swift
//  ARCam
//
//  Created by zhaox on 2017/10/31.
//  Copyright © 2017年 MerryUnion. All rights reserved.
//

import ReplayKit

extension UIViewController {
    func startReplayKitRecording(completionHandler:@escaping (_ result:Bool) -> Void) {
        if RPScreenRecorder.shared().isAvailable {
            RPScreenRecorder.shared().startRecording() { (error) in
                if error == nil {
                    print("started recording")
                    DispatchQueue.main.async { completionHandler(true) }
                } else {
                    print("error starting screen recording")
                    DispatchQueue.main.async { completionHandler(false) }
                }
            }
        } else {
            print("screen recorder not available")
            completionHandler(false)
        }
    }
    
    func stopReplayKitRecording() {
        RPScreenRecorder.shared().stopRecording { (previewController, error) in
            if let previewController = previewController {
                DispatchQueue.main.async {
                    self.present(previewController, animated: true, completion: nil)
                }
            } else {
                print("error stopping recording (was it running?)")
            }
        }
    }
}
