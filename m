Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5F21CC43
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987020; cv=none; b=p1q3CsRQdXV3kbE0yarG6YnpLe7iDVR6HucyVWxbegI4yFLgzcOIT0H15GiT/R6iGxuPuYBgHXnwrtb1sCtJBjmj5PfDwcDDqZBKqsa102qP/B0+rfenHMQ9v9tjwr0BNm7vQpRH+Kbdw0S11RcqBonltie4zheVDeDfFsNSnLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987020; c=relaxed/simple;
	bh=YrJC5J7681h5EtG4Fnl2lmSqfxbzPT9H+LTc93PKQcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jER1ENafOUySCbFZXJQz914ZIybf73E3oSiEk8Xwcrmcrxz7ihdI3B3lricgnonpwn0rWwllyt6u63Yr7aT5QPXU85qvamODHmlP0oW1vLgoRhgASA6acGHMkFcK4TQmR7Z7i8rbDd8EKQ4buG3yKcdN+pWXux4nCJh9qUpzoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=P4qqGEsO; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="P4qqGEsO"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so7494227a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747987018; x=1748591818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HIEfRb/xMDpChBp8rkfZX0YXQPLer1o8qoAk5nNMeJA=;
        b=P4qqGEsOC5EMm1L1ukYUBupi3i/isDRM4YRe3/w4eEAXjQZ9TVdMq6sEjWZ0tKElAh
         dTJh5gMaAol6wmAvYFtx+fRotqNr8z9SS93GNRdiXbGtbBKGW0Iq+U4QBhEaAJEdEp7N
         1nCgupx5abuAYDY8NM5TjN+VlhvF0jFpb+Nb+G4BhjEjeMetNHDq0j3CrHqcd3Y+0vXc
         yYxr69H4S5R1wA508wouAT/aTFar/r7c8AVnIK0HE8jnzZVqVsuFZzvYNU587JZZnXHS
         pOkccZQEqLxhSa/BbxQfjPJ64fBdYd75rFBgVOvpQE2iyMkyo86DiMk21jsS+4ftti/S
         9mXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987018; x=1748591818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIEfRb/xMDpChBp8rkfZX0YXQPLer1o8qoAk5nNMeJA=;
        b=iq7bWusAy1EU/w/zOX8t+eHi8z3rzeU/J0FEEtqPDFmONXNj3mBxc6EnwugPVFYbZp
         91atlnF09SgeBfyGmhZpi3L5Yy8uKzDXtTIN3NiVXFdbm+M5xiiFaptP8ku6pmccVqXZ
         +GQtPV9Lr3MYDltqEtd6tWaa2Ne+yv2qNBekDIOfUwUg17ybxThy6Of1RJnaDZx+PeXy
         Soa+M1mcB62/hPgtxtabtQbKx4DtduyBcygvQLQSgl9iggyDNjg3C9rpjigRx3P/LKPB
         ZASlHEkmfIkfGvJzd+c9rtGKRCU1PLmtpokSE2wdglELJXSlMOaLWY8nXVlkchalEcQF
         mS8w==
X-Forwarded-Encrypted: i=1; AJvYcCVt6TClCx+yAbINz+/W241jlrBQRHagNodokVri8F9/pfHIlQkOMKWH6eq1YVDyttMEbDAdJ+Z3vRlB/o4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/Tv+VqJt3oVSbT+DKny9rDlTE27nK7tN7yUPKErb9pwDoWiJ
	xZwZ6N4Wrg8WEtt5/wb5tjVANmO8wVblhobmR0WWgSdSmqJzFSCyeQyNyebTsG1WyA==
X-Gm-Gg: ASbGncvptZIkN7xz+OlAgfuGzBI5lyH74Tp3szDGHV5ITO7U9wL7wkN1+mDBVpVDBJW
	wa1cWJSK/XWWU7oo31o74CxBcC7CI8NQtrsFIo4Lz8quI66A15l2Kk0HQPkdvY9Urc3C1kScLxe
	UwEXOn585PV4dHES505O+5tPWK95iN7oVpD0r5QokdZdkF2gQ7RKXaDoBnEY7oA8VrQWsKiAnOp
	uWdrZ/Q4IapKQcm2i9UWDK9+SV+aidBi9zEwjCOlkRa3VYyR3w9NrLq1xYUP0fTA0fOsLGLfSho
	T234ZZQG9izsvXaAqsFcTDIMoyRXczvBDSeStY9TECkW1LvC2I0=
X-Google-Smtp-Source: AGHT+IF5rJfv09n+vtXh18+/DbnjUvHZGrhm0Fe2QZ/byJlVEOkumOoa6jjyGoqwfrLNUF+dhgIpQA==
X-Received: by 2002:a17:903:1c9:b0:22e:b215:1b6 with SMTP id d9443c01a7336-231d4548442mr444107445ad.28.1747987017855;
        Fri, 23 May 2025 00:56:57 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9249sm119902435ad.44.2025.05.23.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:56:57 -0700 (PDT)
Date: Fri, 23 May 2025 15:56:40 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
Message-ID: <20250523075640.GA1168183@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>

On Fri, May 23, 2025 at 10:43:53AM +0800, Chengming Zhou wrote:
> On 2025/5/20 18:41, Aaron Lu wrote:
> > On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> > core will dequeue it and then requeued it.
> > 
> > The throttled task is still considered as queued by core because p->on_rq
> > is still set so core will dequeue it, but since the task is already
> > dequeued on throttle in fair, handle this case properly.
> > 
> > Affinity and sched class change is similar.
> 
> How about setting p->on_rq to 0 when throttled? which is the fact that
> the task is not on cfs queue anymore, does this method cause any problem?
> 

On task group change/affinity change etc. if the throttled task is
regarded as !on_rq, then it will miss the chance to be enqueued to the
new(and correct) cfs_rqs, instead, it will be enqueued back to its
original cfs_rq on unthrottle which breaks affinity or task group
settings. We may be able to do something in tg_unthrottle_up() to take
special care of these situations, but it seems a lot of headaches.

Also, for task group change, if the new task group does not have throttle
setting, that throttled task should be allowed to run immediately instead
of waiting for its old cfs_rq's unthrottle event. Similar is true when
this throttled task changed its sched class, like from fair to rt.

Makes sense?

Thanks,
Aaron

> > 
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 74bc320cbc238..4c66fd8d24389 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
> >   		update_rq_clock(rq);
> >   		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> >   		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > +		/*
> > +		 * Must not add it to limbo list before dequeue or dequeue will
> > +		 * mistakenly regard this task as an already throttled one.
> > +		 */
> >   		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> >   		resched_curr(rq);
> >   	}
> > @@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
> >   	INIT_LIST_HEAD(&p->throttle_node);
> >   }
> > +static void dequeue_throttled_task(struct task_struct *p, int flags)
> > +{
> > +	/*
> > +	 * Task is throttled and someone wants to dequeue it again:
> > +	 * it must be sched/core when core needs to do things like
> > +	 * task affinity change, task group change, task sched class
> > +	 * change etc.
> > +	 */
> > +	WARN_ON_ONCE(p->se.on_rq);
> > +	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> > +
> > +	list_del_init(&p->throttle_node);
> > +}
> > +
> >   static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> >   static int tg_unthrottle_up(struct task_group *tg, void *data)
> >   {
> > @@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
> >   static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> >   static void task_throttle_setup_work(struct task_struct *p) {}
> >   static bool task_is_throttled(struct task_struct *p) { return false; }
> > +static void dequeue_throttled_task(struct task_struct *p, int flags) {}
> >   static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> >   {
> > @@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> >    */
> >   static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> >   {
> > +	if (unlikely(task_is_throttled(p))) {
> > +		dequeue_throttled_task(p, flags);
> > +		return true;
> > +	}
> > +
> >   	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> >   		util_est_dequeue(&rq->cfs, p);
