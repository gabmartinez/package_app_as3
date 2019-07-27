package com.accesso.controllers {
import com.accesso.core.Controller;
import com.accesso.models.Package;
import com.accesso.services.PackageService;

import flash.events.Event;

import spark.components.List;

public class MainController extends Controller {

    public function MainController() {
        this.service = new PackageService();
        this.entity = Package;
        this.requestListing();
    }

    public function onItemSelectedEvent(event:Event):void {
        var selectedIndex:int = (event.currentTarget as List).selectedIndex;
        if(selectedIndex >= 0){
            (this.listing.getItemAt(selectedIndex) as Package).count += 1;
        }
    }

    public function resetButtonEvent():void {
        for each (var pac:Package in listing){
            pac.count = 0;
        }
    }

}
}
