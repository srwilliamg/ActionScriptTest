package libraries {
  import flash.display.Sprite;
  import flash.net.URLRequest;
  import flash.net.URLLoader;
  import flash.events.Event;
  import flash.display.Stage;
  import libraries.Words;
  import flash.display.MovieClip;

  public class Alphabet extends Sprite{
    public var actualWord:String = "";
    public function Alphabet(){

	  }

  	public function chooseRandomWord():String{
  		var numWord:Number = Math.floor(Math.random()*4);
  		return Words.getInstance().xmlData.words.A.word[numWord];
    }

    public function drawLetters(stage:Stage):void{
      var letter:String = chooseRandomWord();
      var addr:String;
      var lett:String;
      var long:uint = letter.length;
      var img:ImageContainer;

      for(var i:uint = 0; i < long ; i++){
        lett = letter.charAt(i).toUpperCase();
        addr = Words.getInstance().xmlData.alphabet.img.(@id==lett);
        stage.addChild(new ImageContainer(addr, lett,50*i,50));
      }
    }
  }
}
