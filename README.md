# FormMacro

Examples to copy some style key from one selected objet to another.

## Macro classes

List of macro defined here [Project/Sources/FormMacros.jso](Project/Sources/FormMacros.json)

An abtract class [FormMacro](Project/Sources/Classes/FormMacro.4dm) allow to share some functions between macro classes

### CopyStyle

[CopyStyle](Project/Sources/Classes/CopyStyle.4dm) copy selected object style into pasteboard using JSON format.

Because some style are not defined in object by applying `Null` to an object will failed, `defaultValue` function provide default value for some object keys.

> For instance `fontSize` 0 is Automatic, no `borderStyle` is "none"

### PasteStyle

[PasteStyle](Project/Sources/Classes/PasteStyle.4dm) get the style from pasteboard and apply to selected element

## TODO

- Apply the style to a list of selected elements (easy, you could PR if you implement i)
- More style keys
