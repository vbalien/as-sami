[as-sami](http://github.com/vbalien/as-sami)
=======================================================
SAMI(Synchronized Accessible Media Interchange) parser for Action Script

Installation
------------
```
'as-sami.as' import in your project
```
Usage
-----
```
// initialize SAMIParser
private var SAMIParser:SAMI = new SAMI();
// OR
private var SAMIParser:SAMI = new SAMI("SAMI Content");
```

```
// set SAMI for URL
SAMIParser.SAMILoader([URL:URLRequest]);
```

```
// set SAMI for content
SAMIParser.SetSAMI([Source:String]);
```

```
// get sync content; return to HTML format
SAMIParser.GetSYNC_Content([Index:int]); 
```

```
// get sync time
SAMIParser.GetSYNC_Time([Index:int]);
```

Example
-----
```
var myStr:String = SAMIParser.GetSYNC_Content(0);
myRichEditableText.textFlow = TextConverter.importToFlow(myStr, TextConverter.TEXT_FIELD_HTML_FORMAT);
```