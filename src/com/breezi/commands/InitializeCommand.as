/** InitializeCommand.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.serialization.json.JSON;
	import com.breezi.model.BreeziModelLocator;
	import com.breezi.vo.boxVO;
	import com.breezi.vo.interfaces.IBox;
	
	import flash.events.Event;
	import flash.text.Font;
	
 	public class InitializeCommand implements ICommand
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
 		public function execute(event:CairngormEvent):void
 		{
 			if (model.params)
			{
				var json:Object = JSON.decode(model.params as String);
				model.boxData = new boxVO(json);
			}
			else
			{
				model.boxData = new boxVO();
			}
			
			model.fileRef.addEventListener(Event.SELECT, selectHandler);
			model.fileRef.addEventListener(Event.COMPLETE, completeHandler);
			
			model.fontArray = Font.enumerateFonts(true);
 		}
 		
 		public function selectHandler(e:Event):void
		{
			model.fileRef.load();
		}
		
		public function completeHandler(e:Event):void
		{
			model.workView.buttonImage.source = model.fileRef.data;
			model.propView.imageComponent.imagePath.text = model.fileRef.name;
			
			IBox(model.boxData).imageWidth = IBox(model.boxData).width;
			IBox(model.boxData).imageHeight = IBox(model.boxData).height;			
		}
	}
}