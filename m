Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B12D77F5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534931; cv=none; b=l/IJixPaLmy+RBaCIXHGtu2G2Zmqhv87ne06oFBwDnZYCQwa3kynaWYuDbJhrhTYULjLMD6ahaapcfu4oR0AMgqg+iFcvlf5SeOgcOHM9jM6DXTNYJ7eGioO8bjILtee3IqKcJBJlF1D9ZYU8GXuyOhrZsOmysytTQwg1+P4Bio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534931; c=relaxed/simple;
	bh=8KfOT7t21AoCJ5H/PyPJ7XD2JKNkfHAYXVJuPTVF4Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bozLDh5f8UyNgEz5carn8UZ+6OfmJDA30Xnz7EH01LxaKWQdAZoqRpaUjaXO5R23UQFgFUe2xPKqBBf0Fb7af3PpIc6yTUOSMa6vJsrdbUjmeZw7SD2rvfS9OFRZQooPO5Jw2bT2BupTyP13YzAdYF90w81k7l0NEZ8MRZ4uhoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KI0MAxEh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KI0MAxEh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a54690d369so5150824f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751534928; x=1752139728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldn8I14D5I8HY3T0ak8PJXlgQ/uI/BbBsFDo/rfP9I0=;
        b=KI0MAxEhfaAHqZagsnLU8MSrHzj6UFK+ebArG91bLTRCUR/tq178lU8OH9c5dRuOAI
         ofBGqxr57uYgu6AdCvg/uGPZ4xSeBgAksAnaGrKBEGrK8D0i5y7sVjFYfCubms9fFDkI
         JMoRanI4CSU9+FUh6xVdGSq38D7ct0iAt9nV4apak5Bp+37Am7EiP4wM4hF4z2daZL7H
         irNySl8yJZXyDAjytF47BAVUOcE2XDDxxjuDdHLiP+/zhWLyU8gKjvMEB53pA2EU9Wke
         AqCHLunDlB7TxAPp09VBSg/Ka4iF4UQ/gBwwvrBbckLCkUEuS3vstBs4Aguc8wdGIn/0
         4VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534928; x=1752139728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldn8I14D5I8HY3T0ak8PJXlgQ/uI/BbBsFDo/rfP9I0=;
        b=lNr47XjLb9j3VGkGy5BY86buX7MNaJvm1nLp91efJokagICgFWuLqfmmvdvFKRzcVu
         LMootjJWAKYrSXkQLjsbITYJ/blwNmwNS7tfPEEu6ry5+5JlzuQM//GVP6ObNPnYCzv4
         smUyYTrNeWKUedyHlNCS73cnHFI/5sk8TKIv5Cj8d0zEjE4DTNqpjB653GHgCpuIpkRU
         JzeThSQHVZvwn1W4hNTcV9IaCpLFkaLrQjEtWaFoiTri1jA5N48uj+89JraQvOLnPDKe
         AesmyYRQCZDIIFvAWy+cyYP4Q0QtZLpZJLyOfsCwpQ9UM6yxNRCLSdKQRt7lN1Js8a80
         VJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhgNjH2l7YysIK6Ghc42PJhTsfrnVVTtMfnsYPnUa1/kFxyGX++vhc014aY9qx/xTpl7QNAWt7thM2LgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfq/UeUJ8f16N0OglSQuxKzpWPjVVnhf1SqtfD7jhyfG87Sqn
	30POerb+bO+CYTBuqSPcWFDDReT8oicz2nsSb0iTopWAMwOIsnqrHIJ/BAXYsApzc78=
X-Gm-Gg: ASbGnctzZtNLrMLYVcYxlk3miPA8MbXEDe5XKSKyuLroznEQZWAsmbOYRcHHSft28g8
	Esvr5hRpY/mNdJJ22RNFtMUOHbh3GPVWPernnVhOfrqWD9FeFRMQOblaRC2WO/3ZPXVXk7tqXPp
	2tP/3851H8NpdiVLIhWgv54XZGNK8TN2sRnWsF9QuO20/UEie6qLg5Yg8esDHXMUCdDjSziDSHg
	bOKp1v64YpD3eVVE9Dk+OxXt9/TRFaQTEL76mzDuwJoaUao7UXBCQYZbhhgG/J4EkqNNZYNo5Wc
	sWCDXNkWvXPKDsLc3LOBWhAU1a2E0lL2WKmwiBq4YfbArVz1xmaztLqTsa053PrbSbQy6svElPE
	=
X-Google-Smtp-Source: AGHT+IHark7nNokUf7fbniQ1bjkjXCjqcQXSIwqQINrCjNlo/yWXomt+ZK/7vWtlsIQqRX5YoU1/lQ==
X-Received: by 2002:a5d:5f4e:0:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3b200b4673amr4558022f8f.41.1751534928051;
        Thu, 03 Jul 2025 02:28:48 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52b9esm18374772f8f.61.2025.07.03.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:28:47 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:28:46 +0200
From: Michal Hocko <mhocko@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <aGZNTtJuCyHJE_25@tiehlicka>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703072608.GS1613200@noisy.programming.kicks-ass.net>

On Thu 03-07-25 09:26:08, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 12:32:47AM +0800, Chen Yu wrote:
> 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 8988d38d46a3..4e06bb955dad 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3364,7 +3364,14 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
> >  {
> >  	__schedstat_inc(p->stats.numa_task_swapped);
> >  	count_vm_numa_event(NUMA_TASK_SWAP);
> > -	count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > +	/* exiting task has NULL mm */
> > +	if (!(p->flags & PF_EXITING)) {
> > +		WARN_ONCE(!p->mm, "swap task %d %s %x has no mm\n",
> > +			  p->pid, p->comm, p->flags);
> > +
> > +		if (p->mm)
> > +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > +	}
> 
> Aside from the things already mentioned by Andrew and Michal; why not
> simply do something like:
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 87b6688f124a..8396ebfab0d5 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -969,7 +969,7 @@ static inline void count_memcg_events_mm(struct mm_struct *mm,
>  {
>  	struct mem_cgroup *memcg;
>  
> -	if (mem_cgroup_disabled())
> +	if (mem_cgroup_disabled() || !mm)
>  		return;

This would imply mm check for all other users that know their mm is
valid as they are operating on vma->mm or current task.

But thinking about this some more, this would be racy same as the
PF_EXITING check. This is not my area but is this performance sensitive
path that couldn't live with the proper find_lock_task_mm?

I do not see other race free way to deal with a remote task exit race.

-- 
Michal Hocko
SUSE Labs
