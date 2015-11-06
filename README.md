#Tuple

##What is it?

A tuple is a collection of typed, unnamed values.

##What is it for?

If you want to return more than one value from a function, rather than create a new type, you can wrap the return value as a Tuple.

If you are using higher order functions, you can pack the inputs down to one parameter, so you don't have to define the higher order functions with 2, 3, 4 etc parameters.

##Api

There are one or two unavoidable gotchas, so off the bat `Tup2` is the abstract type and `Tuple2` is defined as an `enum`.use them by:

    using stx.Tuple2

So that if you're in a position where you have the underlying `Tuple2` implementation, you can still use the functions by way of `using`.

###Instantiation

You can create a tuple by using the enum constructor `tuple2`

    var a = tuple2(1,2);// Returns an instance of Tuple2

If you want to use functions on them the first function will automatically hoist to an instance of `Tup2`.

###abstract Tup2<a,B>

####fst

    public function fst():A

Returns the value in the left side of the tuple

####snd

    public function snd():B

Returns the value in the right hand side of the tuple

####swap

    public function swap():Tuple2<B,A>

Returns a tuple with the left hand side on the right and vice-versa.

####equals

    public function equals(other:Tuple2<A,B>):Bool

Yup, you can compare them, uses a regular `=` for each element.

####toArray()

    public function toArray():Array<Dynamic>

Produces an array of untyped values.

####into

    public function into(fn:A->B->C):C;

Unpacks the tuple and applies the function with the internal values.

###tupled

    static public function tupled(fn:A->B->C):Tuple2<A,B>->C

Transforms the function to receive a tuple rather than two arguments.

###untupled

    static public function untupled(fn:Tuple2<A,B>->C):A->B->C

Transforms a function taking a tuple to one taking two arguments.

##Destructuring

Using pattern matching on Tuples goes as follows

    var a = tuple2({ test : "hello"}, "world");

    switch(a){
        case tuple2(a,"world") :
            trace(a.test);
        default :
    }
    //or
    switch(a){
        case tuple2({ test : "hello",b) :
            trace(b);
        default:
     }
