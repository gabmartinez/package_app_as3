package com.accesso.services {
import com.accesso.core.Service;

import flash.html.script.Package;

public class PackageService extends Service {

    public function PackageService() {
        super("data/test.xml");
        this.entityModel = Package;
    }
}
}
