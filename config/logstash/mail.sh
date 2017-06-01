#!/bin/sh

# must be same with STMP account addr
from="op@a.com"
# more receiver like a@example.com b@example.com ...
to="ops@a.com"
subject="$1"
body="详情请看附件"

declare -a attachments
#attachments=( "a.pdf" "b.zip" )
attachments=( "/data/`log_name-date +%Y%m%d`.txt" )

declare -a attargs
for att in "${attachments[@]}"; do
   [ ! -f "$att" ] && echo "Warning: attachment $att not found, skipping" >&2 && continue	
  attargs+=( "-a"  "$att" )
done

# smtp server info
smtpserver="smtp.a.com"
smtpport="25"
#smtpport="465"
user="op@a.com"
password="123456"

mail -s "$subject" -r "$from" -S smtp="smtp://${smtpserver}:${smtpport}" \
                              -S smtp-auth=login \
                              -S smtp-auth-user="$user" \
                              -S smtp-auth-password="$password" \
                              -S sendwait \
                              "${attargs[@]}" "$to" <<< "$body"
