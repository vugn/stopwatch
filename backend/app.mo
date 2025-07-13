import Time "mo:base/Time";

actor Stopwatch {

  var startTime : ?Int = null;
  var elapsed : Int = 0;

  public func start() : async Text {
    if (startTime == null) {
      startTime := ?Time.now();
      return "Stopwatch started.";
    } else {
      return "Stopwatch is already running.";
    }
  };

  public func stop() : async Text {
    switch (startTime) {
      case (?start) {
        let now = Time.now();
        elapsed += now - start;
        startTime := null;
        return "Stopwatch stopped.";
      };
      case null {
        return "Stopwatch is not running.";
      };
    }
  };

  public func reset() : async Text {
    startTime := null;
    elapsed := 0;
    return "Stopwatch reset.";
  };

  public func getElapsed() : async Int {
    switch (startTime) {
      case (?start) {
        let now = Time.now();
        return elapsed + (now - start);
      };
      case null {
        return elapsed;
      };
    }
  };
}