/** UpdateImageCommand.as
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
	
	public class UpdateImageCommand implements ICommand
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
 		public function execute(event:CairngormEvent):void
 		{
 			if (model.boxData)
			{
	 			switch (IBox(model.boxData).imageHorizontalAlign)
				{
					case "left" 	: model.workView.buttonImage.x = IBox(model.boxData).imageHorizontalPadding; break;
					case "center" 	: model.workView.buttonImage.x = (IBox(model.boxData).width / 2) - (IBox(model.boxData).imageWidth / 2); break;
					case "right"	: model.workView.buttonImage.x = IBox(model.boxData).width - IBox(model.boxData).imageWidth - IBox(model.boxData).imageHorizontalPadding; break;
				}
				
				switch (IBox(model.boxData).imageVerticalAlign)
				{
					case "top"		: model.workView.buttonImage.y = IBox(model.boxData).imageVerticalPadding; break;
					case "middle"	: model.workView.buttonImage.y = (IBox(model.boxData).height / 2) - (IBox(model.boxData).imageHeight / 2); break;
					case "bottom"	: model.workView.buttonImage.y = IBox(model.boxData).height - IBox(model.boxData).imageHeight - IBox(model.boxData).imageVerticalPadding; break;
				}
			}
 		}
	}
}