function neodn
  set DOWNLOAD_LOCALE ~/Neocities/

  if test -z $NEOCITIES_USER |test -z $NEOCITIES_PASS
    echo "Need to set NEOCITIES_USER or NEOCITIES_PASS into ~/.config/fish/fish_variables
    Please either edit the fish_variables file or use set $NEOCITIES_USER and $NEOCITIES_PASS to continue. TODO: add config / enter user/pass at execution"
    return 1
  else
    echo "Logged in as $NEOCITIES_USER"
  end
  if test -z "$argv"
    echo "Downloading to default $DOWNLOAD_LOCALE"
  else
    set DOWNLOAD_LOCALE $argv
    echo "Downloading to custom $DOWNLOAD_LOCALE"
  end
wget --force-directories --no-parent -nH -m -w 1 --http-user=$NEOCITIES_USER --http-password=$NEOCITIES_PASS -P $DOWNLOAD_LOCALE https://neocities.org/webdav/
end






      #--force-directories    - create dirs 
      #--no-parent            - don't go above selected remote dir (stops from downloading the entire web host)
      #-nH                    - --no-host-directories, use selected local dir as parent
      #-m                     - mirror (-r ecursive, -l evel (depth), -N timestamping (Does nothing with neocities))
      #-w                     - wait 1 second between downloads to be nice to the server
      #--http-user/password=  - username / password for https checking
      #-P                     - Path
