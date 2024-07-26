function neoup
  set UPLOAD_LOCALE ~/Neocities/webdav/
  if test -z $NEOCITIES_USER |test -z $NEOCITIES_PASS
    echo "Need to set NEOCITIES_USER or NEOCITIES_PASS into ~/.config/fish/fish_variables
    Please either edit the fish_variables file or use set $NEOCITIES_USER and $NEOCITIES_PASS to continue. TODO: add config / enter user/pass at execution"
    return 1
  else
    echo "Logged in as $NEOCITIES_USER"
  end
  if test -z "$argv"
    echo "Uploading from default $UPLOAD_LOCALE"
  else
    set UPLOAD_LOCALE $argv
    echo "Uploading to custom $UPLOAD_LOCALE"
  end
  echo (find $UPLOAD_LOCAL -name  '*' -type f -print -exec curl -g -v -u $NEOCITIES_USER:$NEOCITIES_PASS -T {} https://neocities.org/api/upload \;)
end
