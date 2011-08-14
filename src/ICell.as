package
{
	/**
	 * Interface IDrawable
	 * 
	 * Defines the common 
	 * functions of a drawable 
	 * object
	 */ 
	public interface ICell
	{
		function draw() : void;
		function getColor() : uint;
		function getRowIndex() : int;
		function getColIndex() : int;
		function setColor(color : uint) : void;
		function setNextColor(color : uint) : void;
		function toNextGeneration() : void;
		function addNeighbour(cell:ICell) : void;
		function getNeighbours() : Vector.<ICell>;
	}
}