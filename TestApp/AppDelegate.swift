//
//  AppDelegate.swift
//  TestApp
//
//  Created by Vedran Ozir on 12/10/15.
//  Copyright © 2015 Vedran Ozir. All rights reserved.
//

import UIKit
import Emby_ApiClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var userId: String?
    var accessToken: String?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        let logger = Logger()
        
        let httpClient = VolleyHttpClient(logger: logger, context: Context())
        
        let jsonSerializer = JsonSerializer()
        
        let service = ConnectService(jsonSerializer: jsonSerializer, logger: logger, httpClient: httpClient, appName: "Emby_ApiClient iOS", appVersion: "1.0")
        
        Authenticate(httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
        
        return true
    }

    func Authenticate(httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<ConnectAuthenticationResult>()
        
        response.completion = { (result: ConnectAuthenticationResult?) -> Void in
            
            print("Authenticate finished with \(result) \(result?.getAccessToken())")
            
            if let
                userId = result?.getUser()?.getId(),
                connectAccessToken = result?.getAccessToken() {
            
//                    self.GetPinStatus(userId, connectAccessToken: connectAccessToken, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
                    
//                    self.userId = userId
//                    self.accessToken = connectAccessToken
//                    
//                    NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("GetPinStatus"), userInfo: nil, repeats: true)
                    
//                    let deviceId = UIDevice.currentDevice().identifierForVendor?.UUIDString ?? "<<unknown device>>"
//                    let pin = "93185"
//                    
//                    self.ExchangePin(deviceId, pin: pin, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
                    
//                let deviceId = UIDevice.currentDevice().identifierForVendor?.UUIDString ?? "<<unknown device>>"
//        
//                self.CreatePin(deviceId, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)

//                self.Logout(connectAccessToken, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
  
                    
                    let feature = "TV"
                    
                    self.GetRegistrationInfo(userId, connectAccessToken: connectAccessToken, feature: feature, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
            }
            
        }
        
        service.Authenticate("vedrano", password: "123456", response: response)
    }

    func GetRegistrationInfo(userId: String, connectAccessToken: String, feature: String, httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<RegistrationInfo>()
        
        response.completion = { (result: RegistrationInfo?) -> Void in
            
            print("GetRegistrationInfo finished with \(result))")
        }
        
        print("response \(response)")
        
        do {
            try service.GetRegistrationInfo(userId, feature: feature, connectAccessToken: connectAccessToken, final: response)
        } catch {
            print("error \(error)")
        }
    }

    func GetPinStatus() {
        
        let logger = Logger()
        
        let httpClient = VolleyHttpClient(logger: logger, context: Context())
        
        let jsonSerializer = JsonSerializer()
        
        let service = ConnectService(jsonSerializer: jsonSerializer, logger: logger, httpClient: httpClient, appName: "Emby_ApiClient iOS", appVersion: "1.0")
        
        if let
            userId = self.userId,
            accessToken = self.accessToken {
                
                self.GetPinStatus(userId, connectAccessToken: accessToken, httpClient: httpClient, logger: logger, jsonSerializer: jsonSerializer, service: service)
        }
    }
    
    func CreatePin(deviceId: String, httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<PinCreationResult>()
        
        response.completion = { (result: PinCreationResult?) -> Void in
            
            print("CreatePin finished with \(result))")
            
            //            if let
            //                Id = result?.getUser()?.getId(),
            //                accessToken = result?.getAccessToken() {
            //
            //                    self.GetPinStatus(Id, connectAccessToken: accessToken)
            //            }
            
        }
        
        print("response \(response)")
        
        service.CreatePin(deviceId, final: response)
    }
    
    func GetPinStatus(userId: String, connectAccessToken: String, httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<ConnectUserServer>()
        
        response.completion = { (result: ConnectUserServer?) -> Void in
            
            print("GetPinStatus finished with \(result))")
            
//            if let
//                Id = result?.getUser()?.getId(),
//                accessToken = result?.getAccessToken() {
//                    
//                    self.GetPinStatus(Id, connectAccessToken: accessToken)
//            }
            
        }
        
        print("response \(response)")
        
        do {
            try service.GetPinStatus(userId, connectAccessToken: connectAccessToken, final: response)
        } catch {
            print("error \(error)")
        }
    }
    
    func ExchangePin(deviceId: String, pin: String, httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<PinExchangeResult>()
        
        let pinCreationResult = PinCreationResult(jSON: JSON())
        
        pinCreationResult.setDeviceId(deviceId)
        pinCreationResult.setPin(pin)
        
        response.completion = { (result: PinExchangeResult?) -> Void in
            
            print("ExchangePin finished with \(result))")
            
            //            if let
            //                Id = result?.getUser()?.getId(),
            //                accessToken = result?.getAccessToken() {
            //
            //                    self.GetPinStatus(Id, connectAccessToken: accessToken)
            //            }
            
        }
        
        print("response \(response)")
        
        service.ExchangePin(pinCreationResult, final: response)
    }

    func Logout(connectAccessToken: String, httpClient: VolleyHttpClient, logger: Logger, jsonSerializer: JsonSerializer, service: ConnectService) {
        
        let response = Emby_Response<EmptyResponse>()
        
        response.completion = { (result: EmptyResponse?) -> Void in
            
            print("Logout finished with \(result))")
            
            //            if let
            //                Id = result?.getUser()?.getId(),
            //                accessToken = result?.getAccessToken() {
            //
            //                    self.GetPinStatus(Id, connectAccessToken: accessToken)
            //            }
            
        }
        response.completionError = { (error) in
            
            print("response error \(error)")
        }
        
        print("response \(response)")
        
        do {
            try service.Logout(connectAccessToken, final: response)
        } catch {
            print("error \(error)")
        }
    }
    
}
