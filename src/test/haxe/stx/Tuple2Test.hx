package stx;

import utest.Assert.*;
using stx.Tuple;

class Tuple2Test{
  public function new(){}

  public function testCreate(){
    var tp = new Tup2(1,2);
    equals(tp.fst(),1);
    equals(tp.snd(),2);
  }
  public function testEquals(){
    var tp0 = new Tup2(1,2);
    var tp1 = new Tup2(1,2);
    isTrue(tp1.equals(tp0));
  }
  public function testCall(){
    var tp = new Tup2(1,2);
    var fn = function(a,b) return a+b;

    var o  = tp.into(fn);
    equals(3,o);

    switch(tp){
      case tuple2(l,r) :
      default : fail();
    }
  }
  public function testImplicitHoist(){
    var tp = tuple2(1,2);
    var o = tp.swap().fst();
    equals(2,o);
  }

  @:note("Cannot call in through the Abstract to the Enum")
  /*
  public function testConstructor(){
    //raises(function(){ untyped (Tup2(1,2)); });
  }*/
}
