Binary Image Classifier
===========

This program is a classifier that is trained to classify labeled binary images (image bits can only have two values: 0 and 1 for black and white), also known as supervised training.

The classifier is trained by fitting a GMM (Gaussian Mixture Model) based on each image's feature vector from the training set, which will allow us to classify new binary images (different from the training set) using a Maximum a Posteriori classification technique by comparing each of the new images' feature vector to the ones stored in the GMM. 

The results can be viewed in a confusion matrix, which is a table that is incremented after each new image has been classified. It allows us to visualize how many images have been correctly classified over the total set. 

After optimization by calculating the ideal feature vector length (8 was the chosen length), a classifying precision of **83%** was achieved.

You can read a more detailed explanation of how the classifier was built, optimized and the mathematics used here: [report](https://github.com/Adamouization/Binary-Image-Classifier/blob/master/report.pdf).


## Screenshots

###### Confusion matrix screenshot - assessing the classifier's quality

![confusion matrix screenshot](https://github.com/Adamouization/Binary-Image-Classifier/blob/master/screenshots/confusion_matrix.png)

###### Gaussian Mixture Model screenshot - the results of the classifier's training used to classify new images

![GMM screenshot](https://github.com/Adamouization/Binary-Image-Classifier/blob/master/screenshots/GMM.png)


## Usage

Clone this repository and open the project in MatLab:

```
git clone https://github.com/Adamouization/Binary-Image-Classifier
```

#### MatLab application usage

Once you have the project opened in MatLab, move to the `src` directory and open the `script.m`. Run the `script.m` file directly from within MatLab

#### Command line usage

Once you have cloned the repository, `cd` into `Binary-Image-Classifier/src` directory:

```
cd Binary-Image-Classifier/src
```

Then run the following command:

```
"C:\<your_local_matlab_path>\matlab.exe" -nodisplay -nosplash -nodesktop -r "run('script.m');"
```

where `C:\<your_local_matlab_path>\matlab.exe` is the path to your MatLab executable.

## License 
* see [LICENSE](https://github.com/Adamouization/Binary-Image-Classifier/blob/master/LICENSE) file

## Contact

* email: adam@jaamour.com
* website: www.adam.jaamour.com
* twitter: [@Adamouization](https://twitter.com/Adamouization)
