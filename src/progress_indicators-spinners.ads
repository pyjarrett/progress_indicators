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
