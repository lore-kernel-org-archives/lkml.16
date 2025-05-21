Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C9219EB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809446; cv=none; b=D8BRdBlCqqRw6XTEcoGgN92DN0D/LLi+ETrqlY0GAYJTBUPoWbgVfmrjDKEKZlGbL3oP4hhBm4hyjDqsB9p5CXTrJr7EI34WVWS2iJs9kRKCkCa20sS4Q6z1UbvRGQ24iOmgZeMla2eM9Fm5t6V9dBT0gOGgIJanl6kmug/rSdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809446; c=relaxed/simple;
	bh=VhuoHg3jQGfRZHvIXt/xWCqRtiaBwPsPV6EGEAMa9rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD4iPGONVWFp4vebKJGRlF3gn0xFyJ/ItrDXN0okWVKL49nypx4fCeSOomAqM9z5BoMXDQBF1VYVIay9TOjXvzGH2MAV5VF1ZDZ81Mv2vFz+Tss4eVBd2ByGmjJ7o5QVqF8sWLBiL+zGzgC1hfNKDOYqMKwsLnSUcBbEWUEL7sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dfcnj2eS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dfcnj2eS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8069857b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747809444; x=1748414244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w3mJUSzRUuycSX2Q6iIlOiZHH9hgJ0lk+kEJmIsy7hA=;
        b=dfcnj2eSum88Piz8OQaZqOvtA5oSfB6Y0LOmHOdE+33j7vAUM7DMR/zlcbMeIgcwfz
         2stJ7hfYzLeCbN/zqWceqaJ4MKE74/hPfGyL5BGa+CGZmvS6fmpLA4inPy/jIx8S69rG
         YlmUZkizrswKug0Z0Uqar4wv3xfLvqo2DlJY6dIvDdKI+drFtXY1vXkgEiATluyLt7gM
         7EB8YiRnULMUUu1MQdaFFtouxPEJ2uug6Nbb4yf/md6qZxBLLbqT6Vu6RYNqgIju4yuM
         V72hQ06TQ1/73jZGPmQme+eAX11MRW8V+LREEVOKwCJmc/17CaVeEABf2H2vWd8USzqP
         zpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809444; x=1748414244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3mJUSzRUuycSX2Q6iIlOiZHH9hgJ0lk+kEJmIsy7hA=;
        b=UMX1msPT2Nyeeii3OyO+9G5pxGwH1Ae8QBlqXuqFLvrZR51E/JVsNzpcFUuB3WRCSz
         Tiip2HoBuVh2F1pdcijcuX+QsthFyQsIdNk1ig/Qy/q2rAgy45U9kGcDMmJYOKazfz4t
         5lDXYNZDgOMjw4lj81P8QEiQhfHiwKB+XHi0qbcik7QdeBtHoBYzueaQkg2kOksgH/ZJ
         RwLfxRV2eQYY4rhQSggyiVkqMgQlonnGIZKLYj947AivmQ+BnK65jbO2N4oCY5tXyChp
         4oOHD7bCoEo7N0j1mW7XtDfI3EcorhUlXXS5jWXSzv+8PLd+WuUHYbR1svS0k+Hbu2cM
         30GQ==
X-Forwarded-Encrypted: i=1; AJvYcCULkpTQh4i8l/2AU6Jjt5E/q+s2UCUgslubXkQp/VllW8YswjgCEz5GlPZ1fHgPUAdeqjNxPPFiTTGhTy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjq5G6SwKD5S0vax5YpkFEzqjP9Ha+zi4L7lpCmvkx+OThSPgu
	b5tdYuNzaNak+F3Mjen6sTFxTpvEXZfMxflFbBtpmJlpajdSsjH0JKowaTmiwYfq6A==
X-Gm-Gg: ASbGncsum0RrTFa6QViUPwByt0/eAoHU1vYyOk3R9auYNg4I3BQFDkx3kNPF07Xeobn
	JqnYtDIDJg71qrmfOgxxIgQZuKH9CUFm1840VLEj3/VxjOVkROXzWop8ZnvOodgN7/wd8NwStPT
	YLs0Km39kX5bikBZimibU43dPp6nhtpFHMAZn8nZSYD4FK0k97kSNLSAEmVc2Xw2AY8E/LQLWNn
	CVcwqJxuCsFEaaigyF2SbtMfjjyuAz+ZqRX3W9bf6GZZ5wsjYTWA50jlFuKJkYU2FlxV/Jb6ijO
	ei8fUAQcadJhYaPmH11agilkmcTaeJtD4THllzo3ezUe//E82PU=
X-Google-Smtp-Source: AGHT+IGksfHB8GP2Cr7l3dVRe3nYbg7hfMxDMcI9hzDvYhK2y00Jh+kUBQkpg18kBXjK/7Ki8ipazA==
X-Received: by 2002:a05:6a20:958f:b0:215:e60b:3bc7 with SMTP id adf61e73a8af0-2170cde5298mr26460904637.26.1747809443633;
        Tue, 20 May 2025 23:37:23 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a987708asm8911809b3a.155.2025.05.20.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:37:23 -0700 (PDT)
Date: Wed, 21 May 2025 14:37:05 +0800
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
Message-ID: <20250521063705.GA4059166@bytedance>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <844ecab14632381bb5dd6a168a988dede64b459e.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844ecab14632381bb5dd6a168a988dede64b459e.camel@siemens.com>

On Tue, May 20, 2025 at 02:02:54PM +0200, Florian Bezdeka wrote:
> On Tue, 2025-05-20 at 18:41 +0800, Aaron Lu wrote:
> > @@ -6744,6 +6805,7 @@ static bool check_cfs_rq_runtime(struct cfs_rq *cfs_rq) { return false; }
> >  static void check_enqueue_throttle(struct cfs_rq *cfs_rq) {}
> >  static inline void sync_throttle(struct task_group *tg, int cpu) {}
> >  static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
> > +static void task_throttle_setup_work(struct task_struct *p) {}
> >  
> >  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
> >  {
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
> 
> Typo: s/Shuold/Should
>

Ah right, thanks.

> Btw: Is there a trace point in place when throttling/unthrottling
> happens? Would be nice to see that in a trace, but might be that I
> missed those events in my configuration up to now.

There is no trace point for throttle related events yet.

I tried to see if bpftrace can do the job but unfortunately, bpftrace
does not allow variable as array indice so I failed to get cfs_rq when
probing tg_throttle_down(tg, data)...

Thanks,
Aaron

> > +		WARN_ON_ONCE(1);
> > +		task_throttle_setup_work(p);
> > +	}
> > +
> > +	return p;
> >  }
> 
