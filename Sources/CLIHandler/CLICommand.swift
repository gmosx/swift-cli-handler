import Utility

open class CLICommand {
    public let name: String
    public let summary: String
    public let usage: String?
    public private(set) var argumentParser: ArgumentParser!
    public private(set) var subcommands: [String: CLICommand]

    public init(name: String, summary: String, usage: String? = nil) {
        self.name = name
        self.summary = summary
        self.usage = usage
        self.subcommands = [:]
    }

    public func setup(argumentParser: ArgumentParser) {
        self.argumentParser = argumentParser
    }

    open func setup() {
        // Override this method to setup options, flags, subcommands, etc.
        return
    }

    public func add(subcommand: CLICommand) {
        let subparser = argumentParser.add(subparser: subcommand.name, overview: subcommand.summary)
        subcommand.setup(argumentParser: subparser)
        subcommand.setup()
        subcommands[subcommand.name] = subcommand
    }

    public func route(result: ArgumentParser.Result) {
        if let subcommandName = result.subparser(argumentParser) {
            if let subcommand = subcommands[subcommandName] {
                subcommand.route(result: result)
            } else {
                print("Unrecognized command '\(subcommandName)'")
            }
        } else {
            willRun()
            run(result: result)
        }
    }

    /// Initialize resources only needed if the command is executed
    open func willRun() {
        return
    }

    /// Execute the logic of the command
    open func run(result: ArgumentParser.Result) {
        return
    }
}
