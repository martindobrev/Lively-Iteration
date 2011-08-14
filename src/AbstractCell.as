package
{
	import flash.display.Sprite;
	
	/**
	 * Class AbstractDrawable
	 * 
	 * Defines the common drawable object behaviour
	 */
	public class AbstractCell extends Sprite implements ICell
	{
		
		protected var rowIndex:int;
		protected var colIndex:int;
		protected var size:uint;
		protected var color:uint;
		protected var nextColor:uint;
		protected var neighbours:Vector.<ICell>;
		
		public function AbstractCell(rowIndex:int, colIndex:int, size:uint, color:uint = 0xffffff)
		{
			super();
			neighbours = new Vector.<ICell>();
			this.rowIndex = rowIndex;
			this.colIndex = colIndex;
			this.size = size;
			this.color = color;
		}
		
		/**
		 * Overriding this method creates a new
		 * way of displaying the object
		 */
		public function draw():void
		{
			//OVERRIDE THIS METHOD TO DO SOMETHING USEFUL!!!!
		}
		
		public function getColor() : uint
		{
			return this.color;
		}
		
		public function getRowIndex() : int
		{
			return this.rowIndex;
		}
		
		public function getColIndex() : int
		{
			return this.colIndex;
		}
		
		public function setColor(color:uint) : void 
		{
			this.color = color;
		}
		
		public function setNextColor(color : uint) : void
		{
			this.nextColor = color;
		}
		
		public function toNextGeneration() : void {
			this.color = this.nextColor;
			this.nextColor = 0xffffff;
		}
		
		public function getNeighbours() : Vector.<ICell>
		{
			return neighbours;
		}
		
		public function addNeighbour(cell : ICell) : void
		{
			if (cell != null)
			{
				neighbours.push(cell);
			}
		}
	}
}