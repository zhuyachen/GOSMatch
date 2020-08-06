function graph_des = Centroids2GraphDes(centroids_vector,semantics_vector)


    graph_des = [];

  %  semantics_vector = bow_vector[frame_idx]  % [10,3,6]
  %  centroids_vector = loadcentroids(centroid_path, frame_idx)

    tmp = 0;
    for i =1:length(semantics_vector)
        tmp = tmp + semantics_vector(i);
        j_tmp = 0;

        for j =i: length(semantics_vector)
            j_tmp = j_tmp + semantics_vector(j);
            graph_des_local = cal_local_g_des(tmp - semantics_vector(i)+1, tmp, j_tmp - semantics_vector(j)+1, j_tmp,centroids_vector);
            graph_des = [graph_des graph_des_local];
        end
    end


end


function local_g_des = cal_local_g_des(i_begin, i_end, j_begin, j_end, centroids_vector)

    vec_size = 61;
    interval = 1;
    local_g_des = zeros(1,vec_size);
  
    for i =i_begin: i_end

        for j =j_begin: j_end
            %disp(strcat(num2str(i),'jjj ',num2str(j_end)));
            ed = Distance(centroids_vector(i,:), centroids_vector(j,:));
%             disp(ed);
            for tmp =1: vec_size 
                if ((tmp-1) * interval <=ed && ed < tmp  * interval)
                    local_g_des(tmp) = local_g_des(tmp)+1;
                    
                    break
                end
                if (ed >= vec_size* interval)
                    local_g_des(vec_size) = local_g_des(vec_size)+1;
           
                    break
                end
                
            end
        end
    end
%     local_g_des
end



