Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F338F80
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743402009; cv=none; b=jLqmSxqSx2LpiTg4UPlU1Q9hxL21M+R/3cxUmDTdShJCFR38D3b6dQeyRhlOznWaOk5mz33saxV7X7Js6SsaXhiFHMCxoCLFLQzDW3K9qXG8aH2B9jVIaaAraJek1QP2FIZyAqGxPzTHVqCUSfUIiZeL0h1Koj7g6bopw8ljUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743402009; c=relaxed/simple;
	bh=n31PvyKE2c2E9UCx6QaGxWJwp2Qf2fwvVdCCFwCIYCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5JsxgKBfC0RUadZMLsQtnVX2YCS7sGgR53FakuqY3zN2SIMjTE8iR+5i0Rq3AsUW8UgOcEufd9CMJpzq5ZoHXA1XcfT2YCkl57OtH9g9fS0OXPSMFHGriuGDDSqv+h/SEyTcizwaXCLhPWjRaEKvy0521+o3NgGe7rucGLTJF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SL6bdgH+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SL6bdgH+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso75407905ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743402004; x=1744006804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEvsty80mbK04aK+lBgb/uBAVExP73PslaIoVYZ1G7w=;
        b=SL6bdgH+VQf5rwVEGwAtRXCUBHHrZGNtzoG0L++1/PrnlQe5Bwrp4GhhmZeFz2Ia+1
         cNPHGhXRTNrHp1L0s1d1TMXD9RpMFsTKs+qyu8R7uYCcGMhb1H4/yLZDj312+fye2aJ8
         4T9UpVlIeGqXA/8xqiPfB88ihcrSUQQNlUcyb4BN+u9hESfBcTywQ1JYS8U4r32xPdfp
         Wn3RrTCeNzfOcIHhCbwOs/vhGH1Ll6gDt86dCdABAJ7qfuUtQFM81rMEiTxjirFQE7p5
         AGpid3e6IdebMz6kmQ7rq27uIleWt6YuCppiScdKt58EaDwMq1b1V/llBPtI5abS4m+u
         5nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743402004; x=1744006804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEvsty80mbK04aK+lBgb/uBAVExP73PslaIoVYZ1G7w=;
        b=ryjVf9+doUBxFQ4j/ncEdk13zxi8C4aL0M2lYEwI1T2i9JNa63+5BXWN3HZPqn6bo6
         dBYXeGkyx6J1lwKt2LpeRtgzvXXF6j2qPnEJ4/7diQRaRk6mRlPg+Ln4EnhKLnrfWpA/
         zUccbDXc5LQFlQ0mMjPRYcbUfM1gQ74UnPLntnRwAj3U0dHk3EhxHfz/Cty0X8MwiML+
         Aj2rREKvEkoDdBTwst5/SVHOuQ1ZqhJAqxoQWIntHva6jTcl8z0QU7E+fmSFnYys3aIG
         bdGGw82BLVA0XxeL9EXGPnGUQmdffVVkPt/N2GMHaETyMi7Lc5V/bFpt+AYF1FLzkgHs
         sUQw==
X-Forwarded-Encrypted: i=1; AJvYcCXmGgwlpwFnjkWGeb/Ti+8/bD0ONsKEQMQBUGE/LwA5VdOS6gRgB2FkX1m7cX5MPYZHC8BfjSfcuEdQzwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6Uinm/Yl/pfJ1ZkjlIZUl0XQiB4vofuCdl69fb6c8DFAdEKW
	gqxC0IcEOPz8ICAEdjCbCoHJAPVoMaLzNWZIVD7LMYwjEXmIJ1lDx/E5YTlcDA==
X-Gm-Gg: ASbGnct6KEdyeUXOH3YDhDNHTebIPF+pgCtCGmQGVyX1Z1wdVnCXrVdeQHvRDoN0wbf
	hprcepr7TbJE4vXQKhacMhDeCnwDYbfI7cYB/n/Jrr8EBDL1mQdFByomVr4lhyjQuvi0/rqSRuE
	Cd4jjwsAh8fz+xkiR4wgUFj+YsUzgkUWtI66yRLgvkRru/nhTFApYsRjGsHFgDMBMMn5exuBygK
	+OYvQ9QLo33QAQ7y0/KeNVAMmF7h6C/ujVfE+qLrxNkk4l+HMTIdQdVkA7oMkPgkY11zx3o+7ug
	fwyVbNx/cmXZ5TzWwyUWd3o0mUKmbs9uXVFV7o5E4dCs
X-Google-Smtp-Source: AGHT+IHHcYLApTKcebkcjtMNMs4nBzsPcFimB2tANwgyWhwDdetQFNFG8k37gsNRSylV1Dcx9EIdgw==
X-Received: by 2002:a17:902:cf10:b0:224:216e:3342 with SMTP id d9443c01a7336-2292f9f40bamr125114985ad.43.1743402004358;
        Sun, 30 Mar 2025 23:20:04 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ef62asm62376145ad.217.2025.03.30.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 23:20:03 -0700 (PDT)
Date: Mon, 31 Mar 2025 14:19:49 +0800
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
Message-ID: <20250331061949.GA1571554@bytedance>
References: <20250313072030.1032893-1-ziqianlu@bytedance.com>
 <CANCG0GehTMm3sbtXMy9MMFtG=kPYpHiFwy63OO4+dmXh68bWfA@mail.gmail.com>
 <28267ba4-94a2-4a77-9c34-7273a102c183@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28267ba4-94a2-4a77-9c34-7273a102c183@amd.com>

Hi Prateek,

On Fri, Mar 14, 2025 at 09:44:45AM +0530, K Prateek Nayak wrote:
> Hello Aaron,
> 
> On 3/13/2025 12:52 PM, Aaron Lu wrote:
> > Taskes throttled on exit to user path are scheduled by cond_resched() in
> > task_work_run() but that is a preempt schedule and doesn't mark a task
> > rcu quiescent state.
> > 
> > Fix this by directly calling schedule() in throttle_cfs_rq_work().
> 
> Perhaps that can be gotten around by just using set_ti_thread_flag()
> resched_curr() will also call set_preempt_need_resched() which allows
> cond_resched() to resched the task.
> 
> Since exit_to_user_mode_loop() will run once again seeing that
> TIF_NEED_RESCHED is set, schedule() should follow soon. Thoughts?
> 

I tried this and noticed an unexpected consequence: get_signal() will
also run task works and if the signal is kill, then it can happen:
exit_to_user_mode_loop() -> get_signal() -> throttle_task_work() -> 
do_exit() -> exit_signals() -> percpu_rwsem_wait() -> schedule() -> 
try_to_block_task() -> dequeue_task_fair().

I would like to avoid this path, at least for now. I want to make sure
for throttled tasks, only events like task group change, affinity change
etc. can cause it dequeue from core, that's why I added
SCHED_WARN_ON(flags & DEQUEUE_SLEEP) in dequeue_task_fair(). I think
this can help me capture any unexpected events like this.

Besides, I think explicitely calling schedule() has the advantage of not
relying on other code, i.e. it doesn't matter if someone removed
cond_resched() in task_work_run() some time later or someone changed the
logic in exit_to_user_mode_loop().

So I hope you don't mind I keep schedule() in throttle_cfs_rq_work(),
but if you see anything wrong of doing this, feel free to let me know,
thanks.

Best regards,
Aaron

> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >   kernel/sched/fair.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index f26d53ac143fe..be96f7d32998c 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5847,6 +5847,7 @@ static void throttle_cfs_rq_work(struct
> > callback_head *work)
> >   	struct cfs_rq *cfs_rq;
> >   	struct rq *rq;
> >   	struct rq_flags rf;
> > +	bool sched = false;
> > 
> >   	WARN_ON_ONCE(p != current);
> >   	p->sched_throttle_work.next = &p->sched_throttle_work;
> > @@ -5879,9 +5880,13 @@ static void throttle_cfs_rq_work(struct
> > callback_head *work)
> >   	dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> >   	list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> >   	resched_curr(rq);
> > +	sched = true;
> > 
> >   out_unlock:
> >   	task_rq_unlock(rq, p, &rf);
> > +
> > +	if (sched)
> > +		schedule();
> >   }
> > 
> >   void init_cfs_throttle_work(struct task_struct *p)
> 
> -- 
> Thanks and Regards,
> Prateek
> 
