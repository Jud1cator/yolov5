echo "Export models to onnx"

yolov5_root=/home/mmcv/yolo_object_detection/yolov5
labels_to=$yolov5_root/data/datasets/MMDataset_TyumenCopter/labels

function cl2yaml () {
    numcls=$1
    if [ "$numcls" -eq 1 ]; then
        echo $yolov5_root/data/tyumen_yamls/tyumen_mm_1_class.yaml
    else
        echo $yolov5_root/data/tyumen_yamls/tyumen_mm_"$numcls"_classes.yaml
    fi
}

# GLOBALS
IMAGESIZE=640

# -----------------------------------
# yolov5n
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5n
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)

NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_mm
echo $NAME

WEIGHTSFILE=$yolov5_root/runs/train/$NAME/weights/best.pt

# change labels to fit
labels_from=$yolov5_root/data/datasets/MMDataset_TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --data $DATAYAML \
            --weights $WEIGHTSFILE \
            --verbose \
            --name $NAME
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5n
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)

NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_mm
echo $NAME

WEIGHTSFILE=$yolov5_root/runs/train/$NAME/weights/best.pt

# change labels to fit
labels_from=$yolov5_root/data/datasets/MMDataset_TyumenCopter/labels_7_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --data $DATAYAML \
            --weights $WEIGHTSFILE \
            --verbose \
            --name $NAME
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5s
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)

NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_mm
echo $NAME

WEIGHTSFILE=$yolov5_root/runs/train/$NAME/weights/best.pt

# change labels to fit
labels_from=$yolov5_root/data/datasets/MMDataset_TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --data $DATAYAML \
            --weights $WEIGHTSFILE \
            --verbose \
            --name $NAME
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5s
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)

NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_mm
echo $NAME

WEIGHTSFILE=$yolov5_root/runs/train/$NAME/weights/best.pt

# change labels to fit
labels_from=$yolov5_root/data/datasets/MMDataset_TyumenCopter/labels_7_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --data $DATAYAML \
            --weights $WEIGHTSFILE \
            --verbose \
            --name $NAME
#endregion