//
//  VolleyResponseListener.swift
//  Emby.ApiClient
//
//  Created by Vedran Ozir on 07/10/15.
//  Copyright © 2015 Vedran Ozir. All rights reserved.
//

import Foundation

//package mediabrowser.apiinteraction.android;
//
//import com.android.volley.Response;
//import mediabrowser.model.logging.ILogger;

public class VolleyResponseListener<T> /*implements Response.Listener<T>*/ {
    
//    private mediabrowser.apiinteraction.Response<T> outerResponse;
//    private ILogger logger;
//    private String url;
    
    public init(outerResponse: Response<T>, logger: ILogger, url: String) {
        this.outerResponse = outerResponse;
        this.logger = logger;
        this.url = url;
    }
    
//    @Override
//    public void onResponse(T s) {
//        
//        logger.Info("Response received from: %s", url);
//        
//        outerResponse.onResponse(s);
//    }
    
}