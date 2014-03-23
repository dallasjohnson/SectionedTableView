# SectionedTableView

To populate the data source for a UITableView you would usually fetch a list of items from aserver or some other data source. This is usually pretty straight forward but then if you need to sort your data into tableview sections it all gets a bit complicated. You need an array of sections and within each section and array of items.

If you're on a project that is using **CoreData** this problem has already being solved using the **NSFetchedResultsController** utility class but otherwise you may need to role your own solution. 

Hopefully this will help.

**SectionedTableView** is a simple demo UITableview based app displaying sections without using Coredata. 
The solution relies on adding [**ItemSectionGroup**](SectionedTableView/Model/ItemSectionGroup.m) model class as an aggregate of the single items with a key method:

    -(NSArray*)addAndGroupItems:toArray:ascending:
This demo project has a model about as simple as you can get but should be enough to show the pattern I have used so you can customise it for your own model classes. 

---
There are other solutions to this problem on Stackoverflow that have iterated through all items one and a time filtering as it goes. I thought it may have been better to take advantage of some of the built in NSArray methods to get better performance.

Some people prefer to not use NSPredicates so the same filtering functionality could be achived using a block, filtering with the help of something like [EnumeratorKit](https://github.com/sharplet/EnumeratorKit)

	ItemSectionGroup *filteredArray = [sortedInputArray find:^BOOL(ItemSectionGroup *group) {
            return [group.groupTitle isEqualToString:sectionKey];
        }];
To keep this example simple and without adding other libraries and frameworks, this example just uses the built in classes and methods. 


### License
MIT License

	Copyright (c) 2014 Dallas Johnson
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of
	this software and associated documentation files (the "Software"), to deal in
	the Software without restriction, including without limitation the rights to use,
	copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
	Software, and to permit persons to whom the Software is furnished to do so,
	subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.