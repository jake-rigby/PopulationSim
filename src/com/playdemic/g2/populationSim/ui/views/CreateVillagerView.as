package com.playdemic.g2.populationSim.ui.views
{
	import com.playdemic.g2.populationSim.enums.GenderType;
	import com.playdemic.g2.populationSim.models.VillagerModel;
	import com.playdemic.g2.populationSim.models.VillagersModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	import org.osflash.signals.Signal;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.ViewBase;
	
	public class CreateVillagerView extends ViewBase
	{
		[Inject] public var villagers:VillagersModel;
		
		[SkinPart] public var create:Signal;
		
		
		private var _males:IList;
		private var _females:IList;
		
		public function get femalesCache():IList
		{
			return _females ||= new ArrayCollection();
		}
		
		public function get malesCache():IList
		{
			return _males ||= new ArrayCollection();
		}
		
		override protected function initializationComplete():void
		{
			super.initializationComplete();
			
			// sort the villagers into gender as a first pass
			for each (var v:VillagerModel in villagers.villagers)
			{
				if (v.gender == GenderType.MALE)
					malesCache.addItem(v);
				else if (v.gender == GenderType.FEMALE)
					femalesCache.addItem(v);
			}
			
			// listen for updates
			villagers.villagerAdded.add(villagerAdded);
			villagers.villagerRemoved.add(villagerRemoved);
		}
		
		private function villagerAdded(villager:VillagerModel):void
		{
			if (villager.gender == GenderType.MALE)
				malesCache.addItem(villager);
			else if (villager.gender == GenderType.FEMALE)
				femalesCache.addItem(villager);
		}
		
		private function villagerRemoved(villager:VillagerModel):void
		{
			if (malesCache.getItemIndex(villager)!=-1 && villager.gender == GenderType.MALE)
				malesCache.removeItemAt(malesCache.getItemIndex(villager));
			else if (femalesCache.getItemIndex(villager)!=-1 && villager.gender == GenderType.FEMALE)
				femalesCache.removeItemAt(malesCache.getItemIndex(villager));
		}
		
		override public function dispose():void
		{
			// unlisten
			villagers.villagerAdded.remove(villagerAdded);
			villagers.villagerRemoved.remove(villagerRemoved);
		}

	}
}