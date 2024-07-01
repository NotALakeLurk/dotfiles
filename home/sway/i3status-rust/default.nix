{ pkgs, ... }: {
  programs.i3status-rust.enable = true;
  programs.i3status-rust.bars."" = {
    blocks = [
      { block = "focused_window"; format = " $title "; }
      { block = "sound"; format = " Vol: {$volume|muted} "; }
      { block = "backlight"; format = " Light: $brightness "; }
      { block = "memory"; format = " Mem: $mem_used_percents "; }
      { block = "cpu"; format = " CPU: $utilization $barchart "; }
      { 
        block = "battery";
        format = " Bat: $percentage ";
	full_format = " Bat: Full ";
	empty_format = " Bat: Empty ";
      }
      { block = "disk_space"; info_type = "used"; format = " Disk: $used/$total "; }
      { block = "net"; format = " $ssid $signal_strength "; }
      { block = "time"; format = " $timestamp.datetime(f:'%a — %d %b %Y') "; interval = 60; }
    ];
  };
}
