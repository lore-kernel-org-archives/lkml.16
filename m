Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51435966
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940982; cv=none; b=FSQmO+C2ddNA/8ycMp2hlrJ+haG2U4t4hTBU5x/H2VjW5Bxt8jegiH0dFc7x6Q7D7DUBatodkdDTaLo49oFZUdhSmQ0Z5wBUZWvROXHhLEUA+oduxhBNgHVhAH7BkGokIUQCgM/x8aNS6BK7SVsHvpdPonztWfJDxVvxmF3Vj68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940982; c=relaxed/simple;
	bh=pdWzrS90iB4pAZ0q3eUgaMlr+v76bINSCDOe2VK5lYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYNF6CJ96bQiJRd+R0Xijx2PoBkuNwAKEn+zMXHGByIMXewtfVKFwKe9wuAzDqGB+5R2f7ZRxipm0CXk3uM0MUf6pTlvHJ/aslPhjaoCloIbgfpxScadbq+2A8juS6a4hWT5KwTnMmd06gaa4LK6+BOfRFuIt6AYE+giHh5mTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xb4W3JwI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xb4W3JwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745940977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8zG8xnU1Vh/id2TLgUuTUbnO4nrCXineYfDomYbQIKo=;
	b=Xb4W3JwIYuRO1b9KYwZe6zmbe/AYMUe53OYk5/tg3lCjpVNPMgdywbX4GMuT+MmL0wZ9RU
	CVp8Iyf4nY/ni/or+cnxoTiG+zw4SUNzvE1W3DoFTenxbPYK9NgPghhwpSQU+AFVQ9fcml
	fIHOBh7ZDP7NDhIKFgQU+QZFgSlaLGQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-BsjGHlEKNq23Yl9gLV6xrw-1; Tue,
 29 Apr 2025 11:36:14 -0400
X-MC-Unique: BsjGHlEKNq23Yl9gLV6xrw-1
X-Mimecast-MFC-AGG-ID: BsjGHlEKNq23Yl9gLV6xrw_1745940972
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84B611800368;
	Tue, 29 Apr 2025 15:36:11 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.81.190])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 739A619560AF;
	Tue, 29 Apr 2025 15:36:08 +0000 (UTC)
Date: Tue, 29 Apr 2025 11:36:05 -0400
From: Phil Auld <pauld@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>, kernel-team@android.com,
	peter-yc.chang@mediatek.com
Subject: Re: [PATCH v3] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
Message-ID: <20250429153605.GA69823@pauld.westford.csb>
References: <20250429150736.3778580-1-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429150736.3778580-1-jstultz@google.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi John,

On Tue, Apr 29, 2025 at 08:07:26AM -0700 John Stultz wrote:
> It was reported that in 6.12, smpboot_create_threads() was
> taking much longer then in 6.6.
> 
> I narrowed down the call path to:
>  smpboot_create_threads()
>  -> kthread_create_on_cpu()
>     -> kthread_bind()
>        -> __kthread_bind_mask()
>           ->wait_task_inactive()
> 
> Where in wait_task_inactive() we were regularly hitting the
> queued case, which sets a 1 tick timeout, which when called
> multiple times in a row, accumulates quickly into a long
> delay.
> 
> I noticed disabling the DELAY_DEQUEUE sched feature recovered
> the performance, and it seems the newly create tasks are usually
> sched_delayed and left on the runqueue.

This seems odd to me. Maybe I'm just misunderstanding something but
I don't see how newly created tasks should have accumulated enough
runtime to have negative lag that needs to be decayed. 

That said, I think it does make sense to dequeue in this case. 

Cheers,
Phil

> 
> So in wait_task_inactive() when we see the task
> p->se.sched_delayed, manually dequeue the sched_delayed task
> with DEQUEUE_DELAYED, so we don't have to constantly wait a
> tick.
> 
> This seems to work, but I've only lightly tested it, so I'd love
> close review and feedback in case I've missed something in
> wait_task_inactive(), or if there is a simpler alternative
> approach.
> 
> NOTE: Peter did highlight[1] his general distaste for the
> kthread_bind() through wait_task_inactive() functions, which
> suggests a deeper rework might be better, but I'm not familiar
> enough with all its users to have a sense of how that might be
> done, and this fix seems to address the problem and be more
> easily backported to 6.12-stable, so I wanted to submit it
> again, as a potentially more short-term solution.
> 
> [1]: https://lore.kernel.org/lkml/20250422085628.GA14170@noisy.programming.kicks-ass.net/
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: kernel-team@android.com
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Reported-by: peter-yc.chang@mediatek.com
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
> v2:
> * Rework & simplify the check as suggested by K Prateek Nayak
> * Added Reported-by tag for proper attribution
> v3:
> * Add Fixed-by: and Tested-by tag suggested by Prateek
> ---
>  kernel/sched/core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba05..b986cd2fb19b7 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2283,6 +2283,12 @@ unsigned long wait_task_inactive(struct task_struct *p, unsigned int match_state
>  		 * just go back and repeat.
>  		 */
>  		rq = task_rq_lock(p, &rf);
> +		/*
> +		 * If task is sched_delayed, force dequeue it, to avoid always
> +		 * hitting the tick timeout in the queued case
> +		 */
> +		if (p->se.sched_delayed)
> +			dequeue_task(rq, p, DEQUEUE_SLEEP | DEQUEUE_DELAYED);
>  		trace_sched_wait_task(p);
>  		running = task_on_cpu(rq, p);
>  		queued = task_on_rq_queued(p);
> -- 
> 2.49.0.901.g37484f566f-goog
> 
> 

-- 

