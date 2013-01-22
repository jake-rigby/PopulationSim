package com.playdemic.g2.populationSim.commands
{
	import com.playdemic.g2.populationSim.ui.views.MainMenuView;
	
	import org.robotlegs.mvcs.Command;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.DebugValuesView;
	import uk.co.jakerigby.sparkrl.framework.ui.enums.ViewMode;
	import uk.co.jakerigby.sparkrl.framework.ui.events.ViewTrigger;
	
	public class Initialise extends Command
	{
		override public function execute():void
		{
			dispatch(new ViewTrigger(ViewTrigger.ADD,new MainMenuView(),ViewMode.DESKTOP));
			dispatch(new ViewTrigger(ViewTrigger.ADD,injector.instantiate(DebugValuesView),ViewMode.DESKTOP));
		}
	}
}