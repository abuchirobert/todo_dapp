// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Name: Abuchi Robert
//Path: Web3


contract ToDoList {
    // This struct is used to represent a task instance
    struct Task {
        uint id;
        string content;
        bool isCompleted;
    }

    // The task arrays will be stored here
    Task[] public tasks;

    // Counter to keep track of task IDs and it is set to 0 indicating no task for now
    uint public taskCount = 0;

    // Function to create a new task
    function createTask(string memory _content) public {
        tasks.push(Task(taskCount, _content, false)); //the tasks.push pushes the taskcount, the content and the default status of the task
        taskCount++;
    }

    // Function to update a task's content
    function updateTask(uint _id, string memory _newContent) public {//the string memory stores the content of the _newContent in the memory instead of the blockchain
        require(_id < taskCount, "Invalid task ID");
        tasks[_id].content = _newContent;
    }

    // Function to mark a task as completed or pending
    function updateTaskStatus(uint _id, bool _isCompleted) public {
        require(_id < taskCount, "Invalid task ID");
        tasks[_id].isCompleted = _isCompleted;
    }

    // Function to get a specific task by ID
    function getTask(uint _id) public view returns (Task memory) {
        require(_id < taskCount, "Invalid task ID");
        return tasks[_id];
    }

    // Function to get all tasks
    function getAllTasks() public view returns (Task[] memory) {
        return tasks;
    }

    // Function to delete a task by ID
    function deleteTask(uint _id) public {
        require(_id < taskCount, "Invalid task ID");

        // Shift tasks to remove deleted element efficiently
        for (uint i = _id; i < taskCount - 1; i++) {
            tasks[i] = tasks[i + 1];
        }
        taskCount--;
        tasks.pop(); // Remove the last element (potentially empty)
    }
}
