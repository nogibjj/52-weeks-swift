var registry = CommandRegistry(usage: "<command> <options>", overview: "Basic Calculator")

registry.register(command: AdditionCommand.self)
registry.register(command: SubtractionCommand.self)
registry.register(command: MultiplicationCommand.self)
registry.register(command: DivisionCommand.self)

registry.run()