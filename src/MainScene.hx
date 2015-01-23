import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.utils.Input;

class MainScene extends Scene implements IMultiInputtable
{
  #if mobile
  private var touch_handler:TouchHandler;
  #else
  private var mouse_handler:MouseHandler;
  #end

  private var left_button:Button;
  private var right_button:Button;


  public override function begin()
  {

    /*
      Create two buttons for testing
     */
    left_button = new Button();
    right_button = new Button();

    left_button.type = "collide_left_button";
    right_button.type = "collide_right_button";


    /*
      Add the buttons to this scene
      http://haxepunk.com/documentation/api/com/haxepunk/Scene.html#add
     */
    add( left_button );
    add( right_button );

    // position the buttons
    left_button.x = 150;
    left_button.y = 150;

    right_button.x = 350;
    right_button.y = 150;


    #if mobile
    /*
      Setup Touch Event Handler
     */
    touch_handler = new TouchHandler(this);

    #else

    /*
      Setup Mouse Event Handler
     */
    mouse_handler = new MouseHandler(this);

    #end

  }

  public override function update()
  {
    #if mobile
    touch_handler.update();
    #else
    mouse_handler.update();
    #end

    super.update();
  }

  public inline function handleInputDown( x: Float, y: Float ):Void
  {
    if( left_button.collidePoint( left_button.x, left_button.y, x, y ) ){
      left_button.activate();
    }
    if( right_button.collidePoint( right_button.x, right_button.y, x, y ) ){
      right_button.activate();
    }
  }

  public inline function handleInputUp( x: Float, y: Float ):Void
  {
    if( left_button.collidePoint( left_button.x, left_button.y, x, y )  ){
      left_button.deactivate();
    }
    if( right_button.collidePoint( right_button.x, right_button.y, x, y )  ){
      right_button.deactivate();
    }
  }

}