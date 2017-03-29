use Mojo::Base -strict;
use Test::More;

plan skip_all => 'set TEST_POD to enable this test'
  unless $ENV{TEST_POD} or $ENV{RELEASE};
# Ensure adequate version of Test::Pod
plan skip_all => 'Test::Pod 1.22 required for testing POD'
  unless eval 'use Test::Pod 1.22; 1';

all_pod_files_ok();
