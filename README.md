# FormMacro

Examples to copy some style keys from one selected objet to another.

## Macro classes

List of macro defined here [Project/Sources/FormMacros.jso](Project/Sources/FormMacros.json)

An abtract class [FormMacro](Project/Sources/Classes/FormMacro.4dm) allow to share some functions between macro classes

### CopyStyle

[CopyStyle](Project/Sources/Classes/CopyStyle.4dm) copy selected object style into pasteboard using JSON format.

Not all style keys are copyed, a list of keys is [here](https://github.com/mesopelagique/Example-FormMacro-CopyPasteStyle/blob/master/Project/Sources/Classes/CopyStyle.4dm#L3) in code. More could be added, see todo (like background color...)

#### to fix see todo

Because some style are not defined in object by applying `Null` to an object will failed, [`defaultValue`](https://github.com/mesopelagique/Example-FormMacro-CopyPasteStyle/blob/master/Project/Sources/Classes/CopyStyle.4dm#L33) function provide default value for some object keys.

> - `fontSize` 0 is for Automatic
> - no `borderStyle` is "none"

### PasteStyle

[PasteStyle](Project/Sources/Classes/PasteStyle.4dm) get the style from pasteboard and apply to selected element

## TODO

- Apply the style to a list of selected elements (easy, you could PR if you implement i)
- More style keys
- Instead of settings null, unset when pasting style if not defined
