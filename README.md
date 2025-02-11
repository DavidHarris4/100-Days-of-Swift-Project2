# 100-Days-of-Swift-Project2
Following the 100 Days of Swift tutorial, I created this basic Guess the Flag app.

I followed the main tutorial and even completed the three challenges that were provided:
1. Try showing the player’s score in the navigation bar, alongside the flag to guess.
2. Keep track of how many questions have been asked, and show one final alert controller after they have answered 10. This should show their final score.
3. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.

After completing the three challenges provided, I iterated on them and added some of my own spin:
1. I moved the player's score down to a "scoreboard" label below the three flag buttons and updated the main title to "Tap the Flag: [countries]" to direct the player what they should do.
2. I updated the score calculation to not remove 1 point with an incorrect answer.
3. I updated the scoreboard to include "X of Y", where X is the player's score and Y is the number of questions answered.
4. I added two small arrays for good responses and bad responses to be triggered at random depending on if the right answer or wrong answer was selected.
5. I added two separate "Game Over" alerts; one for if you got all answers correct and one if you missed at least one answer.
