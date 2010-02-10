/** IBox.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.vo.interfaces
{
	[Bindable]
	public interface IBox
	{
		function set borderStyle(pValue:String):void;
		function get borderStyle():String;
		
		function set width(pValue:Number):void;
		function get width():Number;
		
		function set height(pValue:Number):void;
		function get height():Number;
		
		function set alpha(pValue:Number):void;
		function get alpha():Number;
		
		function set borderThickness(pValue:Number):void;
		function get borderThickness():Number;
		
		function set borderColor(pValue:uint):void;
		function get borderColor():uint;
		
		function set isTab(pValue:Boolean):void;
		function get isTab():Boolean;
		
		function set useCornerRadius(pValue:Boolean):void;
		function get useCornerRadius():Boolean;
		
		function set cornerRadiusDistance(pValue:Number):void;		
		function get cornerRadiusDistance():Number;
		
		function set backgroundColor(pValue:uint):void;
		function get backgroundColor():uint;
		
		function set useGradient(pValue:Boolean):void;
		function get useGradient():Boolean;
		
		function set gradientColor(pValue:uint):void;
		function get gradientColor():uint;
		
		function set backgroundAlpha(pValue:Number):void;
		function get backgroundAlpha():Number;
		
		function set useShadow(pValue:Boolean):void;
		function get useShadow():Boolean;
		
		function set shadowColor(pValue:uint):void;
		function get shadowColor():uint;
		
		function set shadowDirection(pValue:String):void;
		function get shadowDirection():String;
		
		function set shadowDistance(pValue:Number):void;
		function get shadowDistance():Number;
		
		function set text(pValue:String):void;
		function get text():String;
		
		function set fontFamily(pValue:String):void;
		function get fontFamily():String;
		
		function set fontSize(pValue:Number):void;
		function get fontSize():Number;
		
		function set fontColor(pValue:uint):void;
		function get fontColor():uint;
		
		function set fontBold(pValue:Boolean):void;
		function get fontBold():Boolean;
		
		function set fontItalic(pValue:Boolean):void;
		function get fontItalic():Boolean;
		
		function set fontUnderline(pValue:Boolean):void;
		function get fontUnderline():Boolean;
		
		function set fontAlign(pValue:String):void;
		function get fontAlign():String;
		
		function set useImage(pValue:Boolean):void;
		function get useImage():Boolean;
		
		function set imageWidth(pValue:Number):void;
		function get imageWidth():Number;
		
		function set imageHeight(pValue:Number):void;
		function get imageHeight():Number;
		
		function set imageHorizontalAlign(pValue:String):void;
		function get imageHorizontalAlign():String;
		
		function set imageHorizontalPadding(pValue:Number):void;
		function get imageHorizontalPadding():Number;
		
		function set imageVerticalAlign(pValue:String):void;
		function get imageVerticalAlign():String;
		
		function set imageVerticalPadding(pValue:Number):void;
		function get imageVerticalPadding():Number;
		
		function set imageMaintainAspectRatio(pValue:Boolean):void;
		function get imageMaintainAspectRatio():Boolean;
		
		function set base64(pValue:String):void;
		function get base64():String;
	}
}