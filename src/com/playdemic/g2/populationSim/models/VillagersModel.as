package com.playdemic.g2.populationSim.models
{
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.Actor;
	
	public class VillagersModel extends Actor
	{
		private var _villagers:Vector.<VillagerModel>;
		private var _villagerAdded:Signal;
		private var _villagerRemoved:Signal;
		
		public function VillagersModel()
		{
			super();
			_villagers = new Vector.<VillagerModel>;
		}
		
		public function addVillager(villager:VillagerModel):void
		{
			removeVillager(villager.id);
			_villagers.push(villager);
			villagerAdded.dispatch(villager);
		}
		
		public function removeVillager(villagerId:int):void
		{
			var i:int = 0;
			while (i < _villagers.length)
			{
				if (_villagers[i].id == villagerId)
					villagerRemoved.dispatch(_villagers.splice(i,1).pop());
				else
					i++;
			}
		}

		public function get villagerRemoved():Signal
		{
			return _villagerRemoved ||= new Signal(VillagerModel);
		}

		public function get villagerAdded():Signal
		{
			return _villagerAdded ||= new Signal(VillagerModel);
		}
		
		public function get villagers():Vector.<VillagerModel>
		{
			return _villagers.concat(); 
		}
	}
}