BEGIN{
    FPAT="([^,]+)|(\"[^\"]+\")"
    line = ""
}

function countq(s,  c,i){
    c = 0
    while( (i=index(s,"\"")) > 0 ){
        c++
        s = substr(s,i+1)
    }
    return c
}
{
    if( line != "" ){
        line = line RS $0
    } else {
        line = $0
    }
    if (countq(line) % 2 != 0 ){
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
