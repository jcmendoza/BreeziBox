/** BreeziModelLocator.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	import com.breezi.view.propertiesView;
	import com.breezi.view.workareaView;
	import com.breezi.vo.boxVO;
	import com.breezi.vo.interfaces.IBox;
	
	import flash.display.DisplayObject;
	import flash.net.FileReference;

	[Bindable]
	public class BreeziModelLocator implements IModelLocator
	{
		private static var model:BreeziModelLocator = new BreeziModelLocator();
		
		private var _constants:BreeziConstants;
		public var fileRef:FileReference = new FileReference();		
		public var boxData:boxVO 
		public var params:Object;
		public var mainView:DisplayObject;
		public var propView:propertiesView;
		public var workView:workareaView;
		public var fontArray:Array = new Array();
		
		public function BreeziModelLocator()
		{
			if (model != null) 
			{
				trace("Only one ModelLocator instance should be instantiated");
			}
		}
		
		public static function getInstance():BreeziModelLocator 
		{
			if (model == null) 
			{
				model = new BreeziModelLocator();
			}
				
			return model;
		}
		
		public function get constants():BreeziConstants
		{
			if (!_constants)
			{
				_constants = new BreeziConstants();
			}
			
			return _constants;
		}
		
		public function getFontObject():Object
		{
			for (var idx:* in model.fontArray)
			{
				if (model.fontArray[idx].fontName.toLowerCase() == IBox(model.boxData).fontFamily.toLowerCase())
				{
					break;
				}
			}
			
			return model.fontArray[idx];
		}
	}
}