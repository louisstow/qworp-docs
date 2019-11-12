# Functions Reference

- [Introduction](/docs/)

## Selector

### **`select <tags>`** `In: None. Out: <block>`{.input} ### {#select .def}

- **tags** - tags to match against blocks

Return all blocks that contain the given tags. When multiple tags are provided, all tags must be present for a block to be returned. If a function begins with a tag, this function will be invoked.

#### Example
Return all blocks tagged with #A and #B

~~~
=(select #A #B)
~~~

### **`not <tags>`** `In: <block>. Out: <block>`{.input} ### {#select .def}

- **tags** - tags to exclude input blocks

Functions similar to `select` though the blocks found will be excluded from the input.

#### Example
Return all blocks tagged with #A and #B but exclude those tagged with #C.

~~~
=(select #A #B | not #C)
~~~

### **`all`** `In: None. Out: <block>`{.input} ### {#all .def}

Return all blocks in the document.

### **`this`** `In: None. Out: <block>`{.input} ### {#this .def}

Return the block from where the function is being executed. If an action does not begin with a selector, `this` is implicitly added and executed first.

### **`children [incl]`** `In: <block>. Out: <block>`{.input} ### {#children .def}

- **incl** - include the input blocks in the output

Return the immediate children of the blocks passed into the input. If `incl` is present in the argument, the original parent block is included in the output.

#### Example

Return the children of blocks tagged with #A.

~~~
=(#A | children)
~~~

Return the block and children of the blocks tagged with #A.

~~~
=(#A | children incl)
~~~

### **`descendants [incl]`** `In: <block>. Out: <block>`{.input} ### {#descendants .def}

- **incl** - include the input blocks in the output

Return all the children of the input blocks. Where `children` will only return the immediate next level children, `descendants` will return the entire tree of children.

### **`parent [incl]`** `In: <block>. Out: <block>`{.input} ### {#parent .def}

- **incl** - include the input blocks in the output

Return the parent block of the input block(s).

### **`siblings`** `In: <block>. Out: <block>`{.input} ### {#parent .def}

- **incl** - include the input blocks in the output

Return the siblings of the input block(s) but not including the input block.

#### Example

Returns the blocks Y and Z.

~~~
X
	#A
	Y
	Z

=(#A | siblings)
~~~

### **`next [<limit: number> | all]`** `In: <block>. Out: <block>`{.input} ### {#next .def}

- **limit** - Number of sibling blocks to return. `all` will keep traversing until no more siblings.

Return the next sibling of the input blocks.

#### Example

Returns the block X.

~~~
#A
X
Y

=(#A | next)
~~~

### **`prev [<limit: number> | all]`** `In: <block>. Out: <block>`{.input} ### {#prev .def}

Functionally the same as `next` but returns previous siblings.

### **`first`** `In: <block>. Out: <block>`{.input} ### {#first .def}

Returns the very first block in the input blocks.

### **`last`** `In: <block>. Out: <block>`{.input} ### {#last .def}

Returns the last block in the input blocks.

### **`slice <from: number> <to: number>`** `In: <block>. Out: <block>`{.input} ### {#slice .def}

- **from** - the index of the input blocks to start the slice
- **to** - the index of the input blocks before which to end the slice

Returns a subset of the input blocks given a start and end index. If only one argument is present, it will use it as the from index.

#### Example

Returns X and Y blocks.

~~~
#A
	W
	X
	Y
	Z

=(#A | children | slice 1 3)
~~~

### **`filter <tag | fn>`** `In: <block>. Out: <block>`{.input} ### {#slice .def}

- **tag** - filter the input blocks to only those with the provided tag
- **fn** - filter the input blocks based on a special filter

Returns input blocks that pass a filter test. If a tag is used as the first argument then only blocks with the given tag will be returned. The available special filters are:

- **visible** - blocks that are visible
- **hidden** - blocks that are hidden
- **empty** - blocks with no text
- **notempty** - blocks that have text
- **plaintext** - blocks that have text only (no features like buttons, tags, immediates)
- **feature** - blocks that have features (buttons, tags, immediates)
- **haschildren** - blocks with children
- **nochildren** - blocks with no children
- **hascolor** - blocks with a color set
- **nocolor** - blocks with no color set
- **hasbackground** - blocks with a background set
- **nobackground** - blocks with no background set
- **hashead** - blocks that has head content from the `before` function
- **nohead** - blocks that has no head content from the `before` function
- **hastail** - blocks that has tail content from the `after` function
- **notail** - blocks that has no tail content from the `after` function

## Blocks

### **`after <tail: string> [once]`** `In: <block>. Out: <In>`{.input} ### {#after .def}

- **tail** - text to become the tail of the block
- **once** - when present will only set tail if there is none already

Sets the tail of the input blocks to the given string. This will also append the text to the end of the block. Returns the input blocks.

#### Example

Sets the tail of #A to the given text and appends it to the end.

~~~
#A

=(#A | after " (this is the tail)")
~~~

### **`before <head: string> [once]`** `In: <block>. Out: <In>`{.input} ### {#before .def}

- **head** - text to become the head of the block
- **once** - when present will only set head if there is none already

Functionally the same as `after`. Sets the head of the input blocks to the given string. This will also prepend the text to the start of the block. Returns the input blocks.

### **`hide`** `In: <block>. Out: <In>`{.input} ### {#hide .def}

Hides the input blocks. If already hidden this will have no effect.

### **`show`** `In: <block>. Out: <In>`{.input} ### {#show .def}

Input blocks become visible. If already visible this will have no effect.

### **`toggle`** `In: <block>. Out: <In>`{.input} ### {#toggle .def}

Switches the visibility state of the input blocks. If a block is hidden it becomes visible, if visible it is hidden.

### **`indent`** `In: <block>. Out: <In>`{.input} ### {#indent .def}

Input blocks are indented by a single tab. This will change the tree structure of the blocks.

### **`unindent`** `In: <block>. Out: <In>`{.input} ### {#unindent .def}

Input blocks are unindented by a single tab. This will change the tree structure of the blocks.

### **`flatten`** `In: <block>. Out: <In>`{.input} ### {#flatten .def}

Removes all indentation of the input blocks. This will change the tree structure of the blocks.

### **`remove`** `In: <block>. Out: None`{.input} ### {#remove .def}

Input blocks are removed from the document. This function returns nothing.

### **`duplicate`** `In: <block>. Out: <new block>`{.input} ### {#duplicate .def}

Creates a copy of the input blocks immediately after the original. Returns the newly created input blocks. The copied block will inherit the same properties such as head, tail, visibility state and styles.

### **`sort <sortkey: tag | alpha> [asc|desc]`** `In: <block>. Out: <In>`{.input} ### {#sort .def}

- **sortkey** - Either a tag or indentifier that will be used to sort the blocks
- **asc/desc** - The direction to sort, ascending or descending

Will sort and rearrange the immediate children of the input blocks in place. If a tag is present, the sorter will look at the value of the tag. If this option is not used or the indentifier `alpha` is present, the sorter will sort alphabetically based on the text. If no direction is specified it will sort in ascending order.

#### Example

Will sort the children of #A by the value of #t in descending order (largest to smallest).

~~~
#A
	a #t:4
		a.a
	b #t:2
	c #t:5
	d #t:1

=(#A | sort #t desc)
~~~

### **`move <destination: subcommand>`** `In: <block>. Out: <block>`{.input} ### {#move .def}

- **destination** - subcommand that should select a block as the destination of the move

Moves the input blocks and all the subtree of blocks to be a child of the block returned by the subcommand. If the destination block already has children it will be moved to be the last child. The destination subcommand may only use selector functions and will use the first block in the output.

*This function will always change the document even if the input blocks are already children of the destination block. Therefore it's recommended not to run move in an immediate action.*

#### Example

Will move the #B block to be a child of the #A block.

~~~
#B
#A

=(#B | move `#A`)
~~~

### **`pos`** `In: None. Out: <number>`{.input} ### {#pos .def}

Returns the position of the current block where the function is executed. The position represents a zero-based index of where the blocks sits relative to its parent.


#### Example

The #A tag is at position 0 relative to the root of the document. It's children a, b and c are 0, 1 and 2 respectively as that is the position relative to the parent #A.

~~~
#A {0}(pos)
	a {0}(pos)
	b {1}(pos)
	c {2}(pos)
~~~

## Date

### **`now`** `In: None. Out: <number>`{.input} ### {#now .def}

Returns the current date and time as a [UNIX timestamp](https://en.wikipedia.org/wiki/Unix_time).

## Formatting

### **`background <color: string>`** `In: <block>. Out: <In>`{.input} ### {#background .def}

- **color** - a color string that can either be hexadecimal RGB or an alias from [this table](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#colors_table)

Sets the background color of the input blocks. Once a background color is set it can only be unset with `clearformat`.

### **`color <color: string>`** `In: <block>. Out: <In>`{.input} ### {#color .def}

- **color** - a color string that can either be hexadecimal RGB or an alias from [this table](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value#colors_table)

Sets the text color of the input blocks. Once a background color is set it can only be unset with `clearformat`.

### **`bold`** `In: <block>. Out: <In>`{.input} ### {#bold .def}

Input blocks have the bold format applied.

### **`italic`** `In: <block>. Out: <In>`{.input} ### {#italic .def}

Input blocks have the italic format applied.

### **`strikethrough`** `In: <block>. Out: <In>`{.input} ### {#strikethrough .def}

Input blocks have the strikethrough format applied.

### **`underline`** `In: <block>. Out: <In>`{.input} ### {#underline .def}

Input blocks have the underline format applied.

### **`clearformat`** `In: <block>. Out: <In>`{.input} ### {#clearformat .def}

Resets all format and colors of the input blocks to the default values.

## Number

### **`avg`** `In: <number>. Out: <number>`{.input} ### {#avg .def}

Given an input of numbers, calculate the average and output it.

### **`count`** `In: <any>. Out: <number>`{.input} ### {#count .def}

Returns number of values given in the input. This could be blocks, numbers or strings.

### **`sum`** `In: <number>. Out: <number>`{.input} ### {#sum .def}

Given an input of numbers, calculate the sum and output it.

### **`dec <target: tag>`** `In: <block>. Out: <In>`{.input} ### {#dec .def}

- **target** - the tag to decrement the value

Decrement the value of a tag from the input blocks.

#### Example

Will decrement the value of the tag #value until stopped.

~~~
#A #value:5
=(#A | dec #value)
~~~

### **`inc <target: tag>`** `In: <block>. Out: <In>`{.input} ### {#inc .def}

- **target** - the tag to increment the value

Functionally the same as `dec` but instead will add 1.

### **`dollar`** `In: <number>. Out: <string>`{.input} ### {#dollar .def}

Given a number will return a string with the number formatted as a dollar value. If more than one number is input, it will use the first value.

#### Example

~~~
#A:9.9889

{$9.99}(#A | val #A | dollar)
~~~

### **`pct [<decimal: number>]`** `In: <number>. Out: <string>`{.input} ### {#pct .def}

- **decimal** - the number of decimal places (default: 0)

Given a number will return a string with the number formatted as a percentage value. If more than one number is input, it will use the first value.

#### Example

~~~
#A:0.5012

{50.1%}(#A | val #A | pct 1)
~~~

### **`fixed [<decimal: number>]`** `In: <number>. Out: <string>`{.input} ### {#fixed .def}

- **decimal** - the number of decimal places (default: 0)

Given a number will return a string with the number fixed to a decimal place. If more than one number is input, it will use the first value.

#### Example

~~~
#A:1.99

{2.0}(#A | val #A | fixed 1)
~~~

### **`max <target: tag>`** `In: <block|number>. Out: <block|number>`{.input} ### {#max .def}

- **target** - if blocks are the input, this tag will be used to return the block with the highest value

There are two ways to use the max functions. It can be used to return the input block with the highest value of a given tag. It can also be used to return the highest value given input numbers.

#### Example 1

Given the input blocks, returns the block with the highest value in the tag #value and set the color to red.

~~~
#A
	a #value:3
	b #value:1
	c #value:2

=(#A | children | max #value | color "red")
~~~

#### Example 2

Given the input blocks, extract the value of the tag #value and return the maximum.

~~~
#A
	a #value:3
	b #value:1
	c #value:2

{3}(#A | children | val #value | max)
~~~

### **`min <target: tag>`** `In: <block|number>. Out: <block|number>`{.input} ### {#min .def}

Functionally the same as min but looking for the lowest value.

### **`val <target: tag> [all]`** `In: <block>. Out: <number>`{.input} ### {#val .def}

- **target** - the tag for which to extract the value
- **all** - if present will extract all values if there is more than one tag on a block

Given input blocks, extract the value of the tag provided. If a block has multiple of the target tag, the indentifier all must be used to extract both values rather than just the first value.

### **`setval <target: tag> <destination: subcommand>`** `In: <number>. Out: <In>`{.input} ### {#setval .def}

- **target** - the tag to set the given number value
- **destination** - subcommand that should select a block as the target

Given an input number, set the value of a tag. The tag to set should be the first argument, the block that contains the tag should be the second argument as returned by the subcommand.

#### Example

Return the number 2, pass it into setval then set the tag of #value for the blocks tagged with #A.

~~~
#A #value

=(expr "2" | setval #value `#A`)
~~~

### **`expr <expression: string>`** `In: <number|block>. Out: <number>`{.input} ### {#expr .def}

- **expression** - a string of a mathematical expression

Will execute the expression in the string. Tag values can be used in the expression for calculation. If blocks are the input, it will execute the expression per block and use the tags of said block in the expression. If a number is the input, it be used in an expression with a special tag `#x`.

Extracting the value of a tag has many moving parts. First it will try to find the tag in the current block, then it will look up the tree for the tag in any parents, then it will look down the tree in any children. If the tag is still not found it will search the entire document and use the first occurance.

There are a set of common mathematical functions available:

- `min(a, b)` - return the minimum
- `max(a, b)` - return the maximum
- `sin(x)` - return the sine of `x` in radians
- `cos(x)` - return the cosine of `x` in radians
- `tan(x)` - return the tangent of `x` in radians
- `pow(base, exponent)` - return the base taken to the power of the exponent
- `abs(n)` - return the absolute value of `n`
- `random()` - return a random number between 0.0 (inclusive) and 1.0 (exclusive)
- `ceil(n)` - return `n` rounded up to the nearest integer
- `floor(n)` - return `n` rounded down to the nearest integer
- `round(n)` - return `n` rounded up or down to the nearest integer
- `sqrt(n)` - return the square root of `n`

#### Example

Select the children of #A, extract the value of #v and multiply by 2.

~~~
#A
	a #v:1
	b #v:3
	c #v:2

{2, 6, 4}(#A | children | expr "#v * 2" | join)
~~~

## String

### **`text`** `In: <block>. Out: <string>`{.input} ### {#text .def}

- **all** - return the raw text without removing features

Return the text of the input blocks removing all features including tags, buttons, immediates and textboxes. When the indentifier `all` is present, no features will be removed and the raw text will be returned.

### **`compact`** `In: <string>. Out: <string>`{.input} ### {#compact .def}

Compacts consecutive whitespace into a single space and performs trim.

#### Example

Select the block tagged with #A, return the text (without the tag), then collapse the whitespace.

~~~
this    is   a    string #A with   text
{this is a string with text}(#A | text | compact)
~~~

### **`trim`** `In: <string>. Out: <string>`{.input} ### {#trim .def}

Returns the input text but with the whitespace removed from the beginning and end of the text.

#### Example

The block #A has two spaces at the beginning and end. These will be removed by `trim`.

~~~
  text #A  
{text}(#A | text | trim)
~~~

### **`join <separator: string>`** `In: <number | string>. Out: <string>`{.input} ### {#join .def}

- **separator** - the string that will be used as glue between each element (default: `', '`)

Returns a string with all the inputs joined by a separator.

#### Example

Select the block tagged with #A, select its children and extract the text. This is joined by the default separator and returned. Notice the tab character before each item. This can be removed by using `trim` after extracting the text.

~~~
#A
	1
	2
	3
{	1, 	2, 	3}(#A | children | text | join)
~~~

## Tag

### **`addtag <tag> [once]`** `In: <block>. Out: <In>`{.input} ### {#addtag .def}

- **tag** - the tag that will be added to the block
- **once** - identifier to only add the tag to the block if one does not exist

Adds the provided tag to the input blocks. Will append the tag to the end of the block. If `only` is present, this will have no change if one is already present. Otherwise multiple tags can be added.

#### Example

~~~
#A
=(#A | addtag #B once)
~~~

### **`removetag <tag> [all]`** `In: <block>. Out: <In>`{.input} ### {#removetag .def}

- **tag** - the tag that will be removed from the block
- **all** - identifier to remove all the tags instead of just the first occurence

Removes the provided tag from the input blocks. This will remove the first occurence of the tag unless the `all` identifier is present.

### **`toggletag <tag>`** `In: <block>. Out: <In>`{.input} ### {#removetag .def}

- **tag** - the tag that will be added or removed to the block

Toggle tag will removed the provided tag if present on the input block. It will add it to the end of the block if it is not present. Toggle tag will remove all occurances of the tag that are present on the block.

## Misc.

### **`error`** `In: None. Out: <string>`{.input} ### {#error .def}

If at any point an error is made in an action, the error string is saved and can be viewed by using this function. This will always return the last error that has happened.

#### Example

~~~
=(expr "fail")
{expr: unrecognised expression function (fail)}(error)
~~~

### **`scroll`** `In: <block>. Out: None`{.input} ### {#scroll .def}

Take the first input block and scroll it into view. This function can only be executed from a button action.
