#!/usr/bin/env bash
# thanks to @NicklasLallo

cfg_tmpdir="/run/user/$UID/i3lock-extra"
cfg_pixelize_scale='10'

err() { printf '%s\n' "$*" >&2; }

usage() {
	while read; do printf '%s\n' "$REPLY"; done <<- EOF
		Usage: i3lock-extra [flags]
		    Flags:
		        --help|-h                       Show this message.
		        --umask|-u                      Set umask.
		        --tmpdir|-d                     Directory to store temporary files in.
		                                          This should not be accessible by other users!
		        --image_file|-i                 Lock screen with an image.
		        --screenshot|-s                 Lock screen with a screenshot of your current workspace.

		        # Modifiers (apply to both screenshots and specified images):
		        --overlay-image|-o              Overlay another image over the main one.
		                                          Gets applied after all other modifiers.
		        --grayscale|-g                  Make the image grayscale.
		        --pixelize|-p                   Pixelize the image.
		        --pixelize-scale|-P             Sets the number by which the image is resized down and up
		                                          again to achieve the pixelize effect. For example, 4 means
		                                          that it will be resized to 1/4 of the original and blown back up.
		        --blur|-b                       Blur the image.
	EOF
}

deskshot() {
	scrot -o "$cfg_tmpdir/lockbg.png"
	image_file="${cfg_tmpdir}/lockbg.png"
}

image_prepare() {
	declare -a convert_args
	declare scale_down scale_up

	if (( f_grayscale )); then
		convert_args+=( -grayscale rec601luma )
	fi

	if (( f_pixelize )); then
		scale_down=$(( 100/cfg_pixelize_scale ))
		scale_up=$(( ( 100/cfg_pixelize_scale ) * cfg_pixelize_scale * cfg_pixelize_scale ))

		convert_args+=( -scale "$scale_down%" -scale "$scale_up%" )
	fi

	if (( f_blur )); then
		convert_args+=( -blur 4x8 )
	fi

	if [[ "$convert_args" ]]; then
		convert "$image_file" "${convert_args[@]}" "$cfg_tmpdir/lockbg.png"
		image_file="$cfg_tmpdir/lockbg.png"
	fi
	
	if [[ "$overlay_image" ]]; then
            # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file $overlay_image | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)
    # RX=640
    # RY=360

    SR=$(xrandr --query | grep -P ' connected primary [0-9]+' | cut -f4 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        # PY=$(($SROY + $SRY/4))
        PY=$(($SROY + $SRY/2 - $RY/2))

        convert $image_file $overlay_image -geometry +$PX+$PY -composite -matte  "$cfg_tmpdir/lockbg.png"

		image_file="$cfg_tmpdir/lockbg.png"
    done
		# convert -gravity center -composite -matte "$image_file" "$overlay_image" "$cfg_tmpdir/lockbg.png"
	fi
}

main() {
	umask 0077 # All files and dirs created should only be accessible by the user.

	# Restart i3lock on non-zero exit code by default.
	f_secloop=1

	while (( $# )); do
		case "$1" in
			--help|-h) usage; return 0;;

			--tmpdir|-d) cfg_tmpdir=$2; shift;;
			--umask|-u) umask "$2"; shift;;
			--image-file|-i) image_file=$2; shift;;
			--overlay-image|-o) overlay_image=$2; shift;;

			--screenshot|-s) f_screenshot=1;;
			--grayscale|-g) f_grayscale=1;;
			--pixelize|-p) f_pixelize=1;;
			--pixelize-scale|-P) cfg_pixelize_scale=$2; shift;;
			--blur|-b) f_blur=1;;

			--unsecure) f_secloop=0;;

			--) shift; break;;
			-*)
				err "Unknown key: $1"
				usage
				return 1
			;;

			*) break;;
		esac
		shift
	done

	if ! [[ -d "$cfg_tmpdir" ]]; then
		mkdir -p "$cfg_tmpdir" || {
			return 1
		}
	fi

	if (( f_screenshot )); then
		deskshot
	fi

	if ! [[ $image_file ]]; then
		usage
		return 1
	fi

	image_prepare

	if (( f_secloop )); then
		until i3lock -n -t -i "$image_file"; do
			true
		done
	else
		i3lock -n -t -i "$image_file"
	fi
}

main "$@"

