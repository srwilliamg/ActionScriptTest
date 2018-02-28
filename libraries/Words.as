package libraries {
  import flash.display.Sprite;
  import flash.net.URLRequest;
  import flash.net.URLLoader;
  import flash.events.Event;
  import flash.events.ProgressEvent;

  public class Words{
    private var _XMLdata:XML = new XML();
    private static var _instance:Words;

    public function Words(singletonEnforcer:SingletonEnforcer):void{
      if(_instance){
        throw new Error("Singleton... use getInstance()");
      } 
      _instance = this;
    }

    public static function getInstance():Words{
      if(!_instance) {
        _instance = new Words( new SingletonEnforcer() );
      }
      return _instance;
    }

    public function set xmlData(data:XML):void{
      this._XMLdata = data;
    }

    public function get xmlData():XML{
      return this._XMLdata;
    }
  }
}

internal class SingletonEnforcer{}