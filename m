Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2C79CF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612965; cv=none; b=dxS5BzyKEpqbKEg3cJz8ry3KSjZIUlhLvU0PLArvEtJz5Y/6CtMf7HqVanVQtSupN5f7Voi2xZ5UZPjtvz8LAYeMYDTzJvgiTvLMUG0xl99uZSoddZpgdsOe5AG3a14Xus+pVHWF8S4i1Jrv1j9pOBmiW2N2Tyj+/g3y6ziGlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612965; c=relaxed/simple;
	bh=1jTr1g5QOazu47tadj4JGVrJDAfLbg3ptCZUFAnGh6w=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=rIy6YOL7DKcFSMC4wWWNJdwkXJTQruCM1PCbA8NMDNcjzd9NNNZ0HG6liMcTrSeXCPaji6+10mKOftpLK4iTHJV5ymS9l0e6I8kMgGHoZEAAO16ePZIFsd6HTIz6YBiKVrXIaSorlIUU2WTJOgF7mSsZgkJPXfI9KSRlYgFzD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:55896)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uKzm5-005yU3-MH; Fri, 30 May 2025 07:27:53 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:47416 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uKzm4-000Vcx-Jk; Fri, 30 May 2025 07:27:53 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>
References: <aDlty06JvlGwTfKk@gondor.apana.org.au>
Date: Fri, 30 May 2025 08:27:14 -0500
In-Reply-To: <aDlty06JvlGwTfKk@gondor.apana.org.au> (Herbert Xu's message of
	"Fri, 30 May 2025 16:35:23 +0800")
Message-ID: <87ldqegrf1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1uKzm4-000Vcx-Jk;;;mid=<87ldqegrf1.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/1W1G+VTxfE0afk/cNZjBjXCe2jTfZW4E=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Herbert Xu <herbert@gondor.apana.org.au>
X-Spam-Relay-Country: 
X-Spam-Timing: total 496 ms - load_scoreonly_sql: 0.08 (0.0%),
	signal_user_changed: 13 (2.6%), b_tie_ro: 11 (2.2%), parse: 1.31
	(0.3%), extract_message_metadata: 18 (3.5%), get_uri_detail_list: 1.80
	(0.4%), tests_pri_-2000: 17 (3.5%), tests_pri_-1000: 3.2 (0.6%),
	tests_pri_-950: 1.65 (0.3%), tests_pri_-900: 1.29 (0.3%),
	tests_pri_-90: 109 (22.0%), check_bayes: 107 (21.5%), b_tokenize: 7
	(1.4%), b_tok_get_all: 7 (1.3%), b_comp_prob: 2.4 (0.5%),
	b_tok_touch_all: 88 (17.6%), b_finish: 1.12 (0.2%), tests_pri_0: 312
	(63.0%), check_dkim_signature: 0.68 (0.1%), check_dkim_adsp: 3.5
	(0.7%), poll_dns_idle: 0.92 (0.2%), tests_pri_10: 4.0 (0.8%),
	tests_pri_500: 11 (2.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] userns: Add forward declaration of struct seq_file in
 user_namespace.h
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Herbert Xu <herbert@gondor.apana.org.au> writes:

> Add forward declaration of struct seq_file before using it in
> function prototype.

I don't see anything wrong with doing that.

However:
> Fixes: 9cc46516ddf4 ("userns: Add a knob to disable setgroups on a per
> user namespace basis")

That description seems to be lacking something.  The code as has been
fine since 2014 and there is no conditional compilation involved.

Did some other change cause a declaration of seq_file not to be present?
Did user_namespace.h get included somewhere new and that new location
doesn't wind up declaring seq_file?

Especially since fixes tags tend to get code back ported I would
appreciate a bit more context on why this is a problem in 2025 when
it hasn't been a problem for the last decade.

Thank you,
Eric Biederman

> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
> index a0bb6d012137..5c7aa940b1aa 100644
> --- a/include/linux/user_namespace.h
> +++ b/include/linux/user_namespace.h
> @@ -16,6 +16,8 @@
>  #define UID_GID_MAP_MAX_BASE_EXTENTS 5
>  #define UID_GID_MAP_MAX_EXTENTS 340
>  
> +struct seq_file;
> +
>  struct uid_gid_extent {
>  	u32 first;
>  	u32 lower_first;
