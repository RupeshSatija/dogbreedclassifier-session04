# Data
Pulled from Kaggle: https://www.kaggle.com/c/dog-breed-identification/data
And used in the training via pulling from google drive: https://drive.google.com/file/d/1j_Z_y5zXJWZd5Z6X5Z6X5Z6X5Z6X5Z6/view?usp=sharing

# Train
docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -it dogbreed-1 python src/train.py

<!-- docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -it dogbreed-1 python src/train.py -->

# Eval | Validation
docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -it dogbreed-1 python src/eval.py 'logs/dogbreed_classification/checkpoints/$checkpoint_filename'

<!-- docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -it dogbreed-1 python src/eval.py 'logs/dogbreed_classification/checkpoints/epoch=epoch=04-val_loss=val_loss=0.03.ckpt -->

# Infer
docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -v $(pwd)/samples:/app/samples -v $(pwd)/predictions:/app/predictions -it dogbreed-1 python src/infer.py --input_folder samples --output_folder predictions --ckpt_path 'logs/dogbreed_classification/checkpoints/$checkpoint_filename'

<!-- docker run -v $(pwd)/data:/app/data -v $(pwd)/logs:/app/logs -v $(pwd)/samples:/app/samples -v $(pwd)/predictions:/app/predictions -it dogbreed-1 python src/infer.py --input_folder samples --output_folder predictions --ckpt_path 'logs/dogbreed_classification/checkpoints/epoch=epoch=04-val_loss=val_loss=0.03.ckpt' -->
