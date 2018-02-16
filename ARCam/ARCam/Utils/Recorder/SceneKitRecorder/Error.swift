//
//  Error.swift
//  ARCam
//
//  Created by zhaox on 2017/10/20.
//  Copyright © 2017年 MerryUnion. All rights reserved.
//

import Foundation

extension SceneKitRecorder {
    public struct VideoSizeError: Error {}
    public struct PreparationError: Error {
        let title = "Recorder wasn't ready!"
        let description = "You need to call prepare() before startWriting(). Preferably in viewDidAppear() way before startWriting()"
    }
    public struct RenderingApiError: Error {
        let title = "Only Metal is supported!"
        let description = "SceneKitRecorder only supports scenes with Metal as rendering api for now."
    }
}
