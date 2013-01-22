package com.playdemic.g2.populationSim.ui.mediators
{
	import com.playdemic.g2.populationSim.enums.RelationshipType;
	import com.playdemic.g2.populationSim.models.RelationshipsModel;
	import com.playdemic.g2.populationSim.models.VillagerModel;
	import com.playdemic.g2.populationSim.models.VillagersModel;
	import com.playdemic.g2.populationSim.ui.views.CreateVillagerView;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.Alert;
	import uk.co.jakerigby.sparkrl.framework.ui.enums.ViewMode;
	import uk.co.jakerigby.sparkrl.framework.ui.events.ViewEvent;
	import uk.co.jakerigby.sparkrl.framework.ui.events.ViewTrigger;
	import uk.co.jakerigby.sparkrl.framework.ui.mediators.ViewMediator;
	
	public class CreateVillagerViewMediator extends ViewMediator
	{
		[Inject] public var view:CreateVillagerView;
		[Inject] public var villagers:VillagersModel;
		[Inject] public var relationships:RelationshipsModel;
		
		override public function onRegister():void
		{
			view.create.add(onCreate);
			super.onRegister();
		}
		
		override public function onRemove():void
		{
			view.create.remove(onCreate);
			super.onRemove();
		}
		
		private function onCreate(model:VillagerModel):void
		{
			if (!model ||
				model.name == null ||
				model.name == '' ||
				model.birthday == null ||
				model.gender == null)
			{
				var alert:Alert = new Alert();
				alert.message = "invalid parameters";
				dispatch(new ViewTrigger(ViewTrigger.ADD,alert,ViewMode.MODAL));
			}
			
			else
			{
				villagers.addVillager(model);
				
				if (model.father)
					relationships.addRelationship(RelationshipType.PARENT,model.father,model);
				
				if (model.mother)
					relationships.addRelationship(RelationshipType.PARENT,model.mother,model);
				
				// TOODO siblings grandparents cousins and parental siblings
				
				view.dispatchEvent(new ViewEvent(ViewEvent.CLOSE_REQUESTED));
			}				
		}
	}
}