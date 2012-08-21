use warnings;
use strict;
use Module::Build;

Module::Build->new(
    module_name => 'Ppoker',
    license => 'perl',
    dist_version => 0.1,
    dist_abstract => 'abstracto something or other',
)->create_build_script;
