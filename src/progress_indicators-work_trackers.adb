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
