package com.playdemic.g2.populationSim.models
{
	import com.playdemic.g2.populationSim.enums.RelationshipType;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RelationshipModel extends Actor
	{
		private var _type:RelationshipType;
		private var _subject:VillagerModel;
		private var _target:VillagerModel;
		
		public function RelationshipModel(type:RelationshipType, subject:VillagerModel, target:VillagerModel)
		{
			_type = type;
			_subject = subject;
			_target = target;
		}

		public function get target():VillagerModel
		{
			return _target;
		}

		public function get subject():VillagerModel
		{
			return _subject;
		}

		public function get type():RelationshipType
		{
			return _type;
		}
	}
}