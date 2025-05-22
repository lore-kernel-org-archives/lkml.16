Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D625823C8D5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914312; cv=none; b=iA7flJtuuaUnkM3X8fCCexAIFR5A86noRcDrjaJ+GQz0bhwMnkYgjwxR5uMg+2HiTnQlnlrxPYVNqA+gYy02pN8fZwSlTEy/6kTN1Af7kuCe5l/OWrkioG2ACbByLsWU048bWLE8bqXGd7aaVWLYWTB9JyW/CMbdYq9GQL2QmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914312; c=relaxed/simple;
	bh=0LE6IQ0VgZXsjN5TfMRDr3Q5i8Lt4jQi6U56rlZIan4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqYd0tCkS1IlSCRMADMWp10s5/iDUg+KlR/WxM0aV0k5iLjM5Hj0ClYEkXWzAJREUaEIpkjWOlUYC56wNoCXH/ILwOg21nW4gXQVAMaj9pSoEsUg9uENFsny5Q1Romb1KKkxhkKbMhHkGWtKIV+Y4ZjJLanfUh3UQsyWxetT2Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=knBbVcbw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="knBbVcbw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74019695377so5839559b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747914310; x=1748519110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDcvm/fLPibC2WRR28EYbmUafPkGyNzY62zNPky4cSc=;
        b=knBbVcbwk/zUxvHvNjcyL+gguo1a+2PEJ6siiRP/SxDOHaQ87CgH4UIMTO6ojgLIr5
         +WV2GGbGSxWtML8mwA96IaYO3cdPNUBDHOtijrc/aXN2gJxe8Wceq0DvEFLMMMlD62H1
         d7u3YbVcW1YplKO6krXOSAdwO/h8GLp7uFuXFChZZE+mVGFdYCDYt10C/EUcof7Sb4Bf
         poyCZDt4ph4pGVr+5jhzlwyv6gaYG6izK2Vr9d928uPSjDX/dNdZuIUcdtnhUMiWvKdc
         UcWXhZd7Cl8QIknJH16zLiVq3+Xf/iyHOlHG3iwwizlL/xILzhhhl6NBatFA89hkfFbY
         Reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914310; x=1748519110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDcvm/fLPibC2WRR28EYbmUafPkGyNzY62zNPky4cSc=;
        b=UaiTivj619ewEHK2ema1i0FxIkd9Irj2C2QtpHwjWn2gt3ndhnU7RjEjZFq8HjJMw1
         wTMetIlJREoJiHMdXitD2AfHFCNXwDWnCTwp/u00j+S75XIAqFsa9cgp1jW+DnBfYxDD
         T7RNFgejqcDnGAw2m0mP2rl1hy1Qcb2Ii/uUwFD76j7LQu7VRWM3h5GpHnpKw1DNIxq5
         AWC1lg9xlS8l/91QKid0hWZXZK67JB+EdIyqfLycVKsWW7CKvRfk2CHAZ+WuUIC64r0F
         eDhwKkdQ1PABGcy2vS+TS4Ok84PKiImiqB67ACKxfcvbqD2sXyKY9mJY2FdoVdz9nroC
         0Tsg==
X-Forwarded-Encrypted: i=1; AJvYcCVOYOgpdYqu6epUM3+WI0G6oDH0w/i0CnQkFEttCRp7RmTw5eAWplRHXPHezvBOcYJAEJ6POCFqB5r06EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNh47/Hi3hMo508tuLrKmse09KTk7E7es8cdtP9l4ShnS3H/Pg
	n1JyQ73bYwTCa9GkuyjeyPljyLUqaaj7GdqVgop3Q9trXaxvyMyqy96mpYX/7nqNSw==
X-Gm-Gg: ASbGnct7DxMkj8xxOV4nzsPellpu6R8c6CsgvIRjFtOfj0eTJF7jCxRBMKEcislJGkL
	VsmDErAt9Hs6A83fcDbxgR4lKXIQCBB79xqYfWpN757qxgZuKwKoa6fXKiwoa6rTjJEfPNqk55Q
	rmHhjFewDHFGhMTxcFcDvKoiY+2cWj8BbtG9dnf2R4LM8BRSo6NY3iBxWTq6Cko4OiKnpoHF2d0
	VbyXSqbfqu/djeCmffwk8/2rRm55Yuo1Ajx9D4eaibsh1KZCC+itDhJSxG87H6FVuJQOZC9tcBp
	Kr3WwKkHsNb9H4pmNN6hDtxQE3dPV53oRa5X4vVttI7aZ3JVxiQ=
X-Google-Smtp-Source: AGHT+IHQ62TScOl40n04GVpuc1dsSzsbaiqzTPoEbs4lkB/8y3wJEIJHcDxxVyugpzAeVqS8d7C3+g==
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr27419643b3a.18.1747914309893;
        Thu, 22 May 2025 04:45:09 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8ead7sm11196297a12.46.2025.05.22.04.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:45:09 -0700 (PDT)
Date: Thu, 22 May 2025 19:44:55 +0800
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
Message-ID: <20250522114012.GA672414@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522104843.GG39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522104843.GG39944@noisy.programming.kicks-ass.net>

On Thu, May 22, 2025 at 12:48:43PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> 
> >  static void throttle_cfs_rq_work(struct callback_head *work)
> >  {
> > +	struct task_struct *p = container_of(work, struct task_struct, sched_throttle_work);
> > +	struct sched_entity *se;
> > +	struct cfs_rq *cfs_rq;
> > +	struct rq *rq;
> > +
> > +	WARN_ON_ONCE(p != current);
> > +	p->sched_throttle_work.next = &p->sched_throttle_work;
> > +
> > +	/*
> > +	 * If task is exiting, then there won't be a return to userspace, so we
> > +	 * don't have to bother with any of this.
> > +	 */
> > +	if ((p->flags & PF_EXITING))
> > +		return;
> > +
> > +	scoped_guard(task_rq_lock, p) {
> > +		se = &p->se;
> > +		cfs_rq = cfs_rq_of(se);
> > +
> > +		/* Raced, forget */
> > +		if (p->sched_class != &fair_sched_class)
> > +			return;
> > +
> > +		/*
> > +		 * If not in limbo, then either replenish has happened or this
> > +		 * task got migrated out of the throttled cfs_rq, move along.
> > +		 */
> > +		if (!cfs_rq->throttle_count)
> > +			return;
> > +		rq = scope.rq;
> > +		update_rq_clock(rq);
> > +		WARN_ON_ONCE(!list_empty(&p->throttle_node));
> > +		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_SPECIAL);
> > +		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> > +		resched_curr(rq);
> > +	}
> > +
> > +	cond_resched_tasks_rcu_qs();
> >  }
> 
> What's that cond_resched thing about? The general plan is to make
> cond_resched go away.

Got it.

The purpose is to let throttled task schedule and also mark a task rcu
quiescent state. Without this cond_resched_tasks_rcu_qs(), this task
will be scheduled by cond_resched() in task_work_run() and since that is
a preempt schedule, it didn't mark a task rcu quiescent state.

Any suggestion here? Perhaps a plain schedule()? Thanks.
