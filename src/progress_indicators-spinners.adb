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

with AnsiAda;

package body Progress_Indicators.Spinners is

    function Make (Style : Spinner_Style := In_Place; Ticks_Per_Move : Positive := 1) return Spinner is
    begin
        return (Ticks_Per_Move => Ticks_Per_Move, Ticks => 0, State => 0, Style => Style);
    end Make;

    function Value (S : Spinner) return String is
    begin
        if not Spinners_Enabled then
            return "";
        end if;

        case S.Style is
            when Empty =>
                return "";
            when In_Place =>
                return Spinner_States (S.State) & AnsiAda.Back;
            when Normal =>
                return "" & Spinner_States (S.State);
        end case;
    end Value;

    procedure Tick (S : in out Spinner) is
    begin
        S.Ticks := (S.Ticks + 1) mod S.Ticks_Per_Move;
        if S.Ticks = 0 then
            S.State := S.State + 1;
        end if;
    end Tick;

    procedure Enable_All is
    begin
        Spinners_Enabled := True;
    end Enable_All;

    procedure Disable_All is
    begin
        Spinners_Enabled := False;
    end Disable_All;

end Progress_Indicators.Spinners;
