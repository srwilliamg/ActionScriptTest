package  libraries{
	import org.alivepdf.pdf.*;
	import org.alivepdf.layout.*;
	import org.alivepdf.fonts.*;
	import org.alivepdf.display.*;
	import flash.filesystem.*;
	import org.alivepdf.colors.*;
	import org.alivepdf.saving.*;
	import flash.utils.ByteArray;

	public class MakePDF {

		private var _myPDF:PDF;

		public function MakePDF() {
			_myPDF= new PDF();
			_myPDF.setDisplayMode( Display.FULL_PAGE, Layout.SINGLE_PAGE );
			_myPDF.addPage();
		}

		public function addTitle(title:String, size:uint = 24, posx:uint = 10, posy:uint = 40){
			//_myPDF.textStyle (new RGBColor ( 140 ));
			//_myPDF.setFont( FontFamily.ARIAL, "",32 );
			_myPDF.setFontSize ( size );
			_myPDF.setXY( posx, posy );
			_myPDF.addMultiCell ( 300, 1, title );
		}

		public function addContent(content:String, size:uint = 14, posx:uint = 10, posy:uint = 50){
			//_myPDF.textStyle ( new RGBColor ( 0 ) );
			//_myPDF.setFont( FontFamily.HELVETICA, Style.BOLD );
			_myPDF.setFontSize ( size );
			_myPDF.setXY( posx, posy );
			for(var i:uint = 0; i< 100;i++)
			  _myPDF.addMultiCell ( 300, 10, content );
		}

		public function savePDF(filename:String){
			var f : FileStream = new FileStream();
			var file:File = File.documentsDirectory;
			try
			{
			    file.browseForSave("Save As");
			    file.addEventListener(Event.SELECT, saveData);
			}
			catch (error:Error)
			{
			    trace("Failed:", error.message);
			}

			function saveData(event:Event):void
			{
			    var newFile:File = event.target as File;
			    if (!newFile.exists)
			    {
						f.open( newfile, FileMode.WRITE);
						var bytes : ByteArray = _myPDF.save(Method.LOCAL);
						f.writeBytes(bytes);
						f.close();
			    }
			}

			trace("PDF file has been created.");
		}

		/*public function get file():String{

		}*/

	}

}
