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

package Progress_Indicators.Bars is
    pragma Preelaborate;

    type Percentage is range 0 .. 100;

    function Get_Bar (Value : Percentage; Width : Natural := 100) return String;

end Progress_Indicators.Bars;