/** UpdateShadowDistanceCommand.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.breezi.model.BreeziModelLocator;
	import com.breezi.vo.interfaces.IBox;
	
	public class UpdateShadowDistanceCommand implements ICommand
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
 		public function execute(event:CairngormEvent):void
 		{
 			if (model.boxData)
			{
	 			model.propView.backgroundComponent.shadowDistance.labels = [model.propView.backgroundComponent.shadowDistance.minimum, 0, model.propView.backgroundComponent.shadowDistance.maximum];
			}
 		}
	}
}