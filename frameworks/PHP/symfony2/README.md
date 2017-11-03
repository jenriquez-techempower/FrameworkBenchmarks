# Symfony Benchmarking Test

The information below contains information specific to Symfony2. 
For further guidance, review the 
[documentation](http://frameworkbenchmarks.readthedocs.org/en/latest/). 
Also note the additional information provided in the [PHP README](../).

This is the Symfony 3 PHP portion of a [benchmarking test suite](../../) comparing a variety of web development platforms.

## Infrastructure Software Versions

The tests were run with:

* [Symfony Version 3.3.0](http://symfony.com/)
* [PHP Version 7.x](http://www.php.net/) with FPM and APC
* [nginx 1.4.0](http://nginx.org/)
* [MySQL 5.5.29](https://dev.mysql.com/)

## Paths & Source for Tests

* [JSON Serialization](src/Skamander/BenchmarkBundle/Controller/BenchController.php)
: "/json" _Note: Uses the PHP standard 
[JSON encoder](http://www.php.net/manual/en/function.json-encode.php)._
* [Single Database Query](src/Skamander/BenchmarkBundle/Controller/BenchController.php) ([Model](src/Skamander/BenchmarkBundle/Entity/World.php))
: "/db" _Note: Uses the Symfony 2/Doctrine 2 Entity functionality._
* [Multiple Database Queries](src/Skamander/BenchmarkBundle/Controller/BenchController.php) ([Model](src/Skamander/BenchmarkBundle/Entity/World.php))
: "/db?queries=" _Note: Uses the Symfony 3/Doctrine 2 Entity functionality._
* [Fortunes Template Test](src/Skamander/BenchmarkBundle/Controller/BenchController.php)
: "/fortunes" _Note: Uses Symfony's template engine 'Twig'_

## Advice for Adding Symfony Tests

This implementation is the direct result of installing the 
[Standard Edition of Symfony](https://github.com/symfony/symfony-standard) using [Composer](https://getcomposer.org/), and making 
the minimum modifications necessary to support 
running the benchmark. Specifically, unnecessary bundles 
have *not* been removed from the kernel to properly 
reflect "out of the box" performance.

Note: `app/bootstrap.php.cache` is generated by Composer
when you first run `composer.phar install`

# Interesting Links

* [Discussion on APC vs Zend Optimizer, PHP 5.4](http://www.ricardclau.com/2013/03/apc-vs-zend-optimizer-benchmarks-with-symfony2/)
* [Symfony2 Performance Tuning](http://symfony.com/doc/current/book/performance.html)
* [Why is Symfony2 performing so bad in benchmarks and does it matter?](http://stackoverflow.com/questions/16696763/why-is-symfony2-performing-so-bad-in-benchmarks-and-does-it-matter)