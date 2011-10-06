package massive.mcover.data;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class FileTest extends AbstractNodeListTest
{	
	var file:File;

	public function new() {super();}
	
	@BeforeClass
	override public function beforeClass():Void
	{
		super.beforeClass();
	}
	
	@AfterClass
	override public function afterClass():Void
	{
		super.afterClass();
	}
	
	@Before
	override public function setup():Void
	{
		super.setup();
		file = createEmptyFile();
	}
	
	@After
	override public function tearDown():Void
	{
		super.tearDown();
	}

	@Test
	override public function shouldGetClassesInItems()
	{
		var item1 = cast(nodeList.getItemByName("item1", Clazz),Clazz);
		var classes = nodeList.getClasses();

		Assert.areEqual(1, classes.length);
		Assert.areEqual(item1, classes[0]);

		var item2 = cast(nodeList.getItemByName("item2", Clazz),Clazz);
		classes = nodeList.getClasses();
		Assert.areEqual(2, classes.length);
	}

	@Test
	public function shouldAppendClassCountToResults()
	{
		var r = file.getResults();
		assertEmptyResult(r);

		var item1 = cast(file.getItemByName("item1", NodeMock), NodeMock);
		r = file.getResults(false);

		Assert.areEqual(0, r.cc);
		Assert.areEqual(1, r.c);

		item1.results.sc = 1;

		r = file.getResults(false);

		Assert.areEqual(1, r.cc);
		Assert.areEqual(1, r.c);	
	}

	//////////////////

	override function createEmptyNode():AbstractNode
	{
		return createEmptyNodeList();
	}

	override function createEmptyNodeList():AbstractNodeList
	{
		return createEmptyFile();
	}

	function createEmptyFile():File
	{
		return new File();
	}


}