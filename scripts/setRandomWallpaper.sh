nmb_screens=$(xrandr | grep -sw 'connected' | wc -l)
active_wallpaper_dir=~/.active-wallpaper

get_wallpaper_dir() {
  # check if the theme is dark or light
  cat ~/.config/awesome/rc.lua | grep -i 'local theme = themes\[1\]' &> /dev/null \
    && echo /home/powerleech/Pictures/wallpapers/light \
    || echo /home/powerleech/Pictures/wallpapers/dark;
}

get_search_string() {
  if [[ $nmb_screens == 1 ]]; then
   echo '*.single.jpg'
  else
    echo '*.dual.jpg'
  fi
}



# create active wallpaper folder if not there
ls $active_wallpaper_dir > /dev/null || mkdir $active_wallpaper_dir

wallpaper_dir=$(get_wallpaper_dir)
search_str=$(get_search_string)

new_wallpaper=$(find $wallpaper_dir -name $search_str | sort -R | head -1)
ln -sf $new_wallpaper $active_wallpaper_dir/wallpaper.jpg
