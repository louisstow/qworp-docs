~~~
Learn QWORP in Y minutes =(bold | color "white" | background "black")
The interactive and programmable living document =(color "white" | background "black")

This is a block
	A block can have children blocks by indenting with a tab character
		We can go deeper
			Deeper still!

Blocks can have #tags

Tags can be used to target blocks [Click Me](#tags | color "red")

Tags can have a numerical value [+1](#tags | inc #tags) {0}(expr "pow(#tags, 2)")

Actions manipulate the document. Actions are a chain of functions separated by the pipe character | . The output of the previous function becomes the input of the next function.

Immediate actions get run on every document change
	=(this | after " this is an immediate action") this is an immediate action

Button actions get run when clicked
	[Button Label Here](this | after " this is a button")

Textbox actions get run on every document change then render the output of the action
	{62}(all | count)

Selectors find blocks by tags

<Space> = logical AND
   |    = logical OR

find blocks tagged with #A AND #B then pass them into dostuff
(#A #B | dostuff)

find blocks tagged with #A OR #B then pass them into dostuff
(#A | #B | dostuff)

find blocks tagged with (#A AND #B) OR #C then pass them into dostuff
(#A #B | #C | dostuff)

Traversal functions take blocks as input and traverse the block hierarchy.

#Tree
	1.
	2.
		2.1.
			2.1.1. Try to find me
	3.
[Traverse the tree](#Tree | children | first | next | children | children | color "red")

Blocks can be moved around

#MoveThisBlock
#Destination
[Move it](#MoveThisBlock | move `#Destination`)

Backticks ` ` are subcommands that can be used in some functions to target blocks. They can contain selectors and other traversal functions.

Parent block
	1st block
	2nd block [Move me](move `this | parent`)
		Children blocks will be moved with it
	3rd block

Children of a block can be sorted by a tag value or alphabetically

[Sort #value asc](this | sort #value asc) [Sort #value desc](sort #value desc) [Sort Alphabetical](sort)
	A #value:4
	B #value:2
	C #value:8
	D #value:1

Blocks can be made hidden.
[Toggle above block](prev | toggle) [Hide](prev | hide) [Show](prev | show)

String functions can extract and manipulate text from blocks

#text
	Item A #thiswillbestripped
	Item B [so will this](this). Text only
	Item C

{}(#text | children | text | trim | join " - ")

The numerical values of tags can be used in expressions

#numbers
	Item A #price:3 #quantity:1
	Item B #price:9 #quantity:3
	Item C #price:2 #quantity:2

Sum of prices: {}(#numbers | children | val #price | sum)
Total: {}(#numbers | children | expr "#price * #quantity" | sum)
Item with highest price: {}(#numbers | children | max #price | text | trim)

Blocks can be formatted and styled

Italic =(italic)
Bold =(bold)
Underline =(underline)
Strikethrough =(strikethrough)
Color =(color "#008822")
Background color =(background "#eeeeee")
~~~