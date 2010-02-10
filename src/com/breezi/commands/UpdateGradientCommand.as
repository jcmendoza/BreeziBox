/** UpdateGradientCommand.as
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
	
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	public class UpdateGradientCommand implements ICommand
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
 		public function execute(event:CairngormEvent):void
 		{
 			if (model.boxData)
			{
	 			if (IBox(model.boxData).useGradient)
				{
					model.workView.box.setStyle("backgroundColor", "");
					
					var m:Matrix = new Matrix();
					m.createGradientBox(IBox(model.boxData).width, IBox(model.boxData).height, Math.PI/2, 0, 0);
					
					model.workView.box.graphics.clear();
					
					if (IBox(model.boxData).isTab)
					{
						model.workView.box.graphics.beginGradientFill(GradientType.LINEAR, [IBox(model.boxData).backgroundColor, IBox(model.boxData).gradientColor], [IBox(model.boxData).backgroundAlpha, IBox(model.boxData).backgroundAlpha], [0, 255], m);
						model.workView.box.graphics.drawRect(0, IBox(model.boxData).height / 2, IBox(model.boxData).width, IBox(model.boxData).height / 2);
						model.workView.box.graphics.endFill();
					}
					
					var roundDistance:Number = (IBox(model.boxData).useCornerRadius) ? IBox(model.boxData).cornerRadiusDistance * 2 : 0;
					
					model.workView.box.graphics.beginGradientFill(GradientType.LINEAR, [IBox(model.boxData).backgroundColor, IBox(model.boxData).gradientColor], [IBox(model.boxData).backgroundAlpha, IBox(model.boxData).backgroundAlpha], [0, 255], m);
					model.workView.box.graphics.drawRoundRect(0, 0, IBox(model.boxData).width, IBox(model.boxData).height, roundDistance, roundDistance);
					model.workView.box.graphics.endFill();
				}
				else
				{
					model.workView.box.setStyle("backgroundColor", IBox(model.boxData).backgroundColor);
					model.workView.box.graphics.clear();
					
					if (IBox(model.boxData).isTab)
					{
						model.workView.box.graphics.beginFill(IBox(model.boxData).backgroundColor, IBox(model.boxData).backgroundAlpha);
						model.workView.box.graphics.drawRect(0, IBox(model.boxData).height / 2, IBox(model.boxData).width, IBox(model.boxData).height / 2);
						model.workView.box.graphics.endFill();
					}
				}
			}
 		}
	}
}