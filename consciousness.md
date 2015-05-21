# Stream of Consciousness

[TOC]

# Milestones

Below is a list of actions that must be completed in order to be production ready (at least beta level).  Once one is completed, it can be lined out.  Lineout is done through two consecutive ~ symbols on each side of the block of text.  ~~example~~.

 1. Determine a productive file structure
 2. User Authentication
 3. Store User Answer
 4. Recall User Answer
 5. Update User Answer
 6. Establish a file to generate a database and the associated tables with defaults
 7. Read Questions from Database
 8. Perform logic for question tree
 9. Base screen update on AJAX backend

# General Thoughts

## Project file structure

Need thoughts here...

## Logged in User Status

Server configuration is Linux host on a Windows network.  The primary question is how do we track what user is logged in? The concept is called Single Sign On (SSO).  Apparently the backbone of this is the  NT LAN Manager (NTLM) which manages  authentication, integrity, and confidentiality for users.

It seems like a good answer to the problem is


Useful Links:
  1. [http://blogs.msdn.com/b/cellfish/archive/2008/08/26/getting-the-logged-on-windows-user-in-your-apache-server.aspx](http://blogs.msdn.com/b/cellfish/archive/2008/08/26/getting-the-logged-on-windows-user-in-your-apache-server.aspx)
  2. [NT LAN Manager Wikipedia Page](http://en.wikipedia.org/wiki/NT_LAN_Manager)
  3. [Wiki Page detailing Apache setup for NTLM SSO](http://wiki.otterhub.org/index.php?title=Implementing_Single_Sign_On_on_Linux_with_Apache)
  4. [**mod_auth_ntlm_winbind** Homepage with instructions](http://adldap.sourceforge.net/wiki/doku.php?id=mod_auth_ntlm_winbind)







