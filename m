Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0C1D9A5F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354498; cv=none; b=cL1JFLLpi+filbFir3TbwJHKuzQY4tGkIasjl69Ep/mzTnHvm8Wezx+xRy7zcRNKKms6jfV8YgT8iV2TlSY7jubYHv8mupUhbxww3mAtKj1ArJnQhxpDEHk1AD7xnuPHoBgmVKpk+VFsCjIl49a59Qe1248e+KWzFRryYW4EFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354498; c=relaxed/simple;
	bh=Q5d5mjBTEHG1jQvQON1LOWbWVkNHO/OGcBzFcs4PcNo=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=SRU2RQ1PNr/c/tewkCW4C6gMyaDjwsNh9KERcgDXPoaF3OwPXpKTS1OsdYKz9PWawUFiNxjqrrZmtnxQKubkE5jvpWur7NVhI9ljVdb9+fiHMhkAzq+MGXTXPd5NvAxflFM9mLUQK0PeO+MGuXwzK5StjmQKSIhxgCdBPrqNY5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:58754)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uSJA0-005eki-J6; Thu, 19 Jun 2025 11:34:48 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:33430 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1uSJ9z-00Fsf7-EW; Thu, 19 Jun 2025 11:34:48 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Jiazi Li <jqqlijiazi@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  linux-kernel@vger.kernel.org,
  "mingzhu.wang" <mingzhu.wang@transsion.com>
References: <20250619120104.4622-1-jqqlijiazi@gmail.com>
Date: Thu, 19 Jun 2025 12:34:20 -0500
In-Reply-To: <20250619120104.4622-1-jqqlijiazi@gmail.com> (Jiazi Li's message
	of "Thu, 19 Jun 2025 20:00:58 +0800")
Message-ID: <877c17zlcz.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1uSJ9z-00Fsf7-EW;;;mid=<877c17zlcz.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+Mh6N0T36JlWRFahycjvLhbkSNK0aI7+s=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4963]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Jiazi Li <jqqlijiazi@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 588 ms - load_scoreonly_sql: 0.14 (0.0%),
	signal_user_changed: 12 (2.0%), b_tie_ro: 9 (1.6%), parse: 1.97 (0.3%),
	 extract_message_metadata: 27 (4.5%), get_uri_detail_list: 3.3 (0.6%),
	tests_pri_-2000: 25 (4.3%), tests_pri_-1000: 3.9 (0.7%),
	tests_pri_-950: 1.78 (0.3%), tests_pri_-900: 1.37 (0.2%),
	tests_pri_-90: 61 (10.4%), check_bayes: 59 (10.1%), b_tokenize: 9
	(1.5%), b_tok_get_all: 6 (1.1%), b_comp_prob: 2.7 (0.5%),
	b_tok_touch_all: 38 (6.5%), b_finish: 0.93 (0.2%), tests_pri_0: 420
	(71.4%), check_dkim_signature: 0.93 (0.2%), check_dkim_adsp: 3.9
	(0.7%), poll_dns_idle: 1.15 (0.2%), tests_pri_10: 4.6 (0.8%),
	tests_pri_500: 24 (4.0%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] kthread: update comment for __to_kthread
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: mingzhu.wang@transsion.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, peterz@infradead.org, jqqlijiazi@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Jiazi Li <jqqlijiazi@gmail.com> writes:

> With commit 343f4c49f243 ("kthread: Don't allocate kthread_struct
> for init and umh") and commit 753550eb0ce1 ("fork: Explicitly set
> PF_KTHREAD"), umh task no longer have struct kthread and PF_KTHREAD flag.
> Io_uring worker thread does not have PF_KTHREAD flag, but worker_private
> is not null, so update comment for __to_kthread.

I agree the comment is a bit dated and can use being updated.

Removing the portion describing the exceptions for init and umh is good
as they no longer apply.

However I don't think we want to go on about io_uring and whatever
else winds up using p->worker_private as exceptions.  That will just
mean the comment goes stale next time there is a change.

Can you update the comment to describe what the current rules
are to detect is something is a kthread?

Perhaps:
  *
  * When "(p->flags & PF_KTHREAD)" is set the task is a kthread and will
  * always remain a kthread.  For kthreads p->worker_private always
  * points to a struct kthread.  For tasks that are not kthreads
  * p->worker_private is used to point to other things.
  *
  * Return NULL for any task that is not a kthread.
  */

Eric


> Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
> Signed-off-by: mingzhu.wang <mingzhu.wang@transsion.com>
> ---
>  kernel/kthread.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 85fc068f0083..810cc244b81c 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -88,13 +88,9 @@ static inline struct kthread *to_kthread(struct task_struct *k)
>  /*
>   * Variant of to_kthread() that doesn't assume @p is a kthread.
>   *
> - * Per construction; when:
> - *
> - *   (p->flags & PF_KTHREAD) && p->worker_private
> - *
> - * the task is both a kthread and struct kthread is persistent. However
> - * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
> - * begin_new_exec()).
> + * For io_uring worker thread, p->worker_private point to io_worker
> + * struct, but they do not have PF_KTHREAD flag.
> + * Return NULL for such tasks.
>   */
>  static inline struct kthread *__to_kthread(struct task_struct *p)
>  {
