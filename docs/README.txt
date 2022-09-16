Overview
==============================================================================
The robot orchestra is a model of a real orchestra. To that end, it is
intended to perform musical scores with multiple, independent Musicians all
contributing to the orchestra. The orchestra is broken down into a Conductor
and a number of Musicians, which are connected by some transport so they can
communicate with one another.

Dictionary
------------------------------------------------------------------------------
Orchestra:
- all nodes connected to the network, consisting of a single Conductor, and at
  least one Musician

Conductor:
- the control node of the network, running a user-accessible interface

Musician:
- a node in the network that can play an assigned part score with its
  connected instrument

Orchestral Score:
- a mapping of connected Musicians to their Part Scores

Part Score:
- a piece of music playable by a Musician, encoded in a custom binary format

Orchestral Configuration:
- data held by a Musician denoting which Orchestral Section they belong to,
  in which Orchestral Register they play their assigned Part Score, and a
  unique identifier by which the Musician is known on the network

Orchestral Section:
- a collection of one or more Musicians, all playing the same Part Score
  (potentially each in a different Orchestral Register)

Orchestral Register:
- the pitch offset used by a Musician, relative to which all notes in its
  assigned Part Score are interpreted and played


Overview: Conductor
------------------------------------------------------------------------------
The Conductor is a node in the network with a UI attached, to allow a user to
interface with and configure the orchestra for a performance. Via the
Conductor, the user can:
- enumerate all Musicians currently connected to the network as part of the
  orchestra
- manage the orchestral configuration each connected Musician
- select a part score for each connected Musician (individually, or as part of
  an orchestral section)
- start, pause, and stop playback of the currently selected orchestral score

Overview: UI (Graphene Mk. 6)
------------------------------------------------------------------------------
The UI for the Conductor node needs to allow the user to manage the orchestra
in a simple, accessible, and intuitive manner. This would either be via a web
application (running on the Conductor node), or via a GUI program.

Overview: Musician
------------------------------------------------------------------------------
The Musician is a node in the network that implements an instrument, and that
gets configured and controlled by the Conductor. It can:
- announce itself to the network, implementing automatic discovery
- store orchestral configuration data about itself
- buffer a part score of fixed length, which can be overwritten at playtime so
  as to afford the Musician the ability to play unlimited length part scores
- play, pause, and stop playback of the currently buffered part score
