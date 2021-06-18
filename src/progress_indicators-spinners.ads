--  SPDX-License-Identifier: Apache-2.0
--
--  Copyright (c) 2021 The progress_indicators authors
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.

package Progress_Indicators.Spinners is
    -- It's always fun to have a fun spinning indicator while waiting for
    -- terminal work to complete.  This is just a simple reusable version useful
    -- for tasks monitoring work to indicate that the process isn't dead.

    type Spinner is private;

    type Spinner_Style is (Empty, In_Place, Normal);
    -- What happens when you get the value of the spinner?
    --
    -- Empty returns an empty string, useful for disabling spinners when not
    -- running interactively.
    --
    -- In_Place inserts the appropriate ANSI escape sequence after the moving
    -- bar to overwrite in-place when called with `Put` in sequence.
    --
    -- Normal just returns the next moving bar.

    function Make (Style : Spinner_Style := In_Place; Ticks_Per_Move : Positive := 1) return Spinner;
    -- Makes a new spinner which goes to the next element every given number of
    -- ticks, allowing you to vary spin rate.
    --
    -- "In Place" prepends the appropriate ANSI escape sequence such that
    -- calling Put(Value(Spinner)) will spin in-place.

    function Value (S : Spinner) return String;
    procedure Tick (S : in out Spinner);

    procedure Enable_All;
    -- Global switch to allow spinners to be printed.  Spinners are enabled by
    -- default.

    procedure Disable_All;
    -- Global switch to turn all spinners into empty spinners.

private

    Spinners_Enabled : Boolean := True;

    type Spinner_State is mod 4;

    Spinner_States : constant array (Spinner_State) of Character := ('/', '-', '\', '|');

    type Spinner is record
        Ticks_Per_Move : Positive;
        Ticks          : Natural;
        State          : Spinner_State;
        Style          : Spinner_Style;
    end record with
        Type_Invariant => Ticks < Ticks_Per_Move;

end Progress_Indicators.Spinners;
