function centroids = loadCentroids(base_dir,index)

if( length(num2str(index)) == 4 )
    bin_path = strcat(base_dir, '00', num2str(index), '.txt');
elseif (length(num2str(index)) == 3)
    bin_path = strcat(base_dir, '000', num2str(index), '.txt');
elseif (length(num2str(index)) == 2)
    bin_path = strcat(base_dir, '0000', num2str(index), '.txt');
elseif (length(num2str(index)) == 1)
    bin_path = strcat(base_dir, '00000', num2str(index), '.txt');
end


centroids = load(bin_path);










end