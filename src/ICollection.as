package
{
	/**
	 * Interface ICollection
	 * 
	 * Defines the actions that a collection
	 * of drawable objects should posses
	 */ 
	public interface ICollection
	{
		function iterator() : IGridIterator;
		function redraw() : void;
	}
}