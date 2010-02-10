/** Image.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package mx.controls
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.ByteArray;
	
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.IDataRenderer;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.graphics.codec.PNGEncoder;
	import mx.managers.SystemManagerGlobals;
	import mx.utils.LoaderUtil;
	
	use namespace mx_internal;
	
	[Event(name="dataChange", type="mx.events.FlexEvent")]
	
	[DefaultBindingProperty(source="progress", destination="source")]
	
	[DefaultTriggerEvent("complete")]
	
	[IconFile("Image.png")]
	
	public dynamic class Image extends SWFLoader implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer
	{    
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  Constructor.
		 */
		public function Image()
		{
			super();
			
			// images are generally not interactive
			tabChildren = false;
			tabEnabled = true;
			        
			showInAutomationHierarchy = true;       
		}
		
		private var makeContentVisible:Boolean = false;
		    
		private var sourceSet:Boolean;
		
		private var settingBrokenImage:Boolean;
		
		[Bindable("sourceChanged")]
		[Inspectable(category="General", defaultValue="", format="File")]
		
		override public function set source(value:Object):void
		{
			settingBrokenImage = (value == getStyle("brokenImageSkin"));
			sourceSet = !settingBrokenImage;
			super.source = value;     
			invalidateProperties();  
		}
		
		private var _data:Object;
		
		[Bindable("dataChange")]
		[Inspectable(environment="none")]
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
			        
			if (!sourceSet)
			{
				source = listData ? listData.label : data;
				sourceSet = false;
			}
			
			dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
		}
		
		private var _listData:BaseListData;
		
		[Bindable("dataChange")]
		[Inspectable(environment="none")]
		
		public function get listData():BaseListData
		{
			return _listData;
		}
		
		public function set listData(value:BaseListData):void
		{
			_listData = value;
		}
			
		private var downloadMenu:ContextMenuItem;
		private var fr:FileReference;
			
		// check if the run-time support the features of  
		// flash player 10
		private function get usingPlayerGlobal10():Boolean
		{ 
			if (!fr) 
			{
				fr = new FileReference();
			}
			
			var result:Boolean = false;
			
			try
			{
				result = fr.load is Function;
			}
			catch(e:Error)
			{
				result = false;
			}
			return result;
		}
		    
		private var _downloadable:Boolean = false;
		    
		[Inspectable(category="General", defaultValue="false", format="Boolean")]
		public function get downloadable():Boolean
		{
			return _downloadable;
		}
		    
		public function set downloadable(value:Boolean):void
		{
			_downloadable = value;
			invalidateProperties();
		}
		
		override public function invalidateSize():void
		{
			if (data && settingBrokenImage)
			{
				// don't invalidate otherwise we'll reload and loop forever
				return;
			}
		
			super.invalidateSize();
		}
		    
		override protected function commitProperties():void
		{
			super.commitProperties();
			    	
			if (!downloadable)
			{
				removeContextMenu(); 
			}
			else
			{
				if (usingPlayerGlobal10)
				{
					//if (!source || source == "")
					//{
					//	removeContextMenu(); 
					//}
					//else
					//{
						addContextMenu(); 
					//}
				}
				else
				{
					if (source && source is String && source != "")
					{
						var url:String = getAbsoluteURL(String(source));
						
						if (url.indexOf("http") == 0)
						{
							addContextMenu();
						} 
					}
					else
					{
						removeContextMenu();  
					}
				}
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			if (makeContentVisible && contentHolder)
			{
				contentHolder.visible = true;
				makeContentVisible = false;
			}      
		}
		    
		override mx_internal function contentLoaderInfo_completeEventHandler(event:Event):void
		{
			var obj:DisplayObject = DisplayObject(event.target.loader);
			
			super.contentLoaderInfo_completeEventHandler(event);
			        
			// Hide the object until draw
			obj.visible = false;
			makeContentVisible = true;
			invalidateDisplayList();
		}
		    
		private function addContextMenu():void
		{
			if (!fr) 
			{
				fr = new FileReference();
			}
			
			if (!contextMenu)
			{
				contextMenu = new ContextMenu();
				contextMenu.hideBuiltInItems();
			}
			
			if (!downloadMenu)
			{
				downloadMenu = new ContextMenuItem("Save Image...");
			}
					
			downloadMenu.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, menuItemSelectHandler);
			contextMenu.customItems.push(downloadMenu);
		}
		    
		private function removeContextMenu():void
		{
			if (downloadMenu && contextMenu)
			{
				var index:int = contextMenu.customItems.indexOf(downloadMenu);
				
				if (index > -1)
				{
					contextMenu.customItems[index] = null;
					downloadMenu.removeEventListener(ContextMenuEvent.MENU_ITEM_SELECT, menuItemSelectHandler);
				}  		
			}
		}
		    
		private function menuItemSelectHandler(event:ContextMenuEvent):void
		{
			if (event.currentTarget == downloadMenu)
			{   		
				var cls:Class;
				var url:String;
							
				if (!(source is Class) && !(source is ByteArray) && !(source is DisplayObject))
				{
					try
					{
						cls = Class(systemManager.getDefinitionByName(String(source)));
					}
					catch (e:Error)
					{ // ignore
					}
					
					url = source.toString();		            
				}
					        		        
				if (!cls && url)
				{	           
					url = getAbsoluteURL(url);
						        	
					if (url.indexOf("http") == 0)
					{
						fr.download(new URLRequest(url));	           		
						return;
					}
				}
					        
				if (usingPlayerGlobal10)
				{
					if (content && content is Bitmap)
					{
						var bitmapData:BitmapData = Bitmap(content).bitmapData;
						var encoder:PNGEncoder = new PNGEncoder();
						var encodeResult:ByteArray = encoder.encode(bitmapData);
						fr.save(encodeResult, name + ".png");
					}
				}
			}
		}
		    
		private function getAbsoluteURL(rawURL:String):String
		{
			var url:String = rawURL;
			
			if (!(url.indexOf(":") > -1 || url.indexOf("/") == 0 || url.indexOf("\\") == 0))
			{
				var rootURL:String;
				
				if (SystemManagerGlobals.bootstrapLoaderInfoURL != null && SystemManagerGlobals.bootstrapLoaderInfoURL != "")
				{
					rootURL = SystemManagerGlobals.bootstrapLoaderInfoURL;
				}
				else if (root)
				{
					rootURL = LoaderUtil.normalizeURL(root.loaderInfo);
				}
				else if (systemManager)
				{
					rootURL = LoaderUtil.normalizeURL(DisplayObject(systemManager).loaderInfo);
				}
				
				if (rootURL)
				{
					var lastIndex:int = Math.max(rootURL.lastIndexOf("\\"), rootURL.lastIndexOf("/"));
					
					if (lastIndex != -1)
					{
						url = rootURL.substr(0, lastIndex + 1) + url;
					}
				}
			}
			
			return url;
		}		       
	}
}