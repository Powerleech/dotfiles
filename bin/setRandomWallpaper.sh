active_wallpaper_dir=~/.active-wallpaper

wallpaper_dir=/home/powerleech/.muralith_tmp
new_wallpaper=$(find $wallpaper_dir -name '*.jpg' | sort -R | head -1)
ln -sf $new_wallpaper $active_wallpaper_dir/wallpaper.jpg
