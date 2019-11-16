# Introduction to qworp

**qworp** is a text editor where you make the rules. It's programmable and interactive.

- [Learn qworp in 2 minutes (Interactive Demo)](/api/4zvEBQ/duplicate)
- [Function Reference](/docs/functions)
- [REST API](/docs/api)

## Blocks

The atomic unit of a qworp document is a block. A document is simply a tree of blocks. A block is represented by a line of text in the document. The tree is represented by the indentation (or tab characters) that make blocks children of other blocks.

## Tags

Tags are a way to identify blocks in a document. A block can have many tags and tags need not be unique. They are represented just like a hashtag with a pound sign and some non-whitespace characters (e.g. #thisisatag).

A tag on a block can have a numerical value associated with it. By default all tags have a value of `0`. These can be used as variables to store numeric values. This is represented with a colon and the numerical value (e.g. #mytag:56).

## Actions

The glue that binds tags and blocks together is the actions. Actions are a set of functions that can manipulate and query the document. Actions can be triggered in a variety of ways such as in buttons, textboxes or immediates.

Actions will chain output of a function into the input of the next function. This is represented by a pipe character `|` and will be a familiar concept for those who have used UNIX-like terminals.

## Data Types

Functions in actions work with data types whether passed into the input or as an argument. There are six natively supported data types:

1. **string** - A string is the data type used for any text related functions.

2. **number** - Numbers can come from tag values, expressions or functions that return a number.

3. **block** - Selector functions return blocks.

4. **tag** - Functions can accept a tag as an argument.

5. **subcommand** - A special data type to embed an action within the arguments of a function. Represented with backticks.

6. **ident** - Identifier keywords that certain functions will understand as an argument.

## Functions

There is a large variety of functions available to manipulate and query the document. See the full [function reference](/docs/functions) for more.

## Selectors

Querying the document is done with selector functions. Selector fuinctions look for blocks that contain the specified tags. Once you have some blocks you can use tree traversal functions or the filter function to narrow down the results to the block you want to target.

## Buttons

Buttons are an interactive way to run an action when a button is clicked. This is represented by the following text `[button label](actions)`. This will render a button with the label provided and execute the actions when clicked.

## Textbox

A textbox is used to render text in the document. The actions will be executed on every document change. This is represented with the following text `{}(actions)`. The output of the actions (either a string or number) is inserted in between the curly braces.

## Immediates

Immediates are actions that will be executed on every document change but the output of the last function is discarded. These are used to setup rules.
