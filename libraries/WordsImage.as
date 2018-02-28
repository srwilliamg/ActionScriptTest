package libraries {
  import flash.display.Sprite;
  import flash.net.URLRequest;
  import flash.net.URLLoader;
  import flash.events.Event;

  public class WordsImage{
      private var _myXML:XML;

      public function WordsImage():void{
        var XML_URL:String = "xml/text.xml"; 
        var myXMLURL:URLRequest = new URLRequest(XML_URL); 
        var myLoader:URLLoader = new URLLoader(myXMLURL);
        myLoader.addEventListener(Event.COMPLETE, xmlLoaded); 
      }

      private function xmlLoaded(event:Event):void{ 
        //_myXML = XML(event.target.data);
        
        this._myXML = XML(event.currentTarget.data);
        //trace(_myXML);
        //var aux:String = _myXML.words.A;
        //trace("XML data:\n"+aux);
      }

      public function print():void{
        trace(this._myXML);
      }

      public function chooseRandomWord():String{
        var numWord:Number = Math.floor(Math.random()*4);
        trace(numWord+"||"+_myXML.alphabet);
        //var aux:String = _myXML.words.A;
        //trace(aux);
        return "jfjf";

      }
  }
}
