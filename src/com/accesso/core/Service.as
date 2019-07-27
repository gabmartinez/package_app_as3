package com.accesso.core {

import com.accesso.core.Mapper;
import com.accesso.core.interfaces.IService;

import mx.collections.ArrayCollection;

import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.http.HTTPService;

import spark.components.Alert;

public class Service extends HTTPService implements IService {

    protected var entityModel:Class;
    private var endpoint:String;

    public function Service(endpoint:String) {
        this.contentType = CONTENT_TYPE_XML;
        this.showBusyCursor = true;
        this.resultFormat = RESULT_FORMAT_E4X;
        this.endpoint = endpoint;
    }

    public function listing(callback:Function=null):void {
        this.url = this.endpoint;
        this.addEventListener(ResultEvent.RESULT, function resultEvent(event:ResultEvent):void {
            if(callback != null){
                callback(event.result);
            }
            event.currentTarget.removeEventListener(event.type, resultEvent);
        });
        this.addEventListener(FaultEvent.FAULT, faultRequestEvent);
        this.send();
    }

    private static function faultRequestEvent(event:FaultEvent):void {
        Alert.show('Something wrong with the service. Please contact the support team.');
        trace(event.fault.message);
        event.currentTarget.removeEventListener(event.type, faultRequestEvent);
    }
}
}
