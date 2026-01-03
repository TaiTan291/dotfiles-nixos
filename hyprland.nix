{ pkgs, ... }:
{
	programs.kitty.enable = true; # kitty
	wayland.windowManager.hyprland = {
		enable = true;
		systemd = {
			enable = true;
		};
		settings = {
			# See http://wiki.hypr.land/Configuring/Keywrods/
			monitor = ",preferred,auto,auto";

			"$terminal" = "kitty";
			"$fileManager" = "dolphin";
			"$menu" = "wofi --show drun";
			"$browser" = "firefox";
			"$mainMod" = "SUPER";

			exec-once = [
				"$terminal"
				"nm-applet"
				"dunst"
				"waybar"
				"fcitx5 -d -r"
				"fcitx5-remote -r"
			];
			# See https://wiki.hypr.land/Configuring/Environment-v
			env = [
				"XCURSOR_SIZE,24"
				"HYPRCURSOR_SIZE,24"
				#fcitx5
				"QT_IM_MODULE,fcitx"
				"GTK_IM_MODULE,fcitx"
				"XMODIFIERS,@im=fcitx"
				#"INPUT_METHOD,fcitx"
			];

			# 一般設定
			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;
				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";
				resize_on_border = true;
				allow_tearing = false;
				layout = "dwindle";
			};
	
			# デコレーション
			decoration = {
				rounding = 10;
				rounding_power = 2;
				active_opacity = 1.0;
				inactive_opacity = 1.0;       
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

			# アニメーション
			animations = {
				enabled = true;    
				bezier = [
					"easeOutQuint, 0.23, 1, 0.32, 1"
					"easeInOutCubic, 0.65, 0.05, 0.36, 1"
					"linear, 0, 0, 1, 1"
					"almostLinear, 0.5, 0.5, 0.75, 1"
					"quick, 0.15, 0, 0.1, 1"
				];
				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
					"zoomFactor, 1, 7, quick"
				];
			};
			# レイアウト
			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};
			# その他
			misc = {
				force_default_wallpaper = -1;
				disable_hyprland_logo = false;
			};

			# 入力設定
			input = {
				kb_layout = "jp";
				kb_variant = "106";
				kb_rules = "evdev";
				kb_options = "ctrl:nocaps";
				follow_mouse = 1;
				sensitivity = 0;    
				touchpad = {
					natural_scroll = false;
				};
			};

			#ジェスチャー
			gestures = {
				#workspace_swipe = true;
				#workspace_swipe_fingers = 3;
			};

			#キーバインド
			bind = [
				"$mainMod, Q, exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, R, exec, $menu"
				"$mainMod, P, pseudo,"
				"$mainMod, J, togglesplit,"
				"$mainMod, B, exec, $browser"
        
				# フォーカス移動
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"

				# ワークスペース切り替え
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
        
				# ウィンドウ移動
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
        
				# スペシャルワークスペース
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
        
				# マウスホイール
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
        
				# スクリーンショット
				", Print, exec, hyprshot -m window"
				"$mainMod, Print, exec, hyprshot -m region"
				"$mainMod SHIFT, Print, exec, hyprshot -m output"
			];
			# マウスバインド
			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			# メディアキー
			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
				",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
			];

			bindl = [
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPause, exec, playerctl play-pause"
				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioPrev, exec, playerctl previous"
			];

			# ウィンドウルール
			windowrule = [
				#pseudo, fcitx
				#"suppressevent maximize, class:.*"
				#"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];
		};
	};
}
