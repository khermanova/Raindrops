Raindrop Game:
==============
The object of this game is to catch raindrops with a catcher. This game will be programmed with an array of raindrops, a catcher (image at bottom of screen), a score variable, and a lives variable. The catcher will follow the mouse along a horizontal plane, and as the raindrop touches the catcher, the score will increase and the raindrop disappear. After a certain time interval, the next raindrop will fall. If the player misses three raindrops by allowing them to touch the ground, it is game over. Lives are displayed in the left corner with three hearts and a Lives box that updates with the current lives. If the player has one life an extra life falls down the screen. The score is displayed in the left corner. Depending on the score, the player advances through five levels. Depending on the level, the time between raindrops decreases, the background changes, and a colorDrop may fall down the screen. If this drop is caught, 5 points are added to the score. If the player reaches a score of 50 before losing, they have won the game. By pressing the "r" key, the game will restart.

Creation of the Game:
--------------------
1. Create a raindrop.
2. Create a catcher.
3. When the raindrop intersects with the raindrop, the raindrop goes away and the score increases.
	* if the raindrop intersects with the catcher, it is caught
	* if the raindrop is caught, it will disappear and increase the score.
4. If a raindrop hits the ground a third time, game over.
	* create a lives method and score method that display both to the player
	* if a player has one life left, an extra life will fall
	* if the game is over, the raindrops will stop falling and *Game Over* text will appear
5. If the player reaches a score of 50, they have won and a victory screen will appear.
6. Create a start button and start screen through a boolean *start* that is false when the program is run but true when the button is pressed. When it is true the game runs. When it is false, a start screen, that includes a start button, appears.
7. Create a Levels class that controls the progress of the game (intervals between raindrops, power ups, and backgrounds) depending on the player's score. A colorDrop will fall in certain levels and if it is caught, 5 points are added to the score.
8. Create a restart method.
	
	

