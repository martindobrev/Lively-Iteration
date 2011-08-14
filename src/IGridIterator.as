package
{
	public interface IGridIterator
	{
		function next() : ICell;
		function hasNext() : Boolean;
	}
}