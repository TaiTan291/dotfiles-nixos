{ config, pkgs, ... }:
{
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";

				modules-left = [
					"hyprland/workspaces"
					"hyprland/window"
				];
				modules-center = [
					"clock"
				];
				modules-right = [
					"cpu"
					"memory"
					"battery"
					"network"
					"pulseaudio"
					"tray"
				];
	
				# moduleの設定
				"hyprland/workspaces" = {
					format = "{icon}";
					format-icons = {
						default = "○";
						active = "●";
						urgent = "!";
					};
				};

				"clock" = {
					format = "🕑 {:%H:%M}";
					tooltip-format = "{:%Y年%m月%d日 %A}";
				};

				"pulseaudio" = {
					format = "{icon} {volume}%";
					format-bluetooth = "{icon} {volume}%";
					format-muted = "🔇";
					format-icons = {
						default = "🔊";
					};
					on-click = "pavucontrol";
				};

				"network" = {
					format = "{ifname}";
					format-wifi = "🛜 ↑{bandwidthUpBits} ↓{bandwidthDownBits}";
					format-ethernet = "󰈔  ↑{bandwidthUpBits} ↓{bandwidthDownBits}";
					format-disconnected = "🚫 Offline";
					tooltip-format-wifi = "接続  : {ifname} \nSSID  : {essid} \nIP  : {ipaddr} \n通信強度  : {signalStrength} \n通信速度  : ↑{bandwidthUpBits} ↓{bandwidthDownBits}"; 
					on-click = "kitty -e nmtui";
				};

				cpu = {
					interval = 1;
					format = "CPU {usage}%";
				};

				memory = {
					interval = 1;
					format = "RAM {percentage}%";
				};

				battery = {
					interval = 60;
					format = "🔋 {capacity}%";
				};
			};
		};
	};
}
