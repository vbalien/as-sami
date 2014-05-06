/*
* SAMI Parser
* 
* Copyright (c) 2013 엘련(vbalien@live.jp), http://www.alien.pe.kr
* Licensed under the MIT License:
* http://www.opensource.org/licenses/mit-license.php
*/

package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class SAMI
	{
		private var SyncArray:Array = new Array();
		private var SyncTimeArray:Array = new Array();
		
		public function SAMI(data:String = '')
		{
			var Source:String = data;
			SyncTimeArray = Parser(Source,"<SYNC Start=",">");
			SyncArray = Parser(Source,"><P Class=","<SYNC ");
		}
		
		public function SAMILoader(URL:URLRequest):void
		{
			var SAMILoader:URLLoader = new URLLoader();
			SAMILoader.addEventListener(Event.COMPLETE,SamiLoadComplete);
			SAMILoader.load(URL);
		}
		
		public function SetSAMI(data:String):void
		{
			var Source:String = data;
			SyncTimeArray = Parser(Source,"<SYNC Start=",">");
			SyncArray = Parser(Source,"><P Class=","<SYNC ");
		}
		
		private function SamiLoadComplete(e:Event):void
		{
			var Source:String = e.target.data;
			SyncTimeArray = Parser(Source,"<SYNC Start=",">");
			SyncArray = Parser(Source,"><P Class=","<SYNC ");
		}
		
		private function Parser(Str:String,Start:String,End:String):Array
		{
			var Source:String = Str;
			var Count:int = 0;
			var ReArray:Array = new Array();
			
			while(Source.indexOf(Start)!= -1){
				Source = Source.substr(Source.indexOf(Start) + Start.length);
				ReArray[Count] = (Source.substr(0,Source.indexOf(End)));
				Count++;
			}
			return ReArray;
		}
		
		public function GetSYNC_Content(Index:int):String
		{
			var Content:String = "<P Class="+SyncArray[Index];
			
			var LowArray:Array = Parser(Content,"<",">");
			var RepString:String;
			for(var i:int = 0;LowArray.length > i;i++){
				var LowString:String = String(LowArray[i]).toLowerCase();
				if(LowString.indexOf("color=") != -1){
					var RepArray:String = LowArray[i].substr(LowString.indexOf("color=") + "color=".length);
					RepString = LowArray[i].replace(RepArray ,"\"#"+ColorReplace(RepArray)+"\"");
					RepString = RepString.toLowerCase();
				}else{
					RepString = String(LowArray[i]).toLowerCase();
				}
				
				Content = Content.replace(LowArray[i] ,RepString);
				
			}
			
			var ModArray:Array = Parser(Content,"<font","<");
			for(i = 0;ModArray.length > i;i++){
				if(String(ModArray[i]).toLowerCase().indexOf("</font>") == -1){
					Content = Content.replace(ModArray[i] ,ModArray[i]+"</font>");
				}
			}
			
			return Content;
		}
		
		public function GetSYNC_Time(Index:int):int
		{
			return SyncTimeArray[Index];
		}
		
		private function ColorReplace(Str:String):String
		{
			var Source:String = Str.toLowerCase();
			Source = Source.replace("#","");
			Source = Source.replace("\"","");
			Source = Source.replace("aqua","0b57a4");
			Source = Source.replace("babyblue","b8d0e8");
			Source = Source.replace("black","ffffff");
			Source = Source.replace("blue","2a82d7");
			Source = Source.replace("bluegreen","148aa5");
			Source = Source.replace("blueviolet","3714a4");
			Source = Source.replace("brown","964B00");
			Source = Source.replace("crimson","a50516");
			Source = Source.replace("deeppink","fb3c8f");
			Source = Source.replace("forestgreen","1b4f15");
			Source = Source.replace("fuchsia","a51497");
			Source = Source.replace("gray","686868");
			Source = Source.replace("green","3aa03a");
			Source = Source.replace("hotpink","ff0080");
			Source = Source.replace("lemon","fee233");
			Source = Source.replace("lighblue","8bbdeb");
			Source = Source.replace("lightred","fc6a6c");
			Source = Source.replace("lime","c1fd33");
			Source = Source.replace("limegreen","2bfd2f");
			Source = Source.replace("magenta","fc1cad");
			Source = Source.replace("maroon","7f2b14");
			Source = Source.replace("midnight","000066");
			Source = Source.replace("olive","2b4726");
			Source = Source.replace("orange","fd7222");
			Source = Source.replace("orangered","fc331c");
			Source = Source.replace("orangeyellow","ffcc00");
			Source = Source.replace("peach","FFE5B4");
			Source = Source.replace("pink","fc5ab8");
			Source = Source.replace("purple","af31f2");
			Source = Source.replace("red","fc0d1b");
			Source = Source.replace("redorange","d7462c");
			Source = Source.replace("salmon","f69e94");
			Source = Source.replace("tan","f2ddbf");
			Source = Source.replace("teal","2b8a6d");
			Source = Source.replace("violet","6b28ce");
			Source = Source.replace("violetblue","6041fa");
			Source = Source.replace("white","ffffff");
			Source = Source.replace("yellow","feee35");
			Source = Source.replace("yellowgreen","defd35");
			Source = Source.replace("yelloworange","fec42e");
			return Source;
		}
	}
}