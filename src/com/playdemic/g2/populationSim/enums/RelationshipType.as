package com.playdemic.g2.populationSim.enums
{
	import uk.co.jakerigby.sparkrl.framework.reflection.Enum;
	
	public class RelationshipType extends Enum
	{
		Enum.erate(RelationshipType);
		
		public static const PARENT:RelationshipType = new RelationshipType('parent','father','mother');
		public static const GRANDPARENT:RelationshipType = new RelationshipType('grandparent','grandfather','grandmother');
		public static const SIBLING:RelationshipType = new RelationshipType('grandparent','grandfather','grandmother');
		public static const COUSIN:RelationshipType = new RelationshipType('cousin');
		public static const NEFLING:RelationshipType = new RelationshipType('nefling','nephew','neice');
		public static const PARENTAL_SIBLING:RelationshipType = new RelationshipType('parental sibling','uncle','aunt');
		public static const SPOUSE:RelationshipType = new RelationshipType('spouse','husband','wife');
			
		private var _name:String;
		private var _maleVariant:String;
		private var _femaleVariant:String;
		
		public function RelationshipType(name:String, maleVariant:String = null, femaleVariant:String = null)
		{
			_name = name;
			_maleVariant = maleVariant ||= name;
			_femaleVariant = femaleVariant ||= name;
		}
		
		[Bindable(event="_")] public function get name():String
		{
			return _name;
		}

		public function get femaleVariant():String
		{
			return _femaleVariant;
		}

		public function get maleVariant():String
		{
			return _maleVariant;
		}
		
		public function toString():String
		{
			return _name;
		}
	}
}