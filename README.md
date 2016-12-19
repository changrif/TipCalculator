# Pre-work - *Tip Calculator*

*Tip Calculator* is a tip calculator application for iOS.

Submitted by: Charles "Chandler" Griffin

Time spent: 5 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] I implemented a toggling decimal keyboard that appears when the user is entering the bill that disappears after the user clicks elsewhere
- [X] I implemented a sliding bar to split the check (possible of splitting the check to a party of up to 5)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:



GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I encountered problems getting the sliding bar to work with the initial implementation of the calculator. Firstly,
I needed to round the slider values to be integer values and a few errors were reoccuring getting the bill and split
values to divide properly.

## License

    Copyright [2016] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.