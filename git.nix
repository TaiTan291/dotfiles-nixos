{pkgs, ...}: {
	programs.git = {
			enable = true;
			userName = "TaiTan291";
			userEmail = "dachnegfujing41@gmail.com";
			settings = {
				user = {
					name = "TaiTan291";
					email = "dachnegfujing41@gmail.com";
				};
			};
	};
	programs.gh = {
		enable = true;
		extensions = with pkgs; [gh-markdown-preview]; # オススメ
		settings = {
			editor = "nvim";
			git_protocol = "https";
		};
	};

}
