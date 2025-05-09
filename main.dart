import 'package:flutter/material.dart';

  void main() {
  runApp(ToDoApp());
  }

          class ToDoApp extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
              return MaterialApp(
            title: 'Simple To-Do App',
            theme: ThemeData(
              primaryColor: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
        ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
        ),
        ),
        ),
        home: ToDoHome(),
        debugShowCheckedModeBanner: false,
        );
            }
          }

          class ToDoHome extends StatefulWidget {
            @override
            _ToDoHomeState createState() => _ToDoHomeState();
        }

            class _ToDoHomeState extends State<ToDoHome> {
            final TextEditingController _controller = TextEditingController();
            final List<String> _tasks = [];

              void _addTask() {
              final text = _controller.text.trim();
                if (text.isNotEmpty) {
              setState(() {
                _tasks.add(text);
              });
                _controller.clear();
            }
          }

            void _deleteTask(int index) {
                setState(() {
                _tasks.removeAt(index);
              });
            }

              @override
                Widget build(BuildContext context) {
                  return Scaffold(
              appBar: AppBar(
              title: Text('To-Do List'),
            ),
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                    children: [
                  Expanded(
                    child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                    labelText: 'Enter a task',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),


                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
                Expanded(
                  child: _tasks.isEmpty
                ? Center(child: Text('No tasks yet.'))
                : ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.circular(8),
              ),
                    child: ListTile(
                    title: Text(_tasks[index]),
                    trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                ),
              ),
            );
          },
          ),
      ),
    ],
    ),
    );
  }
}