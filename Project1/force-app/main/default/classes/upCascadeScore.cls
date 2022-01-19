global class upCascadeScore {

	//we take the scores for the comments, sum them up, add the post's score and save as an aggregate score on the post    
    Boolean moveCommentScoreToPost() {
        Boolean ret = false;

    	List<sObject> commentScoreSumByPost_l = [SELECT Post__r.ID, SUM(score__c)sum  FROM Comment__c GROUP BY Post__r.ID ];
        Map<Id, Integer> commentScoreSumByPost_m = new Map<Id, Integer>();
        for(sObject c : commentScoreSumByPost_l) { 
            commentScoreSumByPost_m.put(c.ID, Integer.valueOf(c.get('sum')) ); 
        }

        Set<ID> postIDs_s = commentScoreSumByPost_m.keySet();
        for(sObject c: commentScoreSumByPost_l) { 
            postIDs_s.add(c.ID); 
        }

        Map<Id, Post__c> posts_m = new Map<Id, Post__c>(
            [SELECT Id, Score__c, Aggregate_Score__c FROM Post__c WHERE Id IN :postIDs_s]
        );

        for(ID i : postIDs_s) {
            posts_m.get(i).Aggregate_Score__c += commentScoreSumByPost_m.get(i) + posts_m.get(i).Score__c;
        }

		List<Database.SaveResult> lsr = Database.update(posts_m.values());

        for(Database.SaveResult sr : lsr) { 
            ret &= sr.isSuccess(); 
        }
        return ret;
    }
}