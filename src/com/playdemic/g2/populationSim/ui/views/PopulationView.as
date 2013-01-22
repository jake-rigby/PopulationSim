package com.playdemic.g2.populationSim.ui.views
{
	import com.playdemic.g2.populationSim.models.VillagerModel;
	import com.playdemic.g2.populationSim.models.VillagersModel;
	
	import mx.events.FlexEvent;
	
	import net.digitalprimates.collections.VectorListCollection;
	
	import spark.components.DataGroup;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.ViewBase;
	
	public class PopulationView extends ViewBase
	{
		[Inject] public var model:VillagersModel;
		
		[SkinPart] public var villagers:DataGroup;
		
		override protected function initializationComplete():void
		{
			super.initializationComplete();
			model.villagerAdded.add(update);
			model.villagerRemoved.add(update);
			update(null);
		}
		
		private function update(villagerAddedOrRemoved:VillagerModel):void
		{
			villagers.dataProvider = new VectorListCollection(model.villagers);
		}		
		
		override public function dispose():void
		{
			if (model)
			{
				model.villagerAdded.remove(update);
				model.villagerRemoved.remove(update);
			}
		}
	}
}