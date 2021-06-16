package Progress_Indicators.Spinners is
    -- It's always fun to have a fun spinning indicator while waiting for
    -- terminal work to complete.  This is just a simple reusable version useful
    -- for tasks monitoring work to indicate that the process isn't dead.

    type Spinner is private;

    function Make (Ticks_Per_Move : Positive) return Spinner;
    -- Makes a new spinner which goes to the next element every given number of
    -- ticks, allowing you to vary spin rate.

    function Value (S : Spinner) return Character;
    procedure Tick (S : in out Spinner);

private

    type Spinner_State is mod 4;

    Spinner_States : constant array (Spinner_State) of Character := ('/', '-', '\', '|');

    type Spinner is record
        Ticks_Per_Move : Positive;
        Ticks          : Natural;
        State          : Spinner_State;
    end record with
        Type_Invariant => Ticks < Ticks_Per_Move;

end Progress_Indicators.Spinners;
