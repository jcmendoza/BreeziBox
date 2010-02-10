/** BreeziEvent.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
 	public class BreeziEvent extends CairngormEvent
	{		
		public static const INITIALIZE:String = "initialize";
		public static const SAVE_IMAGE:String = "save_image";
		public static const UPDATE_GRADIENT:String = "update_gradient";
		public static const UPDATE_TEXT:String = "update_text";
		public static const UPDATE_IMAGE:String = "update_image";
		public static const UPDATE_SHADOW_DISTANCE:String = "update_shadow_distance";
		
		public function BreeziEvent(type:String)
 		{
 			super(type);
 		}
	}
}