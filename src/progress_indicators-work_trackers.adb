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

package body Progress_Indicators.Work_Trackers is

    protected body Work_Tracker is
        procedure Start_Work (Amount : Natural) is
        begin
            Current.Total := Current.Total + Amount;
        end Start_Work;

        procedure Finish_Work (Amount : Natural) is
        begin
            Current.Completed := Current.Completed + Amount;
        end Finish_Work;

        function Report return Status_Report is (Current);
    end Work_Tracker;

end Progress_Indicators.Work_Trackers;
