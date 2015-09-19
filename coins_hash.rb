# if 5 is an integer I have to convert from an int to a float with .to_f, it is more performant to just accept input in all floats (though the performance difference is neglible, it is still good to go with the more performant option unless I have a reason not too)
COINS = {
  5.67  =>  25,
  2.5   =>  10,
  5.0     =>  5
}