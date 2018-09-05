#!/usr/bin/expect 
spawn telnet 0
expect "Password:"
send "j\n"
expect "HHOS>"
send "show summary\n"
expect "HHOS>"
send "system show interface hds\n"
expect "HHOS>"
send "flow show information\n"
expect "HHOS>"
send "system show thread statistics\n"
expect "HHOS>"
send "system show cycles\n"
expect "HHOS>"
send "xdr show debug\n"
expect "HHOS>"
send "exit\n"
expect off
