<?php
 
use PhilipBrown\Nacho\Nacho;
 
class NachoTest extends PHPUnit_Framework_TestCase {
 
  public function testNachoHasCheese()
  {
    $nacho = new Nacho;
    $this->assertTrue($nacho->hasCheese());
  }

  public function testNachoHasNoCheese()
  {
    $nacho = new Nacho;
    $this->assertFalse($nacho->hasCheese(false));
  }
 
}