Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079A226D00
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747999054; cv=none; b=IP9nZa/XpuhBl7cUSb7esut61I4bCp/mnu6dnf0PMkL3q5ceO9Eg2TQDFRKPws/Nb7+DbaRw5xTjI7BIiYq0ZHl1tu4aEywj1ssV1Rlo1H8CrRzrHChfk9HmZWfXqWCvp56ndB0jmB/rDafFM1AD/JEyRfsBFlAstigis1zK2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747999054; c=relaxed/simple;
	bh=aXwGmk38YT1RpR5waJssUQ3b8AE2B72B5OpXaIRMqzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1t0EXQZ7f5qWN/bRbCmk8nCRYn6UkYxHCwzkhJRmwAK9FGQ5t8gjvzUZumAciFXhpsAtlc1WSd1JxbuBzf/UtdYd9sJ3EgUxDPqKSRjqh+jAYXC43dyW9T8SHt57WpvW4R5juiHmE/xzWo0u7Twt+2SUpzjs6U1TeKqqaEDpvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e3kJ7hUe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e3kJ7hUe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2320e53167dso67081935ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747999051; x=1748603851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhnsyk5sIDtBnLVE6Pc/k3My+E7AwAB2wNZ/KRPC8oo=;
        b=e3kJ7hUeXKOg+H3mthGDSTm4BA54HX3xGEVpE9BcmHP6oTSOUdqiDUJHxa2vMBKNA8
         /+sEorZBidLrtNdlQbkKWG+qbWLK/fMZazI7GQMt9xbFVHMcvGXxMTV0P0DW7UDGKnly
         M1b7O2DIw+iZrvQc0uHE7r2ajAPb6CCUMOhOEbY4Tz5a+dkQvoWPaV8+AaDzro9BDs+7
         +mLBQLrNnH1eXHo0ya5/CV7+pysOHTjep2zPlZPHsExK4aXi5au0HHykHRtI+m+fJWKT
         /SqahzaCvVXGBlVbIKUCXFjlnnsqP2x231EtcDAUbjmJTBMAYel0UatV0lxLmHxHuZ3S
         LoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747999051; x=1748603851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dhnsyk5sIDtBnLVE6Pc/k3My+E7AwAB2wNZ/KRPC8oo=;
        b=kIDlN16GgdZ/gals7Y6BY92mFYQeIROuLduiNtEu6Xesd1gXSNvSfZ+WcVuAMaRkp7
         fhC7k2KToVG4iSpoEdwaNPEgU0ktHAxdLFc26o9lTn0rJw7Cr/ntQHsUw2onRtl/coHg
         DSpzlMsTMsefoEVYzPFoFs0seEdHSTJtqowv3+AQiRczQZcDS/pjVWqYN2hWUqZ7HJbZ
         t8wFB8rPL6yMWazy15J5JaLntuuk7bkX0rd88WYJfqaL0IZFN9D2lHZybdVvFI7Q1EP3
         b+pPkuadhIZimr71vmBdyQS9eutYeKogaNw5W4pG+wurf49NuRMlaa8884+eTgggQ7oJ
         aLnA==
X-Forwarded-Encrypted: i=1; AJvYcCUcbP8DtPBI+s5N3vPlRbN7S/WyjQY0ZhZCbX4YLvko2YAq694XrxDWiOcRCHO8muDUcwi2g8gavi9ju68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcxjhHZbbRZFvOeIPffPQhi3QRXUx6yFdn4krElcuPi2didc1
	a0YSPzPJ+a33YiSkr3nJJzKn4R+P6F3MtctrP6ZJ3e4n6ApFD45HOmNDu9/VfwGUhA==
X-Gm-Gg: ASbGncvMqEozvlafT/Z+TiIkOePdhyTTtAYa6NNp8eFXvt2fl2/TFhwhFeby8SL0fnW
	92CYl+n4BxtMmWr4/rYlmd0wguBY2ICmJ5K48tsF+bQiDVsrpT/394kyBJmQGgH132WbeQnEJ3v
	ovxkUk4+OJhUOHdy/ikJ2v8Q8TqOiJMsbaed2bz+Ccx/BYwnCfcNjqZzT6XGnRIk4dvvixV/98f
	ywC/A8n4PZU7si+UPt77W/Uzr4HjBFqm/3DSKESKXsbvSimp4M6euittG5T50drPFtuUdyHdHQ8
	cUflvk9z0oe+nnnoxpxakbw00Q29vu7ZGMICRBLRsKdSmuBg0Fk=
X-Google-Smtp-Source: AGHT+IH1t3OsNTQoN1A7HGAwLDzpcxmgCGhKMXDqWJbNOXg72fAbAeBduxXMSL4mFXtvYGPZzZy7pA==
X-Received: by 2002:a17:903:1314:b0:233:fc2f:d172 with SMTP id d9443c01a7336-233fc2fd1bdmr12820325ad.19.1747999051000;
        Fri, 23 May 2025 04:17:31 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f8b2dce4sm6913755ad.120.2025.05.23.04.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:17:30 -0700 (PDT)
Date: Fri, 23 May 2025 19:17:22 +0800
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
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Paul McKenney <paulmck@kernel.org>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250523111016.GA1240558@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
 <20250522114012.GA672414@bytedance>
 <20250522115418.GI24938@noisy.programming.kicks-ass.net>
 <20250522123750.GB672414@bytedance>
 <20250523095350.GA1215853@bytedance>
 <20250523105222.GJ24938@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523105222.GJ24938@noisy.programming.kicks-ass.net>

On Fri, May 23, 2025 at 12:52:22PM +0200, Peter Zijlstra wrote:
> On Fri, May 23, 2025 at 05:53:50PM +0800, Aaron Lu wrote:
> > On Thu, May 22, 2025 at 08:40:02PM +0800, Aaron Lu wrote:
> > > On Thu, May 22, 2025 at 01:54:18PM +0200, Peter Zijlstra wrote:
> > > > On Thu, May 22, 2025 at 07:44:55PM +0800, Aaron Lu wrote:
> > > > > On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> > > > > > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > > > > > 
> > > > > > >  static void throttle_cfs_rq_work(struct callback_head *work)
> > > > > > >  {
> > > > > > > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > > > > > > +	struct sched_entity *se;
> > > > > > > +	struct cfs_rq *cfs_rq;
> > > > > > > +	struct rq *rq;
> > > > > > > +
> > > > > > > +	WARN_ON_ONCE(p != current);
> > > > > > > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * If task is exiting, then there won't be a return to userspace, so we
> > > > > > > +	 * don't have to bother with any of this.
> > > > > > > +	 */
> > > > > > > +	if ((p->flags & PF_EXITING))
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	scoped_guard(task_rq_lock, p) {
> > > > > > > +		se = &p->se;
> > > > > > > +		cfs_rq = cfs_rq_of(se);
> > > > > > > +
> > > > > > > +		/* Raced, forget */
> > > > > > > +		if (p->sched_class != &fair_sched_class)
> > > > > > > +			return;
> > > > > > > +
> > > > > > > +		/*
> > > > > > > +		 * If not in limbo, then either replenish has happened or this
> > > > > > > +		 * task got migrated out of the throttled cfs_rq, move along.
> > > > > > > +		 */
> > > > > > > +		if (!cfs_rq->throttle_count)
> > > > > > > +			return;
> > > > > > > +		rq = scope.rq;
> > > > > > > +		update_rq_clock(rq);
> > > > > > > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > > > > > > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > > > > > > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > > > > > > +		resched_curr(rq);
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	cond_resched_tasks_rcu_qs();
> > > > > > >  }
> > > > > > 
> > > > > > What's that cond_resched thing about? The general plan is to make
> > > > > > cond_resched go away.
> > > > > 
> > > > > Got it.
> > > > > 
> > > > > The purpose is to let throttled task schedule and also mark a task rcu
> > > > > quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
> > > > > will be scheduled by cond_resched() in task_work_run() and since that is
> > > > > a preempt schedule, it didn't mark a task rcu quiescent state.
> > > > > 
> > > > > Any suggestion here? Perhaps a plain schedule()? Thanks.
> > > > 
> > > > I am confused, this is task_work_run(), that is ran from
> > > > exit_to_user_mode_loop(), which contains a schedule().
> > >
> > 
> > I should probably have added that the schedule() call contained in
> > exit_to_user_mode_loop() is early in that loop, where the to-be-throttled
> > task doesn't have need_resched bit set yet.
> 
> No, but if it does get set, it will get picked up at:
> 
> 	ti_work = read_thread_flags();
> 
> and since TIF_NEED_RESCHED is part of EXIT_TO_USER_MODE_WORK, we'll get
> another cycle, and do the schedule() thing.
> 
> > > There is a cond_resched() in task_work_run() loop:
> > > 
> > > 		do {
> > > 			next = work->next;
> > > 			work->func(work);
> > > 			work = next;
> > > 			cond_resched();
> > > 		} while (work);
> 
> That cond_resched() is equally going away.

Good to know this.

As long as this cond_resched() goes away, there is no need for an
explicite schedule() or any of its other forms in this throttle task
work.

> > > And when this throttle work returns with need_resched bit set,
> > > cond_resched() will cause a schedule but that didn't mark a task
> > > quiescent state...
> > 
> > Another approach I can think of is to add a test of task_is_throttled()
> > in rcu_tasks_is_holdout(). I remembered when I tried this before, I can
> > hit the following path:
> 
> So this really is about task_rcu needing something? Let me go look at
> task-rcu.

Yes. I found this problem when using bpftrace to profile something and
bpftrace couldn't start untill the test is finished :)

I'm assuming bpftrace need those throttled tasks properly mark a qs
state. With this change here, bpftrace can start normally when the test
is running.

> 
> So AFAICT, exit_to_user_mode_loop() will do schedule(), which will call
> __schedule(SM_NONE), which then will have preempt = false and call:
> rcu_note_context_switch(false) which in turn will do:
> rcu_task_rq(current, false).
> 
> This should be sufficient, no?

Yes, as long as that cond_resched() in task_work_run() loop is gone.

I'll also give it a test and will let you know if I find anything
unexpected.

Thanks,
Aaron
