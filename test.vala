
public class Test : Object {
	
	public static int main(string[] args) {
		if (args.length < 2) {
			stdout.printf("Usage: %s FILE\n", args[0]);
			
			return -1;
		}
		
		CxTypes.IplImage *img = HighGUI.load_image(args[1]);
		CxTypes.MemStorage *storage = CxCore.create_mem_storage(0);
		
		File exec_file = File.new_for_path(Environment.find_program_in_path(args[0]));
        string haarcascade_path =
			exec_file.get_parent().get_child("haarcascade_frontalface_alt2.xml").get_path();
		
		CvTypes.HaarClassifierCascade *cascade =
			(CvTypes.HaarClassifierCascade *) CxCore.load(haarcascade_path);
		
		double scale = 1.1;
		
		// Can't use CxTypes.Scalar(), not sure why, but may
		// be related to this: https://bugzilla.gnome.org/show_bug.cgi?id=578968 (see comment #5).
//~ 		CxTypes.Scalar blue = CxTypes.Scalar();
//~ 		blue.val = {0, 0, 255};
		CxTypes.Scalar blue = {};
		blue.val = {0, 0, 255};
		CxTypes.Scalar light_blue = {};
		light_blue.val = {0, 128, 255};
		CxTypes.Scalar cyan = {};
		cyan.val = {0, 255, 255};
		CxTypes.Scalar green = {};
		green.val = {0, 255, 0};
		CxTypes.Scalar orange = {};
		orange.val = {255, 128, 0};
		CxTypes.Scalar yellow = {};
		yellow.val = {255, 255, 0};
		CxTypes.Scalar red = {};
		red.val = {255, 0, 0};
		CxTypes.Scalar magenta = {};
		magenta.val = {255, 0, 255};
		
		CxTypes.Scalar[] colors = {blue, light_blue, cyan, green, orange, yellow, red, magenta};
		
		// Detect objects
		CxCore.clear_mem_storage(storage);
		CxTypes.Seq *objects = Cv.haar_detect_objects(img, cascade, storage, scale, 4, 0, {40, 50});
		
		CxTypes.Rect *r;
		// Loop through objects and draw boxes
		for (int i = 0; i < (objects != null ? objects -> total : 0); i++) {
			r = (CxTypes.Rect *) CxCore.get_seq_elem(objects, i);
			CxCore.rectangle(img, {r -> x, r -> y}, {r -> x + r -> width, r -> y + r -> height},
			colors[i % 8]);
		}
		
		HighGUI.named_window("Output");
		HighGUI.show_image("Output", img);
		HighGUI.wait_key();
		
		CxCore.release_image(&img);
		CxCore.release_mem_storage(&storage);
		Cv.release_haar_classifier_cascade(&cascade);
		
		delete img;
		delete storage;
		delete cascade;
		
		return 0;
	}
}