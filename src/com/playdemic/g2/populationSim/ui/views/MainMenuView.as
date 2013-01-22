package com.playdemic.g2.populationSim.ui.views
{
	import org.osflash.signals.Signal;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.ViewBase;
	
	public class MainMenuView extends ViewBase
	{
		[SkinPart] public var openCreateVillager:Signal;
		[SkinPart] public var openPopulationView:Signal;
		[SkinPart] public var openTimeView:Signal;
	}
}