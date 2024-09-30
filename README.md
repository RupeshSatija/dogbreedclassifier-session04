# Data
Pulled from Kaggle: https://www.kaggle.com/c/dog-breed-identification/data
And used in the training via pulling from google drive: https://drive.google.com/file/d/1j_Z_y5zXJWZd5Z6X5Z6X5Z6X5Z6X5Z6/view?usp=sharing

# Train
docker run -it --entrypoint python $imagename src/train.py

# Eval | Validation
docker run -it --entrypoint python $imagename src/eval.py logs/dogbreed_classification/checkpoints/epoch=epoch=04-val_loss=val_loss=0.02.ckpt'

# Infer
docker run -it --entrypoint python $imagename src/infer.py --input_folder samples --output_folder predictions --ckpt_path 'logs/dogbreed_classification/checkpoints/epoch=epoch=04-val_loss=val_loss=0.02.ckpt'
