package com.accesso.core {
import com.accesso.core.interfaces.IController;
import com.accesso.core.interfaces.IService;

import flash.xml.XMLDocument;

import mx.collections.ArrayCollection;
import mx.rpc.xml.SimpleXMLDecoder;

public class Controller implements IController {

    protected var _listing:ArrayCollection;
    public var service:IService;
    public var entity:Class;

    public function Controller() {
        this.listing = new ArrayCollection();
    }

    [Bindable]
    public function get listing():ArrayCollection {
        return _listing;
    }

    public function set listing(value:ArrayCollection):void {
        _listing = value;
    }

    public function requestListing():void {
        this.listing = new ArrayCollection();
        this.service.listing(function (packages:XML):void {
            var xmlDoc:XMLDocument = new XMLDocument(packages.children());
            var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
            for each (var obj:Object in decoder.decodeXML(xmlDoc).p){
                listing.addItem(Mapper.fromObject(obj, entity));
            }
        })
    }
}
}
