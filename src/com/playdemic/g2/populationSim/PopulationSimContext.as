package com.playdemic.g2.populationSim
{
	import com.playdemic.g2.populationSim.commands.Initialise;
	import com.playdemic.g2.populationSim.models.RelationshipsModel;
	import com.playdemic.g2.populationSim.models.TimeModel;
	import com.playdemic.g2.populationSim.models.VillagersModel;
	import com.playdemic.g2.populationSim.ui.mediators.CreateVillagerViewMediator;
	import com.playdemic.g2.populationSim.ui.mediators.MainMenuMediator;
	import com.playdemic.g2.populationSim.ui.mediators.TimeViewMediator;
	import com.playdemic.g2.populationSim.ui.views.CreateVillagerView;
	import com.playdemic.g2.populationSim.ui.views.MainMenuView;
	import com.playdemic.g2.populationSim.ui.views.PopulationView;
	import com.playdemic.g2.populationSim.ui.views.TimeView;
	
	import uk.co.jakerigby.sparkrl.framework.robotlegs.ApplicationContext;
	import uk.co.jakerigby.sparkrl.framework.ui.components.DebugValuesView;
	import uk.co.jakerigby.sparkrl.framework.ui.components.ViewBase;
	import uk.co.jakerigby.sparkrl.framework.ui.events.SparkRLEvent;
	import uk.co.jakerigby.sparkrl.framework.ui.functionality.IUpdater;
	import uk.co.jakerigby.sparkrl.framework.ui.mediators.ViewMediator;
	import uk.co.jakerigby.sparkrl.framework.ui.models.DebugModel;
	import uk.co.jakerigby.sparkrl.framework.ui.models.UpdaterModel;
	
	
	public class PopulationSimContext extends ApplicationContext
	{
		override protected function mappings():void
		{			
			// entry point
			commandMap.mapEvent(SparkRLEvent.STARUP_COMPLETE, Initialise, SparkRLEvent);
			
			// ticker, instantiate immediately to start
			//injector.mapSingletonOf(IUpdater,UpdaterModel);				
			//injector.getInstance(IUpdater);
			
			// debugger model and view
			//injector.mapSingleton(DebugModel);
			mediatorMap.mapView(DebugValuesView,ViewMediator,[ViewBase,DebugValuesView]);

			// models
			injector.mapSingleton(VillagersModel);
			injector.mapSingleton(RelationshipsModel);
			injector.mapSingleton(TimeModel);
			
			// views
			mediatorMap.mapView(MainMenuView,MainMenuMediator,[ViewBase,MainMenuView]);
			mediatorMap.mapView(CreateVillagerView,CreateVillagerViewMediator,[ViewBase,CreateVillagerView]);
			mediatorMap.mapView(PopulationView,ViewMediator,[ViewBase,PopulationView]);
			mediatorMap.mapView(TimeView,TimeViewMediator,[ViewBase,TimeView]);
		}
	}
}