echo "Напрямую на датасете (Только tyumen)"

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

function batch_size () {
    if [ $1 == "yolov5n" ]; then
        if [ "$2" -eq 320 ]; then
            echo 128
        else
            echo 64
        fi
    else
        if [ "$2" -eq 320 ]; then
            echo 64
        else
            echo 32
        fi
    fi
}

# GLOBALS
NUM_OF_EPOCHS=150
NUM_OF_EVOL_EPOCHS=10
PATIENCE=10
HYP_PATH=$yolov5_root/data/hyps/hyp.scratch-med.yaml

# -----------------------------------
# yolov5n
# 320 res
# 1 class

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5n
# 320 res
# 3 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5s
# 320 res
# 1 class

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5s
# 320 res
# 3 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=320
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 1 class

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5n
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5n
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 1 class

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=1
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_1_class
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 3 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=3
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_3_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion

# -----------------------------------
# yolov5s
# 640 res
# 7 classes

#region
CURRENTMODEL=yolov5s
WEIGHTSFILE=$yolov5_root/$CURRENTMODEL.pt
NUMCLASSES=7
DATAYAML=$(cl2yaml $NUMCLASSES)
IMAGESIZE=640
NAME="$CURRENTMODEL"_"$NUMCLASSES"classes_"$IMAGESIZE"res_only_tyumen
echo $NAME
# change labels to fit
labels_from=$yolov5_root/data/datasets/TyumenCopter/labels_7_classes
rm -r $labels_to
cp -r $labels_from $labels_to
# change labels to fit

BATCH_SIZE=$(batch_size $CURRENTMODEL $IMAGESIZE)

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $HYP_PATH \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --evolve $NUM_OF_EVOL_EPOCHS \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0

EVOLVED_HYPS=$yolov5_root/runs/evolve/$NAME/hyp_evolve.yaml

python3 train.py --weights $WEIGHTSFILE \
        --cfg $yolov5_root/models/$CURRENTMODEL.yaml \
        --data $DATAYAML \
        --hyp $EVOLVED_HYPS \
        --epochs $NUM_OF_EPOCHS \
        --batch-size $BATCH_SIZE \
        --img $IMAGESIZE \
        --cache \
        --name $NAME \
        --exist-ok \
        --patience $PATIENCE \
        --device 0
#endregion