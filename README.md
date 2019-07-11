# HammingCodes-EDC
To enable to use of the Cyclic codes (7,4) Hamming for Error Detection and Correction Capablities


Hamming codes are generally cyclic codes that has the capabilty of detecting and correcting the error bits.

                                                       (n,k)  HAMMING CODES 
                                                       
                                                       Hamming distance (d)= 3
                                                       Parity Bits : r = n-k
                                                       Message Block Length : k = 2^r − r − 1

Due to the limited redundancy that Hamming codes add to the data, they can only detect and correct errors when the error rate is low and this is one of the major disadvantages.

----------------------------------------------------------------------------------------------


The code basically generates all the possible code words from the Generator Matrix(G) and introduces an error in the data and uses the Syndrome Matrix (S) for the error detection.
