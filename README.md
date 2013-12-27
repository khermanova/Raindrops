Raindrop Game:
==============
The object of this game is to catch raindrops with a catcher. This game will be programmed with an array of raindrops, a catcher (image at bottom of screen), a score variable, and a lives variable. The catcher will follow the mouse along a horizontal plane, and as the raindrop touches the catcher, the score will increase and the raindrop disappear. After a certain time interval, the next raindrop will fall. If the player misses three raindrops by allowing them to touch the ground, it is game over. If the player reaches a score of 75 before losing, they have won the game.

Creation of the Game:
--------------------
1.Create a raindrop.
2.Create a catcher.
3.When the raindrop intersects with the raindrop, the raindrop goes away and the score increases.
	-if the raindrop intersects with the catcher, it is caught
	-if the raindrop is caught, it will disappear and increase the score; the backround will change
4.If the raindrop hits the ground a third time, game over.
	-if the game is over, the raindrops will stop falling and "Game Over" text will appear
5.If the player reaches a score of 75, they have won and a victory screen will appear.
6.Create a start button and start screen through a boolean "start" that is false when the program is run but true when the button is pressed. When it is true the game runs. When it is false, a start screen, that includes a start button, appears.
	
	

