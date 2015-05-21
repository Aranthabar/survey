# Stream of Consciousness

[TOC]

# Milestones

Below is a list of actions that must be completed in order to be production ready (at least beta level).  Once one is completed, it can be lined out.  Lineout is done through two consecutive ~ symbols on each side of the block of text.  ~~example~~.

 1. Determine a productive file structure
 2. Track session cookies
 3. Enforce timeout??
 2. User Authentication (installation of `mod_auth_ntlm_winbind` on the server)
 3. Store User Answer
 4. Recall User Answer
 5. Update User Answer
 6. Establish a file to generate a database and the associated tables with defaults
 7. Read Questions from Database
 8. Perform logic for question tree
 9. Base screen update on AJAX backend

# General Thoughts

## Database todo list

 1. Alter the questions table to have a heiarchical structure (parent / children)
 2. Alter the answers table to store the username and not the user id from the user table
 3. Remove the users table as we will likely not need it since we can use NTLM for auth

## Project file structure

Need thoughts here...

## Logged in User Status

Server configuration is Linux host on a Windows network.  The primary question is how do we track what user is logged in? The concept is called Single Sign On (SSO).  Apparently the backbone of this is the  NT LAN Manager (NTLM) which manages  authentication, integrity, and confidentiality for users.

Based on my current browsing, the best looking solution is to implement the [`mod_auth_ntlm_winbind`](http://adldap.sourceforge.net/wiki/doku.php?id=mod_auth_ntlm_winbind) solution which is documented via the links below.  This module uses a combination of Apache, Kerberos, SAMBA, and something else to communicate with the Windows Active Directory services to handle your login.  If the user is already logged onto a windows network, then the username will just be available to PHP via an environment variable.  If the user is not already logged in, the web browser will ask for a username / password / domain for the login to occur.  The great thing about this solution is there is not much we would need to do inside the website to track the user login process and the user would not have to deal with this.  << too good to be true huh...>>

Once everything is setup, we do not handle authentication at all and just need to reference the active logged in user via the username via:

```
$username = $_SERVER['PHP_AUTH_USER'];
```

or

```
$username = $_SERVER['REMOTE_USER'];
```

The [user manual for PHP](http://php.net/manual/en/reserved.variables.server.php) defines these elements of the `_SERVER` variable as:

| Field | Description |
|-------|-------------|
| PHP_AUTH_USER | When doing HTTP authentication this variable is set to the username provided by the user. |
| PHP_AUTH_PW | When doing HTTP authentication this variable is set to the password provided by the user. |
| REMOTE_USER | The authenticated user. |

### Useful Links

  1. [http://blogs.msdn.com/b/cellfish/archive/2008/08/26/getting-the-logged-on-windows-user-in-your-apache-server.aspx](http://blogs.msdn.com/b/cellfish/archive/2008/08/26/getting-the-logged-on-windows-user-in-your-apache-server.aspx)
  2. [NT LAN Manager Wikipedia Page](http://en.wikipedia.org/wiki/NT_LAN_Manager)
  3. [Wiki Page detailing Apache setup for NTLM SSO](http://wiki.otterhub.org/index.php?title=Implementing_Single_Sign_On_on_Linux_with_Apache)
  4. [mod_auth_ntlm_winbind Homepage with instructions](http://adldap.sourceforge.net/wiki/doku.php?id=mod_auth_ntlm_winbind)
  5. [Step by step instructions for mod_auth_ntlm_winbind](http://sourceforge.net/p/adldap/discussion/500911/thread/94209498/)





