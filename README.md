# ![appIcon](https://github.com/RickardGS4991/starwarsiOsGame/assets/62120855/7af4686c-0822-46ea-9a16-f8af88839393)
<h1 align="center">X-Wing Survivor</h1>

##Indice
*[Introduction](#Introduction)
*[Description](#Project-Description)
*[Project Video](#Project-video)
*[Technology](#Technology)
*[Team](#Team)

## 💻 Introduction
Final project for Semana i in Tecnológico de Monterrey Campus Puebla. This project was created by Rodrigo Oliveros &amp; Ricardo Garcia. It consists of to develop a game in the Swift Language for iOs. Basically, you are a pilot that manage a x-wing. You must avoid Star Destroyer. Besides, you can destroyed TIE Fighter. If you hit a Star Destroyer, you can get a R2-D2 to recuperate your shield.

## 🛠️ Description
***
1.- In the first part of the project, team selected different images to represent the player, villain and the helper. Besides, an background and sound were added. The images must add it in the Assest directory.

![Directory](https://github.com/RickardGS4991/starwarsiOsGame/assets/62120855/d940ee8f-2d3c-4622-a37a-02c9da16f934)

2.- In the programming, team developed a counter for enemy destroyed and the damage you get. Then, three functions about create enemies and the helper were developed. If the destroyed enemy counter gets more than 5 or 10, the difficulty increase. These three functions are called addTie(), addShip() and addR2()

3.- The game has an important override function. This function manages all asignments for the differents characters in the game. Besides, the background sound was added in this part. This function called didMove().

4.- The game has other three function that manages the start, ending and the explosion for the enemy. In the startGame() function, we run the functions AddTie(), addShip() and AddR2. Then we wait some seconds (It depends on every function). Finally, they runs again repeatly after seconds. Besides, labels are managed here. It shows the TIE destroyed and the shield. The endGame() runs when the shield is equal to zero. Finally, the explosion() added a sprite to simulate tthe explosion between the player and the enemy.

5.- The game has other three important functions. These functions manage when the enemy, the helper and the player hit. These functions are called spaceshipCollideWithTie(), spaceshipCollideWithShip() and spaceshipCollideWithR2(). The first function manage when the player hits with the TIE Fighter. If both hits, the user obtain 1 point. Besides, we called the explosion() function every time player hits TIE. The second function manage when the player hits the Star Destroyer. Every time this occurs, the shield of the player reduces 10 points. Finally, the third function is used to manage the helper- In this case, if the player hits the helper, it obtains 10 life points.

6.- The final function didBegin() runs the three last function we talked before. If the collision happens, this function runs the methods. 

## 📹 Project Video
https://youtu.be/WQE7ejyZdhk?si=WbQn_-bsOOtDk0P3

## 👨‍💻Technology

1.- Swift 5.9
2.- XCode
3.- GitHub

## 🥇 Team

1.- Rodrigo Oliveros Vazquez
2.- Ricardo Garcia Sedano
