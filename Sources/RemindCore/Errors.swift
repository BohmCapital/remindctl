import Foundation

public enum RemindCoreError: LocalizedError, Sendable, Equatable {
  case accessDenied
  case writeOnlyAccess
  case listNotFound(String)
  case reminderNotFound(String)
  case ambiguousIdentifier(String, matches: [String])
  case invalidIdentifier(String)
  case invalidDate(String)
  case unsupported(String)
  case operationFailed(String)

  public var errorDescription: String? {
    switch self {
    case .accessDenied:
      return "Access to Reminders denied. Grant access in System Settings > Privacy & Security > Reminders."
    case .writeOnlyAccess:
      return "Reminders access is write-only. Full access is required to read reminders."
    case .listNotFound(let name):
      return "List not found: \"\(name)\"."
    case .reminderNotFound(let id):
      return "Reminder not found: \"\(id)\"."
    case .ambiguousIdentifier(let input, let matches):
      return "Identifier \"\(input)\" matches multiple reminders: \(matches.joined(separator: ", "))."
    case .invalidIdentifier(let input):
      return "Invalid identifier: \"\(input)\"."
    case .invalidDate(let input):
      return "Invalid date: \"\(input)\"."
    case .unsupported(let message):
      return message
    case .operationFailed(let message):
      return message
    }
  }
}
