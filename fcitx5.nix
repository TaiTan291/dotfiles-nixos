{ config, pkgs, ... }:
{
	xdg.configFile = {
		"fcitx5/profile".text = ''
			[Groups/0]
			# Group Name
			Name=デフォルト
			# Layout
			Default Layout=us
			# Default Input Method
			DefaultIM=skk

			[Groups/0/Items/0]
			# Name
			Name=skk
			# Layout
			Layout=

			[GroupOrder]
			0=デフォルト
		'';

		"fcitx5/config".text = ''
			[Hotkey]
			# トグルキーの修飾キーを押し続けたときは列挙
			EnumerateWithTriggerKeys=True
			# 入力メソッドを有効にする
			ActivateKeys=
			# 入力メソッドをオフにする
			DeactivateKeys=
			# 一時的な入力メソッドの切り替え
			AltTriggerKeys=
			# 次の入力メソッドに切り替える
			EnumerateForwardKeys=
			# 前の入力メソッドに切り替える
			EnumerateBackwardKeys=
			# 切り替え時は第1入力メソッドをスキップする
			EnumerateSkipFirst=False
			# 次の入力メソッドグループに切り替える
			EnumerateGroupForwardKeys=
			# 前の入力メソッドグループに切り替える
			EnumerateGroupBackwardKeys=
			# フォールバックの前ページ
			PrevPage=
			# フォールバックの次ページ
			NextPage=
			# 修飾キーのショートカットをトリガーするための時間制限（ミリ秒）
			ModifierOnlyKeyTimeout=250

			[Hotkey/TriggerKeys]
			0=Control+space

			[Hotkey/PrevCandidate]
			0=Shift+Tab

			[Hotkey/NextCandidate]
			0=Tab

			[Hotkey/TogglePreedit]
			0=Control+Alt+P

			[Behavior]
			# デフォルトで有効にする
			ActiveByDefault=False
			# フォーカス時に状態をリセット
			resetStateWhenFocusIn=No
			# 入力状態を共有する
			ShareInputState=No
			# アプリケーションにプリエディットを表示する
			PreeditEnabledByDefault=True
			# 入力メソッドを切り替える際に入力メソッドの情報を表示する
			ShowInputMethodInformation=True
			# フォーカスを変更する際に入力メソッドの情報を表示する
			showInputMethodInformationWhenFocusIn=False
			# 入力メソッドの情報をコンパクトに表示する
			CompactInputMethodInformation=True
			# 第1入力メソッドの情報を表示する
			ShowFirstInputMethodInformation=True
			# デフォルトのページサイズ
			DefaultPageSize=5
			# XKB オプションの上書き
			OverrideXkbOption=False
			# カスタム XKB オプション
			CustomXkbOption=
			# Force Enabled Addons
			EnabledAddons=
			# Force Disabled Addons
			DisabledAddons=
			# Preload input method to be used by default
			PreloadInputMethod=True
			# パスワード欄に入力メソッドを許可する
			AllowInputMethodForPassword=False
			# パスワード入力時にプリエディットテキストを表示する
			ShowPreeditForPassword=False
			# ユーザーデータを保存する間隔（分）
			AutoSavePeriod=30
		'';

		"fcitx5/conf/skk.conf".text = ''
			# 入力方式
			Rule=default
			# 句読点スタイル
			PunctuationStyle=Japanese
			# 初期入力モード
			InitialInputMode=Latin
			# ページサイズ
			PageSize=7
			# 候補のレイアウト
			Candidate Layout=Vertical
			# 確定時にリターンキーを押しても改行を挿入しない
			EggLikeNewLine=False
			# 注釈を表示
			ShowAnnotation=True
			# 候補の選択に使用するキー
			CandidateChooseKey="Digit (0,1,2,...)"
			# 候補ウィンドウを表示するまでの候補数
			NTriggersToShowCandWin=4

			[CandidatesPageUpKey]
			0=Page_Up

			[CandidatesPageDownKey]
			0=Next

			[CursorUp]
			0=Up

			[CursorDown]
			0=Down

		'';

		"fcitx5/conf/notifications.conf".text = ''
			# 隠す通知
			HiddenNotifications=
		'';
	};
}
