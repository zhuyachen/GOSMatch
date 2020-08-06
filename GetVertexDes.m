function v_des = GetVertexDes(centroids_vector,semantics_vector)
   % centroids_vector = loadcentroids(centroid_path, frame_idx)
 %   semantics_vector = bow_vector[frame_idx]  # [10,3,6]
    index_vector = zeros(1,length(semantics_vector));

    tmp = 0;
    vec_size=61;
    interval =1;
    for i =1:length(index_vector)
        tmp = tmp + semantics_vector(i);
        index_vector(i) = tmp; % # [10,21,26]
    end
    sem_size = length(semantics_vector);

    v_row_des = zeros(1,vec_size * sem_size);
    v_des = zeros(length(centroids_vector), length(v_row_des));

    for i =1:length(centroids_vector)
        for j =1: length(centroids_vector)
            if i == j
                continue;
            end
            ed = Distance(centroids_vector(i,:), centroids_vector(j,:));

            offset_idx = get_v_des_offset(i, j, index_vector);
            %disp( sum(semantics_vector)) ;
            %offset_idx = offset_idx+1;
            %# print i,j,offset_idx,len(centroids_vector),index_vector,frame_idx
            for tmp =1: vec_size
                if (tmp-1) * interval <=ed && ed < tmp  * interval
                    
                    v_des(i,tmp + offset_idx * vec_size) = v_des(i,tmp + offset_idx * vec_size)+1;
                  
                    break;
                end
                if ed >= vec_size* interval
                    v_des(i,vec_size  + offset_idx * vec_size) = v_des(i,vec_size  + offset_idx * vec_size)+1;
               
                    break;
                end
            end
        end
    end
    
end

function offset_index =get_v_des_offset(i_idx, j_idx, index_vector)
    offset_index = 0;

    for j =1:length(index_vector)
        if j_idx-1 <= index_vector(j)
            break;
        
            %return offset_index
        else
            offset_index = offset_index+1;
        end
    end
end
                    
       
                    
