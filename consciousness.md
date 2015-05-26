# Stream of Consciousness

[TOC]

# Milestones

Below is a list of actions that must be completed in order to be production ready (at least beta level).  Once one is completed, it can be lined out.  Lineout is done through two consecutive ~ symbols on each side of the block of text.  ~~example~~.

## Administrative

 1. Determine a productive file structure
 2. Establish a file to generate a database and the associated tables with defaults

## Infrastructure

 1. Track session cookies
 2. Enforce timeout??
 3. User Authentication (installation of `mod_auth_ntlm_winbind` on the server)
 4. Perform logic for question tree
 5. Base screen update on AJAX backend
 6. Author a function to get the status of all questions the user might need to answer and then flag each as answered(green)/unanswered(red)/na(dray grey)/unknown(light grey)
 7. Write code to allow the user to add a new previously unknown project to the system (???)

## User Interaction

 1. Store User Answer
 2. Recall User Answer
 3. Update User Answer
 4. Read Questions from Database
 5. Author a function to generate the required HTML for the sidebar to display the status
 6. Setup the sidebar to have links to the questions
 7. Author a function extract a particular question from the database and format the HTML code for display
 8. Write the code for the **next** / **save** button on the page which would transmit the results to the database and initiate the pull for the next question.
 9. Compose a landing page where the user can select which project he or she wants to fill in.
 10. Add the username / project identifier to the far left of the title bar

# Website Concept

The primary page is the index.php page which sets up the nessessry page structure using jQuery and <div> tags appropriatley.
The left side of the page would have a column dedicated to informing the user where they are in the QA session.  Maybe the questions can have a short title that can be listed there.  Each of the questions there can be color coded base on completed, not completed but required, not completed and not required, and not completed and unknown.

In addition to a QA status, the far left portion of the title region should have a small and simple username and current project identifier.

The center of the index.php page is a giant div tag with the name "main".  This will be where all of the data from the server will land.

When the user lands on the index.php page for the first time, the server checks for the existance of a cookie called "project".  If that cookie does not exist, it will generate that cookie with a default value of "-1" and then create another cookie called "question" with a default value of "-1".  The idea behind the cookies is that the state can be saved and the user can come back to where they were.  The far left QA status can be populated by the value of the "question" cookie.  Additionally, the server can check to see if the "project" cookie is set to "-1" and if it is, then immediatly present the user with a page giving him or her the option to select a project to answer questions for.

When the user is presented with a question, a "dirty" flag somewhere hidden on the page is set to "0".  If the user alters the contents of the answer in any way, the "dirty"flag will get set to "1".  When the user clocks on any of the navigation icons, the system immeditaly checkes the status of the "dirty" variable.  If it is set to "1", then a special call is made which would transmit the results to the server.  Only then will the next quetsion or other navigation action be executed.

What would be the best is if the database was updated each time the user made a change to the question.  It might be possible to do this.  We can just add a callback to the "onChange" style hook for the question.

# Sample Program Logic Chain

 1. User lands on the page and the "onLoad" callback forces a query to the processAJAX.php routine.

 2. The processAJAX routine checks the $_COOKIE->{"program"} field (It will exist because we force it to -1 by default)

 3. If the program cookie is set to "-1" the routine will return the code nessessary for the user to select the program
 4. Once the user selects the program, the processAJAX will set the cookie to maintain state and set the questionid cookie to the root quetion node for the current survey.
 5. 

# Answerstream

One of the core features of this application is the ability to have the end user submit multiple sets of answers, one for each problem that was discovered or is expected to affect future testing.  In order to support this feature, each answer stored in the database must be addressed with a location and a time in the universe of questions.  This can be accomplished by assigning an index to each question that begins a branch of questions based on an answer and further that answer can also be applied an additional index to track which itteration of the answer it was.

Each branching quesetion (one such that a different route can be taken depending on an answer) will define the headwater.  Specifically each possible answer for that question will define a headwater id.  That headwater id will be tracked and appeneded to each future answer.  The answerstream, the collection of answers for a given series of questions, contains this list of headwater ids that define a specific pathway through the question heiarchy defined in the question roadmap.

The headwater ids default to the questionid_answerorder where questionid is the assigned unique number of the question in the question datatable and the answerorder was the integer order value of the answer for that question defined in the questions_options table.  The initial head question for a survey will be given a default answerstream address of "1_1".  

To determine how many results a person has given for a question, the analysts simply needs to filter the answers datatable for any entry which references the headwaterid.  They then need to simply look at the headwaterindex number for that accosiated headwater id.  The max of these will be the number of responces.

To handle the infinite looping, the `next` field of the roadmap will be set to the question associated with the headwater id.

# Database Structure

## Tables

This is largely a rehash of the current structure of the database but I have done it from free mind (not looking at the current structure) and have added the ability to have heiarchical questions and strict question and radio option orders.

Only thing this can not handle right now is a checkbox style question.  Although it is very similar to the radio option, the answer can be a multiple.  One possible way to handle that style of question is to just store the numbers of the results in a comma delimited list in the answer field.  That can always be reparsed in the future.

Not sure how to factor in the require / optional questions....

The database needs to be able to support questions about the program and questions about the individual problems for each program.  This might mean that we would need to split the answers into two seperate tables.  Ok...  I got this.
To handle cyclic questions I add a parentid field to the answers section.  In the event that multiple answers have the same parentid, those are seperate answer streams for the same question.  The remaining question is how I link the end of the answer stream back to the original question.  I could specify a "headwater" field which would be associated with a question.  If the headwater field is blank for a quetesion, it would inherit the previous headwaters.  In the event that there is already one headwater, and another question is asked that has a headwater, then it would append the new headwater onto the headwater collection, FILO style.
Needs to be a way to tell if a question stream is completed or not

### `survey`
| Field | Description |
|-------|-------------|
| id | Unique id to use as primary key |
| name | Textual name of the survey |
| year | Year the survey was issued |
| initialquestion | Id of the initial question to ask |

### `programs`
| Field | Description |
|-------|-------------|
| id | Unique id field to act as the primary key |
| name | Name of the program |

### `questions`
| Field | Description |
|-------|-------------|
| id | Unique question id field to act as the primary key
| type | Type of question.  Options are `radio` and `text` |
| label | Text passed to the web page for display |

### `questions_radio_options`
| Field | Description |
|-------|-------------|
| id  | Unique id to track as the primary key |
| questionid | Link to the question id |
| isHeadwater | Booline value checking to see if this is the beginning of an answerstream |
| order | Order the option would show in (This would also be the result of the question) |
| label | The text displayed to the user |

### `roadmap`
| Field | Description |
|-------|-------------|
| surveyid | Link to the survey id in the survey table |
| questionid | Link to the question id in the questions table |
| parent | A link to the id of the parent question id |
| order | A numerical order to fix the order upon which the questions appear if multiple questions have the same parent

### `answers`
| Field | Description |
|-------|-------------|
| id | Unique id to track as the primary key |
| username | Name of the user answering the question |
| projectid | Link to the project the question is targeted for |
| questionid | Link to the question id |
| surveyid | Link to the survey id (Not really needed since I could get that through the questionid) |
| answer | Answer from the site.  Always stored as text.  Numbers for the radio type questions can be reconverted |
| parentid | Link to the answer to the previous question |
| date | Datetime that the question was answered |


Ok, so how does all of this work together?  How about a few example tasks?

#### What is the answer to a given question for a given person?
    SELECT answer FROM answers WHERE usersname=<< username >> AND questionid=<< qid >> AND surveyid=<< sid >> AND projectid=<< pid >>

#### What is the next question to answer (current question is pqid)
    SELECT questionid FROM roadmap WHERE surveyid=<< sid >> AND parent=<< pqid >> ORDER BY order ASC
This is not correct...
One would have a function that would check for children that had been un-answered.  If there were it would then return the first un-answered child.  If there were no children that were un-answered, the algorithm would move one level up in the heiarchy and then perform the same check.  I do not think that can be completly done in SQL, as much as I would like for it to be.

    getNextQuestion = function(qid, username, surveyid) {
      unfinishedChildren = SELECT questionid FROM roadmap WHERE surveyid=<< surveyid >> AND parent=<< qid >> ORDER BY order ASC
      if(length(unfinishedChildren) == 0) {
      	qidp = SELECT parent FROM roadmap WHERE surveyid=<< surveyid >> AND questionid=<< qid >>
        return getNextQuestion(qidp, username, surveyid)
      } else {
        ... Need to continue here...  
      }
    }


# General Thoughts

## Database todo list

 1. Alter the questions table to have a heiarchical structure (parent / children)
 2. Alter the answers table to store the username and not the user id from the user table
 3. Remove the users table as we will likely not need it since we can use NTLM for auth
 4. Add question category to the question table

The question category section is so that we can have a sidebar on the web page that denotes which 

## Project file structure

~~~ 
www [Root of the website]
  index.php [Primary landing page]
  processAJAX.php [Page dedicated to answering the AJAX calls]
  style.css [Basic CSS information for the index.php landing page]
  /scripts [Directory to hold all other scripts]
    /js [Directory to hold the JS specific files]
      ajax.js [File to hold all of the specific client side AJAX code]
    /php [Directory to hold the php specific files]
      setup.php [File to load the common php environment for the each page]
      connection.php [File to make the connection to the database]
  /images [Directory to hold graphic media for the site]
~~~

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



