import Utility

public class CLIHandler {
    public init() {
    }

    public func handle(_ arguments: [String]? = nil, with command: CLICommand) throws {
        let argumentParser = ArgumentParser(usage: command.usage ?? "subcommand <options>", overview: command.summary)
        command.setup(argumentParser: argumentParser)
        command.setup()

        do {
            let result = try argumentParser.parse(Array((arguments ?? CommandLine.arguments).dropFirst()))
            command.route(result: result)
        } catch let error as ArgumentParserError {
            print(error.description)
        }
    }
}
