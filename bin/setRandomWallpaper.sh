nmb_screens=$(xrandr | grep -sw 'connected' | wc -l)
active_wallpaper_dir=~/.active-wallpaper
wallpapers=/home/powerleech/Pictures/wallpapers

get_wallpaper_dir() {
  # check if the theme is dark or light
  temp_dir=$wallpapers/$(single_or_dual)
  cat ~/.config/awesome/rc.lua | grep -i 'local theme = themes\[1\]' &> /dev/null \
    # && echo $temp_dir/light \
    # || echo $temp_dir/dark;
    echo $temp_dir
}

single_or_dual() {
  if [[ $nmb_screens == 1 ]]; then
   echo single
  else
    echo dual
  fi
}



# create active wallpaper folder if not there
# ls $active_wallpaper_dir > /dev/null || mkdir $active_wallpaper_dir

wallpaper_dir=$(get_wallpaper_dir)
# echo $wallpaper_dir
new_wallpaper=$(find $wallpaper_dir -name '*.jpg' | sort -R | head -1)
# echo $new_wallpaper
ln -sf $new_wallpaper $active_wallpaper_dir/wallpaper.jpg
