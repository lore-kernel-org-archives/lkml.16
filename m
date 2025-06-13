Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9E291C20
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807662; cv=none; b=MNtNA/K8pkuiP3iSLC/leexKHSAPHFj4EHsQwApb12yQFQnEDZq4kvR2Shs+JemTtVQxGwoPfOlPIXV2tOlpcR4kAVx/KDSAZhCXFDRuH6Zzf00G4IaoPElXgl2XtRkAmKDg20RqJGbuV388bnBJjn6MFLPCeDD6YHHMUmq/0H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807662; c=relaxed/simple;
	bh=vxJIwqBoBthw6Y68avy/XPdTAXT+CeXBYs8C127BEFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFKKBDucogKSTUxNE9eidGbLX1YHUysLqTrFnwi551ffWchPtIVwGoOdwJvHPzvtw7gmQiSTSvSe9Rgv1XNDF8fEIIE2Jqc0nNvTya9psrmQtkZoXPYtOHO1JnvxoLkoE7DfBFDvt1LJ1+RsNzVhQyLD1/no6F3vbdygRdeMycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XnaX2ZYS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XnaX2ZYS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YCxzUkHK8oucoNTrGYax2mHVE0vyWjNk8JVLimfriZ4=; b=XnaX2ZYSGkYwrmeikapZ91uUU8
	WtWp0752MMyx0EWKUg3K85SUIcSjtfVm7d3ldgehZ8fXAw0arviXaBK9juXjjtFLn7LVfhDliDyF9
	cb52DUVfFIfVoX4grP5BIHatLhSgeO3FmvipF7J23kypIvnvt7LGLsKAmAlp67STO4z4U8bz0I6zp
	PxU4a49MLHIvH0pOekQNeZoBV2iYd6Lp88v/YZcNagAwxpCb74qAnD9ky+hUmQW9jKH2cnYDLJTlE
	UOpFJ+gt3Jwhq3QAckCxEqKO9ndPBNE3UVkUnxuBMvda1BKjI9JdIyBxXOwbI837OlGXQdw4oEKPB
	OB8yHRaw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0u4-0000000CnWh-3wKR;
	Fri, 13 Jun 2025 09:40:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 704E83061AA; Fri, 13 Jun 2025 11:40:52 +0200 (CEST)
Date: Fri, 13 Jun 2025 11:40:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Galbraith <efault@gmx.de>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 2/5] sched: Optimize ttwu() / select_task_rq()
Message-ID: <20250613094052.GF2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.620602459@infradead.org>
 <334e48ebbf34d853777672449cb29d5f06c751b7.camel@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <334e48ebbf34d853777672449cb29d5f06c751b7.camel@gmx.de>

On Mon, Jun 09, 2025 at 07:01:47AM +0200, Mike Galbraith wrote:

Right; so the problem being that we can race with
migrate_disable_switch().

>  kernel/sched/core.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4313,7 +4313,10 @@ int try_to_wake_up(struct task_struct *p
>  		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
>  			break;
>  
> -		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
> +		if (is_migration_disabled(p))
> +			cpu = -1;
> +		else
> +			cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
>  
>  		/*
>  		 * If the owning (remote) CPU is still in the middle of schedule() with
> @@ -4326,6 +4329,9 @@ int try_to_wake_up(struct task_struct *p
>  		 */
>  		smp_cond_load_acquire(&p->on_cpu, !VAL);
>  
> +		if (cpu == -1)
> +			cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
> +
>  		if (task_cpu(p) != cpu) {
>  			if (p->in_iowait) {
>  				delayacct_blkio_end(p);
> 

So select_task_rq() already checks is_migration_disabled(); just not
well enough. Also, I'm thinking that if we see migration_disabled, we
don't need to call it a second time, just let it be where it was.

Does something like this help? Specifically, when nr_cpus_allowed == 1
|| is_migration_disabled(), don't change @cpu at all.

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3593,7 +3593,7 @@ int select_task_rq(struct task_struct *p
 		cpu = p->sched_class->select_task_rq(p, cpu, *wake_flags);
 		*wake_flags |= WF_RQ_SELECTED;
 	} else {
-		cpu = cpumask_any(p->cpus_ptr);
+		cpu = task_cpu(p);
 	}
 
 	/*
