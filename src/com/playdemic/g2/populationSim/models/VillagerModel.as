package com.playdemic.g2.populationSim.models
{
	import org.robotlegs.mvcs.Actor;
	import com.playdemic.g2.populationSim.enums.GenderType;
	
	[Bindable]
	public class VillagerModel extends Actor
	{
		private static var __uid:int = 0;
		public static function UID():int { return __uid++;};
		
		private var _id:int;
		private var _name:String;
		private var _mother:VillagerModel;
		private var _father:VillagerModel;
		private var _birthday:Date;
		private var _gender:GenderType;
		
		public function VillagerModel(id:int,name:String,mother:VillagerModel, father:VillagerModel, birthday:Date, gender:GenderType)
		{
			super();
			_id = id;
			_name = name;
			_mother = mother;
			_father = father;
			_birthday = birthday;
			_gender = gender;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get mother():VillagerModel
		{
			return _mother;
		}

		public function get father():VillagerModel
		{
			return _father;
		}

		public function get birthday():Date
		{
			return _birthday;
		}

		public function get gender():GenderType
		{
			return _gender;
		}
	}
}