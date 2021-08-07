import delimited E:\Dropbox\PMA6\PMA6_Shared\data6e\Cluster.txt

set seed 50 

cluster kmeans ror5 de salesgr5 eps5 npm1 pe payoutr1, k(3) name(clust_id)

