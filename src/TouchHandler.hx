/*
  
  Scene will instantiate this, and call it's update() method

 */

import com.haxepunk.utils.Input;
import com.haxepunk.utils.Touch;

class TouchHandler
{
  
  // store all touches here
  private var touches:haxe.ds.IntMap<com.haxepunk.utils.Touch>;

  private var scene:IMultiInputtable;

  public function new( scene:IMultiInputtable )
  {
    this.scene = scene;
  }

  public function update()
  {

    if (Input.multiTouchSupported){

      Input.touchPoints(handleTouch);

      // check for any released touches
      for(touch in touches){
        if(Input.touches[touch.id] == null){
          touchRelease(touch);
        }
      }

    }

  }

  private inline function handleTouch( touch:Touch )
  {
    if(!touches.exists(touch.id)){
      touches.set(touch.id, touch);
      scene.handleInputDown(touch.x, touch.y);
    }
  }

  private inline function touchRelease(touch:Touch)
  {
    scene.handleInputUp(touch.x, touch.y);
    
    touches.remove(touch.id);
  }

}