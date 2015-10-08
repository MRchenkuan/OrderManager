#-*- coding: UTF-8 -*-
import Image
import os

# 文件路径，存储路径，尺寸（宽，高）
def reSizeImg(path, thumb_path, size):
    """生成缩略图"""
    region = Image.open(path)
    width, height = region.size
    # 缩放
    thumb = region.resize(size, Image.ANTIALIAS)

    base, ext = os.path.splitext(os.path.basename(path))
    filename = os.path.join(thumb_path)
    # 保存
    thumb.save(filename, quality=70)