%ERROR DETECTION AND CORRECTION OF INPUT DATA
%HAMMING CODE-WORD GENERATION (n,k)

%Getting the sequence of input bits.
clc;
clear all;
close all;
x=input('Enter a random sequence of input bits');
l=length(x);
m=input('Enter the No of Parity Bits::');                  %No of Parity bits in (7,4) Hamming
n=(2^m)-1;  %No of bits in the code word
k=(2^m)-m-1;
r=rem(l,k);
x=[x zeros(1,k-r)]                                         %Appending zeros to split message bits sets of 4
k1=ceil(length(x)/k)
Y=zeros(k1,k);
                                                           %SPLITTING OF THE MESSAGE BITS
for i=0:k1-1;
   
        Y(i+1,:)= x(k*i+1:k*i+k)
        Z=Y;
        
end
                                                           %GENERATION OF CODEWORDS
[H,G,n,k]= hammgen(m)                                      %inbuilt function 
disp("Parity Check Matrix H::")
H
disp("Generator Matrix G::")
G


%Resultant Code Word
for i=0:k1-1;
    code_word(i+1,:)=Y(i+1,:)*G                            %As we know codeword X=m*G
    code_word(i+1,:)=rem(code_word(i+1,:),2)
end

                                                           %Introducing some error in the generated codeword
							   %Considering a single code word  



							   %ERROR PATTERN GENERATION
error_pattern=zeros(n+1,n);
  for i=1:n;
    error_pattern(i,i)=1
  end
  
  
  
   					                  %GENERATION OF THE SYNDROME MATRIX
syndrome_matrix=zeros(n+1,m);
for i=1:n;
syndrome_matrix(i,:)= error_pattern(i,:)*H'
end
disp('Message bits to be encoded::')
Y
disp('Generator Matrix G::')
G
disp('No of bits in the code word::')
n
disp('No of Message bits:: ')
k
disp('Parity Check Matrix::')
H 
disp('Code words::')
code_word
disp('Error Pattern')
error_pattern
disp('Syndrome Matrix::')
syndrome_matrix 


								%User introduces some error in codeword
error_position=input('Enter the position of error');
for i=1:k1;
unerr_word(i,:)=code_word(i,:) 
code_word(i,error_position)=xor(code_word(i,error_position),1)
err_word(i,:)=code_word(i,:)
end
disp("Codewords without error::")
unerr_word
disp("Codewords with error::")
err_word

								%ERROR DETECTION
synd_check=mod(err_word*H',2)
disp("Syndrome coressponding to error position::")
synd_check(1,:)
for i=1:n+1;
    if (syndrome_matrix(i,:)==synd_check(1,:))
        sprintf("THE ERROR POSTION IS %d",i)
        u=i;
    end
end

								%ERROR CORRECTION
for i=1:k1;
code_word(i,u)=xor(err_word(i,u),1);
end
code_word
        
    
    
    
    


