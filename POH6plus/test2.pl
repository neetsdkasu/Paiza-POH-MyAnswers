<>;%h=();$c=$s="";while(<>){chop($_);@h{$_}=@h{$_}?@h{$_}+1:1;}for(sort(keys%h)){$r=reverse$_;if($r eq$_){$c.=$_ x@h{$_};}if(@h{$r}&&$_ lt$r){$s.=$_;}}print$s.$c.reverse($s);
