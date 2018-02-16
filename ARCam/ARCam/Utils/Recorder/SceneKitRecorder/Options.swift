//
//  Options.swift
//  ARCam
//
//  Created by zhaox on 2017/10/20.
//  Copyright © 2017年 MerryUnion. All rights reserved.
//

import Foundation
import SceneKit
import AVFoundation

extension SceneKitRecorder {
    public struct Options {
        public var timeScale: Int32
        public var videoSize: CGSize
        public var fps: Int
        public var outputUrl: URL
        public var audioOnlyUrl: URL
        public var videoOnlyUrl: URL
        public var fileType: String
        public var codec: String
        public var deleteFileIfExists: Bool
        public var useMicrophone: Bool
        public var antialiasingMode: SCNAntialiasingMode
        
        public static var `default`: Options {
            return Options(timeScale: 1000,
                           videoSize: CGSize(width: 720, height: 1280),
                           fps: 60,
                           outputUrl: URL(fileURLWithPath: NSTemporaryDirectory() + "output.mp4"),
                           audioOnlyUrl: URL(fileURLWithPath: NSTemporaryDirectory() + "audio.m4a"),
                           videoOnlyUrl: URL(fileURLWithPath: NSTemporaryDirectory() + "video.mp4"),
                           fileType: AVFileType.m4v.rawValue,
                           codec: AVVideoCodecType.h264.rawValue,
                           deleteFileIfExists: true,
                           useMicrophone: true,
                           antialiasingMode: .multisampling4X)
        }
        
        var assetWriterVideoInputSettings: [String : Any] {
            return [
                AVVideoCodecKey: codec,
                AVVideoWidthKey: videoSize.width,
                AVVideoHeightKey: videoSize.height
            ]
        }
        
        var assetWriterAudioInputSettings: [String : Any] {
            return [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
        }
        
        var sourcePixelBufferAttributes: [String : Any] {
            return [
                kCVPixelBufferPixelFormatTypeKey as String: NSNumber(value: kCVPixelFormatType_32ARGB),
                kCVPixelBufferWidthKey as String: videoSize.width,
                kCVPixelBufferHeightKey as String: videoSize.height,
            ]
        }
    }
}
