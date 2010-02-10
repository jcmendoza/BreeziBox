/** SaveImageCommand.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.breezi.business.ExternalInterfaceDelegate;
	import com.breezi.model.BreeziModelLocator;
	import com.breezi.view.previewView;
	import com.breezi.vo.interfaces.IBox;
	
	import mx.graphics.codec.PNGEncoder;
	import mx.graphics.ImageSnapshot;
	
	import mx.managers.PopUpManager;
	
 	public class SaveImageCommand implements ICommand
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		private var ei:ExternalInterfaceDelegate = new ExternalInterfaceDelegate();
		
 		public function execute(event:CairngormEvent):void
 		{
 			var imageCapture:ImageSnapshot = ImageSnapshot.captureImage(model.workView.main, 0, new PNGEncoder());
			IBox(model.boxData).base64 = ImageSnapshot.encodeImageAsBase64(imageCapture);
			
			ei.saveImage();
			
			if (model.propView.showDetails.selected)
			{
				PopUpManager.createPopUp(model.mainView, previewView);
			}
 		}
	}
}