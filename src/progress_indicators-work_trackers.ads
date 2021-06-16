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
