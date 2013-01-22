package com.playdemic.g2.populationSim.ui.views
{
	import com.playdemic.g2.populationSim.models.TimeModel;
	
	import org.osflash.signals.Signal;
	
	import uk.co.jakerigby.sparkrl.framework.ui.components.ViewBase;
	import uk.co.jakerigby.sparkrl.framework.ui.functionality.IUpdater;
	import uk.co.jakerigby.sparkrl.framework.ui.models.UpdaterModel;
	
	public class TimeView extends ViewBase
	{
		// dependencies
		[Inject] public var timeModel:TimeModel;
		[Inject] public var updater:IUpdater;
		
		// views
		[SkinPart] public var chooseStartTime:Signal;
		
		// properties
		[Bindable] public var now:Date;
		[Bindable] public var sim:Date;
		[Bindable] public var start:Date;
		
		[PostConstruct] public function initialise():void
		{
			updater.updater.add(update);
		}
		
		override public function dispose():void
		{
			updater.updater.remove(update);
		}	
			
		public function update(deltaMS:int):void
		{
			now = timeModel.now;
			start = timeModel.start;
			sim = timeModel.sim;
		}
		
	}
}