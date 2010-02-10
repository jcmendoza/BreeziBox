/** BreeziController.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.breezi.commands.InitializeCommand;
	import com.breezi.commands.SaveImageCommand;
	import com.breezi.commands.UpdateGradientCommand;
	import com.breezi.commands.UpdateTextCommand;
	import com.breezi.commands.UpdateImageCommand;
	import com.breezi.commands.UpdateShadowDistanceCommand;
	import com.breezi.events.BreeziEvent;
	
	public class BreeziController extends FrontController
	{
		public function BreeziController()
		{
			super();
			initCommands();
		}
		
		public function initCommands() : void
		{
			addCommand(BreeziEvent.INITIALIZE, InitializeCommand);
			addCommand(BreeziEvent.SAVE_IMAGE, SaveImageCommand);
			addCommand(BreeziEvent.UPDATE_GRADIENT, UpdateGradientCommand);
			addCommand(BreeziEvent.UPDATE_TEXT, UpdateTextCommand);
			addCommand(BreeziEvent.UPDATE_IMAGE, UpdateImageCommand);
			addCommand(BreeziEvent.UPDATE_SHADOW_DISTANCE, UpdateShadowDistanceCommand);
		}	
	}
}