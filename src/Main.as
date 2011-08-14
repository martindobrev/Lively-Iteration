package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	[SWF(backgroundColor='#000000', frameRate='3')]
	public class Main extends Sprite
	{
		
		private var _gridChanger:CellGridChanger;
		private var _grid:ICollection;
		
		public function Main()
		{
			initStage();
			
			_grid = new SimpleCellGrid(30, 30, 600, 600);
			//_grid = new CircularCellGrid(30, 30, 600, 600);
			//_grid = new HexagonalCellGrid(30, 30, 20);
			addChild(_grid as AbstractGrid);
			_gridChanger = new CellGridChanger(_grid);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			//grid.drawGrid();
		}
		
		private function initStage() : void 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
		
		private function onEnterFrame(event:Event) : void 
		{
			_gridChanger.changeGrid();
		}
	}
}