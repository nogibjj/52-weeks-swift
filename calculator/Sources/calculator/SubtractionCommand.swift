import Foundation
import Utility
import Basic

struct SubtractionCommand: Command {

    let command = "subtract"
    let overview = "Compute the difference of all the numbers."

    private let numbers: PositionalArgument<[Int]>

    init(parser: ArgumentParser) {
        let subparser = parser.add(subparser: command, overview: overview)
        numbers = subparser.add(positional: "numbers", kind: [Int].self,
                                usage: "List of numbers to operate with.")
    }

    func run(with arguments: ArgumentParser.Result) throws {
        guard var integers = arguments.get(numbers) else {
            return
        }
        let first = integers.removeFirst()
        let result = integers.reduce(first, -)
        print(result)
    }

}