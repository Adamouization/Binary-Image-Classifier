% Return true if two vectors are equal.
function bool = equalVec(a,b)

    bool=1;

    for i=1:size(a)
       if a(i)~=b(i)
          bool=0; 
       end
    end