/** boxVO.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.vo
{
	import com.breezi.events.BreeziEvent;
	import com.breezi.model.BreeziModelLocator;
	import com.breezi.vo.interfaces.IBox;
	
	[Bindable]
	public class boxVO implements IBox
	{
		private var model:BreeziModelLocator = BreeziModelLocator.getInstance();
		
		private var _borderStyle:String;
		private var _width:Number;
		private var _height:Number;
		private var _alpha:Number;
		private var _borderThickness:Number;
		private var _borderColor:uint;
		private var _isTab:Boolean;
		private var _useCornerRadius:Boolean;
		private var _cornerRadiusDistance:Number;
		private var _backgroundColor:uint;
		private var _useGradient:Boolean;
		private var _gradientColor:uint;
		private var _backgroundAlpha:Number;
		private var _useShadow:Boolean;
		private var _shadowColor:uint;
		private var _shadowDirection:String;
		private var _shadowDistance:Number;
		private var _text:String;
		private var _fontFamily:String;
		private var _fontSize:Number;
		private var _fontColor:uint;
		private var _fontBold:Boolean;
		private var _fontItalic:Boolean;
		private var _fontUnderline:Boolean;
		private var _fontAlign:String;
		private var _useImage:Boolean;
		private var _imageWidth:Number;
		private var _imageHeight:Number;
		private var _imageHorizontalAlign:String;
		private var _imageHorizontalPadding:Number;
		private var _imageVerticalAlign:String;
		private var _imageVerticalPadding:Number;
		private var _imageMaintainAspectRatio:Boolean;
		private var _base64:String;
		
		public function boxVO(params:Object = null)
		{
			if (params)
			{
				borderStyle = params.borderStyle;
				width = params.width;
				height = params.height;
				alpha = params.alpha;
				borderThickness = params.borderThickness;
				borderColor = params.borderColor;
				useCornerRadius = params.useCornerRadius;
				cornerRadiusDistance = params.cornerRadiusDistance;
				backgroundColor = params.backgroundColor;
				useGradient = params.useGradient;
				gradientColor = params.gradientColor;
				backgroundAlpha = params.backgroundAlpha;
				useShadow = params.useShadow;
				shadowColor = params.shadowColor;
				shadowDirection = params.shadowDirection;
				shadowDistance = params.shadowDistance;
				text = params.text;
				fontFamily = params.fontFamily;
				fontSize = params.fontSize;
				fontColor = params.fontColor;
				fontBold = params.fontBold;
				fontItalic = params.fontItalic;
				fontUnderline = params.fontUnderline;
				fontAlign = params.fontAlign;
				useImage = params.useImage;
				imageWidth = params.imageWidth;
				imageHeight = params.imageHeight;
				imageHorizontalAlign = params.imageHorizontalAlign;
				imageHorizontalPadding = params.imageHorizontalPadding;
				imageVerticalAlign = params.imageVerticalAlign;
				imageVerticalPadding = params.imageVerticalPadding;
				imageMaintainAspectRatio = params.imageMaintainAspectRatio;
			}
			else
			{
				borderStyle = model.constants.BORDER_SOLID;
				width = 100;
				height = 60;
				alpha = 1.0;
				borderThickness = 1;
				borderColor = 0x000000;
				useCornerRadius = false;
				cornerRadiusDistance = 0;
				backgroundColor = 0xffffff;
				useGradient = false;
				gradientColor = 0x000000;
				backgroundAlpha = 1.0;
				useShadow = false;
				shadowColor = 0x000000;
				shadowDirection = model.constants.ALIGN_RIGHT;
				shadowDistance = 5;
				text = "";
				fontFamily = "arial";
				fontSize = 10;
				fontColor = 0x000000;
				fontBold = false;
				fontItalic = false;
				fontUnderline = false;
				fontAlign = model.constants.ALIGN_CENTER;
				useImage = false;
				imageWidth = width;
				imageHeight = height;
				imageHorizontalAlign = model.constants.ALIGN_CENTER;
				imageHorizontalPadding = 0;
				imageVerticalAlign = model.constants.ALIGN_MIDDLE;
				imageVerticalPadding = 0;
				imageMaintainAspectRatio = false;
			}
		}
		
		public function set borderStyle(pValue:String):void
		{
			pValue = pValue.toLowerCase();
			
			if (pValue == model.constants.BORDER_NONE || pValue == model.constants.BORDER_SOLID)
			{
				_borderStyle = pValue;
			}
			else
			{
				_borderStyle = model.constants.BORDER_NONE;
			}
		}
		
		public function get borderStyle():String
		{
			return _borderStyle;
		}
		
		public function set width(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_width = pValue;
			}
			else
			{
				_width = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
			(new BreeziEvent(BreeziEvent.UPDATE_SHADOW_DISTANCE)).dispatch();
		}
		
		public function get width():Number
		{
			return _width;
		}
		
		public function set height(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_height = pValue;
			}
			else
			{
				_height = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
			(new BreeziEvent(BreeziEvent.UPDATE_SHADOW_DISTANCE)).dispatch();
		}
		
		public function get height():Number
		{
			return _height;
		}
		
		public function set alpha(pValue:Number):void
		{
			if (pValue < 0.0)
			{
				_alpha = 0.0;
			}
			else if (pValue > 1.0)
			{
				_alpha = 1.0;
			}
			else
			{
				_alpha = pValue;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set borderThickness(pValue:Number):void
		{
			if (pValue < 0.0)
			{
				_borderThickness = 0.0;
			}
			else if (pValue > Math.floor(Math.min(width / 2, height / 2)))
			{
				_borderThickness = Math.floor(Math.min(width / 2, height / 2));
			}
			else
			{
				_borderThickness = pValue;
			}
		}
		
		public function get borderThickness():Number
		{
			return _borderThickness;
		}
		
		public function set borderColor(pValue:uint):void
		{
			if (pValue < 0x000000)
			{
				_borderColor = 0x000000;
			}
			else if (pValue > 0xffffff)
			{
				_borderColor = 0xffffff;
			}
			else
			{
				_borderColor = pValue;
			}
		}
		
		public function get borderColor():uint
		{
			return _borderColor;
		}
		
		public function set isTab(pValue:Boolean):void
		{
			_isTab = pValue;
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get isTab():Boolean
		{
			return _isTab;
		}
		
		public function set useCornerRadius(pValue:Boolean):void
		{
			_useCornerRadius = pValue;
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get useCornerRadius():Boolean
		{
			return _useCornerRadius;
		}
		
		public function set cornerRadiusDistance(pValue:Number):void
		{
			if (pValue < 0)
			{
				_cornerRadiusDistance = 0;
			}
			else if (pValue > Math.floor(Math.min(width / 2, height / 2)))
			{
				_cornerRadiusDistance = Math.floor(Math.min(width / 2, height / 2));
			}
			else
			{
				_cornerRadiusDistance = pValue;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get cornerRadiusDistance():Number
		{
			return _cornerRadiusDistance;
		}
		
		public function set backgroundColor(pValue:uint):void
		{
			if (pValue < 0x000000)
			{
				_backgroundColor = 0x000000;
			}
			else if (pValue > 0xffffff)
			{
				_backgroundColor = 0xffffff;
			}
			else
			{
				_backgroundColor = pValue;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get backgroundColor():uint
		{
			return _backgroundColor;
		}
		
		public function set useGradient(pValue:Boolean):void
		{
			_useGradient = pValue;
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get useGradient():Boolean
		{
			return _useGradient;
		}
		
		public function set gradientColor(pValue:uint):void
		{
			if (pValue < 0x000000)
			{
				_gradientColor = 0x000000;
			}
			else if (pValue > 0xffffff)
			{
				_gradientColor = 0xffffff;
			}
			else
			{
				_gradientColor = pValue;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get gradientColor():uint
		{
			return _gradientColor;
		}
		
		public function set backgroundAlpha(pValue:Number):void
		{
			if (pValue < 0.0)
			{
				_backgroundAlpha = 0.0;
			}
			else if (pValue > 1.0)
			{
				_backgroundAlpha = 1.0;
			}
			else
			{
				_backgroundAlpha = pValue;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_GRADIENT)).dispatch();
		}
		
		public function get backgroundAlpha():Number
		{
			return _backgroundAlpha;
		}
		
		public function set useShadow(pValue:Boolean):void
		{
			_useShadow = pValue;
		}
		
		public function get useShadow():Boolean
		{
			return _useShadow;
		}
		
		public function set shadowColor(pValue:uint):void
		{
			if (pValue < 0x000000)
			{
				_shadowColor = 0x000000;
			}
			else if (pValue > 0xffffff)
			{
				_shadowColor = 0xffffff;
			}
			else
			{
				_shadowColor = pValue;
			}
		}
		
		public function get shadowColor():uint
		{
			return _shadowColor;
		}
		
		public function set shadowDirection(pValue:String):void
		{
			pValue = pValue.toLowerCase();
			
			if (pValue == model.constants.ALIGN_LEFT || pValue == model.constants.ALIGN_CENTER || pValue == model.constants.ALIGN_RIGHT)
			{
				_shadowDirection = pValue;
			}
			else
			{
				_shadowDirection = model.constants.ALIGN_RIGHT;
			}
		}
		
		public function get shadowDirection():String
		{
			return _shadowDirection;
		}
		
		public function set shadowDistance(pValue:Number):void
		{
			if (pValue < 0 - Math.floor(Math.min(width / 2, height / 2)))
			{
				_shadowDistance = 0 - Math.floor(Math.min(width / 2, height / 2));
			}
			else if (pValue > Math.floor(Math.min(width / 2, height / 2)))
			{
				_shadowDistance = Math.floor(Math.min(width / 2, height / 2));
			}
			else
			{
				_shadowDistance = pValue;
			}
		}
		
		public function get shadowDistance():Number
		{
			return _shadowDistance;
		}
		
		public function set text(pValue:String):void
		{
			_text = pValue;
		}
		
		public function get text():String
		{
			return _text;
		}
		
		public function set fontFamily(pValue:String):void
		{
			_fontFamily = pValue;
		}
		
		public function get fontFamily():String
		{
			return _fontFamily;
		}
		
		public function set fontSize(pValue:Number):void
		{
			if (pValue < 4.0)
			{
				_fontSize = 4.0;
			}
			else if (pValue > 48)
			{
				_fontSize = 48;
			}
			else
			{
				_fontSize = pValue;
			}
		}
		
		public function get fontSize():Number
		{
			return _fontSize;
		}
		
		public function set fontColor(pValue:uint):void
		{
			if (pValue < 0x000000)
			{
				_fontColor = 0x000000;
			}
			else if (pValue > 0xffffff)
			{
				_fontColor = 0xffffff;
			}
			else
			{
				_fontColor = pValue;
			}
		}
		
		public function get fontColor():uint
		{
			return _fontColor;
		}
		
		public function set fontBold(pValue:Boolean):void
		{
			_fontBold = pValue;
		}
		
		public function get fontBold():Boolean
		{
			return _fontBold;
		}
		
		public function set fontItalic(pValue:Boolean):void
		{
			_fontItalic = pValue;
		}
		
		public function get fontItalic():Boolean
		{
			return _fontItalic;
		}
		
		public function set fontUnderline(pValue:Boolean):void
		{
			_fontUnderline = pValue;
		}
		
		public function get fontUnderline():Boolean
		{
			return _fontUnderline;
		}
		
		public function set fontAlign(pValue:String):void
		{
			pValue = pValue.toLowerCase();
			if (pValue == model.constants.ALIGN_LEFT || pValue == model.constants.ALIGN_CENTER || pValue == model.constants.ALIGN_RIGHT)
			{
				_fontAlign = pValue;
			}
			else
			{
				_fontAlign = model.constants.ALIGN_CENTER;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_TEXT)).dispatch();
		}
		
		public function get fontAlign():String
		{
			return _fontAlign;
		}
		
		public function set useImage(pValue:Boolean):void
		{
			_useImage = pValue;
		}
		
		public function get useImage():Boolean
		{
			return _useImage;
		}
		
		public function set imageWidth(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_imageWidth = pValue;
			}
			else
			{
				_imageWidth = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageWidth():Number
		{
			return _imageWidth;
		}
		
		public function set imageHeight(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_imageHeight = pValue;
			}
			else
			{
				_imageHeight = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageHeight():Number
		{
			return _imageHeight;
		}
		
		public function set imageHorizontalAlign(pValue:String):void
		{
			pValue = pValue.toLowerCase();
			
			if (pValue == model.constants.ALIGN_LEFT || pValue == model.constants.ALIGN_CENTER || pValue == model.constants.ALIGN_RIGHT)
			{
				_imageHorizontalAlign = pValue;
			}
			else
			{
				_imageHorizontalAlign = model.constants.ALIGN_CENTER;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageHorizontalAlign():String
		{
			return _imageHorizontalAlign;
		}
		
		public function set imageHorizontalPadding(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_imageHorizontalPadding = pValue;
			}
			else
			{
				_imageHorizontalPadding = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageHorizontalPadding():Number
		{
			return _imageHorizontalPadding;
		}
		
		public function set imageVerticalAlign(pValue:String):void
		{
			pValue = pValue.toLowerCase();
			
			if (pValue == model.constants.ALIGN_TOP || pValue == model.constants.ALIGN_MIDDLE || pValue == model.constants.ALIGN_BOTTOM)
			{
				_imageVerticalAlign = pValue;
			}
			else
			{
				_imageVerticalAlign = model.constants.ALIGN_MIDDLE;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageVerticalAlign():String
		{
			return _imageVerticalAlign;
		}
		
		public function set imageVerticalPadding(pValue:Number):void
		{
			if (pValue >= 0)
			{
				_imageVerticalPadding = pValue;
			}
			else
			{
				_imageVerticalPadding = 0;
			}
			
			(new BreeziEvent(BreeziEvent.UPDATE_IMAGE)).dispatch();
		}
		
		public function get imageVerticalPadding():Number
		{
			return _imageVerticalPadding;
		}
		
		public function set imageMaintainAspectRatio(pValue:Boolean):void
		{
			_imageMaintainAspectRatio = pValue;
		}
		
		public function get imageMaintainAspectRatio():Boolean
		{
			return _imageMaintainAspectRatio;
		}
		
		public function set base64(pValue:String):void
		{
			_base64 = pValue;
		}
		
		public function get base64():String
		{
			return _base64;
		}
	}
}