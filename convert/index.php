<?php
class ConvertVideo{
    public $input;
	public $output;
	public $coverPath;
	private $thumb_stdout;
	private $errors;
    public function __construct($input, $output, $coverpath){
        $this->input = $input;
		$this->output = $output;
		$this->coverPath = $coverpath;
    }
		function ExtractThumb($in, $out)
		{
			// Delete the file if it already exists
			if (file_exists($out)) { unlink($out); }

			shell_exec("ffmpeg -i $in -deinterlace -an -ss 1 -t 00:00:01 -r 1 -y -vcodec mjpeg -f mjpeg $out 2>&1");

		}

    public function run(){
        exec("ffmpeg -i $this->input -vcodec h264 -acodec aac -strict -2 $this->output", $thumb_stdout, $retval);
		$this->ExtractThumb($this->output, $this->coverPath);
    }
}
