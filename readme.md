richcsv.awk
===========

Pure AWK Template for reading CSV files containing line breaks in elements

```awk
BEGIN{
    FPAT="([^,]+)|(\"[^\"]+\")"
}

{
    last = last $0
    if (split(last,trash,"\"") % 2 == 0 ){
        last = last RS
        next
    }
    $0 = last ; last = ""
}

# test
{
    for(i = 1 ; i <= NF ; i++ ){
        printf "<%s>",$i
    }
    print ""
}
```

```
$ type sample.csv
0001,=1+1,03,-4,5/2
"hogeohg  2",5555,3,"1st TEXT
2nd
3rd
4th"
$ gawk -f richcsv.awk sample.csv
<0001><=1+1><03><-4><5/2>
<"hogeohg  2"><5555><3><"1st TEXT
2nd
3rd
4th">
```

