DIR = "/home/lucas/CPBS/7712/Mod1/hackathon/CPBS-7712-Hackathon1/data/kmer_counts"

mapped.files = list.files(sprintf(DIR), pattern = "\\_mapped.txt$")
all.files = list.files(sprintf(DIR), pattern = "\\_all.txt$")

file.list = mapped.files
combine_dat =  function(file.list,type) {

	tmp.list = lapply(file.list, function(x) sprintf("%s/%s",DIR,x ))
	dat = lapply(tmp.list, function(x) read.delim(x,header = F, sep = " "))
	all = Reduce(cbind,dat)
	all = all[, c(1, seq(2, ncol(all), 2))]
	names(all) = c("kmer",gsub(".txt", "", unlist(file.list)))
	write.csv(all, file = sprintf("%s/%s.csv", DIR, type))	
}




combine_dat(mapped.files, "mapped")
combine_dat(all.files, "all")



