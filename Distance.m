function [dist] = Distance(a,b)
% Currently using Euclidean Distance, you cn change to other distance


dist = pdist([a;b],'euclidean');

end

