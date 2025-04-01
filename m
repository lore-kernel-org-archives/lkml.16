Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0921EB5CA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497325; cv=none; b=VWGj3UvcJ2tm0b3kjAUOgXERoGmoydbcwfwyWyXbt9bWP14hb9aKBmCYP2YMl78Bxp7s8nkMspktlCcB8oAPcMSISNf465hm3nyS6W6LRe769nGAvpoQqcpKD3RQe5ZIDuMcNZJsSjzmnjq0p8m8VokdtOEsMpYWLnCEIs6K/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497325; c=relaxed/simple;
	bh=M/jKHdkoWQYqeJLKTS4FEumlRsvjGCl3sPnitnVIQSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8SzHPos0r4M+Vjl8CBbdZGGwe5tAjbOPCYeu3vLE8MZCaKbJiHoKpW+m5lzyXfmYxyWTp5EeSyWPl7C5w2GP+hVL9sHowBKQIvyLDTPT/EgRRVOx8xUX2sOG95o4BMgsq0wLYTMTH1pnc9wKJ3YbqOqCG21JRmADmHiTUSOx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XGu+h66I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XGu+h66I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224341bbc1dso89652075ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743497323; x=1744102123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQDvupq+B5zwNGV5/up4+rY43ZFKqh0iEnLVDF6R9EQ=;
        b=XGu+h66InipOD5Asx36qxPb5l4v349sDs6bwxzCoW11emM3M/0FFqyFqRyKbL8FdD4
         aPAPUh0AOufqnrojMPVas4qOW6dZIFsrj6Zvpamwr5egzTm91HzNaRRMRhdGrQbKtUEe
         xtXzpyeScLqNujcCv1LGInHcK0bV2xNoGzEy5qaKaWVtcVdhoR6Eq6WDmI0mml+NxI48
         WixYwqORVLtao+5+DzQQFcoPcDTqzKkANvus8UKN2DZWvOP7AYoqcKQvBii6n0by60V+
         66955901cqKiB/jaVT8898NP62SK3ZyZ/FGRzT8/fkzNavjYxzYIc8bSeP6XnQ25zWvj
         sqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497323; x=1744102123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQDvupq+B5zwNGV5/up4+rY43ZFKqh0iEnLVDF6R9EQ=;
        b=G5oyjX1QhYYJGIEc6oP17ESIFF4svta0HI5w3LCo9Kcg8EEDB0ebPXakl/uCYSgTsT
         HvPmqPAAsUEHWbU0v2YuFDNd5/w5hMaV6UEMw+FxxSUXxDN6GxsZCJBDi56br0gw5LwM
         pOuNFzizhYrjly17zhKAdZ5tLn4ZZ180RBq0o0FrYhqnHdg0uB6c8SjhH/dGcWORSTm5
         +KHsUVIe3wLqS/Q2kEQH5NqvN4LP+QzSaMCmaQkFuLAVCbpOfVWKz1lAhwgifFFbsxdC
         v1Tn3Bs3ST4sI+MsTrkyOqdlq1khPbx+4k+dMLDHmlqRutYCaEEg7cZsfaOxuRhrmW51
         0Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCUH2yPV36aH0VjBOEvkh9ooQFrC69guOIgYyYkj8StbeCJV0A/r1Gx4aNBab6d3KRNsECRz+yLWCTL3H7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQwSk5N1GApnw/SXgDnz1/Ul/3gMPm1gxgAo3iyVMkf5DFDHQ
	UACV3ELRm2765PUdBvdRuQ/DS0B/XUbyfwu8XWZdA1fZQ3fHA1GtNFAK+taYuA==
X-Gm-Gg: ASbGnct9/4JmeM27Rqefv2v4DS+cciLVraraQEQprDOeeXcNwFmQWojrj0KIvxxzYsZ
	WlLn5HmQFucM5ugSfkFj8GGTQcMhrIqrTitWQrCTnfLa1Q7N4UMuMfSXRTn7c1J5aRFPBAy5Nil
	y6pp7b1GFvgR87ADQqYgX0xr3YE5rzgHyLPu2oNpPRS/Cx7S/x9Cjh8lUZx8Jo+DnY3XGEk2ujn
	2TnO5j7WLz1B4Jt2FvsZVT9FhA8yZLQ1+pQCRPdTdG24YU+n1DpR6Udc7PjBkxVO5hhbS9DpWIs
	SxOmqslYp6UrSaIU/j5jgnfbDho17+wh8m2MT7h4xvD1
X-Google-Smtp-Source: AGHT+IFyradX1EAqshQKsI4osxO3uV2+QZtUYtggk/jwxD5jZgAAnwqveE2sX4p8Z3ad7jruBGK//g==
X-Received: by 2002:a05:6a21:6b0c:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-2009f78c6fbmr20399554637.35.1743497322577;
        Tue, 01 Apr 2025 01:48:42 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e273d2sm8659388b3a.55.2025.04.01.01.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:48:41 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:48:26 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>
Subject: Re: [RFC PATCH 6/7] sched/fair: fix tasks_rcu with task based
 throttle
Message-ID: <20250401084826.GA13530@bytedance>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GehTMm3sbtXMy9MMFtG=kPYpHiFwy63OO4+dmXh68bWfA@mail.gmail.com>
 <28267ba4-94a2-4a77-9c34-7273a102c183@amd.com>
 <20250331061949.GA1571554@bytedance>
 <e9aae247-5347-4748-ac5e-9f54f733e230@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9aae247-5347-4748-ac5e-9f54f733e230@amd.com>

On Tue, Apr 01, 2025 at 08:47:02AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 3/31/2025 11:49 AM, Aaron Lu wrote:
> > > > Taskes throttled on exit to user path are scheduled by cond_resched() in
> > > > task_work_run() but that is a preempt schedule and doesn't mark a task
> > > > rcu quiescent state.
> 
> So browsing through kernel/rcu/task.h, I found the
> cond_resched_tasks_rcu_qs() that basically clears task holdout before
> calling schedule(). The question is, is it safe to be used in the
> task_work_run() context? I have no idea but you can do a resched_curr()
> followed by a cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() and
> that should give you the same effect as doing a schedule().
> 
> Thoughts?
>

Looks good to me.

> > > > 
> > > > Fix this by directly calling schedule() in throttle_cfs_rq_work().
> > > Perhaps that can be gotten around by just using set_ti_thread_flag()
> > > resched_curr() will also call set_preempt_need_resched() which allows
> > > cond_resched() to resched the task.
> > > 
> > > Since exit_to_user_mode_loop() will run once again seeing that
> > > TIF_NEED_RESCHED is set, schedule() should follow soon. Thoughts?
> > > 
> > I tried this and noticed an unexpected consequence: get_signal() will
> > also run task works and if the signal is kill, then it can happen:
> > exit_to_user_mode_loop() -> get_signal() -> throttle_task_work() ->
> > do_exit() -> exit_signals() -> percpu_rwsem_wait() -> schedule() ->
> > try_to_block_task() -> dequeue_task_fair().
> > 
> > I would like to avoid this path, at least for now. I want to make sure
> > for throttled tasks, only events like task group change, affinity change
> > etc. can cause it dequeue from core, that's why I added
> > SCHED_WARN_ON(flags & DEQUEUE_SLEEP) in dequeue_task_fair(). I think
> > this can help me capture any unexpected events like this.
> > 
> > Besides, I think explicitely calling schedule() has the advantage of not
> > relying on other code, i.e. it doesn't matter if someone removed
> > cond_resched() in task_work_run() some time later or someone changed the
> > logic in exit_to_user_mode_loop().
> > 
> > So I hope you don't mind I keep schedule() in throttle_cfs_rq_work(),
> > but if you see anything wrong of doing this, feel free to let me know,
> > thanks.
> 
> I don't have any strong feelings. Just that the open-coded schedule()
> struck out like a sore thumb and since you mention future changes, the
> "local_irq_enable_exit_to_user(ti_work)" could perhaps one day be
> extended to not disable IRQs in exit_to_user_mode_loop() in which case
> a direct call to schedule() can cause scheduling while atomic warnings.
> 
> IMO using cond_resched_tasks_rcu_qs() is cleaner and it is obvious that
> the throttle work wants to call schedule() asap while also clearing the
> RCU holdout but I'll wait for others to comment if it is safe to do so
> or if we are missing something.

I'm running some tests and I'll follow your suggestion if no problem
found, thanks for the suggestion.
