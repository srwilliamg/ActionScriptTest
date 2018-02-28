package libraries {
  import flash.display.Sprite;
  import flash.net.URLRequest;
  import flash.net.URLLoader;
  import flash.events.Event;
  import flash.display.Stage;
  import libraries.Words;
  import flash.display.MovieClip;

  public class Alphabet extends Sprite{
    public var space:Sprite = new Sprite();
    public var actualWord:String = "";
    public function Alphabet(){

	  }

  	public function chooseRandomWord():String{
  		var numWord:Number = Math.floor(Math.random()*4);
      this.actualWord = Words.getInstance().xmlData.words.A.word[numWord];
  		return actualWord;
    }

    public function drawAlphabet(stage:Stage){
      var y,x:uint = 0;
      for(var i:uint = 0; i < 26 ; i++){
        if(x == 400){
          y+=100;
          x = 0;
        }
        else{
          x+=100;
        }
        stage.addChild(
        new ImageContainer(
          Words.getInstance().xmlData.alphabet.img[i],
          Words.getInstance().xmlData.alphabet.img[i].@id,
          x,
          y
          )
        );
      }
    }

    public function drawWordFields(stage:Stage){
      var letter:String = chooseRandomWord();
      var addr,lett:String;
      var long:uint = letter.length;
      var img:ImageContainer;

      for(var i:uint = 0; i < long ; i++){
        lett = letter.charAt(i).toUpperCase();
        addr = Words.getInstance().xmlData.field;
        stage.addChild(new StaticImage(addr, lett, 80*i, stage.stageHeight-100));
      }
    }

    public function drawLetters(stage:Stage):void{
      var letter:String = chooseRandomWord();
      var addr,lett:String;
      var long:uint = letter.length;
      var img:ImageContainer;

      for(var i:uint = 0; i < long ; i++){
        lett = letter.charAt(i).toUpperCase();
        addr = Words.getInstance().xmlData.alphabet.img.(@id==lett);
        stage.addChild(new ImageContainer(addr, lett, 50*i, 50));
      }
    }
  }
}
