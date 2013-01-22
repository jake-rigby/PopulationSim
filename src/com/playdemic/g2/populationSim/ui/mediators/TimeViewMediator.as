package com.playdemic.g2.populationSim.ui.mediators
{
	import com.playdemic.g2.populationSim.models.TimeModel;
	import com.playdemic.g2.populationSim.ui.views.TimeView;
	
	import mx.containers.ViewStack;
	
	import uk.co.jakerigby.sparkrl.framework.ui.mediators.ViewMediator;
	
	public class TimeViewMediator extends ViewMediator
	{
		[Inject] public var view:TimeView
		[Inject] public var timeModel:TimeModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			view.chooseStartTime.add(onStartDateChange);
		}
		
		override public function onRemove():void
		{
			view.chooseStartTime.remove(onStartDateChange);
		}
		
		protected function onStartDateChange(chosenDate:Date):void
		{
			// update model and view in one step
			view.start = timeModel.start = chosenDate;
		}
	}
}