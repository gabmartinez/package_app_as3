package com.accesso.models {

[Bindable]
public class Package {

    private var _id:int;
    private var _name:String;
    private var _price:Number;
    private var _count:int;
    private var _image:String;

    public function Package() {
    }

    public function get id():int {
        return _id;
    }

    public function set id(value:int):void {
        _id = value;
    }

    public function get price():Number {
        return _price;
    }

    public function set price(value:Number):void {
        _price = value;
    }

    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
    }

    public function get image():String {
        return _image;
    }

    public function set image(value:String):void {
        _image = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }
}
}
