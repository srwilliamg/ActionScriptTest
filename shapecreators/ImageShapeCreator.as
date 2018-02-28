package shapecreators
{
    public class ImageShapeCreator extends ShapeCreator
    {
        public static const RUNNER:uint =  0;

        override protected function createShape(cType:uint):ShapeWidget
        {
            if (cType == RUNNER){
                trace("Creating new image shape");
                return new ImageWidget( );
            } else {
                throw new Error("Invalid kind of shape specified");
                return null;
            }
        }



    }
}
