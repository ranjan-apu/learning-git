clc; 
clear; 
disp('Alice and Bob use the Diffie-Hellman key exchange technique with a common prime q = 23 and a primitive root 𝛼α= 5 .'); 
disp('--------------------------------------------------------------------------------------------------------------------'); 
clear ;
close all; 
cs109_p = 23; 
cs109_g = 5; 
cs109_Yb = 10; % Bob's public key 
cs109_temp = 1; 
cs109_i = 0; 
while 1 
    if cs109_temp == cs109_Yb 
        break 
    end 
    cs109_i = cs109_i+1; 
    cs109_temp = mod(cs109_temp*cs109_g,cs109_p); 
end 
cs109_Xb = cs109_i; % Bob's private key 
fprintf("Bob's private key : %d\n", cs109_Xb); 
cs109_Ya = 8; % Alice public key 
cs109_key = mod(cs109_Ya^cs109_Xb,cs109_p); 
fprintf("Shared key which is secret: %d\n", cs109_key); 
cs109_g = 5; % generator  
cs109_p = 23;%Two large prime numbers to be taken 
cs109_arr(cs109_p-1) = 0; % declaring array of zeros of size cs109_p-1 
cs109_arr(1) = 1; 
for cs109_i = 2:cs109_p-1 
    cs109_arr(cs109_i) = mod(cs109_arr(cs109_i-1)*cs109_g,cs109_p); 
end 
is_primitive = 1; % flag 
for cs109_i = 1:cs109_p-1 
    cs109_found = 0; % flag 
    for j = 1:cs109_p-1 
        if cs109_arr(j) == cs109_i 
            cs109_found = 1; 
            break 
        end 
    end 
    if ~cs109_found  
        is_primitive = 0; 
        break 
    end 
end  
if is_primitive 
    fprintf("%d is primitive root of %d", cs109_g, cs109_p); 
else 
    fprintf("%d is not a primitive root of %d", cs109_g, cs109_p); 
end 
fprintf("\nAll numbers 1-%d are being generated:\n", cs109_p-1); 
for cs109_i = 0:cs109_p-2  
    fprintf("%d^%d (mod %d) = %d\n", cs109_g, cs109_i, cs109_p, cs109_arr(cs109_i+1)); 
end 