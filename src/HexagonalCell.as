package
{
	public class HexagonalCell extends AbstractCell
	{
		
		private var points:Array;
		
		public function HexagonalCell(rowIndex:int, colIndex:int, size:uint, color:uint=0xffffff)
		{
			super(rowIndex, colIndex, size, color);
			this.size -= 2;
			calculatePoints();
		}
		
		private function calculatePoints() : void 
		{
			points = new Array();
			var d2r:Number = Math.PI / 180;
			var angularDistance:Number = 60;
			for (var i:int = 0; i < 6; i++)
			{
				var rad:Number = angularDistance * i * d2r;
				var dx:Number = Math.cos(rad) * size / 2;
				var dy:Number = Math.sin(rad) * size / 2;
				points.push({x: size / 2 + dx, y: size / 2 + dy});
			}
		}
		
		override public function draw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(this.color);
			this.graphics.moveTo(points[0].x, points[0].y);
			for (var i:int = 1; i < points.length; i++)
			{
				this.graphics.lineTo(points[i].x, points[i].y);
			}
			this.graphics.lineTo(points[0].x, points[0].y);
			this.graphics.endFill();
		}
	}
}