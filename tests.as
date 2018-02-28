import libraries.*;

var xmlURL:String = "xml/text.xml";

function loadXML(){
  var xml_Loader:URLLoader = new URLLoader();
  trace("ADDING EVENTS");
  xml_Loader.load(new URLRequest(xmlURL));
  xml_Loader.addEventListener(Event.OPEN, openHandler);
  xml_Loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
  xml_Loader.addEventListener(Event.COMPLETE, do_XML);
}

function openHandler(e:Event){trace("start loading");}
function progressHandler(e:ProgressEvent){trace("loaded: " + e.bytesLoaded + "total: " + e.bytesTotal);}

function do_XML(e:Event):void {
  trace("COMPLETE");
  Words.getInstance().xmlData = new XML(e.target.data);

  var game:Alphabet = new Alphabet();
  //game.drawLetters(stage);
  game.drawWordFields(stage);
  game.drawAlphabet(stage);
}

loadXML();
trace("Ended");