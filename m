Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E828312D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245574; cv=none; b=qh113HyR3zBk+/Ge3UQ5DVdBKA1h2/pQOxyKqQ3JBNB4y4fa12Lz0n2fI2gQRrzoX6mseXHCGo7/y/+4I65CaCze2RMgwBTk4W5XhpvjTW2GShYYL+sf8o767mLyaTe75qlOuPwlB3ZAmTlq7MQIrvtnJ2sVsOyzgT0JloZcj7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245574; c=relaxed/simple;
	bh=6IFcJecWPDxzwpqbsp+nq1q0GXSZzkq028xZi1epNuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dz0FPEIb/wqcRb5nsEu2QOm/pkQGnoXvDkfu+EvzxHjwgGGLk49WucUAMfwpJh2LyfUU7y0oey/uUOhCBvr539dPmeTE9+JQxUIC6xdHRf3UPJXE6vic+LqdUXiV2YTTrmWU3Qq91OZr80nOmvjEtseKgropjBtInRooBmGuo2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CcP4WB3C; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CcP4WB3C"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso5211968a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750245572; x=1750850372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hMNUK2IravDH/g4o6YvfyEM4Lj/JnxKb4gaeFAPp8w=;
        b=CcP4WB3C2MCNSAnhQ6Shd2VDP6hsM2SbbbjHO56iOSt0yCfSdHNm2HvWjOoQ8vcZoL
         7h0jT2ChHxtPsQEm7AcLFE2EJiQTln3+518nR6P+GtcEAqtW+LGH9vc2NhzFi3Smbxgy
         fNY6Fp1dv+SWjs6KM3p4cruKz5P9egrBXxwCSWeUh/0fyqY98/k7qbEwb+tGoL2TAtqA
         iPo8lB9JclDerb1lc3D/mL+szFahH5EMFQB+ZsFVySpv8fo5snfBSah14iSOomC/eOQ8
         CpAZcoazn+AuqAJZ/tohEazb6FrhfwGmWm3RtGbcusBPRjqQMxpOwHGi5oT0PYX4zeG7
         RpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750245572; x=1750850372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hMNUK2IravDH/g4o6YvfyEM4Lj/JnxKb4gaeFAPp8w=;
        b=eY2kE1iedpC6XGrH62JzeDFCn//C0ZuLGI1peQEkdYRfgXVOyd+4JrsRJNt38Su2gk
         AjunRPtGPINyEo9+21Qm3axuFzY3EK5HCDQzgSNvbBpuAUS3c1Q5fgRgtzsYeQdLaurK
         PUWJHx3uJLb6Eni6lyotzaw/TgZAUTeYKTIb/dtaVdwpzQ+F/Ypy12GJbL8pOi/R9KA4
         RmSi+USHemdRC7Z5gT98sIvK7v5b6cz+TbYDw99Es2Z52cU+Mi3PGF8zhvxgT5azypjo
         /X274eeqsPdG62cfzgQQ9Cga1viWIl1XRTBx4aCF9IKs0/mKvpDimqtPJAhl/YWi+g32
         yuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh05Y/T7yJ/gMGu/roRac+J/Ek7Pb8w+2YQz8D8eUBOA1Y4Tw9gshQqCdJqKNAqFXqdDaycb0BrtDA90E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdDcfIkbrRqSP8mGI4AdatqTcM+ZD5sy6kQmz6tgFvfgQQ7RT
	rkUDToxhIA62FSs9vbKdPpICVf1lUytadmi7OJ9m4eq+HtUyYy1VuCwuFmrEif6/gA==
X-Gm-Gg: ASbGncsftvOnR+wfihtsHVgkSaAmdIyfnubvUVhrXPmJ/oBas+Htka+BgNOupiVVCgz
	kvOU+nwFWy+kP9PEIlCNweFcFwW/bQuw16FYfWlNhItikv1hP0pnXfsK2s4sgOFwC4bLVafEGet
	BtRDM2MUX/jxQEXVwyB5Lb2QAW3k+Xuha+hje3EEX4/LZi+pMqPdCO5y39aLFmGsx0IXCxMReVF
	49W6eY6Ni75Hfb3YtELbJQOwIV8vZPQ4By2V/gWLtsRQ37eE9Cqf5qwS0/yYIdN/P5UPF/O/Xu0
	EX0byfKzE9i8oVLD062qd2uAylWhDzKD+VXNbGqQ5Anzu/lYsdUylpyMF7pk4Tj5G8ZHV2XO9yc
	2+oZZaxM=
X-Google-Smtp-Source: AGHT+IFCEJnoApMHKSZQinvZ0JT9cxEOIqNL2O8ad+UmRU93rOEFMgXIJN4G15nmXk7zFuo2AQyx8A==
X-Received: by 2002:a17:90a:da86:b0:313:480f:ee72 with SMTP id 98e67ed59e1d1-313f1daf632mr21821640a91.23.1750245571610;
        Wed, 18 Jun 2025 04:19:31 -0700 (PDT)
Received: from bytedance ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3157a615170sm887358a91.0.2025.06.18.04.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:19:31 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:19:13 +0800
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
Subject: Re: [PATCH v2 3/5] sched/fair: Switch to task based throttle model
Message-ID: <20250618111913.GA646@bytedance>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <20250618081940.621-4-ziqianlu@bytedance.com>
 <ddca03a3-14d2-4d71-8070-8f9b8de9b7eb@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddca03a3-14d2-4d71-8070-8f9b8de9b7eb@linux.dev>

Hi Chengming,

Thanks for your review.

On Wed, Jun 18, 2025 at 05:55:08PM +0800, Chengming Zhou wrote:
> On 2025/6/18 16:19, Aaron Lu wrote:
> > From: Valentin Schneider <vschneid@redhat.com>
> > 
> > In current throttle model, when a cfs_rq is throttled, its entity will
> > be dequeued from cpu's rq, making tasks attached to it not able to run,
> > thus achiveing the throttle target.
> > 
> > This has a drawback though: assume a task is a reader of percpu_rwsem
> > and is waiting. When it gets woken, it can not run till its task group's
> > next period comes, which can be a relatively long time. Waiting writer
> > will have to wait longer due to this and it also makes further reader
> > build up and eventually trigger task hung.
> > 
> > To improve this situation, change the throttle model to task based, i.e.
> > when a cfs_rq is throttled, record its throttled status but do not remove
> > it from cpu's rq. Instead, for tasks that belong to this cfs_rq, when
> > they get picked, add a task work to them so that when they return
> > to user, they can be dequeued there. In this way, tasks throttled will
> > not hold any kernel resources. And on unthrottle, enqueue back those
> > tasks so they can continue to run.
> > 
> > Throttled cfs_rq's leaf_cfs_rq_list is handled differently now: since a
> > task can be enqueued to a throttled cfs_rq and gets to run, to not break
> > the assert_list_leaf_cfs_rq() in enqueue_task_fair(), always add it to
> > leaf cfs_rq list when it has its first entity enqueued and delete it
> > from leaf cfs_rq list when it has no tasks enqueued.
> > 
> > Suggested-by: Chengming Zhou <chengming.zhou@linux.dev> # tag on pick
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > Signed-off-by: Aaron Lu <ziqianlu@bytedance.com>
> > ---
> >   kernel/sched/fair.c | 325 +++++++++++++++++++++-----------------------
> >   1 file changed, 153 insertions(+), 172 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 8226120b8771a..59b372ffae18c 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -5291,18 +5291,17 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >   	if (cfs_rq->nr_queued == 1) {
> >   		check_enqueue_throttle(cfs_rq);
> > -		if (!throttled_hierarchy(cfs_rq)) {
> > -			list_add_leaf_cfs_rq(cfs_rq);
> > -		} else {
> > +		list_add_leaf_cfs_rq(cfs_rq);
> >   #ifdef CONFIG_CFS_BANDWIDTH
> > +		if (throttled_hierarchy(cfs_rq)) {
> >   			struct rq *rq = rq_of(cfs_rq);
> >   			if (cfs_rq_throttled(cfs_rq) && !cfs_rq->throttled_clock)
> >   				cfs_rq->throttled_clock = rq_clock(rq);
> >   			if (!cfs_rq->throttled_clock_self)
> >   				cfs_rq->throttled_clock_self = rq_clock(rq);
> > -#endif
> >   		}
> > +#endif
> >   	}
> >   }
> > @@ -5341,8 +5340,6 @@ static void set_delayed(struct sched_entity *se)
> >   		struct cfs_rq *cfs_rq = cfs_rq_of(se);
> >   		cfs_rq->h_nr_runnable--;
> > -		if (cfs_rq_throttled(cfs_rq))
> > -			break;
> >   	}
> >   }
> > @@ -5363,8 +5360,6 @@ static void clear_delayed(struct sched_entity *se)
> >   		struct cfs_rq *cfs_rq = cfs_rq_of(se);
> >   		cfs_rq->h_nr_runnable++;
> > -		if (cfs_rq_throttled(cfs_rq))
> > -			break;
> >   	}
> >   }
> > @@ -5450,8 +5445,11 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >   	if (flags & DEQUEUE_DELAYED)
> >   		finish_delayed_dequeue_entity(se);
> > -	if (cfs_rq->nr_queued == 0)
> > +	if (cfs_rq->nr_queued == 0) {
> >   		update_idle_cfs_rq_clock_pelt(cfs_rq);
> > +		if (throttled_hierarchy(cfs_rq))
> > +			list_del_leaf_cfs_rq(cfs_rq);
> 
> The cfs_rq should be removed from leaf list only after
> it has been fully decayed, not here.

For a throttled cfs_rq, the intent is to preserve its load while it's
throttled. Its pelt clock is stopped in tg_throttle_down(), there will
be no decay for it if left on leaf list.

I've also described why I chose this behaviour in cover letter:
"
For pelt clock, I chose to keep the current behavior to freeze it on
cfs_rq's throttle time. The assumption is that tasks running in kernel
mode should not last too long, freezing the cfs_rq's pelt clock can keep
its load and its corresponding sched_entity's weight. Hopefully, this can
result in a stable situation for the remaining running tasks to quickly
finish their jobs in kernel mode.
"

Thanks,
Aaron
