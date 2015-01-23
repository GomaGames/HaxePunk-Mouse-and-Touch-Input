/*
  
  Scene will instantiate this, and call it's update() method

 */

import com.haxepunk.utils.Input;

class MouseHandler
{
  
  private var scene:IMultiInputtable;

  public function new( scene:IMultiInputtable )
  {
    this.scene = scene;
  }

  public function update():Void
  {
    if(Input.mouseDown){
      scene.handleInputDown( Input.mouseX, Input.mouseY );
    }else if(Input.mouseReleased){
      scene.handleInputUp( Input.mouseX, Input.mouseY );
    }
  }

}
