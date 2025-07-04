Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F22EACE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615690; cv=none; b=erH+2sx49voeOaEy0x8rX60Dk7zbdjcv8EcVGQfEWA9S3AeYOyIM6W21wCm/TagiYmlJaU0TnH32saFNSAzzgYBC3oskWvata72yf3GVqicu5ABfPdA4sShk6moz2FSRRQrwzBP/UTSP4d35FUUq+cpHr7nGMsTXp84XNhahfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615690; c=relaxed/simple;
	bh=4DfcdeKnwnpj1p8wwHo+u1D5WCM1Ch8/6gEH4p+ayJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGUocIuJMPqZYEcZld4tjnLgscTK2G2esdVAiVj71jr9+gAaOlDuCWZQKD9jGbD2yiQt14qYdRlTrdx+jEgMHQUFkDot23zCc2dvDeigaJX+UEINQGeNfAS/CfnghdMv9rF/MoFV/BYIMIdEu4haC7nP9mfzRYoqkKn2cFd1/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JAvzbjzp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JAvzbjzp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748e378ba4fso985060b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751615685; x=1752220485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zBg3P3l5iZj6jNarchJkWv/GwIRhcaNaBK6GFSgLOXk=;
        b=JAvzbjzpoui89qckm4Vu1cHeYtAGNJsuuDjuTDrkzcc19tOuKKZx0gRsUqzxYfDFmg
         BsHLNnJE7S7BRZu6iA35PtM9wvHuHRECrgpMAQzFl9n5DGrbfDKPA7qy9Z30RhV3GgJI
         rhImZF3Jmit5M15zV8NTtf6hJNnH3o9yjx03YJYbGWkJmRJGh3uCaXq2MJCYdBm6B45Q
         4QEUifYxCkicHSAts1hD9F6Mt7oZmk4ZpmjO5j6jfoxIKIhccOd1mw+uu8/yq6eCzCys
         imyBQmFP6K6AbGXlbloqcbvqM0U+TvFm15DDKMuHoegrqlFpnAmIVn9HVKtKV7NhM/EQ
         c7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615685; x=1752220485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBg3P3l5iZj6jNarchJkWv/GwIRhcaNaBK6GFSgLOXk=;
        b=B7JWsPnjRphxLbJM58t96xbv7GxoHyvBIyJvzIUatId2ZnbPNYLxlgLW09t0r9oxT9
         ZQOqjY6stiVqyv2uvynv9ZbYEDolFfjXgCUxYT6yYKUFUzih42HL/DmzSeJqb+b1kyLv
         A2Etk94yBYxOhvhh9FgOx+sIX31/1yOXsFbkFka52rBFznSLZLcivt3rO8sjJ4CJRj2R
         yUggRvUkD3Qwsdc6Vt31LNS06cCi7d5rBuKwCymN5eI8y+NfHaYxQm0iw55kvByxlJjK
         EssV3hILgNQ5LZciNWRldmeDd+ct6JRpJhExAgQLTHq5FoxFiranMZSjl+Wbn/r8V+nB
         dcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPOFVEIUAbLi9CccrSXxWsgtRH2ISQlak+IQqjBjnsIqV5WSbqMbmXr0YZEUfXXUKpAyF6MumX14PYSZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2LCtG8oCNWdL+AXEubaQ46qdjbWC2UaY6md5cOHV7AYDF4LK
	jqQp27d9fw+t1qb5gyw3Q8wws70DQP/5RF6wjtGRUAsSP4qXxbzemX+omS5BYALh7OOiNbE3tRd
	v+oJsbA==
X-Gm-Gg: ASbGnctQDtsIM9s1UoZg07qEOd8k8ySmBD919Q8klhs2qTtScBUdaLRTb+JHRJbWTXX
	1eIOLwytZ+4HvPEepqHj7/lz7z6TnyODQxY9DZSzMecMAwxs1nkmWvh4MBH1hYQBQP0wVlhFLFv
	PNdTrtFFYY7AuO8dOpIyr+1DVmM0DOqPIsjMWbKlKpFsJs8d0mCZe4S1MbKrjwI3I8e5muWnOot
	MOmsKPEZDJuz2TPCqxwkFYgea/JlbpIrktbcoTpK619pVqWPvbC4PiXw0CRNoYBAZwxMwuPujEb
	dxWgWvjLUBruEQ8LycJyyB23nUf7yBBOD0VWBEs/UPKrj3H7Tb+Kt7jFMpHOkLMIe3Q0oE7zr1n
	DtKthfww=
X-Google-Smtp-Source: AGHT+IG5iOI1OvqEOKkhtI8dyDfvCyrItCbs53iwd/pDwLaVq5b5xwBHpT9ViuvBLYkqxqu2G/Tq6w==
X-Received: by 2002:a05:6a00:22c7:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74ce68e4dbbmr2175139b3a.5.1751615684876;
        Fri, 04 Jul 2025 00:54:44 -0700 (PDT)
Received: from bytedance ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417dd7esm1583738b3a.97.2025.07.04.00.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:54:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 15:54:30 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>,
	Benjamin Segall <bsegall@google.com>,
	Chengming Zhou <chengming.zhou@linux.dev>
Cc: Valentin Schneider <vschneid@redhat.com>,
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
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
Message-ID: <20250704075430.GA1641@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <xm26qzyyb6cn.fsf@google.com>
 <dc54a6ab-2529-4def-ae7d-6a217e3bc1bc@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc54a6ab-2529-4def-ae7d-6a217e3bc1bc@amd.com>

On Fri, Jul 04, 2025 at 10:04:13AM +0530, K Prateek Nayak wrote:
> Hello Ben,
> 
> On 7/3/2025 3:30 AM, Benjamin Segall wrote:
> > Aaron Lu <ziqianlu@bytedance.com> writes:
> > 
> > > For pelt clock, I chose to keep the current behavior to freeze it on
> > > cfs_rq's throttle time. The assumption is that tasks running in kernel
> > > mode should not last too long, freezing the cfs_rq's pelt clock can keep
> > > its load and its corresponding sched_entity's weight. Hopefully, this can
> > > result in a stable situation for the remaining running tasks to quickly
> > > finish their jobs in kernel mode.
> > 
> > I suppose the way that this would go wrong would be CPU 1 using up all
> > of the quota, and then a task waking up on CPU 2 and trying to run in
> > the kernel for a while. I suspect pelt time needs to also keep running
> > until all the tasks are asleep (and that's what we have been running at
> > google with the version based on separate accounting, so we haven't
> > accidentally done a large scale test of letting it pause).
> 
> Thinking out loud ...
> 
> One thing this can possibly do is create a lot of:
> 
>   throttled -> partially unthrottled -> throttled
> 
> transitions when tasks wakeup on throttled hierarchy, run for a while,
> and then go back to sleep. If the PELT clocks aren't frozen, this
> either means:
> 
> 1. Do a full walk_tg_tree_from() placing all the leaf cfs_rq that have
>    any load associated back onto the list and allow PELT to progress only
>    to then remove them again once tasks go back to sleep. A great many of
>    these transitions are possible theoretically which is not ideal.
> 

I'm going this route, becasue it is kind of already the case now :)

I mean throttled cfs_rqs are already added back to the leaf cfs_rq
list during enqueue time, to make the assert_list_leaf_cfs_rq(rq); at
the bottom of enqueue_task_fair() happy when a task is enqueued to a
throttled cfs_rq.

I'm sorry if this is not obvious in this series, I guess I put too many
things in patch3.

Below is the diff I cooked on top of this series to keep pelt clock
running as long as there is task running in a throttled cfs_rq, does it
look sane?

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d869c8b51c5a6..410b850df2a12 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5290,8 +5290,15 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 	se->on_rq = 1;
 
 	if (cfs_rq->nr_queued == 1) {
+		struct rq *rq = rq_of(cfs_rq);
+
 		check_enqueue_throttle(cfs_rq);
 		list_add_leaf_cfs_rq(cfs_rq);
+		if (cfs_rq->pelt_clock_throttled) {
+			cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
+				cfs_rq->throttled_clock_pelt;
+			cfs_rq->pelt_clock_throttled = 0;
+		}
 	}
 }
 
@@ -5437,8 +5444,13 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
 
 	if (cfs_rq->nr_queued == 0) {
 		update_idle_cfs_rq_clock_pelt(cfs_rq);
-		if (throttled_hierarchy(cfs_rq))
+		if (throttled_hierarchy(cfs_rq)) {
+			struct rq *rq = rq_of(cfs_rq);
+
+			cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
+			cfs_rq->pelt_clock_throttled = 1;
 			list_del_leaf_cfs_rq(cfs_rq);
+		}
 	}
 
 	return true;
@@ -5873,8 +5885,11 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
 	if (--cfs_rq->throttle_count)
 		return 0;
 
-	cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
-		cfs_rq->throttled_clock_pelt;
+	if (cfs_rq->pelt_clock_throttled) {
+		cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
+			cfs_rq->throttled_clock_pelt;
+		cfs_rq->pelt_clock_throttled = 0;
+	}
 
 	if (cfs_rq->throttled_clock_self) {
 		u64 delta = rq_clock(rq) - cfs_rq->throttled_clock_self;
@@ -5939,11 +5954,13 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 	if (cfs_rq->throttle_count++)
 		return 0;
 
-	/* group is entering throttled state, stop time */
-	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
 
-	if (!cfs_rq->nr_queued)
+	if (!cfs_rq->nr_queued) {
+		/* group is entering throttled state, stop time */
+		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
+		cfs_rq->pelt_clock_throttled = 1;
 		list_del_leaf_cfs_rq(cfs_rq);
+	}
 
 	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
 	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index 62c3fa543c0f2..f921302dc40fb 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -162,7 +162,7 @@ static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
 {
 	u64 throttled;
 
-	if (unlikely(cfs_rq->throttle_count))
+	if (unlikely(cfs_rq->pelt_clock_throttled))
 		throttled = U64_MAX;
 	else
 		throttled = cfs_rq->throttled_clock_pelt_time;
@@ -173,7 +173,7 @@ static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
 /* rq->task_clock normalized against any time this cfs_rq has spent throttled */
 static inline u64 cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
 {
-	if (unlikely(cfs_rq->throttle_count))
+	if (unlikely(cfs_rq->pelt_clock_throttled))
 		return cfs_rq->throttled_clock_pelt - cfs_rq->throttled_clock_pelt_time;
 
 	return rq_clock_pelt(rq_of(cfs_rq)) - cfs_rq->throttled_clock_pelt_time;
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f2a07537d3c12..877e40ccd8cc1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -724,7 +724,8 @@ struct cfs_rq {
 	u64			throttled_clock_pelt_time;
 	u64			throttled_clock_self;
 	u64			throttled_clock_self_time;
-	int			throttled;
+	int			throttled:1;
+	int			pelt_clock_throttled:1;
 	int			throttle_count;
 	struct list_head	throttled_list;
 	struct list_head	throttled_csd_list;


Thanks,
Aaron

> 2. Propagate the delta time where PELT was not frozen during unthrottle
>    and if it isn't 0, do an update_load_avg() to sync PELT. This will
>    increase the overhead of the tg_tree callback which isn't ideal
>    either. It can also complicate the enqueue path since the PELT of
>    the the cfs_rq hierarchy being enqueued may need correction before
>    the task can be enqueued.
> 
> I know Josh hates both approaches since tg_tree_walks are already very
> expensive in your use cases and it has to be done in a non-preemptible
> context holding the rq_lock but which do you think is the lesser of two
> evils? Or is there a better solution that I have completely missed?
> 
> > 
> > Otherwise it does look ok, so long as we're ok with increasing distribute
> > time again.
> 
> -- 
> Thanks and Regards,
> Prateek
> 
