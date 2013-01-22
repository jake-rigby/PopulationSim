package com.playdemic.g2.populationSim.models
{
	import org.robotlegs.mvcs.Actor;
	
	public class TimeModel extends Actor
	{
		private var _start:Date;
		private var _now:Date;
		private var _sim:Date;
		
		public function get now():Date
		{
			return new Date();
		}
		
		public function get sim():Date
		{
			return _sim ||= start; 			
		}

		public function get start():Date
		{
			return _start ||= new Date();
		}

		public function set start(value:Date):void
		{
			_start = value;
			if (start.time > now.time)
			{
				_sim = _start;
			}
		}
	}
}