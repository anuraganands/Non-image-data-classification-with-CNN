function norm = norm_scale01(x)

  inds = find(~isnan(x) & isfinite(x));
  mi = min(x(inds)); 
  ma = max(x(inds));
  if mi == ma, p = [mi, 1]; 
  else
      p = [mi, ma-mi];
  end
  
  norm =(x-p(1)) / p(2);
  
 


