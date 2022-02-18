/^</{
    fname = substr($0,2)
    while( (getline < fname) > 0 ){
        print
    }
    close(fname)
    next
}
/^\|/{
    command = substr($0,2)
    while( (command | getline) > 0 ){
        print
    }
    close(command)
    next
}
{
    print
}
