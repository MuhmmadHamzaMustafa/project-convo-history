# Clarification Questions

1. **Authentication**  
   Q: Do users need to authenticate to perform actions?  
   A: Yes, only authenticated users can create projects/comments.

2. **Project Attributes**  
   Q: What fields should a project have?  
   A: Title (required), Description, Status (Not Started/In Progress/Completed), collaborators - contributors, teams - team members

3. **Status Tracking**  
   Q: How should status changes be recorded?  
   A: Track as activities with old/new values in the conversation history.

4. **UI Requirements**  
   Q: Should the conversation history have a specific order?  
   A: Show most recent first, with timestamps.

5. **Permissions**  
   Q: Who can change project status?  
   A: Project owners and admins.

6. **Pagination**  
   Q: Should we paginate long histories?  
   A: Yes, limit to 20 items per page.
7. **OPENSEARCH**
   Q: Should we implement elasticsearch index for better searching experience? 
   A: Yes its a great choice but we should consider ransack as well, as it consumes less storage.