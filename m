Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D107FD
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 04:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750481022; cv=none; b=ERb+LQtUOVFQK1x1lOlb/Z17m5IBAoHdplRKUToz5GVQY2OvNxJrjtQp863hEotCiKRDr7XVfg1USisfY4gOuPRqkBNCdfPxCZU5DEqgQJLssAK6klDAP2gf4Dbfy0+3pGCFNHOTc8yXIKaCFT6g6MQ3wqPaejUSwDHDV7Wztyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750481022; c=relaxed/simple;
	bh=ToVhZCsD2efbsBQyGR7Wvsk6qWFi78jX44J93aubQ3A=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=k9apF1rhs4bUx5hyG2sNGyzHI9Js8jzT8Fv8XtVi6S+tlGUJi+P0PuOR9xJo54b/2Mpsk26f+CbmcT3sMgASVbxkogLprALDWLjfchyudp6hCdyirJeQ4Rc8lwvHaRrstXreGPD6cMnvL+CMIG0drR7Z+RnVhgncOFuZuX8HlLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:46950)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uSpNk-00HFlA-Vs; Fri, 20 Jun 2025 21:59:09 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:56574 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uSpNj-000phB-4p; Fri, 20 Jun 2025 21:59:08 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Jiazi Li <jqqlijiazi@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org,
  "mingzhu.wang" <mingzhu.wang@transsion.com>
References: <20250620100801.23185-1-jqqlijiazi@gmail.com>
Date: Fri, 20 Jun 2025 22:54:35 -0500
In-Reply-To: <20250620100801.23185-1-jqqlijiazi@gmail.com> (Jiazi Li's message
	of "Fri, 20 Jun 2025 18:07:56 +0800")
Message-ID: <871prdzr44.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1uSpNj-000phB-4p;;;mid=<871prdzr44.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+GNAnAEZiXV7SS/Wf2fmsa0r5/4MYO4lU=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4960]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Jiazi Li <jqqlijiazi@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 872 ms - load_scoreonly_sql: 0.09 (0.0%),
	signal_user_changed: 12 (1.4%), b_tie_ro: 10 (1.2%), parse: 1.36
	(0.2%), extract_message_metadata: 21 (2.4%), get_uri_detail_list: 1.94
	(0.2%), tests_pri_-2000: 17 (2.0%), tests_pri_-1000: 2.6 (0.3%),
	tests_pri_-950: 1.32 (0.2%), tests_pri_-900: 1.05 (0.1%),
	tests_pri_-90: 406 (46.5%), check_bayes: 395 (45.3%), b_tokenize: 7
	(0.8%), b_tok_get_all: 6 (0.7%), b_comp_prob: 2.1 (0.2%),
	b_tok_touch_all: 377 (43.2%), b_finish: 1.00 (0.1%), tests_pri_0: 349
	(40.0%), check_dkim_signature: 0.67 (0.1%), check_dkim_adsp: 3.4
	(0.4%), poll_dns_idle: 0.19 (0.0%), tests_pri_10: 2.6 (0.3%),
	tests_pri_500: 54 (6.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] kthread: update comment for __to_kthread
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: mingzhu.wang@transsion.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, peterz@infradead.org, jqqlijiazi@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Jiazi Li <jqqlijiazi@gmail.com> writes:

> With commit 343f4c49f243 ("kthread: Don't allocate kthread_struct
> for init and umh") and commit 753550eb0ce1 ("fork: Explicitly set
> PF_KTHREAD"), umh task no longer have struct kthread and PF_KTHREAD flag.
>
> Update the comment to describe what the current rules are to detect
> is something is a kthread.

Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>
> Suggested-by Eric W . Biederman <ebiederm@xmission.com>
> Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
> Signed-off-by: mingzhu.wang <mingzhu.wang@transsion.com>
>
> ---
> Changes in v2:
> - describe current rules for detect
> ---
> ---
>  kernel/kthread.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 85fc068f0083..0e98b228a8ef 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -88,13 +88,12 @@ static inline struct kthread *to_kthread(struct task_struct *k)
>  /*
>   * Variant of to_kthread() that doesn't assume @p is a kthread.
>   *
> - * Per construction; when:
> + * When "(p->flags & PF_KTHREAD)" is set the task is a kthread and will
> + * always remain a kthread.  For kthreads p->worker_private always
> + * points to a struct kthread.  For tasks that are not kthreads
> + * p->worker_private is used to point to other things.
>   *
> - *   (p->flags & PF_KTHREAD) && p->worker_private
> - *
> - * the task is both a kthread and struct kthread is persistent. However
> - * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
> - * begin_new_exec()).
> + * Return NULL for any task that is not a kthread.
>   */
>  static inline struct kthread *__to_kthread(struct task_struct *p)
>  {
