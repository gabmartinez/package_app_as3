package com.accesso.core {
import com.accesso.core.interfaces.IService;

import mx.collections.ArrayCollection;

public class Controller {

    protected var _listing:ArrayCollection;
    public var service:IService;

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
}
}
