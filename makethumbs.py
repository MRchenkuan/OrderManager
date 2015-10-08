#!/usr/bin/env python
#coding=utf-8
'''
Created on 2012-6-2

@author: fatkun
'''
import Image
import os

def make_thumb(path, thumb_path, size):
    """生成缩略图"""
    img = Image.open(path)
    width, height = img.size
    # 裁剪图片成正方形
    if width > height:
        delta = (width - height) / 2
        box = (delta, 0, width - delta, height)
        region = img.crop(box)
    elif height > width:
        delta = (height - width) / 2
        box = (0, delta, width, height - delta)
        region = img.crop(box)
    else:
        region = img

    # 缩放
    thumb = region.resize((size, size), Image.ANTIALIAS)

    base, ext = os.path.splitext(os.path.basename(path))
    filename = os.path.join(thumb_path, '%s_thumb.jpg' % (base,))
    print filename
    # 保存
    thumb.save(filename, quality=70)

if __name__=='__main__':
    make_thumb('/Users/mac/DEV/site0/imageBed/bed/13978279165556.jpg','/Users/mac/Desktop/',(500,400))