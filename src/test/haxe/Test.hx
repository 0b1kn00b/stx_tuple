package;

using Lambda;
using stx.Tuple;

class Test{
  public function new(){
    var runner = new utest.Runner();
    utest.ui.Report.create(runner);
    var tests : Array<Dynamic> = [
      new stx.Tuple2Test()
    ];
    tests.iter(
      function(x){
        runner.addCase(x);
      }
    );
    runner.run();
  }
  static function main(){
    new Test();
  }
}
