Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9F13DDAE
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993341; cv=none; b=UFBSXf98uz+HJIb25EFG9BsZ/wNW3jP3irXZTFBuxrHmIw4RPm01IY0fsY2yB/mXGldAqzGwdkwM6x/XNQ7d1icF0ffQYvpGRPH7b91aWhqPxZdOrxkhmxArtKR8/fnqJOkwu+cwkyh8AXjE/Vi2SxUKdXUkS4fKlI63DNWYero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993341; c=relaxed/simple;
	bh=KDcGZ1N7qhbzQYUqBmyN5WABfL+Y5PKjWSekcghpCVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDwMVc+Rp1qbN3p7oscF1Zwt0G6ch75fEKgzLgqSscmTdjUbnO37Obx8Qunn6W/SWNAeuIFA8n1BAEFl0XtDCsWQu89w81g90tQIbcSIGR5xg9SdetsnyuDsNhMH/5GUXC2O1WB6r3O+/ROIzaFgeP+586IxnI/M33zUY613wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hszFl3RN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hszFl3RN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231e331baceso72480395ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747993338; x=1748598138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCZNeKJnql3RJIGTELNYAVHmwzNuroFYBBBIrRXO0W4=;
        b=hszFl3RN3JU25It6vY95voaoOyfimEtgy3zQbHJIJGB6Rc1pZqllFO0ALab1t6t7yn
         6PHG8OYf9v4myqRs/bzGVZiqPJPHEpDGEuYsD2dTat3ijiioJKeQwo9q5+ezBFxDyvAA
         bgBmkm+R9kJ15spgSKo9OIOrpWBuif8qmLrzTJb2lyU0k2dUCAKscNFamHFqku1tmWsk
         CmR2iZ7Ztv5qqyMSxOQWS+hA4ZIsYu0w83rl/nXrSKqDQKK5n3GMVMV4nOCLczVGsH5x
         ytOSRC0TtRze794QKiTYKAlfzkTd3L/t1PFt/yL9VZVv2ZpZIwjSOv/8GUd7ICfm4uX8
         juDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993338; x=1748598138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCZNeKJnql3RJIGTELNYAVHmwzNuroFYBBBIrRXO0W4=;
        b=Yc3B8R6oarOYahEa1xXWNTI72agXiIbqz/h4uMRQk5VRsEAxRXqGZz+/Fo4/3ykq13
         hklJQMnyQLYU6JJuF/dfDce4wABuHEehFSHSxPZPpsTY1GvAPs5my2doMCI2cCihZKPL
         sOnNM4tq7LQdVOQCSRKrpbYeWPlSjmQgyUhYyatOHyRno4M9l6FKX85Q/HrWXmHg+AXu
         tejT8QHV1ucoy38dyiu/of6Jrj+WPUwnu6gs1DbI7jzAc//3gdn+JMH4x7MYO3AtFhQg
         e7+urZlyp9mDMmXQQP6Clms7+3h/8j44smz8aKlrS1orp8mk5JKqoiKVm0ysLijFuy0q
         7HhA==
X-Forwarded-Encrypted: i=1; AJvYcCVdLP5CEKvOYfabJ6BvZthSGLCLss0v8fIuElymGVjFtUw+Gh53A4xi00Q3rWDY0mzbnYLliZzTC/wx6+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8ULUXk8hJadnwHSSZ8d3ME3QUHQza0Muzz/SHk8212YLuTla
	96EKrjBLEtAc7BboMfUNW+dpsb6XAA8m1laZ+EPtbHgOTUWf9mpwei0e4Wej7sAaDA==
X-Gm-Gg: ASbGncudMEwYGC2+2iN49tJdreFRtUii0u2bv2+v3LsT+Sa0xe+b+UlvMUexrWCyag2
	+J9T+baehM2na+Am/eFw2n3UZpeQWtSj4gDaTfVeV5pTb93cd+izYwV8NDz3UfBhvSAbR2lkJ5b
	L+L7Qb+QBtJmp+gFdiLkGDrik8RetMVhwxSiLaThUZaofrAfVG1u0HgsL5GQVAHk0Q9spJpThTe
	ovx1/0hDn35+kub/pqraeH/mIapaSjY/MAPw1fbI9QvSsiblxenCzyKrHI5p/ycM6S3f3R3FnV5
	r6NqXq5YPjVE3J46J7vDx+mm5+uXlsSor93FnWhb1ya5ZE5kYqk=
X-Google-Smtp-Source: AGHT+IHQ0yzz1vNC71f1Z1jLMK2CaKqXWlcCqeVLDndKwuCMWGP3UKbO3POMY5iyxCFpk0zcVXJdfA==
X-Received: by 2002:a17:902:ea0e:b0:22e:8183:1fae with SMTP id d9443c01a7336-233f25f4019mr38606855ad.41.1747993338277;
        Fri, 23 May 2025 02:42:18 -0700 (PDT)
Received: from bytedance ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb749sm120815585ad.55.2025.05.23.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:42:17 -0700 (PDT)
Date: Fri, 23 May 2025 17:42:05 +0800
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
Message-ID: <20250523094106.GA1210419@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>
 <20250523075640.GA1168183@bytedance>
 <ad8197f1-548d-4fad-abd0-e8f6e9dbe12a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad8197f1-548d-4fad-abd0-e8f6e9dbe12a@linux.dev>

On Fri, May 23, 2025 at 05:13:35PM +0800, Chengming Zhou wrote:
> On 2025/5/23 15:56, Aaron Lu wrote:
> > On Fri, May 23, 2025 at 10:43:53AM +0800, Chengming Zhou wrote:
> > > On 2025/5/20 18:41, Aaron Lu wrote:
> > > > On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> > > > core will dequeue it and then requeued it.
> > > > 
> > > > The throttled task is still considered as queued by core because p->on_rq
> > > > is still set so core will dequeue it, but since the task is already
> > > > dequeued on throttle in fair, handle this case properly.
> > > > 
> > > > Affinity and sched class change is similar.
> > > 
> > > How about setting p->on_rq to 0 when throttled? which is the fact that
> > > the task is not on cfs queue anymore, does this method cause any problem?
> > > 
> > 
> > On task group change/affinity change etc. if the throttled task is
> > regarded as !on_rq, then it will miss the chance to be enqueued to the
> > new(and correct) cfs_rqs, instead, it will be enqueued back to its
> > original cfs_rq on unthrottle which breaks affinity or task group
> 
> Yeah, this is indeed a problem, I was thinking to delete the throttled task
> from the cfs_rq limbo list, then add it to another cfs_rq limbo list or cfs_rq
> runnable tree based on the new cfs_rq's throttle status.

Only work when the task is still handled by fair :)

> 
> But it's much complex compared with your current method.
> 
> > settings. We may be able to do something in tg_unthrottle_up() to take
> > special care of these situations, but it seems a lot of headaches.
> > 
> > Also, for task group change, if the new task group does not have throttle
> > setting, that throttled task should be allowed to run immediately instead
> > of waiting for its old cfs_rq's unthrottle event. Similar is true when
> > this throttled task changed its sched class, like from fair to rt.
> > 
> > Makes sense?
> 
> Ok, the another problem of the current method I can think of is the PELT maintenance,
> we skip the actual dequeue_task_fair() process, which includes PELT detach, we just
> delete it from the cfs_rq limbo list, so it can result in PELT maintenance error.
>

There are corresponding callbacks that handle this, e.g. for task group
change, there is task_change_group_fair() that handles PELT detach; for
affinity change, there is migrate_task_rq_fair() does that and for sched
class change, there is switched_from/to() does that.

Or do I miss anything?

Thanks,
Aaron
 
> > > > 
> > > > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > > > ---
> > > >    kernel/sched/fair.c | 24 ++++++++++++++++++++++++
> > > >    1 file changed, 24 insertions(+)
> > > > 
> > > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > > index 74bc320cbc238..4c66fd8d24389 100644
> > > > --- a/kernel/sched/fair.c
> > > > +++ b/kernel/sched/fair.c
> > > > @@ -5866,6 +5866,10 @@ static void throttle_cfs_rq_work(struct callback_head *work)
> > > >    		update_rq_clock(rq);
> > > >    		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > >    		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > > +		/*
> > > > +		 * Must not add it to limbo list before dequeue or dequeue will
> > > > +		 * mistakenly regard this task as an already throttled one.
> > > > +		 */
> > > >    		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > >    		resched_curr(rq);
> > > >    	}
> > > > @@ -5881,6 +5885,20 @@ void init_cfs_throttle_work(struct task_struct *p)
> > > >    	INIT_LIST_HEAD(&p->throttle_node);
> > > >    }
> > > > +static void dequeue_throttled_task(struct task_struct *p, int flags)
> > > > +{
> > > > +	/*
> > > > +	 * Task is throttled and someone wants to dequeue it again:
> > > > +	 * it must be sched/core when core needs to do things like
> > > > +	 * task affinity change, task group change, task sched class
> > > > +	 * change etc.
> > > > +	 */
> > > > +	WARN_ON_ONCE(p->se.on_rq);
> > > > +	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> > > > +
> > > > +	list_del_init(&p->throttle_node);
> > > > +}
> > > > +
> > > >    static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> > > >    static int tg_unthrottle_up(struct task_group *tg, void *data)
> > > >    {
> > > > @@ -6834,6 +6852,7 @@ static inline void sync_throttle(struct task_group *tg, int cpu) {}
> > > >    static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> > > >    static void task_throttle_setup_work(struct task_struct *p) {}
> > > >    static bool task_is_throttled(struct task_struct *p) { return false; }
> > > > +static void dequeue_throttled_task(struct task_struct *p, int flags) {}
> > > >    static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> > > >    {
> > > > @@ -7281,6 +7300,11 @@ static int dequeue_entities(struct rq *rq, struct sched_entity *se, int flags)
> > > >     */
> > > >    static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
> > > >    {
> > > > +	if (unlikely(task_is_throttled(p))) {
> > > > +		dequeue_throttled_task(p, flags);
> > > > +		return true;
> > > > +	}
> > > > +
> > > >    	if (!(p->se.sched_delayed && (task_on_rq_migrating(p) || (flags & DEQUEUE_SAVE))))
> > > >    		util_est_dequeue(&rq->cfs, p);
