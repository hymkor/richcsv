BEGIN{
    FPAT="([^,]+)|(\"[^\"]+\")"
    line = ""
}

{
    if( line != "" ){
        line = line RS $0
    } else {
        line = $0
    }
    if (split(line,tmp,"\"") % 2 == 0 ){
        next
    }
    $0 = line
    line = ""
}

# test
{
    for(i = 1 ; i <= NF ; i++ ){
        printf "<%s>",$i
    }
    print ""
}
