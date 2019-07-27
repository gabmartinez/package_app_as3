package com.accesso.controllers {
import com.accesso.core.Controller;
import com.accesso.core.Mapper;
import com.accesso.models.Package;
import com.accesso.services.PackageService;

import flash.events.Event;
import flash.xml.XMLDocument;

import mx.rpc.xml.SimpleXMLDecoder;

import spark.components.List;

public class MainController extends Controller {

    public function MainController() {
        this.service = new PackageService();
        this.service.listing(function (packages:XML):void {
            var xmlDoc:XMLDocument = new XMLDocument(packages.children());
            var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
            for each (var obj:Object in decoder.decodeXML(xmlDoc).p){
                listing.addItem(Mapper.fromObject(obj, Package));
            }
        });
    }

    public function onItemSelectedEvent(event:Event):void {
        var selectedIndex:int = (event.currentTarget as List).selectedIndex;
        if(selectedIndex >= 0){
            (this.listing.getItemAt(selectedIndex) as Package).count += 1;
        }
    }

    public function clearCountAllPackages():void {
        for each (var pac:Package in listing){
            pac.count = 0;
        }
    }

}
}
