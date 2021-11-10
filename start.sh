#!/bin/bash

cd /

#mkdir dra_img

#cp *.jpg dra_img

sed '4s/.*/#return 1/' /usr/local/amba-cv-tools-2.1.9-20200428.ubuntu-18.04/env/cv22.env >> /usr/local/amba-cv-tools-2.1.9-20200428.ubuntu-18.04/env/cv22.env-update

mv /usr/local/amba-cv-tools-2.1.9-20200428.ubuntu-18.04/env/cv22.env-update /usr/local/amba-cv-tools-2.1.9-20200428.ubuntu-18.04/env/cv22.env

source /usr/local/amba-cv-tools-2.1.9-20200428.ubuntu-18.04/env/cv22.env


#SDK 3.0 - Generating Cavalry binary for Ambaralla CV25 from ONNX face recogniser  model.   ./arcface_onnx_cavalry.sh 112 112 result.onnx


if [ ! -d output_files ]
then
    mkdir output_files
fi

# Generates the binary image file --input: image.jpg , color 0-RGB 1-BGR ,input size and output file path
gen_image_list.py -f /opt/dra_img/ -o output_files/img_list.txt -ns -e jpg -c 0 -d 0,0 -r 112,112 -bf output_files/dra_bin/ -bo output_files/dra_bin_list.txt


# Graph surgery : --input: input node name ,output file path
graph_surgery.py onnx -m /opt/r1202_16.onnx -o output_files/surgery_arcface.onnx -t SetIOShapes #ConstantifyShapes,FoldConstants

# Generates output vas files --input: input node name , image size, mean,scale , output node name and  folder for output files

onnxparser.py -m output_files/surgery_arcface.onnx -o arcface -isrc "is:1,3,112,112|iq|idf:0,0,8,0|ic:1|i:data=output_files/dra_bin_list.txt" -of output_files/arcface_out -odst "o:fc1|odf:fp32" -c act-force-fx8,coeff-force-fx8

# Generates vas_ouput folder --input : .vas file.
cd output_files/arcface_out; vas -auto -summary -show-progress -dvi arcface.vas


# Generates final calvalry binary --input : vas_ouput folder , cavalry file name
cavalry_gen -d vas_output/ -f onnx_arcface_cavalry.bin

cp -r output_files/ /opt
