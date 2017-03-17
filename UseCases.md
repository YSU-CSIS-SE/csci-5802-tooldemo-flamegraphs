# Use Cases

# Who are Flame Graphs for?

Flame graphs are for you if you're doing something at scale - website, server, program, whatever. If something is done at a large enough scale, the time spent 

## Where should your code be?

Flame graphs are something you use after you've written the code and you have it running. By using profilers and tools like Flame Graphs you can develop with the code now, optimize later philosophy. You never truly know what is actually an optimization during development anyways.

## Environment - Large Infrastructure

// Insert stats about Google, AWS, etc infrastructure cost

// Talk about what a 10% gain in efficiency would do

## Program Types

If you have a web server or service, batch processing system, speed critical system, or anything that has a lot of CPU time - you should try Flame Graph Profiling.

## Code Patterns

If much of your program's work is done by external libraries, it's worth ensuring you're using them efficiently.

### Common Examples

Some libraries have common patterns where they recommend you use them in a specific way, these include JSON parsers, string functions, network/communication libraries.

# Who are Flame Graphs not for?

## Program Types
GUI/Frontend programs that are not widely where most of the time is spent waiting on the user.

Small services - optimization has little return when not at scale. 

## Costs
If running your web service costs an inconsequential annual amount, it's likely not worth your time to profile the service for inefficiencies.

# Reading Flame Graphs - Examples Inefficiencies

These are actually quite simple to read.

// Insert picture

// Talk about picture