import libraries.*;

var xmlURL:String = "xml/text.xml";
var game:Alphabet = new Alphabet(stage);

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
  //game.drawLetters();
  game.drawWordFields();
  game.drawAlphabet();
}

loadXML();

//var img:ImageContainer = new ImageContainer(3,"images/button.png");
//img.setSize(300,200);
//stage.addChild(img);

r_btn.addEventListener(MouseEvent.CLICK, fl_ClickToGoToAndStopAtFrame);
//r_btn.addEventListener(MouseEvent.MOUSE_OVER, fl_Mouse_over);
function fl_ClickToGoToAndStopAtFrame(event:MouseEvent):void{
  game.clean();
  gotoAndStop(5);
}

//function fl_Mouse_over(event:MouseEvent):void{
//  r_btn.changetext();
//}

trace("Ended");