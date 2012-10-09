use inc::Module::Install;
name 'Kappa-Example';
all_from 'lib/Kappa/Example.pm';
readme_from 'lib/Kappa/Example.pm';
readme_markdown_from 'lib/Kappa/Example.pm';
readme_pod_from 'lib/Kappa/Example.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
