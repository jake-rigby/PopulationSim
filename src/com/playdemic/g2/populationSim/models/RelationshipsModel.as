package com.playdemic.g2.populationSim.models
{
	import com.playdemic.g2.populationSim.enums.RelationshipType;
	
	import org.robotlegs.mvcs.Actor;
	
	public class RelationshipsModel extends Actor
	{
		private var _rels:Vector.<RelationshipModel>;
		
		public function RelationshipsModel()
		{
			_rels = new Vector.<RelationshipModel>;
		}
		
		public function addRelationship(type:RelationshipType,subject:VillagerModel,target:VillagerModel):void
		{
			if (!getRelationship(type,subject,target))
				_rels.push(new RelationshipModel(type,subject,target));	
		}
		
		public function removeRelationship(type:RelationshipType,subject:VillagerModel,target:VillagerModel):void
		{
			var i:int = 0;
			while (i < _rels.length)
			{
				if (_rels[i].type == type && _rels[i].subject == subject && _rels[i].target == target)
					_rels.splice(i,1);
				else
					i++
			}
		}
		
		public function getRelationship(type:RelationshipType,subject:VillagerModel,target:VillagerModel):RelationshipModel
		{
			for each (var r:RelationshipModel in _rels)
				if (r.type == type && r.subject == subject && r.target == target) 
					return r;
			return null;
		}
	}
}