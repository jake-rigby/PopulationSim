package com.playdemic.g2.populationSim.enums
{
	import uk.co.jakerigby.sparkrl.framework.reflection.Enum;

	public class GenderType extends Enum
	{
		Enum.erate(GenderType);
		
		public static const MALE:GenderType = new GenderType("Male");
		public static const FEMALE:GenderType = new GenderType("Female");
		
		private var _name:String;
		
		public function GenderType(name:String)
		{
			_name = name;
		}

		[Bindable(event="_")] public function get name():String
		{
			return _name;
		}
		
		public function toString():String
		{
			return _name;
		}

	}
}