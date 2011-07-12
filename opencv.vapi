/* Copyright 2009-2011 Yorba Foundation
 *
 * This software is licensed under the GNU LGPL (version 2.1 or later).
 * See the COPYING file in this distribution. 
 */

[CCode (cheader_filename="opencv/cv.h")]
namespace Cv {
    
    [CCode (cname="cvHaarDetectObjects")]
    public CxTypes.Seq *haar_detect_objects(void *image, CvTypes.HaarClassifierCascade *cascade,
        CxTypes.MemStorage *storage, double scale_factor = 1.1, int min_neighbors = 3,
        int flags = 0, CxTypes.Size min_size = {0, 0});
        
    [CCode (cname="cvReleaseHaarClassifierCascade")]
    public void release_haar_classifier_cascade(CvTypes.HaarClassifierCascade **cascade);
}

[CCode (cheader_filename="opencv/cxtypes.h")]
namespace CxTypes {
    
    [Compact]
    [CCode (cname="IplImage")]
    public struct IplImage {
        public int nSize;
        public int ID;
        public int nChannels;
        public int alphaChannel;
        public int depth;
        public char colorModel[4];
        public char channelSeq[4];
        public int dataOrder;
        public int origin;
        public int align;
        public int width;
        public int height;
        public IplROI *roi;
        public IplImage *maskROI;
        public void *imageId;
        IplTileInfo *tileInfo;
        public int imageSize;
        public char *imageData;
        public int widthStep;
        public int BorderMode[4];
        public int BorderConst[4];
        public char *imageDataOrigin;
    }
    
    [SimpleType]
    [CCode (cname="IplROI", destroy_function="")]
    public struct IplROI {
        public int coi;
        public int xOffset;
        public int yOffset;
        public int width;
        public int height;
    }
    
    [Compact]
    [CCode (cname="IplTileInfo", destroy_function="")]
    public struct IplTileInfo {
    }
    
    [Compact]
    [CCode (cname="CvMemStorage", destroy_function="")]
    public struct MemStorage {
        public int signature;
        public MemBlock *bottom;
        public MemBlock *top;
        public MemStorage *parent;
        public int block_size;
        public int free_space;
    }
    
    [Compact]
    [CCode (cname="CvMemBlock", destroy_function="")]
    public struct MemBlock {
        public MemBlock *prev;
        public MemBlock *next;
    }
    
    [SimpleType]
    [CCode (cname="CvRect", destroy_function="")]
    public struct Rect {
        public int x;
        public int y;
        public int width;
        public int height;
    }
    
    [SimpleType]
    [CCode (cname="CvSize", destroy_function="")]
    public struct Size {
        public int width;
        public int height;
    }
    
    [SimpleType]
    [CCode (cname="CvPoint", destroy_function="")]
    public struct Point {
        public int x;
        public int y;
    }
    
    [SimpleType]
    [CCode (cname="CvScalar")]
    public struct Scalar {
        public double val[4];
    }
    
    [Compact]
    [CCode (cname="CvSeq", destroy_function="")]
    public struct Seq {
        public int flags;
        public int header_size;
        public Seq *h_prev;
        public Seq *h_next;
        public Seq *v_prev;
        public Seq *v_next;
        public int total;
        public int elem_size;
        public char *block_max;
        public char *ptr;
        public int delta_elems;
        public MemStorage *storage;
        public SeqBlock *free_blocks;
        public SeqBlock *first;
    }
    
    [Compact]
    [CCode (cname="CvSeqBlock", destroy_function="")]
    public struct SeqBlock {
        public SeqBlock *prev;
        public SeqBlock *next;
        public int start_index;
        public int count;
        public char *data;
    }
}

[CCode (cheader_filename="opencv/cvtypes.h")]
namespace CvTypes {
    
    //[CCode (cname="CV_HAAR_FEATURE_MAX")]
    //public const int HAAR_FEATURE_MAX;
    
    [Compact]
    [CCode (cname="CvHaarClassifierCascade", destroy_function="")]
    public struct HaarClassifierCascade {
        public int flags;
        public int count;
        public CxTypes.Size orig_window_size;
        public CxTypes.Size real_window_size;
        public double scale;
        public HaarStageClassifier *stage_classifier;
        public HidHaarClassifierCascade *hid_cascade;
    }
    
    [Compact]
    [CCode (cname="CvHaarStageClassifier", destroy_function="")]
    public struct HaarStageClassifier {
        public int  count;
        public float threshold;
        public HaarClassifier *classifier;
        public int next;
        public int child;
        public int parent;
    }
    
    [Compact]
    [CCode (cname="CvHaarClassifier", destroy_function="")]
    public struct HaarClassifier {
        public int count;
        public HaarFeature *haar_feature;
        public float *threshold;
        public int *left;
        public int *right;
        public float *alpha;
    }
    
    [Compact]
    [CCode (cname="CvHaarFeature", destroy_function="")]
    public struct HaarFeature {
        public int tilted;
        public HaarFeatureRect rect[3];
    }
    
    public struct HaarFeatureRect {
        public CxTypes.Rect r;
        public float weight;
    }
    
    [Compact]
    [CCode (cname="CvHidHaarClassifierCascade", destroy_function="")]
    public struct HidHaarClassifierCascade {
    }
}

[CCode (cheader_filename="opencv/cxcore.h")]
namespace CxCore {
    
    [CCode (cname="cvCreateMemStorage")]
    public CxTypes.MemStorage *create_mem_storage(int block_size = 0);
    
    [CCode (cname="cvClearMemStorage")]
    public void clear_mem_storage(CxTypes.MemStorage *storage);
    
    [CCode (cname="cvReleaseMemStorage")]
    public void release_mem_storage(CxTypes.MemStorage **storage);
    
    [CCode (cname="cvLoad")]
    public void *load(char *filename, CxTypes.MemStorage *memstorage = null,
        char *name = null, char **real_name = null);
    
    [CCode (cname="cvReleaseImage")]
    public void *release_image(CxTypes.IplImage **image);
    
    [CCode (cname="cvGetSeqElem")]
    public char *get_seq_elem(CxTypes.Seq *seq, int index);
    
    [CCode (cname="cvClearSeq")]
    public void clear_seq(CxTypes.Seq *seq);
    
    [CCode (cname="cvRectangle")]
    public void *rectangle(void *img, CxTypes.Point pt1, CxTypes.Point pt2, CxTypes.Scalar color,
        int thickness = 1, int line_type = 8, int shift = 0);
}

[CCode (cheader_filename="opencv/highgui.h")]
namespace HighGUI {
    
    namespace LOAD_IMAGE {
        [CCode (cname="CV_LOAD_IMAGE_UNCHANGED")]
        public const int UNCHANGED;
        [CCode (cname="CV_LOAD_IMAGE_GRAYSCALE")]
        public const int GRAYSCALE;
        [CCode (cname="CV_LOAD_IMAGE_COLOR")]
        public const int COLOR;
        [CCode (cname="CV_LOAD_IMAGE_ANYDEPTH")]
        public const int ANYDEPTH;
        [CCode (cname="CV_LOAD_IMAGE_ANYCOLOR")]
        public const int ANYCOLOR;
    }
    
    [CCode (cname="cvLoadImage")]
    public CxTypes.IplImage *load_image(char *file_name, int iscolor = LOAD_IMAGE.COLOR);
    
    [CCode (cname="cvNamedWindow")]
    public int named_window(char *name, int flags = 1);
    
    [CCode (cname="cvShowImage")]
    public void show_image(char *name, void *image);
    
    [CCode (cname="cvWaitKey")]
    public int wait_key(int delay = 0);
}