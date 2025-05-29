Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7BF18DB03
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748519519; cv=none; b=fBTwXu1axMz1D36w4ZPT/te3KxevLV+kG9C5aMvrYdOL3uotrWCUTt/BgUafmG/sE0ZiVXLAu8bujaVbg/QtZv+aCHgW+5hZIxtMuV3Kk2qLjVRK1L5UT3BaEjZNsEPCXZlM7f7aUZb+c0VKdGGl7bGRxNA5+fJoePVoy3OVbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748519519; c=relaxed/simple;
	bh=uVPghPQtEjun+UGEQ9dJzi5vPmDEUQiyuo96UtuZk8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uchkJGFlDTGKr93/yyEwba1O7AnOfSYPeDPQ75Ur27R2A49+sdXHOA1tShHrG7r4sqU3Uqd8/oLPk8x8OMBV3LvHs9s0VwLz0qP3vd5Q1zm5q0TyFnivZncDWFr7eMpDMbtzUqTKiQf2Uz53F/Id9uOCwNZOMkpzxYy2769kq8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=J6uvj/BF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="J6uvj/BF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1fde81de05so462624a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748519517; x=1749124317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PFUOWQvwSV07FauuWIwthcsOaAJ6EoCqYPsKG+PzTBA=;
        b=J6uvj/BFCu1P2oVXeWjsFgX9yoM7JjmDPII6ACzyv+gEaylabqgkD7WubkeZI7HgDk
         3FEHhZTASSJ/s/EoR3h0i68sd8mCYOHilMFLEyIrW4Cc+zBdaaWJUoBhRAiSCRhVrA68
         liZ4H/dge4AjPq+OoaDo+aU5H/TvCGVpKzMH5S8G8UPJ7qpOgCg5sNFTqT9iGF8SCZyQ
         rjKJMlj2HGzPtQd+MWeQjLYxD1ze2o8psrIFu0Q7FJvesk15mn5B4cRqvqHxFP8Z20mg
         IHLzFlXVza85NiSRkkVsxFz9Pksc5cAR9l+3z9hvj3eyO4cHeTB/eUohLDvrdtIXPBAb
         UMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748519517; x=1749124317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFUOWQvwSV07FauuWIwthcsOaAJ6EoCqYPsKG+PzTBA=;
        b=kwGnr1OaJhmRZPGOMBO1S2R8E2WPCpZgdirbIXRm+XAC1SR1S0cjAXKxfc82JKAzYE
         9IDXxcwhgMWLN1ss6dJ3sznm8Uj2VMu4WLqPvEuWtjtNAZiC9Cogipn+wrdoatgeFSo0
         FEPwLZi75uuuRxXEaV5m4cP3oI7Obm00qyKIs9yQWXywxBhMbB0zWe2+2vszkQGYTySn
         eLYB11tKzceww+Hmjxgcga2te6T7JP/AjUTvbcEOM40ov5d9vTt6vG5AnYSH/2XL8I9T
         kXHiPsTpJLTwelr0c+ec7TNs6+OvvA+gC9UhJdFQmI5tyREVfDfmKY1eSrNPZmIRKS3Q
         0GPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKT01ZnV7ikCEYshKlbnI8Czccx8YH1e04s+qetpt+v8f1HW682MyKPzlu9tvhxEH5cne8Zh6eKpiI5Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwerTe7HW98tWei+CCr9RkNwgtq/PO7SAIovdQmiQCC7o7fX2t1
	EcQ66axnOO78De9/AW6sOTmvs0IjyjMJIqwPgHlwWj90eoaz1n9QoSX1ohVzm+kQdg==
X-Gm-Gg: ASbGncswwuLj5oNLVwEMy/c8YMllH5b5DWKpYs+bJiD4ksipK4qfi7c8TnoXTfWGu5q
	BbEX16/fVZ+8X0RpxkFotyWnTMWvcAFiD0mkEcOfrjc97DxJUDZT6Le7rs+Wn7TY4xWnD1rUp3j
	L6Vx+OYcpF/DhBss8zW0aNcJmbsJz5kh2h63szGi6cecTcp7cra/IHlAh3em91h2vyA9u/ZtsNO
	X6r1xc5IBMWJhcKrCOukwAcBdrTFXnf9mqazW+T+5OSJKP50PO6mMwitRvxWcT1RaKd9Slo4mt+
	V577qGMfIzEsnoWxenW1Z5vYfhPlBTlFnyZgamH90qB1gEgFh80=
X-Google-Smtp-Source: AGHT+IFQQu01ApDbgMeILy0YDF6/a8nvXdU6+tqD0EZcJD2OV7ZBXD1NaFKBNVl5Qo4hYe875/wnvg==
X-Received: by 2002:a05:6a20:734c:b0:1f5:7c6f:6c8a with SMTP id adf61e73a8af0-21aad9717d4mr9836482637.35.1748519516863;
        Thu, 29 May 2025 04:51:56 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe963cdsm1165009b3a.23.2025.05.29.04.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:51:56 -0700 (PDT)
Date: Thu, 29 May 2025 19:51:48 +0800
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
Message-ID: <20250529115129.GA541982@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522110728.GH39944@noisy.programming.kicks-ass.net>
 <20250523073939.GA1038318@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523073939.GA1038318@bytedance>

On Fri, May 23, 2025 at 03:40:14PM +0800, Aaron Lu wrote:
> On Thu, May 22, 2025 at 01:07:28PM +0200, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > > @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> > >  {
> > >  	struct sched_entity *se;
> > >  	struct cfs_rq *cfs_rq;
> > > +	struct task_struct *p;
> > >  
> > >  again:
> > >  	cfs_rq = &rq->cfs;
> > > @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> > >  		cfs_rq = group_cfs_rq(se);
> > >  	} while (cfs_rq);
> > >  
> > > -	return task_of(se);
> > > +	p = task_of(se);
> > > +	if (throttled_hierarchy(cfs_rq_of(se))) {
> > > +		/* Shuold not happen for now */
> > > +		WARN_ON_ONCE(1);
> > > +		task_throttle_setup_work(p);
> > > +	}
> > > +
> > > +	return p;
> > >  }
> > 
> > So the final code is a little different, because you're removing the
> > return value from check_cfs_rq_runtime().
> > 
> > But would not that exact return value be the thing you're now checking
> > for again?
> >
> 
> Ah yes.
> 
> > That is; at the end of the series, would not something like:
> > 
> > static struct task_struct *pick_task_fair(struct rq *rq)
> > {
> > 	struct sched_entity *se;
> > 	struct cfs_rq *cfs_rq;
> > 	struct task_struct *p;
> > 	bool throttled;
> > 
> > again:
> > 	cfs_rq = &rq->cfs;
> > 	if (!cfs_rq->nr_queued)
> > 		return NULL;
> > 
> > 	throttled = false;
> > 
> > 	do {
> > 		if (cfs_rq->curr && cfs_rq->curr->on_rq)
> > 			update_curr(cfs_rq);
> > 
> > 		throttled |= check_cfs_rq_runtime(cfs_rq);
> > 
> > 		se = pick_next_entity(rq, cfs_rq);
> > 		if (!se)
> > 			goto again;
> > 
> > 		cfs_rq = group_cfs_rq(se);
> > 	} while (cfs_rq);
> > 
> > 	p = task_of(se);
> > 	if (unlikely(throttled))
> > 		task_throttle_setup_work(p);
> > 	return p;
> > }
> > 
> > make it more obvious / be simpler?
> 
> Thanks for the suggestion, will follow it in next version.

Found a tiny difference while testing: check_cfs_rq_runtime() could
return false for a cfs_rq whose throttled_hierarchy() is true. The
reason is, that still throttled cfs_rq may be assigned runtime by
another cpu doing distribute_cfs_runtime() and has an async unthrottle
queued but didn't process it yet. The end result is, it has a positive
runtime_remaining but isn't unthrottled yet. I think this doesn't make
much difference but thought it might be worth mentioning.

A side note, now that check_cfs_rq_runtime() only marks cfs_rq's
throttle status and returns a signal, it no longer does dequeuing
stuffs, I suppose there is no need to call it in put_prev_entity()?
Because that signal is now only useful in pick time and we always run
check_cfs_rq_runtime() on every cfs_rq encountered during pick.

Also, check_enqueue_throttle() doesn't look useful either because
enqueued task will go through pick and we will add a throttle work to it
if needed. I removed these stuffs and run some tests, didn't notice
anything wrong yet but perhaps I missed something, comments?

Best regards,
Aaron
