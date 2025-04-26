import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:io';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final GenerativeModel model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyAg_sqDsucz3np7fYJqIoOX9Yx8MT_2UNQ");

  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Hello! How can I help you today?',
      isUser: false,
      time: DateTime.now(),
    ),
  ];

  bool _isLoading = false;
  String? _error;
  String? _lastFailedMessage;

  String _getErrorMessage(dynamic error) {
    if (error is SocketException) {
      return 'No internet connection. Please check your network settings and try again.';
    } else if (error.toString().contains('Failed host lookup')) {
      return 'Unable to connect to the server. Please check your internet connection.';
    } else if (error.toString().contains('API key')) {
      return 'Invalid API key. Please check your configuration.';
    } else {
      return 'An error occurred. Please try again.';
    }
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _lastFailedMessage = null;
      _messages.add(ChatMessage(
        text: message,
        isUser: true,
        time: DateTime.now(),
      ));
      _messageController.clear();
    });

    try {
      final content = [Content.text(message)];
      final response = await model.generateContent(content);
      //print("data is ${response.text}");
      if (response.text == null || response.text!.isEmpty) {
        throw Exception('Empty response received');
      }

      setState(() {
        _messages.add(ChatMessage(
          text: response.text!,
          isUser: false,
          time: DateTime.now(),
        ));
      });
    } catch (e) {
      //debugPrint('Error generating response: $e');
      final errorMessage = _getErrorMessage(e);
      setState(() {
        _error = errorMessage;
        _lastFailedMessage = message;
        _messages.add(ChatMessage(
          text: errorMessage,
          isUser: false,
          time: DateTime.now(),
        ));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> retryLastMessage() async {
    if (_lastFailedMessage != null) {
      final messageToRetry = _lastFailedMessage!;
      setState(() {
        _lastFailedMessage = null;
        _error = null;
        // Remove the last error message
        if (_messages.isNotEmpty && !_messages.last.isUser) {
          _messages.removeLast();
        }
      });
      await sendMessage(messageToRetry);
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primaryContainer,
              ),
              child: Icon(
                Icons.smart_toy_rounded,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gemini Chat Assistant',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _isLoading
                      ? 'Typing...'
                      : (_error != null ? 'Error' : 'Online'),
                  style: textTheme.bodySmall?.copyWith(
                    color: _error != null
                        ? colorScheme.error
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (_error != null)
            Container(
              padding: const EdgeInsets.all(8),
              color: colorScheme.errorContainer,
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: colorScheme.error),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                  if (_lastFailedMessage != null)
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: retryLastMessage,
                      color: colorScheme.onErrorContainer,
                    ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _error = null),
                    color: colorScheme.onErrorContainer,
                  ),
                ],
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  return ChatBubble(
                    message: message,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _messageController,
                      enabled: !_isLoading,
                      decoration: InputDecoration(
                        hintText: _isLoading
                            ? 'Assistant is typing...'
                            : 'Type a message...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      onSubmitted: (text) => sendMessage(text),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: _isLoading
                        ? colorScheme.surfaceVariant
                        : colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isLoading ? Icons.hourglass_empty : Icons.send,
                      color: _isLoading
                          ? colorScheme.onSurfaceVariant
                          : colorScheme.onPrimary,
                    ),
                    onPressed: _isLoading
                        ? null
                        : () => sendMessage(_messageController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const ChatBubble({
    super.key,
    required this.message,
    required this.colorScheme,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser)
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.primaryContainer,
              ),
              child: Icon(
                Icons.smart_toy_rounded,
                size: 20,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: message.isUser
                    ? colorScheme.primary
                    : colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    message.text,
                    style: textTheme.bodyLarge?.copyWith(
                      color: message.isUser
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${message.time.hour.toString().padLeft(2, '0')}:${message.time.minute.toString().padLeft(2, '0')}',
                    style: textTheme.bodySmall?.copyWith(
                      color: message.isUser
                          ? colorScheme.onPrimary.withOpacity(0.7)
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
