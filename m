Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16682135CB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917612; cv=none; b=R7bkVtLhHEBxK4dTmgm1jbbfolgy5Nt5MTx2E1ZCKEvWahvpervQSEkh/80HnXFLmteK7qMMupU5Xc3eA5JJYggyAetlQcsLtY21xgwWNTLI2gsGR2HCGc/lpcRtJpXtbH1TC2EJeXDNpiQV5cpGHcxeli7KjnrYBSCp9mcWoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917612; c=relaxed/simple;
	bh=xxeMNBKgdkvG1JJS5CMBf0LTtznMrRONcuoazgT63+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGLn9AsyUE4o+JOoZ9bea3uOQhfEP5vlyBUE7lJKn0i0mi2ETMS/rByMhRzsoBcWoBD70yVzoERJwC8y9tz36tR39ErTgoHJMnSWSc2JqkEnoh2vQ+bEBfxe7IM67/Ll77p3iXsiEZSvJV/R7VPiUG8pwxMuFP2h3QzDwJtJj/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ibEvbdoc; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ibEvbdoc"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4098024b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747917610; x=1748522410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdCqFR+56Tm/a3nq0h1iEa05d7szVIy1HdZA4sLbGm4=;
        b=ibEvbdocn4ty4/1W/XjN5MHOEc0WsUKzJOilN3a9Oqy+38D1QDyeYqW8CghnsA+LEO
         Dq73CBhgordT+V1ZSmmfoRvslexxd7PG32N9yE9CAnuUK5m5Lh0UW+5wE1BInpoiA7kA
         PstkJuU+XZFusDC+r2hyU4TTuXWzg3nnvYojTECGqhzKEyfdC2yCK1CUCguOj7LcsaTK
         v/WdCp+EmwR4NcMboz5zelddRdhQirrsPLp4zoNpGu981fwbC+mR18OpGpvwUaK7FNui
         TtpSvmnVQ9xjTQE2ssIzwFdIZ/kipc5V5dUjzzGNotM04w52bNtwOzHiR0cd2ltNGI73
         hVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917610; x=1748522410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdCqFR+56Tm/a3nq0h1iEa05d7szVIy1HdZA4sLbGm4=;
        b=Di30RX/Dh3sDB7upDOYZJ0uQJ+0DSpMa2ttmOeQK09aHtAlrABwaoL8yyhCnSBlYLo
         oUEQrj4XQv6cJiE3SMl/6gH94IwpvDtp5ywmKIXtJUKdQ6hpiepwExul/pVcitHSMO2q
         U31QsY21FYVivrY13vH9jqX775Dnxo9DvjRRul6hvNYc0QN6Ki9wW41bjAXM/QeV65CG
         7h8Iy11Wv21eeohdRmoNYB6fmpBCBmTk8oTZOneq6fKLsuzwXP1eKDNijeGfUEn0BVpq
         qiDGT1rF4vsZhX/LQckZhXrIdmS/MkriYPt4U+nZuHotOPNKGdDpxFZ/d7dynaWGAJ31
         A0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXJpGBm4cyPMrvKloy6rLsb9QDKaNil3pGEWzUxMPNYRNNwSVL5l3dLMsiTvUSJdHny/rarUuQvtERhenc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV7+9jd6e9PKHmwaxhSIN04Ed4y8DaUd+owvVjvQe6wf7R0iVW
	PsuAf+V0f7DQNwAoEdywLDNx96LlN5iWeBFGj1AY1px9uuatQNdK+16dyDAlLK9LKA==
X-Gm-Gg: ASbGncse+dmIuc/ZsfYXzMxgQgHNTSF8emhRlcWV5NMVE5SYhj5x9Br8l/FImnMVthN
	av2HXPH3ZqtXQvhh43Hl96duE7qNTsGW3SKHo+d1rD+QfRW8ihR6c13JgJUXTK+GByPS/1I1v3a
	QLlibwU4Ileq+Q5Mb0ffbp4uZt+K6J2HdkXHQz6VFJgpl3+rROVTGV+t2q947bpQYUkO2x/c6G1
	C671RQycjXk/V2G3zwLkM3n9e40EE8a84aklNIauRmm7yR9HaHE5w+sL7IMPDP9EzfNFts6Qej4
	lKSv0jp10ysRs7eizTTSLt5Z4fBhWBnZ2Dulen/sPHFnhiQIJYhJrUxLECWYLA==
X-Google-Smtp-Source: AGHT+IFvfNkLYHvdfOeMZtqhv+9UDSE7Df/03ZlRb7wnPgT/zwiZsJHssiyPtkwOhlkcmugZlgJLMg==
X-Received: by 2002:a05:6a20:d04e:b0:218:17c4:248c with SMTP id adf61e73a8af0-21817c4f2b6mr31809810637.22.1747917610145;
        Thu, 22 May 2025 05:40:10 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eadc0889sm11153588a12.0.2025.05.22.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:40:09 -0700 (PDT)
Date: Thu, 22 May 2025 20:40:02 +0800
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
Message-ID: <20250522123750.GB672414@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
 <20250522114012.GA672414@bytedance>
 <20250522115418.GI24938@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522115418.GI24938@noisy.programming.kicks-ass.net>

On Thu, May 22, 2025 at 01:54:18PM +0200, Peter Zijlstra wrote:
> On Thu, May 22, 2025 at 07:44:55PM +0800, Aaron Lu wrote:
> > On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> > > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > > 
> > > >  static void throttle_cfs_rq_work(struct callback_head *work)
> > > >  {
> > > > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > > > +	struct sched_entity *se;
> > > > +	struct cfs_rq *cfs_rq;
> > > > +	struct rq *rq;
> > > > +
> > > > +	WARN_ON_ONCE(p != current);
> > > > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > > > +
> > > > +	/*
> > > > +	 * If task is exiting, then there won't be a return to userspace, so we
> > > > +	 * don't have to bother with any of this.
> > > > +	 */
> > > > +	if ((p->flags & PF_EXITING))
> > > > +		return;
> > > > +
> > > > +	scoped_guard(task_rq_lock, p) {
> > > > +		se = &p->se;
> > > > +		cfs_rq = cfs_rq_of(se);
> > > > +
> > > > +		/* Raced, forget */
> > > > +		if (p->sched_class != &fair_sched_class)
> > > > +			return;
> > > > +
> > > > +		/*
> > > > +		 * If not in limbo, then either replenish has happened or this
> > > > +		 * task got migrated out of the throttled cfs_rq, move along.
> > > > +		 */
> > > > +		if (!cfs_rq->throttle_count)
> > > > +			return;
> > > > +		rq = scope.rq;
> > > > +		update_rq_clock(rq);
> > > > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > > +		resched_curr(rq);
> > > > +	}
> > > > +
> > > > +	cond_resched_tasks_rcu_qs();
> > > >  }
> > > 
> > > What's that cond_resched thing about? The general plan is to make
> > > cond_resched go away.
> > 
> > Got it.
> > 
> > The purpose is to let throttled task schedule and also mark a task rcu
> > quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
> > will be scheduled by cond_resched() in task_work_run() and since that is
> > a preempt schedule, it didn't mark a task rcu quiescent state.
> > 
> > Any suggestion here? Perhaps a plain schedule()? Thanks.
> 
> I am confused, this is task_work_run(), that is ran from
> exit_to_user_mode_loop(), which contains a schedule().

There is a cond_resched() in task_work_run() loop:

		do {
			next = work->next;
			work->func(work);
			work = next;
			cond_resched();
		} while (work);

And when this throttle work returns with need_resched bit set,
cond_resched() will cause a schedule but that didn't mark a task
quiescent state...
