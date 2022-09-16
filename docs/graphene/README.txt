Graphene Mk. VI
==============================================================================
Graphene Mk. VI is the new conductor for the UoM RoboSoc Robot Orchestra. It
is responsible for the discovery, configuration, and co-ordination of the
various musicians in the robot orchestra. It is designed to be simple,
extensible, and to support generic instruments, so that the orchestra can be
expanded or minimised to suit the current score as needed.

Features
------------------------------------------------------------------------------
As mentionned earlier, the core features required for Graphene are as follows:
- Supports discovery of all connected musicians
- Supports mapping a part score to one or more musicians
- Supports configuring all connected musicians individually
- Supports playing a score with one or more musicians

Features: Discovery
------------------------------------------------------------------------------
Graphene should be able to automatically discover all musicians connected to
it, and register them centrally for future use. This allows Graphene to
support an arbitrary number of musicians (within the limits imposed by the
connection transport protocol and required bandwidth), and is thus best for
extensibility.

Features: Flashing
------------------------------------------------------------------------------
To enable Graphene to play the widest possible number of scores, it should be
able to flash the part scores of a musician (or group of musicians) at
runtime. Allowing musicians to buffer up a part score means that timing and
bandwidth issues with sending notes individually to each musician are
simplified, and thus improves scaling with the number of musicians. Allowing
flashing of the score at runtime means that scores longer than that which can
fit into the musicians buffer can be played.

Features: Configuration
------------------------------------------------------------------------------
The Graphene-musician interface should be generic (to allow all kinds of
different instrument implementations), and should be simple to implement and
extend. Additionally, certain musicians might want to be grouped into banks of
musicians (so as to play with chords), with each individual musician offset by
a certain pitch. This configuration should be decided at runtime so as to
offer flexibility between scores.

Features: Playing
------------------------------------------------------------------------------
Finally, Graphene must be able to instruct the musicians to play their scores
simultaneously, and to keep them synchronised with one another.

System Architecture
------------------------------------------------------------------------------
Graphene needs to communicate with a user, to select what score(s) to play and
to allow the user to start and stop the orchestra. At the same time, it needs
to be able to convert the user-selected score into a format suitable for the
different available musicians, flash and configure each musician with their
respective part score and orchestral configuration, and relay any play and
stop commands to each musician (synchronising them to a common tempo if
necessary).

Interface Design
------------------------------------------------------------------------------
A mockup of a prototype UI can be found in the `graphene-ui-mockup.png` file.
