import os
import shutil
import pandas as pd
from tqdm import tqdm

root_dir = '/home/mmcv/Datasets/YOLOPersonDataset'
labels_from = 'labels_10_classes'
labels_to = 'labels'
images_dir = 'images'

for split in ['train', 'val']:
    for f in tqdm(os.listdir(f'{root_dir}/{labels_from}/{split}')):
        src = f'{root_dir}/{labels_from}/{split}/{f}'
        dst = f'{root_dir}/{labels_to}/{split}/{f}'
        df = pd.read_csv(src, sep=' ', header=None, index_col=False, names=['class', 'x1', 'y1', 'x2', 'y2'])
        # print(df)
        df["class"].replace({t:0 for t in range(6)}, inplace=True)
        df["class"].replace({t:1 for t in [6,7,8]}, inplace=True)
        df["class"].replace({t:0 for t in [9]}, inplace=True)
        # print(df)
        df.to_csv(dst, index=False, header=False, sep = ' ')
        