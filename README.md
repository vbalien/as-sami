[as-sami](http://github.com/vbalien/as-sami)
=======================================================
SAMI(Synchronized Accessible Media Interchange) parser for Action Script

Installation
------------
```
'SAMIParser.as' import in your project
```
Usage
-----
```
// initialize SAMIParser
private var sp:SAMIParser = new SAMIParser();
// OR
private var sp:SAMIParser = new SAMIParser("SAMI Content");
```

```
// load SAMI for URL
sp.SAMILoader([URL:URLRequest]);
```

```
// set SAMI for content
sp.SetSAMI([Source:String]);
```

```
// get sync content; return to HTML format
sp.GetSYNC_Content([Index:int]); 
```

```
// get sync time
sp.GetSYNC_Time([Index:int]);
```

```
// get sync length
sp.GetSYNC_Length();
```

Example
-----
```
var myStr:String = sp.GetSYNC_Content(0);
myRichText.textFlow = TextConverter.importToFlow(myStr, TextConverter.TEXT_FIELD_HTML_FORMAT);
```