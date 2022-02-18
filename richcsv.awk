BEGIN{
    FPAT="([^,]+)|(\"[^\"]+\")"
}

{
    last = last $0
    if ( last != "" && split(last,trash,"\"") % 2 == 0 ){
        last = last RS
        next
    }
    $0 = last ; last = ""
}

# test
{
    for(i = 1 ; i <= NF ; i++ ){
        printf "<%s>",gensub("\"","","g",$i)
    }
    print ""
}
