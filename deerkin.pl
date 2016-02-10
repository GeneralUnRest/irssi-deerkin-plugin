#   Copyright 2016 prussian <generalunrest@airmail.cc>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

use strict;
use warnings;
use vars qw($VERSION %IRSSI);

use String::IRC;
use Irssi qw(command_bind active_win);
$VERSION = "0.0.0";
%IRSSI = (
    authors	=> 'prussian',
    contact	=> 'generalunrest@airmail.cc',
    name	=> 'deerkin',
    description	=> 'deerkin for your client!',
    license	=> 'Apache 2.0',
    url		=> 'http://github.com/GeneralUnRest/',
    changed	=> 'Sun 09 Feb 17:00 EST 2016',
    changes	=> 'NA',
);

# n to soon be deprecated
my %DEER_SYMBOLS = (
	0 => String::IRC->new("@")->white('white'),
	1 => String::IRC->new("@")->black('black'),
	2 => String::IRC->new("@")->navy('navy'),
	3 => String::IRC->new("@")->green('green'),
	4 => String::IRC->new("@")->red('red'),
	5 => String::IRC->new("@")->brown('brown'),
	6 => String::IRC->new("@")->purple('purple'),
	7 => String::IRC->new("@")->olive('olive'),
	8 => String::IRC->new("@")->yellow('yellow'),
	9 => String::IRC->new("@")->lime('lime'),
	a => String::IRC->new("@")->teal('teal'),
	A => String::IRC->new("@")->teal('teal'),
	b => String::IRC->new("@")->cyan('cyan'),
	B => String::IRC->new("@")->cyan('cyan'),
	c => String::IRC->new("@")->royal('royal'),
	C => String::IRC->new("@")->royal('royal'),
	d => String::IRC->new("@")->pink('pink'),
	D => String::IRC->new("@")->pink('pink'),
	e => String::IRC->new("@")->grey('grey'),
	E => String::IRC->new("@")->grey('grey'),
	f => String::IRC->new("@")->silver('silver'),
	F => String::IRC->new("@")->silver('silver'),
	n => '',
);

command_bind(deerkin => sub {
	open(my $file, '<', $_[0])
	|| return;

	while (<$file>) {
		chomp;
		my $line = $_;
		my $deerline = "";
		foreach my $char (split //, $line) {
			$deerline = $deerline . $DEER_SYMBOLS{$char};
		}
		active_win->command("say $deerline");
	}
});
