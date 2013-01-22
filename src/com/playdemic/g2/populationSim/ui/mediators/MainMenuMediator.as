package com.playdemic.g2.populationSim.ui.mediators
{

	import com.playdemic.g2.populationSim.ui.views.CreateVillagerView;
	import com.playdemic.g2.populationSim.ui.views.MainMenuView;
	import com.playdemic.g2.populationSim.ui.views.PopulationView;
	import com.playdemic.g2.populationSim.ui.views.TimeView;
	
	import org.robotlegs.mvcs.Mediator;
	
	import uk.co.jakerigby.sparkrl.framework.ui.enums.ViewMode;
	import uk.co.jakerigby.sparkrl.framework.ui.events.ViewTrigger;
	import uk.co.jakerigby.sparkrl.framework.ui.mediators.ViewMediator;
	
	/**
	 * ALWAYS call super.onResgister() abnd super.onRemove() before adding to these hooks
	 */
	public class MainMenuMediator extends ViewMediator
	{
		[Inject] public var view:MainMenuView;
		
		override public function onRegister():void
		{
			super.onRegister();
			view.openCreateVillager.add(function():void{dispatch(new ViewTrigger(ViewTrigger.ADD, injector.instantiate(CreateVillagerView), ViewMode.MODAL));});
			view.openPopulationView.add(function():void{dispatch(new ViewTrigger(ViewTrigger.ADD, injector.instantiate(PopulationView), ViewMode.DESKTOP));});
			view.openTimeView.add(function():void{dispatch(new ViewTrigger(ViewTrigger.ADD, injector.instantiate(TimeView), ViewMode.DESKTOP));});
		}
		
		override public function onRemove():void
		{
			super.onRemove();
			view.openCreateVillager.removeAll();
			view.openPopulationView.removeAll();
			view.openTimeView.removeAll();
		}
	}
}