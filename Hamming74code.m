%ERROR DETECTION AND CORRECTION OF INPUT DATA
%HAMMING CODE-WORD GENERATION (7,4)

%Getting the sequence of input bits.
clc;
clear all;
close all;
x=input('Enter a random sequence of input bits');
m=length(x);
n=3;   %No of Parity bits in (7,4) Hamming
k=4;   %No of message bits
r=rem(m,4);
x=[x zeros(1,k-r)]         %Appending zeros to split message bits sets of 4
k1=ceil(length(x)/k)
Y=zeros(k1,k);
%SPLITTING OF THE MESSAGE BITS
for i=0:k1-1;
   
        Y(i+1,:)= x(k*i+1:k*i+k)
        Z=Y;
        
end
%GENERATION OF CODEWORDS
[H,G,n,k]= hammgen(n)    %inbuilt function 
disp("Parity Check Matrix H::")
H
disp("Generator Matrix G::")
G


%Resultant Code Word
for i=0:k1-1;
    code_word(i+1,:)=Y(i+1,:)*G   %As we know codeword X=m*G
    code_word(i+1,:)=rem(code_word(i+1,:),2)
end

%Introducing some error in the generated codeword
%Considering a single code word  



%ERROR PATTERN GENERATION
error_pattern=zeros(8,7);
  for i=1:7;
    error_pattern(i,i)=1
  end
  
  
  
  %GENERATION OF THE SYNDROME MATRIX
syndrome_matrix=zeros(8,3);
for i=1:7;
syndrome_matrix(i,:)= error_pattern(i,:)*H'
end


%User introduces some error in codeword
error_position=input('Enter the position of error');
for i=1:3;
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
for i=1:8;
    if (syndrome_matrix(i,:)==synd_check(1,:))
        sprintf("THE ERROR POSTION IS %d",i)
        u=i;
    end
end

%ERROR CORRECTION
for i=1:3;
code_word(i,u)=xor(err_word(i,u),1);
end
code_word
        
    
    
    
    


