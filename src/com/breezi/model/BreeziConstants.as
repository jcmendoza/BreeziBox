/** BreeziConstants.as
 * 
 * @author Juan Carlos Mendoza - 10/Feb/10
 *
 * Part of the Breezi project. Copyright (c) 2010.
 */
package com.breezi.model
{
	[Bindable]
	public class BreeziConstants
	{
		/**
		 * Supported Alignments/Placements
		 */
		public const ALIGN_LEFT:String = "left";
		public const ALIGN_CENTER:String = "center";
		public const ALIGN_RIGHT:String = "right";
		public const ALIGN_TOP:String = "top";
		public const ALIGN_MIDDLE:String = "middle";
		public const ALIGN_BOTTOM:String = "bottom";
		
		public const VERTICAL_ALIGNMENTS:Array = [ALIGN_TOP, ALIGN_MIDDLE, ALIGN_BOTTOM];
		public const HORIZONTAL_ALIGNMENTS:Array = [ALIGN_LEFT, ALIGN_CENTER, ALIGN_RIGHT];
		public const DROPSHADOW_DIRECTIONS:Array = [ALIGN_LEFT, ALIGN_CENTER, ALIGN_RIGHT];
		
		/**
		 * Border types
		 */
		public const BORDER_NONE:String = "none";
		public const BORDER_SOLID:String = "solid";
		
		public const BORDER_STYLES:Array = [BORDER_NONE, BORDER_SOLID];		
	}
}