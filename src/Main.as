package 
{
	import co.uk.mikestead.net.URLFileVariable;
	import co.uk.mikestead.net.URLRequestBuilder;
	import flash.display.BitmapData;
	import flash.display.JPEGEncoderOptions;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author xiangshun
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var bitmapdata:BitmapData = new BitmapData(200, 300, true,0xffff0000);
			var jpgOption:JPEGEncoderOptions = new JPEGEncoderOptions();
			var byteAry:ByteArray = bitmapdata.encode(bitmapdata.rect, jpgOption);
			
			var urlvar:URLVariables = new URLVariables();
			urlvar.type = "file/imgae";
			urlvar.content = new URLFileVariable(byteAry, "redColor");
			var re:URLRequest = new URLRequestBuilder(urlvar).build();
			re.method = URLRequestMethod.POST;
			re.url = "http://www.ucvcbbs.com/xs/uploadFileForAS/upload.php?r=" + Math.random();
			var load:URLLoader = new URLLoader();
			load.addEventListener(Event.COMPLETE, loadComplete);
			load.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			load.load(re);
		}
		
		private function loadError(e:IOErrorEvent):void 
		{
			trace(e);
		}
		
		private function loadComplete(e:Event):void 
		{
			trace(e.target.data);
		}
		
	}
	
}