/** ExternalInterfaceDelegate.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.business
{
	import flash.external.ExternalInterface;
	
	import com.adobe.serialization.json.JSON;
	import com.breezi.model.BreeziModelLocator;
	import com.breezi.vo.interfaces.IBox;
	
 	public class ExternalInterfaceDelegate
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
		private function callExternalInterface(name:String, param:Object=null):Object
 		{
 			if (!ExternalInterface.available) 
 			{
 				return null;
 			}
 			
 			if (param) 
 			{
 				return ExternalInterface.call(name, param);
 			}
 			
 			return ExternalInterface.call(name);
 		}
 		
 		private function addCallback(name:String, handler:Function):void
 		{
 			if (!ExternalInterface.available) 
 			{
 				return;
 			}
 			
 			ExternalInterface.addCallback(name, handler);
 		}
 		
		public function saveImage():Object
		{
			var result:Object = callExternalInterface("getImage", IBox(model.boxData).base64);
			
			trace("saveImage: " + result);
				
			return result;
		}
		
		public function saveParams():Object
		{
			var result:Object = callExternalInterface("saveParams", JSON.encode(model.boxData));
			
			trace("saveParams: " + result);
			
			return result;
		}
 	}
}