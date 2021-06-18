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

package Progress_Indicators.Work_Trackers is
    -- Tracker used in the tracking of homogenous groups of work farmed out to
    -- many tasks.  The goal is to track the amount of outstanding elements to
    -- process, without caring too much about any individual element of work.

    type Status_Report is record
        Completed : Natural := 0;
        Total     : Natural := 0;
    end record;

    protected type Work_Tracker is
        procedure Start_Work (Amount : Natural);
        procedure Finish_Work (Amount : Natural);
        function Report return Status_Report;
    private
        Current : Status_Report;
    end Work_Tracker;

end Progress_Indicators.Work_Trackers;
