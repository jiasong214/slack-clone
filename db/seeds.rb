# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
luke = User.create!(
  username: "Luke Hammer",
  password: "chicken",
  email: "luke.hammer@generalassemb.ly",
  title: "Instructor/disembodied beard model",
  image: "/assets/default-profile.png"
)

daniel = User.create!(
  username: "Dan Lord-Of-Quizzes",
  password: "chicken",
  email: "dlorddoyle@gmail.com",
  title: "win quizzes regardless of whose involved quizzer",
  image: "/assets/default-profile.png"
)

alex = User.create!(
  username: "Alex Zhang (he/him) - SYD",
  password: "chicken",
  email: "hellozhangdi1994@gmail.com",
  title: "Student",
  image: "/assets/default-profile.png"
)

stanley = User.create!(
  username: "Stanley",
  password: "chicken",
  email: "stanleyshrink@hotmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

dan = User.create!(
  username: "Daniel Yip (he/him) - SYD",
  password: "chicken",
  email: "danielyip90@gmail.com",
  title: "Student",
  image: "/assets/default-profile.png"
)

cam = User.create!(
  username: "Cameron Reid",
  password: "chicken",
  email: "reid.camerond@gmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

suraj = User.create!(
  username: "Suraj Sharma",
  password: "chicken",
  email: "surajneha2510@gmail.com",
  image: "/assets/default-profile.png"
)

steven = User.create!(
  username: "Steven Furnari - SYD",
  password: "chicken",
  email: "s.furnari@hotmail.com",
  title: "Student",
  image: "/assets/default-profile.png"
)

lo = User.create!(
  username: "Laurence Qi",
  password: "chicken",
  email: "laurence.qi@outlook.com",
  title: "",
  image: "/assets/default-profile.png"
)

cassie = User.create!(
  username: "Cassie Lee",
  password: "chicken",
  email: "cassielee8757@gmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

frankie = User.create!(
  username: "Frankie Tsoi",
  password: "chicken",
  email: "frankie.tsoi@hotmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

ethan = User.create!(
  username: "Ethan Zheng",
  password: "chicken",
  email: "yufan.zheng@outlook.com",
  title: "",
  image: "/assets/default-profile.png"
)

alexK = User.create!(
  username: "alex k",
  password: "chicken",
  email: "alexking2212@gmail.com",
  title: "twitter.com/@8CAL1CO",
  image: "/assets/default-profile.png"
)

david = User.create!(
  username: "David Broomhead",
  password: "chicken",
  email: "david.broomhead@gmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

jia = User.create!(
  username: "Jia Song",
  password: "chicken",
  email: "jiasong214@gmail.com",
  title: "",
  image: "/assets/default-profile.png"
)

jesus = User.create!(
  username: "Jesus Flores (He / Him) - SYD",
  password: "chicken",
  email: "jesusflores9325@gmail.com",
  image: "/assets/default-profile.png"
)

angela = User.create!(
  username: "Angela Zhang",
  password: "chicken",
  email: "a_zhang93@hotmail.com",
  image: "/assets/default-profile.png"
)

ro = User.create!(
  username: "Rowena Leung",
  password: "chicken",
  email: "roe0320@gmail.com",
  image: "/assets/default-profile.png"
)

yvonne = User.create!(
  username: "Yvonne Dodd (she/her)",
  title: "Outcomes Mgr + Career Coach",
  password: "chicken",
  email: "yvonne.dodd@generalassemb.ly",
  image: "/assets/default-profile.png"
)

jin = User.create!(
  username: "Jin Zheng",
  title: "Software Engineer - Backend",
  password: "chicken",
  email: "jzheng@atlassian.com",
  image: "/assets/default-profile.png"
)

hayley = User.create!(
  username: "Hayley",
  title: "Director, Student Success",
  password: "chicken",
  email: "hayley@generalassemb.ly",
  image: "/assets/default-profile.png",
  status: "disabled"
)


Channel.destroy_all
seic50 = Channel.create!(
  name: "sei-anz-seic50",
  description: "",
  private: 1,
  owner_id: luke.id
)

global = Channel.create!(
  name: "gloabl",
  description: "This channel is for announcements about trivia. All team members are in this channel, but only admins can post. (Please do not post surveys here).",
  private: 0,
  owner_id: yvonne.id
)


Chat.destroy_all
Chat.create!(
  msg: "<p>SLACK STAND-UP EVERYONE</p><ol><li>What have you got working since yesterday?</li><li>What are you working on right now/today?</li><li>What, if anything, is blocking you or preventing you from making progress?</li></ol>",
  user_id: luke.id,
  channel_id: seic50.id,
)
Chat.create!(
  msg: "<ol><li>Added some JS to enable&nbsp;multiple skills to be created when making or editing a user. Styled all the index pages and almost all the show pages.</li><li>Style the forms and implement the error handling , add multi task creation for projects, tidy up time calculation with a method.</li><li>&nbsp;TIME MANAGEMENT….</li></ol>",
  user_id: dan.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<ol><li>Added UI for home page, installed fonts and some general styling into application.html</li><li>Complete UI for user inputs and show pages, add more validation to forms</li><li>CSS being difficult</li></ol>",
  user_id: david.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p>1.post is working creating is working 2. working on comments 3 working on css</p>",
  user_id: suraj.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p>Morning!</p><p>1. Cloudinary single/mulitple images. User’ CRUD. Fixed Projects edit/update page. Added more columns on database</p><p>2. start working on the css, users profile page, follow other users. If possible make a search bar, like button for projects</p><p>3. multiple/single Cloudinary images errors (solved) was taking some time. Don’t remember what the other error were….but got it working now!</p>",
  user_id: angela.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p>Bonjourno</p><ol><li>Got most of my routes, CRUD and associations working, implemented the other table and additional columns to others, got some special conditionals for form filling</li><li>Finish off backend, hopefully more CSS that works, error messages for user and better user experience</li><li>Associations logic</li></ol>",
  user_id: stanley.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<ol><li>signin page is now working, image upload for profiles started to work on comments</li><li>try and get comments working, add multiple image upload for recipes</li><li>dealing with authenticity tokens when creating a comment, I can add the comments in pry but not on the front end in my form</li></ol>",
  user_id: cam.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<ol><li>functionality mostly done for site</li><li>css, css, css</li><li>my lack of good planning and being unorganised</li></ol>",
  user_id: steven.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<ol><li>created sign in function / user profile page / user watchlist / user review list - so they can see their activities in separate pages</li><li>Add to watchlist function - similar to follow and unfollow feature so hopefully i can get that done today</li><li>Heroku error - getting error msgs when push to heroku</li></ol>",
  user_id: cassie.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p><strong>AGENDA:</strong></p><ul><li>11am: Bootstrap CSS framework with Rowena</li><li>2.30pm: self/friend custom associations</li></ul>",
  user_id: luke.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p>Running a bit late! Starting at 11:10</p>",
  user_id: ro.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<pre class=\"ql-syntax\" spellcheck=\"false\">//= require jquery\r\n//= require popper\r\n//= require bootstrap-sprockets\r\n</pre>",
  user_id: ro.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<pre class=\"ql-syntax\" spellcheck=\"false\">Could not open library '/Users/stevenfurnari/.rvm/gems/ruby-2.7.0/gems/sassc-2.4.0/ext/libsass.bundle': dlopen(/Users/stevenfurnari/.rvm/gems/ruby-2.7.0/gems/sassc-2.4.0/ext/libsass.bundle, 0x0005): tried: '/Users/stevenfurnari/.rvm/gems/ruby-2.7.0/gems/sassc-2.4.0/ext/libsass.bundle' (mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64e')), '/usr/local/lib/libsass.bundle' (no such file), '/usr/lib/libsass.bundle' (no such file) (LoadError)\r\n</pre><p class=\"ql-align-right\">is that an m1 issue again??\t</p><pre class=\"ql-syntax\" spellcheck=\"false\">(mach-o file, but is an incompatible architecture (have 'x86_64', need 'arm64e'))\r\n</pre>",
  user_id: steven.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "ABOUT TO START USER-FOLLOW ASSOCIATIONS SESSION",
  user_id: luke.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<pre class=\"ql-syntax\" spellcheck=\"false\">rails g model Follow follower_id:integer followed_id:integer\r\n</pre>",
  user_id: luke.id,
  channel_id: seic50.id
)
Chat.create!(
  msg: "<p><strong>\“Mindfulness clears the windshield of the mind so that we can see things as they really are.\" -Travis Eliot</strong></p><p><br></p><p>Take a pause and join me for 20ish minutes of breathing + meditation at 12:30pm EST for your weekly mindful moment! &nbsp;Once available, the recording&nbsp;will be added in the thread for those who cannot make it.&nbsp;</p><p><br></p><p>Join me on Zoom at 12:30 EST (<strong>please be on time</strong>)!</p><p><a href=\"https://generalassembly.zoom.us/j/91433882612?pwd=S3pvMC9aL3ZETVFLOVI4cDJjS1NjZz09\" target=\"_blank\" style=\"color: rgba(var(--sk_highlight,18,100,163),1);\">https://generalassembly.zoom.us/j/91433882612?pwd=S3pvMC9aL3ZETVFLOVI4cDJjS1NjZz09</a></p><p><br></p><p>Meeting ID: 914 3388 2612</p><p>Passcode: 369285</p>",
  user_id: yvonne.id,
  channel_id: global.id
)
Chat.create!(
  msg: "<p>Hello GA community, it has come to our attention that some students may have received a spam text stating it was from GA's CEO, Lisa Lewin. Please disregard this message. Our IT teams are actively investigating this issue, we apologize for any confusion or inconvenience.</p>",
  user_id: hayley.id,
  channel_id: global.id
)
Chat.create!(
  msg: "<p><strong>\"In the stillness of the quiet, if we listen, we can hear the whisper of the heart giving strength to weakness, courage to fear, hope to despair.\" -Howard Thurman</strong></p><p><br></p><p>Happening now! Take a pause and join me for 20ish minutes of&nbsp;<strong>breathing + meditation (no yoga)</strong>&nbsp;at 12:30pm EST for your weekly mindful moment!&nbsp;Once available, the recording&nbsp;will be added in the thread for those who cannot make it.&nbsp;</p><p><br></p><p>Join me on Zoom at 12:30 EST (<strong>please be on time</strong>)!</p><p><a href=\"https://generalassembly.zoom.us/j/91433882612?pwd=S3pvMC9aL3ZETVFLOVI4cDJjS1NjZz09\" target=\"_blank\" style=\"color: rgba(var(--sk_highlight,18,100,163),1);\">https://generalassembly.zoom.us/j/91433882612?pwd=S3pvMC9aL3ZETVFLOVI4cDJjS1NjZz09</a></p><p><br></p><p>Meeting ID: 914 3388 2612</p><p>Passcode: 369285</p>",
  user_id: yvonne.id,
  channel_id: global.id
)



luke.channels << seic50 << global
daniel.channels << seic50 << global
alex.channels << seic50 << global
stanley.channels << seic50 << global
dan.channels << seic50 << global
cam.channels << seic50 << global
suraj.channels << seic50 << global
steven.channels << seic50 << global
lo.channels << seic50 << global
cassie.channels << seic50 << global
frankie.channels << seic50 << global
ethan.channels << seic50 << global
alexK.channels << seic50 << global
david.channels << seic50 << global
jia.channels << seic50 << global
jesus.channels << seic50 << global
angela.channels << seic50 << global
ro.channels << seic50 << global

yvonne.channels << global
hayley.channels << global