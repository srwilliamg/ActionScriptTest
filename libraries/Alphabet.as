package libraries {
  import flash.display.Sprite;
  import flash.display.MovieClip;
  import flash.net.URLRequest;
  import flash.net.URLLoader;
  import flash.events.Event;
  import flash.display.Stage;
  import libraries.Words;

  public class Alphabet extends MovieClip{
    public var actualWord:String = "";

    public function Alphabet(stage:Stage){
      stage.addChild(this);
    }

  	public function chooseRandomWord():String{
  		var numWord:Number = Math.floor(Math.random()*4);
      this.actualWord = Words.getInstance().xmlData.words.A.word[numWord];
  		return actualWord;
    }

    public function clean():void{
      while(this.numChildren > 0){
        this.removeChildAt(0);
      }
      trace("Removed");
    }

    public function drawAlphabet(){
      var y,x:uint = 0;
      for(var i:uint = 0; i < 26 ; i++){
        if(x == 400){
          y+=100; //change in coord Y is not working
          x = 0;
        }
        else{
          x+=100;
        }
        this.addChild(
        new ImageContainer(
          Words.getInstance().xmlData.alphabet.img[i],
          Words.getInstance().xmlData.alphabet.img[i].@id,
          x,
          y // here too
          )
        );
      }
    }

    public function drawWordFields(){
      var letter:String = chooseRandomWord();
      var addr,lett:String;
      var long:uint = letter.length;
      var img:ImageContainer;

      for(var i:uint = 0; i < long ; i++){
        lett = letter.charAt(i).toUpperCase();
        addr = Words.getInstance().xmlData.field;
        trace("letter: "+lett+" addres: "+addr);
        this.addChild(new StaticImage(addr, lett, 80*i, 250));
      }
    }

    public function drawLetters():void{
      var letter:String = chooseRandomWord();
      var addr,lett:String;
      var long:uint = letter.length;
      var img:ImageContainer;

      for(var i:uint = 0; i < long ; i++){
        lett = letter.charAt(i).toUpperCase();
        addr = Words.getInstance().xmlData.alphabet.img.(@id==lett);
        this.addChild(new ImageContainer(addr, lett, 50*i, 50));
      }
    }
  }
}
