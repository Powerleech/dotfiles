nmb_screens=$(xrandr | grep -sw 'connected' | wc -l)
wallpaper_dir=/home/powerleech/.wallpapers
if [[ $nmb_screens == 1 ]]; then
 search_str='*.single.jpg'
else
  search_str='*.dual.jpg'
fi

new_wallpaper=$(find $wallpaper_dir -name $search_str | sort -R | head -1)
ln -sf $new_wallpaper $wallpaper_dir/active/wallpaper.jpg
