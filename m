Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9125F78B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828285; cv=none; b=V4Nf8wi4ai0wdknbQMmCEOBoaj8IejWwEQpvx5SVbH/+6VFvZadn1m3JuVvd8O/pX5rCLOu3Xl+LZKpzMvd4nWZwVGz75TEj+4+eE15h29zdq6Z1w47D1Jfusf7IsafQR7eQchqpcB8nQlBA0gEcCxHD1LhxllWZ4pZYMaWsPM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828285; c=relaxed/simple;
	bh=NAlRy4TSlJqo6kSyb89gfLdIB+WD4NGJVv1bAbQh7i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eup7Xq8q97E83956bDHpnlO9pdFxErw9n6nboRvfQl49aYj/Jhv6GGat2jcFW+Vg4lVZK6Fv+k2T7v6BkXGSotBZUDUP8gBs4cJckLu63sPBK7IprxSqaz8hCxZs39dC8GSIWfPJacR9Rtt/R0e+pefzonPkmEUpPiANRWtv/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fWvihoI7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fWvihoI7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so6036475b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747828282; x=1748433082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai0cPCZapTgQ5fbJMTQDpYxKUoqy+ebH71JEB2yHnVk=;
        b=fWvihoI75VWFYl2czHpMcvQgLmcORB8jIJPqvDETbkwWLNhSq0L6eMcWgSmwKY0aOg
         9FOvyH3s+Kp1zWXxfCDIcw0iPUCFGlySI9kQRiA3Nm5NB8IOT/k+x5pxi4bCNDyCfKlN
         MlYBBZ3lmdLfdavdYVQ1HqT955V2jx+2flgXlymqxqST8SEOmBqwD6zsui3VQQMYWD87
         qkLZRu8IRnUVuI25PVmJ+TfleVJMH8/vdT4/XyhfRi4bfuZa8LMYQMDsv028dKFL8Pjw
         1MJCN8XKe+hCHw/7RGPeaIUgkE5oozAmMOlpj6zQAKY5pe6tARfim3XfDB61ELLycs5Z
         ikAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747828282; x=1748433082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai0cPCZapTgQ5fbJMTQDpYxKUoqy+ebH71JEB2yHnVk=;
        b=jvYxXR9OtvOiSjGBwzW1OAXh4PHQNKWxJx73s2Yjwd87FeCLiRcMsVxMAbAl8Bs9TA
         zdv/p2XuPdGGwzO8LP04KnX9l2FEBBRhJ9qg7+nXJ/t+X9RQxExNAvJoUzPLMFhtcAA8
         8guNoWdAXVyLgctNlSM5nqehYhRH3n4OjAtkSwHa/WawvLZzZqJ8asOCDIIlnaiz0TNI
         tIVTipu1oZaOPXPG6xLHMDXhTDccCXhEd+9n2w9ndZL9i/pl7S0pDOd5WYEyksw+PhSt
         jnl9nhIWKzl1I0Woyu8/i3t3Kpc0N3p1ereS5oEFqPUBd+Nx/h9UO6corH2g+h2+HQTI
         3dWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmZQY0OIwykGZ267If4ZHQXE1WLhvjLqk4Y1js+H8RE1dUCVQ/oG4k3smdpjxvory89VfWwFx9+4nqUsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmCcgodQPuKA93sQIUxbkxDmgwRnZMM7fGhq2+sFYiCWWTrweq
	B25knyZ75yHqiwX4y9tnmtGrywQdNFWgoAsorDprdIbYt/MNNYUbVIULiOyiOYCo/Q==
X-Gm-Gg: ASbGnctAv15AiFwBTTWNVDZn7riKcSmEVEVoJEZ+OqOlscZUgCGj/wA6TuwoZSh++8A
	Azk5pjKnMZ65LZqC0ZbRM3C8ywrv4YDkSU4nprx6MwWmN+vnE1QAaCwaloCE+F/8VjmnPGI/Qym
	qjB7KeFBMAxttlZ88hBPWvQCANAkS0WnkgU7iIV1ybws9evkv50EJEY9247hAfhT9zQRYbb2V7P
	EB4asP9G1kVJBlldIHTOHlKTlAAb+jEt7qz1vwSkcBM0JOVMQzSt57T0acw2ubB2tn77DXRGwly
	7GX9RmTYxPvpSXOn20WXS/y2uxvzzIJN168B21wlFXqSpg2CUOw=
X-Google-Smtp-Source: AGHT+IG+cSNjGTwODVc9zXd42NMu3P1O8b9naE/Akej/kRLqdhME25dYrZKxiEjb84BVQq0fPL3ZYg==
X-Received: by 2002:a05:6a20:d04e:b0:218:17c4:248c with SMTP id adf61e73a8af0-21817c4f2b6mr25641914637.22.1747828282264;
        Wed, 21 May 2025 04:51:22 -0700 (PDT)
Received: from bytedance ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829a4dsm9789994b3a.107.2025.05.21.04.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:51:21 -0700 (PDT)
Date: Wed, 21 May 2025 19:51:15 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
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
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
Message-ID: <20250521115115.GB24746@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <844ecab14632381bb5dd6a168a988dede64b459e.camel@siemens.com>
 <20250521063705.GA4059166@bytedance>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521063705.GA4059166@bytedance>

On Wed, May 21, 2025 at 02:37:05PM +0800, Aaron Lu wrote:
> On Tue, May 20, 2025 at 02:02:54PM +0200, Florian Bezdeka wrote:
> > On Tue, 2025-05-20 at 18:41 +0800, Aaron Lu wrote:
> > > @@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
> > >  static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
> > >  static inline void sync_throttle(struct task_group *tg, int cpu) {}
> > >  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> > > +static void task_throttle_setup_work(struct task_struct *p) {}
> > >  
> > >  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> > >  {
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
> > 
> > Typo: s/Shuold/Should
> >
> 
> Ah right, thanks.
> 
> > Btw: Is there a trace point in place when throttling/unthrottling
> > happens? Would be nice to see that in a trace, but might be that I
> > missed those events in my configuration up to now.
> 
> There is no trace point for throttle related events yet.
> 
> I tried to see if bpftrace can do the job but unfortunately, bpftrace
> does not allow variable as array indice so I failed to get cfs_rq when
> probing tg_throttle_down(tg, data)...
> 

@ajor from IRC helped me solve this problem so I think the following
bpftrace script can somehow serve the purpose before trace events for
throttle/unthrottle are supported:

kfunc:tg_throttle_down
{
	$rq = (struct rq *)args->data;
	$cpu = $rq->cpu;
	$cfs_rq = *(args->tg->cfs_rq + $cpu);

	if ($cfs_rq->throttle_count == 0) {
		printf("%llu cfs_rq %s/%d throttled\n", nsecs, str(args->tg->css.cgroup->kn->name), $cpu);
	}
}

kfunc:tg_unthrottle_up
{
	$rq = (struct rq *)args->data;
	$cpu = $rq->cpu;
	$cfs_rq = *(args->tg->cfs_rq + $cpu);

	if ($cfs_rq->throttle_count == 1) {
		printf("%llu cfs_rq %s/%d unthrottled\n", nsecs, str(args->tg->css.cgroup->kn->name), $cpu);
	}
}
