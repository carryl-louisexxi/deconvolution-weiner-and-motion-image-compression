# deconvolution-weiner-and-motion-image-compression

Exercise 2A – (5%) – De-convolution using a Wiener Filter
RESULT: DECONV_TEST 

Figure 1. Reconstructed image of the given corrupted image.
![image](https://user-images.githubusercontent.com/69174836/151278876-323c0e28-cd94-4773-b6ca-07a687b10e2f.png)

Figure 2. Reconstructed image of the given corrupted image.
![image](https://user-images.githubusercontent.com/69174836/151278891-c4698728-adb5-4d62-81ea-38c97a46ea9c.png)

The corrupted image is blurry and have some small amount of noise. To recognize the image, Weiner filter is used. Here, the codes that we are given are the input image (blurred with noisy), blurring function, and k (proportional to the e noise standard deviation times the number of pixels in the image). The process that I take is first obtain the Fourier transforms of the input image and blurring function.  If there are zero values in the spectrum, then these values will be adjusted to avoid division by zero. After that we compute the inverse Fourier transformation based on the formula given.  As we see, the resulting image gives clear presentation of the plate numbers.


RESULT: DECONV_TEST2
What fine tuning of the ‘k’ term will give you enough detail to be able to make out the registration numbers?
Answer: 0.001
![image](https://user-images.githubusercontent.com/69174836/151278907-81e56568-f6f0-4602-ab93-065285852e0b.png)

By trial and error, I believe K is 0.001. As we see, the resulting image is below is clearer compared to the given blurry and noisy image. When I put 0.0001 as K, I get an image that is more detail but it has more image artefacts. That factor makes it difficult to read what’s in the image. When I put 0.01 as K, the image is less sensitive to noise but it is a bit blurry compared to 0.001.


Exercise 3C – Motion Image Compression (5%)
RESULT: JPEG_8x8_TEST

Figure 1 Reconstruction result of the generated random 8x8 image block.
![image](https://user-images.githubusercontent.com/69174836/151278950-fe496472-6128-420b-b61e-1d8c0e49ad20.png)

Figure 2. Reconstruction result of the given 8x8 image block. 
![image](https://user-images.githubusercontent.com/69174836/151278967-3aedc865-ee19-4f4c-8831-ea417fe7a824.png)

The above right is the decompressed/reconstructed image. As we see, there’s a bit difference between the quality of the input and decompressed image. This is because of the uint8 casting of the 8x8 image block. Also, given at the bottom right is the differences of the two.


RESULT: MPEG_8x8_TEST

Figure 1. Compression result for the first image frame.
![image](https://user-images.githubusercontent.com/69174836/151279014-7fd76775-fdbe-4c46-8bd9-d14e6a37b99f.png)


Figure 2. Compression result for the second image frame.
![image](https://user-images.githubusercontent.com/69174836/151279041-87cd8538-4eb4-43f4-b480-855f2964c9ec.png)


Figure 3. Compression result for the second image frame.
![image](https://user-images.githubusercontent.com/69174836/151279058-872b9250-edcc-4c77-b627-cbe58dc75acb.png)


The reference image is located at top right. That will serve as the reference for our reconstructed image. The bottom left is the transmitted data. That is the detected changes between the current and previous frames. The bottom right is the reconstructed image. This is the reconstruction which was generated based on the previous frame and new updates region. The transmitted and reconstructed is computed by calculating the Huffman encoded jpeg coefficients.  The generated dc and ac coefficients will be used for basing which image 8x8 block needs updating.  If it needs no updating then, the blocks of the previous image at that 8x8 region will be used for generating the new image. As we see, the differences of the two is as the frames moves the transmitted data has black background. This is because the previous image of that is a blank. On the other hand, the previous images deposited to the reconstructed is the previous generated frame. It is also worth noting that the reconstructed images undergoes quality, this is because of the uint8 casting in 8x8 jpeg reconstruction. 
