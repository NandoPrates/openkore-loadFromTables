#############################################################################
# loadFromTables plugin by Revok
# revok@openkore.com.br
# for Openkore Brazil VIP members !
#
# Openkore Brazil: http://openkore.com.br/
#############################################################################
package loadFromTables;

use strict;
use Plugins;
use Log qw( message );
use Settings;
use Globals;

use enum qw(CONTROL_FILE_TYPE TABLE_FILE_TYPE);


Plugins::register('loadFromTables', 'load some control files from tables folder');

*Settings::addControlFile =
sub {
	my $name = shift;
	my @args_a = @_;
	#my %args = @args_a;
	#Log::warning "hx: $name ha $_[0] ho $_[1] hu $_[2] hi $_[3] mi: $_[4]\n";
	my $searchname = $_[2] ? $_[3] : $name;
	if (-f $Settings::tablesFolders[0]."/".$searchname ) {		
		$args_a[4] = 1; #$args{autoSearch} = 1;
		return Settings::_addFile($searchname, TABLE_FILE_TYPE, @args_a);
	} else {
		return Settings::_addFile($name, CONTROL_FILE_TYPE, @args_a);
	}
};

1;