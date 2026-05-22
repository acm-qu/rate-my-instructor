# ACM RMS - Product Requirements Document (PRD)

## 1\. Overview

ACM RMS is a course and instructor review platform for Qatar University students.

Students can:

- Browse courses and instructors
- Read reviews and replies
- Upvote comments and replies
- Add reviews and recommendations
- Reply to comments
- Report inappropriate comments

Users are guests by default. Authentication is only required when attempting to create reviews, recommendations, replies, upvotes, or reports.

Instructors are not part of the target audience.

# 2\. Goals

## Primary Goals

- Allow students to share course and instructor experiences
- Help students discover highly rated instructors
- Create structured course-specific discussion threads
- Maintain community moderation through reporting

## Non-Goals

- Instructor accounts
- Major filtering
- Level filtering
- Multi-level nested replies
- Automated username generation

# 3\. User Types

## Guest User

Can:

- Browse courses
- Browse instructors
- Read comments and replies
- View ratings
- View best instructors

Cannot:

- Create reviews
- Reply
- Upvote
- Report comments

## Authenticated Student User

Can:

- Create reviews
- Recommend instructors
- Reply to comments
- Upvote comments and replies
- Edit own comments and replies
- Delete own comments and replies
- Report comments
- Logout

Authentication requires a valid QU email.

# 4\. Core Features

## 4.1 Authentication

### Signup

Users can create an account using a QU email.

Requirements:

- QU email validation
- Password creation
- Username selection
- Session creation after successful signup

### Login

Users can log in using their credentials.

### Logout

Users can terminate their session.

## 4.2 Browse Courses

Users can:

- Search courses
- Open course pages
- View instructor information
- View comments and replies
- View ratings

## 4.3 Add Review

Authenticated users can submit a review tied to:

- course_id
- instructor_id

A review contains:

- Rating
- Text content

Constraints:

- One review per user per instructor/course combination
- Reviews are stored in the database

## 4.4 Recommend Instructor

Recommend Instructor uses the same backend functionality as review creation.

Difference:

- Opens a modal containing an additional instructor name field

Backend behavior:

- Creates a review entry in the database

## 4.5 Replies

Users can reply to comments.

Requirements:

- One-level nesting only
- Replies support tagging using formats similar to @username
- Replies can be edited by the owner
- Replies can be deleted by the owner
- Replies can be upvoted

## 4.6 Upvotes

Users can upvote:

- Comments
- Replies

Constraints:

- One upvote per user per comment/reply

## 4.7 Reporting System

Authenticated users can report comments.

Requirements:

- Report reason submission
- Report stored in database
- Reported comments become hidden once the moderator flags the report as valid
- Reports require moderation review

## 4.8 Best Instructors

The platform provides a best instructors view.

Ranking logic:

- Sorted using average rating

# 5\. User Flow

## Guest Flow

- User enters platform
- User browses courses and instructors
- User opens course page
- User reads comments and replies
- User attempts protected action
- User is prompted to login/signup

## Authenticated Flow

- User logs in
- User selects course
- User views instructor information
- User reads comments
- User:
  - Adds review
  - Recommends instructor
  - Replies
  - Upvotes
  - Reports comments
- Changes persist in database

# 6\. Functional Requirements

## Authentication

- System shall support signup
- System shall support login/logout
- System shall validate QU email usage
- System shall maintain authenticated sessions

## Reviews

- System shall allow authenticated users to create reviews
- System shall prevent duplicate reviews for the same instructor/course pair
- System shall allow editing own reviews
- System shall allow deleting own reviews

## Replies

- System shall support one-level replies only
- System shall support tagged usernames
- System shall allow editing own replies
- System shall allow deleting own replies

## Upvotes

- System shall allow one upvote per user per item
- System shall support upvotes on comments and replies

## Reporting

- System shall allow reporting comments
- System shall hide valid reported comments
- System shall store reports for review
- System shall mark reports using reviewed boolean state

## Browsing

- System shall allow guests to browse content
- System shall display ratings and comments publicly

# 7\. Non-Functional Requirements

## Performance

- Course pages should load quickly under normal usage
- Comment retrieval should support pagination or efficient loading

## Security

- Passwords must be securely hashed
- QU emails must be validated (has to end with qu.edu.qa)
- Authorization checks required for edit/delete actions
- Duplicate upvotes must be prevented
- Duplicate reviews must be prevented

## Scalability

- Database design should support increasing review volume
- Comment and reply retrieval should remain performant at scale

## Reliability

- User-generated content must persist reliably
- Reported content state must remain consistent

# 8\. Constraints

- Instructors are not users
- Guests can browse without authentication
- Replies are limited to one nesting level
- No major filtering
- No level filtering
- Database column names must remain unchanged
- Database tables should be used the way they are and should not be ignored
- No added information that cant be accessed from the database

# 9\. Success Criteria

- Students can browse instructor/course reviews without login
- Authenticated users can successfully create reviews
- Duplicate reviews are prevented
- Upvotes are unique per user
- Reported comments are hidden immediately if the report is valid
- Replies function with one-level nesting
- Best instructors ranking reflects average ratings
