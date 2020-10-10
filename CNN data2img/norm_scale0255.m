function norm = norm_scale0255(x)

  inds = find(~isnan(x) & isfinite(x));
  mi = min(x(inds)); 
  ma = max(x(inds));
  if mi == ma, p = [mi, 1]; 
  else
      p = [mi, ma-mi];
  end
  
  norm = ceil((x-p(1))*255 / p(2));
  
 


