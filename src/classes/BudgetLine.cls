/*
Copyright (c) 2011, salesforce.com, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, 
    this list of conditions and the following disclaimer in the documentation 
    and/or other materials provided with the distribution.
    * Neither the name of the salesforce.com, Inc. nor the names of its contributors 
    may be used to endorse or promote products derived from this software 
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
OF THE POSSIBILITY OF SUCH DAMAGE.

*/

public with sharing class BudgetLine extends BudgetNode{
	
	public Budget_Line__c obj{get;set;} 
	
	public BudgetLine(Integer id, Budget_Line__c bl){
		super(id);
		obj = bl;
		this.savedApproved = this.approved;	
	}
	
	public override String getNameO(){
		return obj.Name;
	}
	
	public override Integer getLevelO(){
		return 3;
	}
	
	public override Decimal getApprovedO(){
		return obj.Budget_Line_Amount__c;
	}	
	public override void setApprovedO(Decimal d){
		obj.Budget_Line_Amount__c = d;
	}
	
	public override Decimal getRequestedO(){
		return obj.Rollup_of_Purchase_Request_Amount__c == null ? 0 : obj.Rollup_of_Purchase_Request_Amount__c;
	}
	
	public override Decimal getBLApprovedUncommittedO(){
		return getApprovedO() - getRequestedO();
	}
	
	public override Id getObjIdO(){
		return obj.id;
	}
}