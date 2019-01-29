for f in `ls */demo*.sh`;
  do 
    cd "$( dirname $(realpath $f) )";
    ./demo*.sh ;
    cd -;  
done
