function [ norm ] = norm_variance( x )
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here

%            Variance normalization. A linear transformation which 
%            scales the values such that their variance=1. This is
%            convenient way to use Mahalanobis distance measure without
%            actually changing the distance calculation procedure.

inds = find(~isnan(x) & isfinite(x));
p = [mean(x(inds)), std(x(inds))];
if p(2) == 0, p(2) = 1; end
%end of norm_variance_init

norm =(x - p(1)) / p(2);