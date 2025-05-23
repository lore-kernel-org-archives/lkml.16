Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927EF236A8B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748001607; cv=none; b=YIyhRSooTJ2c+ME78C4F1RFjDUBOQtI5joO7cHfhG+MZmwL2a/Mo3vj6AVePt/wW4IQAWIxsnM/Y+dTtSOHRbLwgiTPAMnN1n9KLISHUQnhLzpspAkMEkjnFcac4Q0cIuAH2BgAMTv7lE/8b/WHM2dQQYjZYywwfLZqfmJhLfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748001607; c=relaxed/simple;
	bh=aymeMm2BS9qzx3TN2VHOY/E5n3piYZexiFUotJRzCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB9PTAkQZHHTGgbaByEsrW+b6rDydoLA8ihJ5FUGAU8SAJX/W690PWvR3VlQi9SNSo+iePOccXbjphLu2Hdw0r6RNwKkEYgGwenEps49ZQt6kQmWDjAfGf8EUr1gCMHz/iq0DM5aB2Un0FERlNmeuK6FZYw3w55SQPjbLWTisLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KGBkdjkj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KGBkdjkj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3108d54332eso2480184a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748001605; x=1748606405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUVubcJzMbqeouKm6ccxGY/SFLMW1BGFpS2MLs84zAo=;
        b=KGBkdjkjJYrw1rZKShZ4wSP1fFt8zgSQQhFTfj06EmnragGlP5UZ3pAkYwF+rD4ObG
         DflJPwE2YrCwWe3jM3LgnLDIH4BNHBeS0GVnQl+tLcu2u1RAsajppkx1uVTwqwm8GobO
         8paA2/nOYTkIXT9pZWn2ieZu+dUdYaocGLeg89gGT4z4i/5klyP/KGGrQ9byGg8H78kB
         HBtZHEdvSCP4qN8UMO5eCU2MI7QvtwxrPs4y6CBLrH2Xn2NBpvyDlGsBgYLlJ3BmBH2T
         frxf/0dXyYtdr81nN2OIML0/D6QGzToWC9wEYlxdqxdEgvTY09GtzsttdjcswnS+iVE0
         NtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748001605; x=1748606405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUVubcJzMbqeouKm6ccxGY/SFLMW1BGFpS2MLs84zAo=;
        b=FYcjFANXuMMDF6p5mRIiQ05WVWh+mPRwGUk6BD2AQ9MGJKg5r6V0uX5yxUpOY54hyk
         1J/jbJpyPjI8jZkSoY9ZOcpVTlG3TYTGRGrRfWTpUcnXbSOzZ3F4fMWGqFp163DFvoGk
         KO9k7Iq0qcVqRoNYTzK/CgvcjrqR8ioU3bXgOUr8M/xrDlA6noJU8LWKzPITj3Z16/1h
         cHsIugKwkmjL5VBc6hSD4/HBdBa0RSfno+kZOBlVI+3slcER1dI9V8m2beYlGY/fSjs8
         LK1s0iv3hz+MJG/rf5ahTDEJe2+D65mhd2Y8+biY1C9Z2IM28CoJMcmVMQer8Odx0r0o
         b0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKnHA6ipp6MauSlNH6rRoCMucGL/tO3bUNbpdMzYR9wyyYUwYQbOIGD8PPvWTcY8yu64aVmBnAEkpZ84U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFakPWMLxjJw0w4xkb2b5x+Y0SsTLvcKXPyW6L/1PrB4UzSLc
	4Ht9N+Uewfoaonru3XeAuCh1kF/8Isx7BGwIu7886ROWb+0h42fYwCVa1N2zegVXaw==
X-Gm-Gg: ASbGncuxCO0wBBFW7ZG1BkIw/4U8EQN8Nw/jRzhvrKMpvJv8SH+BGV+qAynKakwxhTY
	UzODwty0ClRLf6NK9UA+u0GgYTmBL0PtHMLNqlnzLAYhR1k3wp/mMIBHYRAqYiZjj1K8XTYfCuD
	1y02uhR9z9Pi/WBykcPhXa4/JkaJ3dihWMbMG0jMkvsIOE1QzSle5HU+vZwpeW+KCfwboJ072eH
	sTnGc1ExgePlEt/UW4qxB5rGXOZvCuggDPA5UuywAya5JcEK4V5mYSJUBCfCyTwkAQl2kCIfJXi
	mPWceIlgBJz47hCHICla/J9MEo6Ry6ZXyi/CqdhBl+id7KpfU1wbo7jSdIf1ug==
X-Google-Smtp-Source: AGHT+IF20DOj+2GA25WK52L1zrDSa01gprIXcL5UBzJFw+CZaXgsPNQorO7xE1b8BKXQoAGafMb18Q==
X-Received: by 2002:a17:90b:4a8f:b0:310:8db0:16d3 with SMTP id 98e67ed59e1d1-3108db016d8mr17368795a91.17.1748001604551;
        Fri, 23 May 2025 05:00:04 -0700 (PDT)
Received: from bytedance ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5dc6sm7172527a91.40.2025.05.23.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 05:00:04 -0700 (PDT)
Date: Fri, 23 May 2025 19:59:56 +0800
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
Message-ID: <20250523115921.GB1240558@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <63237b23-ae10-45f9-abdd-8ea4adb4d15e@linux.dev>
 <20250523075640.GA1168183@bytedance>
 <ad8197f1-548d-4fad-abd0-e8f6e9dbe12a@linux.dev>
 <20250523094106.GA1210419@bytedance>
 <a0d4f499-1222-45da-a3ea-e9d445b81c87@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0d4f499-1222-45da-a3ea-e9d445b81c87@linux.dev>

On Fri, May 23, 2025 at 05:53:55PM +0800, Chengming Zhou wrote:
> On 2025/5/23 17:42, Aaron Lu wrote:
> > On Fri, May 23, 2025 at 05:13:35PM +0800, Chengming Zhou wrote:
> > > On 2025/5/23 15:56, Aaron Lu wrote:
> > > > On Fri, May 23, 2025 at 10:43:53AM +0800, Chengming Zhou wrote:
> > > > > On 2025/5/20 18:41, Aaron Lu wrote:
> > > > > > On task group change, for tasks whose on_rq equals to TASK_ON_RQ_QUEUED,
> > > > > > core will dequeue it and then requeued it.
> > > > > > 
> > > > > > The throttled task is still considered as queued by core because p->on_rq
> > > > > > is still set so core will dequeue it, but since the task is already
> > > > > > dequeued on throttle in fair, handle this case properly.
> > > > > > 
> > > > > > Affinity and sched class change is similar.
> > > > > 
> > > > > How about setting p->on_rq to 0 when throttled? which is the fact that
> > > > > the task is not on cfs queue anymore, does this method cause any problem?
> > > > > 
> > > > 
> > > > On task group change/affinity change etc. if the throttled task is
> > > > regarded as !on_rq, then it will miss the chance to be enqueued to the
> > > > new(and correct) cfs_rqs, instead, it will be enqueued back to its
> > > > original cfs_rq on unthrottle which breaks affinity or task group
> > > 
> > > Yeah, this is indeed a problem, I was thinking to delete the throttled task
> > > from the cfs_rq limbo list, then add it to another cfs_rq limbo list or cfs_rq
> > > runnable tree based on the new cfs_rq's throttle status.
> > 
> > Only work when the task is still handled by fair :)
> > 
> > > 
> > > But it's much complex compared with your current method.
> > > 
> > > > settings. We may be able to do something in tg_unthrottle_up() to take
> > > > special care of these situations, but it seems a lot of headaches.
> > > > 
> > > > Also, for task group change, if the new task group does not have throttle
> > > > setting, that throttled task should be allowed to run immediately instead
> > > > of waiting for its old cfs_rq's unthrottle event. Similar is true when
> > > > this throttled task changed its sched class, like from fair to rt.
> > > > 
> > > > Makes sense?
> > > 
> > > Ok, the another problem of the current method I can think of is the PELT maintenance,
> > > we skip the actual dequeue_task_fair() process, which includes PELT detach, we just
> > > delete it from the cfs_rq limbo list, so it can result in PELT maintenance error.
> > > 
> > 
> > There are corresponding callbacks that handle this, e.g. for task group
> > change, there is task_change_group_fair() that handles PELT detach; for
> > affinity change, there is migrate_task_rq_fair() does that and for sched
> > class change, there is switched_from/to() does that.
> > 
> > Or do I miss anything?
> 
> migrate_task_rq_fair() only do it when !task_on_rq_migrating(p), which is wakeup migrate,
> because we already do detach in dequeue_task_fair() for on_rq task migration...
> You can see the DO_DETACH flag in update_load_avg() called from dequeue_entity().
>

Understood, thanks for catching this!

So the code was initially developed on top of v5.15 and there is a
detach in migrate_task_rq_fair():

	if (p->on_rq == TASK_ON_RQ_MIGRATING) {
		/*
		 * In case of TASK_ON_RQ_MIGRATING we in fact hold the 'old'
		 * rq->lock and can modify state directly.
		 */
		lockdep_assert_rq_held(task_rq(p));
		detach_entity_cfs_rq(&p->se);
	}

But looks like it's gone now by commit e1f078f50478("sched/fair: Combine
detach into dequeue when migrating task") and I failed to notice this
detail...

Anyway, the task is already dequeued without TASK_ON_RQ_MIGRATING being
set when throttled and it can't be dequeued again, so perhaps something
like below could cure this situation?(just to illustrate the idea, not
even compile tested)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 89afa472299b7..dc2e9a6bf3fd7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5868,6 +5868,9 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);

	list_del_init(&p->throttle_node);
+
+       if (task_on_rq_migrating(p))
+               detach_task_cfs_rq(p);
}


