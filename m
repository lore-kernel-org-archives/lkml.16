Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EBB24A061
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994045; cv=none; b=CdwwlOeBdmaWAzAD3zYkBuMCSvEgTiVmzZH2cr0COS4V2S02HCCG4EWlFNNeWAv99N1NhtuTxD15Y3A/H5OjDJvO+a+f2Y4u/mdeWh7z/REH4QqAyIuCnQUPTZdmtAUKYdUbfatmmhnOVLcstNWVHb8iorPtbrCGNsliICmrZNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994045; c=relaxed/simple;
	bh=zK6+ZTQnzaaWJ4qRUX1F9g2rew1Hsksjxjet94iLYj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSSb1YVoZP28XdTbJ6X3iV1QhluAAIiQAMAK/gTy3K49YIddpf4HSxKIroAP1RFinJY1dcn75MEc7vPH1F0SW/38kZ4gdmNHnIy2pZLZ2SumamR28Evq80JdPVS/2c5NWRvsC7rW8gdNwihheZaSPXISF4wyNsG51+AbkDhuJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=apH4C9pF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="apH4C9pF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376e311086so10375660b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747994043; x=1748598843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FXXvkKtq4CoNP4NWa3r13aRKj9W3C7sTWo4d8Ry/et0=;
        b=apH4C9pFNnaboHogAS4TE3iguMsLvyA8536mhFmZ2HvXoZ4+pupD8cEJqwagr+YaWE
         wSr7qBQVrBx1qpV257JP+g2dnhN4AfN7N/W+QhM9T1wZZ4tVuy8qt4xfxUQB3PjWkyvR
         vvuDLsIUg4fuRKvDWeeyjbPMMl7K8LajD1tuQMnes5fdE68uBlQOQBTTD61RW79rNQa8
         0mKex7ogNPBNMCKVqFNUdvIf97zmzzMwxJLDHa2PLIY0h5vQ1EgQgpQrWXX5tQfMZ3jv
         y6HoKVCjFfGbxSNygbjc1YGwQxZZyuTj7QZxJeYU8rYrBtoxfZuXZy287RGHwavqrqor
         uRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994043; x=1748598843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXXvkKtq4CoNP4NWa3r13aRKj9W3C7sTWo4d8Ry/et0=;
        b=CrmLZ2b4psafHTEskJsREPFeJycO1aRa8msuJPGQDtJq7Hncxvl6PR8xhO1rfCqzeI
         ZqLUmjrpGbg+FUIc1qhXh7MwbtfW6vT4lA8s408M4P6oYeZ0kaCIIr/gbBQRC+xYvNAM
         y8YAcIZSbA/4SciEAMq9hkEzPw/Z8+SWDlqV6WZNn3jTP0pgwahmnf9a2HRAisPwqbge
         lvYbjHz98x7hB8u+duSJUkYUO85IltMkkRwQnI6ecJ5T7bQI98YKZYqcKeNSse0/rryX
         SdRtegiSf4T4wWu6w4I3VNTOFJOHdTBxch7u1B5SrC5Kcagkvlf1IOTB2f2UVU9itFwv
         C3sg==
X-Forwarded-Encrypted: i=1; AJvYcCXkHm3Ac7gywJNpdmSJjY/lhvJpTZIF7+Qiui5cxioKt9QecL86Rx+8bS99Oef0IV18PvNbRYWW1gyTTbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQSnYr2zi9JNl9pehiV7wTtCM/xwRdH+qMzgnS0bIqFyRxx2o
	TnBMBNAy2kRAKz1APkkXHwo0OH0/ObmI3iaC4hCVCCh2JpVt0bEoBjSKFi5gTgVz7w==
X-Gm-Gg: ASbGncv6J39OjzghsYD1ZjFk9QUFbfxz4jG8yNig/MXwEziMfVfnArmiNgP2c3S/nOy
	xy3ihEz+AqgWehB64xHCN6ctRjoEebnNgAMyAT8bYTaaCgcH8sW8+Tpa6p5aG7ojMcDP/mdLpAL
	BBV9oxdRA3I7r1PPJr10abTLFykWeQfqrJYXrR4G77/RpxwAuTylcrXX1Ek4vibV2sotsE+wvDs
	3TsSFw6PUsvrgUYhdUEgG5BSvyrzt4nQ1FiFBR6MQJWw5AAESy0FAPnIpUVOdryKLbuoTNHfO11
	vW0C0x71D+c0DXOB6fDTBjMmUXTil2a5cCciegGOfq+Ibnv0Jk8=
X-Google-Smtp-Source: AGHT+IH00OofDg7l2hnAnCX4Bclt7TvCfcVPZYFW4nNycz9fudANPt8N+eNkMAgc31K/0sCw3nxMyQ==
X-Received: by 2002:a05:6a00:c82:b0:73e:970:731 with SMTP id d2e1a72fcca58-745ed8f76d1mr3478990b3a.16.1747994042836;
        Fri, 23 May 2025 02:54:02 -0700 (PDT)
Received: from bytedance ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-745f73f4b29sm311471b3a.21.2025.05.23.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:54:02 -0700 (PDT)
Date: Fri, 23 May 2025 17:53:50 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250523095350.GA1215853@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
 <20250522114012.GA672414@bytedance>
 <20250522115418.GI24938@noisy.programming.kicks-ass.net>
 <20250522123750.GB672414@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522123750.GB672414@bytedance>

On Thu, May 22, 2025 at 08:40:02PM +0800, Aaron Lu wrote:
> On Thu, May 22, 2025 at 01:54:18PM +0200, Peter Zijlstra wrote:
> > On Thu, May 22, 2025 at 07:44:55PM +0800, Aaron Lu wrote:
> > > On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> > > > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > > > 
> > > > >  static void throttle_cfs_rq_work(struct callback_head *work)
> > > > >  {
> > > > > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > > > > +	struct sched_entity *se;
> > > > > +	struct cfs_rq *cfs_rq;
> > > > > +	struct rq *rq;
> > > > > +
> > > > > +	WARN_ON_ONCE(p != current);
> > > > > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > > > > +
> > > > > +	/*
> > > > > +	 * If task is exiting, then there won't be a return to userspace, so we
> > > > > +	 * don't have to bother with any of this.
> > > > > +	 */
> > > > > +	if ((p->flags & PF_EXITING))
> > > > > +		return;
> > > > > +
> > > > > +	scoped_guard(task_rq_lock, p) {
> > > > > +		se = &p->se;
> > > > > +		cfs_rq = cfs_rq_of(se);
> > > > > +
> > > > > +		/* Raced, forget */
> > > > > +		if (p->sched_class != &fair_sched_class)
> > > > > +			return;
> > > > > +
> > > > > +		/*
> > > > > +		 * If not in limbo, then either replenish has happened or this
> > > > > +		 * task got migrated out of the throttled cfs_rq, move along.
> > > > > +		 */
> > > > > +		if (!cfs_rq->throttle_count)
> > > > > +			return;
> > > > > +		rq = scope.rq;
> > > > > +		update_rq_clock(rq);
> > > > > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > > > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > > > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > > > +		resched_curr(rq);
> > > > > +	}
> > > > > +
> > > > > +	cond_resched_tasks_rcu_qs();
> > > > >  }
> > > > 
> > > > What's that cond_resched thing about? The general plan is to make
> > > > cond_resched go away.
> > > 
> > > Got it.
> > > 
> > > The purpose is to let throttled task schedule and also mark a task rcu
> > > quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
> > > will be scheduled by cond_resched() in task_work_run() and since that is
> > > a preempt schedule, it didn't mark a task rcu quiescent state.
> > > 
> > > Any suggestion here? Perhaps a plain schedule()? Thanks.
> > 
> > I am confused, this is task_work_run(), that is ran from
> > exit_to_user_mode_loop(), which contains a schedule().
>

I should probably have added that the schedule() call contained in
exit_to_user_mode_loop() is early in that loop, where the to-be-throttled
task doesn't have need_resched bit set yet.

> There is a cond_resched() in task_work_run() loop:
> 
> 		do {
> 			next = work->next;
> 			work->func(work);
> 			work = next;
> 			cond_resched();
> 		} while (work);
> 
> And when this throttle work returns with need_resched bit set,
> cond_resched() will cause a schedule but that didn't mark a task
> quiescent state...

Another approach I can think of is to add a test of task_is_throttled()
in rcu_tasks_is_holdout(). I remembered when I tried this before, I can
hit the following path:

exit_to_user_mode_loop() -> get_signal() -> throttle_task_work() -> 
do_exit() -> exit_signals() -> percpu_rwsem_wait() -> schedule() -> 
try_to_block_task() -> dequeue_task_fair().

I would like to avoid this path, because it doesn't feel right for a
throttled task to go through another dequeue again(except for the cases
like task group change, affinity change etc. are special cases that have
to be dealed with though).

It looks to me, a schedule() call(or any other form) that makes sure
this throttled task gets scheduled in its task work is the safest thing
to do.

Thoughts?

Thanks,
Aaron
