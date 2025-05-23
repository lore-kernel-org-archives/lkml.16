Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132B2DCBED
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986026; cv=none; b=ACMb28P/PRiCCMKw4rlCg7YJCLwxdc7KN78CHxhpSqm/Y2txCAd9WE1JB/QMzjn/zpZwc62J4vqiFuL/zL0wWY3+uPEE0fA4gpI3yTanPGhmocRMF/kyKqYQXIVyUoPTTPS4MbCSlVfJrFtYF+NYd/rInzFDGci9FxXzsci9HTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986026; c=relaxed/simple;
	bh=PGTw0LxUJsSyzQuJ5vPi+5gicKbecgnWnJoEPlcpXP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRoHrUuohGxM4ZgL5mGIQibFaVYrpdNx4nPJzDQM9YOXrXZM5Ab00pl3UcDa76AiNJe963mGQfAOQMY8l9+mS1iKC6yxYkuFEF3Z41VaqMAFnkalYfN3B1Jrmt+KG47QDOW0496ghloEMLw8IF45EaSgIpVB5q+vMYfyy7n+PmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aakIqsvg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aakIqsvg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2301ac32320so93025565ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747986024; x=1748590824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PaTgjZ8nTG5bdDj8zvqvQfi68C6gCVuXyW4zt/CTfRU=;
        b=aakIqsvgSCLedjqcVSvzLUjMxdUnK+0Qb510VX9O+c0EVRv2X3cVDMd1ADypy/l9+4
         LS+wgZHA/mssr9RNcqvUJ5T5ZfVxWIGIVsBN/y09o54JbkXx8fn67WOu9IUzUb2lCR4l
         63v09yCsGUFIn7cQcqtP9SLv4nhjgoBG2f/u/2kg4iT+t3JgxnN4dglLHbBQgeLxsqU7
         GwV5o8jUyWxV9UN9KioN3jHrHkpkZuwkmvB0WMtYuQZ6Vt5vo+jNy0b8UOwCGeAZppn+
         jAn2Cq9NMqTUH+kU7lGY0/QJXzJsvYij71uIDgegOZu3Tcx/UrYBsLPnB6oCaE6j97RL
         YLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986024; x=1748590824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaTgjZ8nTG5bdDj8zvqvQfi68C6gCVuXyW4zt/CTfRU=;
        b=uqhaP6vdjzltYBCPonHYwO0Ho+ofoeYwzRj+bSeqeiRqQdQsx89JEMxaRo7ykzahmn
         gquHjxoVwlbc+Y0qqm9D7XAI68TcvlTvCaJNlPF+5/ZPw4UAsCm0lv4HwphMsrgEZGbK
         +tVwYcYp8lDwz3XqPInWtvtw4y6oCunsqL57hkUO+3FOnD7QV94SyDo/DUEBvVDscKiM
         edCC5BE0U64hcof3ysc0/MnSm67xk3Fx58J7md99gRPSMkKm82X65Er7xUe0iPfecmFI
         PcgQTDQ+RfSno1SnfX+wjXYE40o6zbGBbI2eV84bMNy4TNJjOLcAffaxZibpz3uDa1G9
         75Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV5/6w/DxjJ7NlGIOwK6ZjLCfIfoo4OraTFXvF4HtSuPMTgE1VYD+mg2MwYZrhdba8k6Vc4ZS+QLW9RIHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhpwa+Mq9PsRIHEAlMHzswVF8IOok2PlJBJM+nM81sKiOxD7NY
	gCzXXG12cpQQ+r7PD/jrnfYXy3telyZ0jXFXFdPdaKxtEZuymjLbwS5x+eUFATsRrw==
X-Gm-Gg: ASbGncvIJGgUdX3OTIT4freuUmmwrPeMh5gkn1Bvm+eYE2zDvwkFnamEvsH8odVIeSn
	0xqwTjn7J9oqap3f4TXM+n/Zea5s86L28kgtCaP88hL4qC5VgRbaUCMnKP/y4e+tTyM3Ek2tR0U
	couFVL20pmE4FylfuGWdNYYRIamkpGAC6WM2XDIcqwbklDmd9NhsgKVUj9YUPnaDfo7LsRi+VI6
	fkY0lIsv563xun/RPoEydj9Io3Kjii+dwTsH8uZA2fMuQyd9WbwuvESV+4n2ak+4kAM6FgIc8kJ
	qw4XqDUDCR4rdq+uefriYDkRA+ANjP8RUvFQBe5ea5/7/Z+wPl8=
X-Google-Smtp-Source: AGHT+IF+7alzn8xrzTIyx10RH4kFQdAdOb9EwNh7eqaIwWtTxYvBrsdu+U9FaCzg7hnUg5gq+O/m5A==
X-Received: by 2002:a17:903:faf:b0:224:c46:d167 with SMTP id d9443c01a7336-231d44e7049mr358131955ad.16.1747986023645;
        Fri, 23 May 2025 00:40:23 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed1946sm119166615ad.217.2025.05.23.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:40:23 -0700 (PDT)
Date: Fri, 23 May 2025 15:40:14 +0800
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
Message-ID: <20250523073939.GA1038318@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522110728.GH39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522110728.GH39944@noisy.programming.kicks-ass.net>

On Thu, May 22, 2025 at 01:07:28PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 06:41:05PM +0800, Aaron Lu wrote:
> > @@ -8851,6 +8913,7 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> >  {
> >  	struct sched_entity *se;
> >  	struct cfs_rq *cfs_rq;
> > +	struct task_struct *p;
> >  
> >  again:
> >  	cfs_rq = &rq->cfs;
> > @@ -8871,7 +8934,14 @@ static struct task_struct *pick_task_fair(struct rq *rq)
> >  		cfs_rq = group_cfs_rq(se);
> >  	} while (cfs_rq);
> >  
> > -	return task_of(se);
> > +	p = task_of(se);
> > +	if (throttled_hierarchy(cfs_rq_of(se))) {
> > +		/* Shuold not happen for now */
> > +		WARN_ON_ONCE(1);
> > +		task_throttle_setup_work(p);
> > +	}
> > +
> > +	return p;
> >  }
> 
> So the final code is a little different, because you're removing the
> return value from check_cfs_rq_runtime().
> 
> But would not that exact return value be the thing you're now checking
> for again?
>

Ah yes.

> That is; at the end of the series, would not something like:
> 
> static struct task_struct *pick_task_fair(struct rq *rq)
> {
> 	struct sched_entity *se;
> 	struct cfs_rq *cfs_rq;
> 	struct task_struct *p;
> 	bool throttled;
> 
> again:
> 	cfs_rq = &rq->cfs;
> 	if (!cfs_rq->nr_queued)
> 		return NULL;
> 
> 	throttled = false;
> 
> 	do {
> 		if (cfs_rq->curr && cfs_rq->curr->on_rq)
> 			update_curr(cfs_rq);
> 
> 		throttled |= check_cfs_rq_runtime(cfs_rq);
> 
> 		se = pick_next_entity(rq, cfs_rq);
> 		if (!se)
> 			goto again;
> 
> 		cfs_rq = group_cfs_rq(se);
> 	} while (cfs_rq);
> 
> 	p = task_of(se);
> 	if (unlikely(throttled))
> 		task_throttle_setup_work(p);
> 	return p;
> }
> 
> make it more obvious / be simpler?

Thanks for the suggestion, will follow it in next version.
