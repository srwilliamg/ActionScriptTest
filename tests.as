import libraries.*;

var _XMLdata:XML = new XML();
var _xmlURL:String = "xml/text.xml";

function loadXML(){
  var xml_Loader:URLLoader = new URLLoader();
  trace("ADDING EVENTS");
  xml_Loader.load(new URLRequest(_xmlURL));
  xml_Loader.addEventListener(Event.OPEN, openHandler);
  xml_Loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
  xml_Loader.addEventListener(Event.COMPLETE, do_XML);
}

function openHandler(e:Event){
      trace("start loading"); 
    }
     
function progressHandler(e:ProgressEvent){
  trace("loaded: " + e.bytesLoaded + "total: " + e.bytesTotal);
}

function do_XML(e:Event):void {
  this._XMLdata = new XML(e.target.data);
  //trace("loaded: " + _XMLdata.toXMLString());
  trace("COMPLETE");
  Words.getInstance().xmlData = _XMLdata;

  //trace("XML: "+Words.getInstance().xmlData);

  var game:Alphabet = new Alphabet();
  game.drawLetters(stage);
  trace("Ended");
}

loadXML();

