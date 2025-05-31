Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF421CA0F
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748691698; cv=none; b=Jm7Jm6X6rF7L7QaU5W5tluqiVzjCwBZNFpKeYY64tcysa/7albPZ3ge+bbgyedZb4PxAOJVm5r+aXexLck5IV2D70wAuJUrcGIcqHiellnjcJBFm7M//N4jC+p7byQrSA8igky3WAcZ7zXfUJerF3RcYFRyF7f9gP+dts29BQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748691698; c=relaxed/simple;
	bh=PJYUmQnYqamUhWh7o7uxI5LCMCjqaXJ/8M6Z+95fw5M=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=QVUWCHVOgdUFprQKnUhE8Uk/GBIn1+55qo+jYUwOUNEiRZLPsHpXAQwi6ZEDy2Gf1fjmnGctYbQv5VM3fYjuIGJqPOptJB6ZCEDWz+DIKtoyLB06EWLwtno9N8vsByNFyE/B5INTx0qcFte0AL/eyyx6mkkR/8GN9S9O7x02GY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:36380)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uLK3s-0072Zk-6z; Sat, 31 May 2025 05:07:36 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:36250 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uLK3r-002sts-8B; Sat, 31 May 2025 05:07:35 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>
In-Reply-To: <aDqq4rg9rTKRur8Y@gondor.apana.org.au> (Herbert Xu's message of
	"Sat, 31 May 2025 15:08:18 +0800")
References: <aDlty06JvlGwTfKk@gondor.apana.org.au>
	<87ldqegrf1.fsf@email.froward.int.ebiederm.org>
	<aDqq4rg9rTKRur8Y@gondor.apana.org.au>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Sat, 31 May 2025 06:07:20 -0500
Message-ID: <877c1xghsn.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1uLK3r-002sts-8B;;;mid=<877c1xghsn.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19vJFQhYd6rvInd2nAfpwQNCWGGf0wsLGw=
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Herbert Xu <herbert@gondor.apana.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 395 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 3.6 (0.9%), b_tie_ro: 2.4 (0.6%), parse: 0.95
	(0.2%), extract_message_metadata: 13 (3.2%), get_uri_detail_list: 1.09
	(0.3%), tests_pri_-2000: 14 (3.5%), tests_pri_-1000: 3.1 (0.8%),
	tests_pri_-950: 1.65 (0.4%), tests_pri_-900: 1.06 (0.3%),
	tests_pri_-90: 62 (15.7%), check_bayes: 61 (15.4%), b_tokenize: 4.2
	(1.1%), b_tok_get_all: 6 (1.4%), b_comp_prob: 1.30 (0.3%),
	b_tok_touch_all: 47 (11.9%), b_finish: 0.59 (0.2%), tests_pri_0: 285
	(72.1%), check_dkim_signature: 0.36 (0.1%), check_dkim_adsp: 3.2
	(0.8%), poll_dns_idle: 1.80 (0.5%), tests_pri_10: 1.70 (0.4%),
	tests_pri_500: 6 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] userns: Add forward declaration of struct seq_file in
 user_namespace.h
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Herbert Xu <herbert@gondor.apana.org.au> writes:

> On Fri, May 30, 2025 at 08:27:14AM -0500, Eric W. Biederman wrote:
>>
>> That description seems to be lacking something.  The code as has been
>> fine since 2014 and there is no conditional compilation involved.
>
> I'm happy to drop the fixes header.  There is no need to backport
> this.

The fixes tag isn't wrong.

>> Did some other change cause a declaration of seq_file not to be present?
>> Did user_namespace.h get included somewhere new and that new location
>> doesn't wind up declaring seq_file?
>
> The seq_file forward declaration is currently being provided by
> linux/sched.h.  I tried removing it and found this issue.

Thanks.

That is the interesting information that I would appreciate to see
in the change log.

If someone has to play code archaeologist and has to look at the
history, this is exactly the information that is needed to understand
why the change was made.

Eric

