package com.accesso.core {
import flash.xml.XMLDocument;

import mx.core.ClassFactory;
import mx.rpc.xml.SimpleXMLDecoder;
import mx.utils.ObjectUtil;

public class Mapper extends ClassFactory {

    public function Mapper(generator:Class = null) {
        super(generator);
    }

    override public function newInstance():*
    {
        var instance:Object = new generator();

        if (properties != null)
        {
            for (var property:String in properties)
            {
                try {
                    if(instance.hasOwnProperty(property)){
                        instance[property] = properties[property];
                    } else {
                        trace("INFO - Mapper can't assign the property " + property + " on the class " + ObjectUtil.getClassInfo(generator).name);
                    }
                } catch (error:Error) {
                    trace("ERROR - " + error.message);
                }
            }
        }
        return instance;
    }

    public static function fromObject(obj:Object, generator:Class = null):* {
        var factory:Mapper = new Mapper(generator);
        factory.properties = obj;
        return factory.newInstance();
    }

}
}
