echo "Собрать TyumenCopter метрики для уже обученных моделей на MMDataset"

yolov5_root=/home/mmcv/yolo_object_detection/yolov5
labels_to=$yolov5_root/data/datasets/TyumenCopter/labels

function cl2yaml () {
    numcls=$1
    if [ "$numcls" -eq 1 ]; then
        echo $yolov5_root/data/tyumen_yamls/tyumen_1_class.yaml
    else
        echo $yolov5_root/data/tyumen_yamls/tyumen_"$numcls"_classes.yaml
    fi
}

# -----------------------------------
# yolov5n
# 320 res
# 1 class

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/weights/yolov5n_mmdataset_batch012_1class_320res.onnx
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
touch runs/val/$NAME/result.txt
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5n
# 320 res
# 3 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/weights/yolov5n_mmdataset_batch012_3classes_320res.onnx
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5s
# 320 res
# 1 class

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/weights/yolov5s_mmdataset_batch012_1class_320res.onnx
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5s
# 320 res
# 3 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/weights/yolov5s_mmdataset_batch012_3classes_320res.onnx
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 1 class

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/weights/yolov5n_mmdataset_batch012_1class_640res.onnx
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/weights/yolov5n_mmdataset_batch012_3classes_640res.onnx
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/weights/yolov5n_mmdataset_batch012_7classes_640res.onnx
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 1 class

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/weights/yolov5s_mmdataset_batch012_1class_640res.onnx
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/weights/yolov5s_mmdataset_batch012_3classes_640res.onnx
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/weights/yolov5s_mmdataset_batch012_7classes_640res.onnx
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_mmdataset_"$NUMCLASSES"classes_"$IMAGESIZE"res_tyumen_val
mkdir runs/val/$NAME
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_7_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

python3 val.py --weights $WEIGHTSFILE \
            --data $DATAYAML \
            --img $IMAGESIZE \
            --name $NAME \
            --device 0 --exist-ok --verbose \
            &>> $yolov5_root/runs/val/$NAME/result.txt
#endregion