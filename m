Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727731714C0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622938; cv=none; b=UtHzipWV5MW+WRVi7q4wc4H8O1C119HUh+HoXsBcqBvi97LZ59Jd9kMoHhL1285/P2IiRBwQ2iFwxEfE2r2p0MXzcAkXKXx/b1WinNE6tnxug0nuwOsn8VBAT5t2mVJvr8hcpNOrsUSGN1Zkq8zBKU9Sigd7nF72yRX53q6PPfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622938; c=relaxed/simple;
	bh=1Az0wTupRrZhytcn6m9NKmBOGqe8y0JyGXE8o0PAx5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOJoJlp1BSNaVMDWwFEOCI7DwcTeHsfCPfl1PyGKxBPuTzS46Y1iGwQiDxg13FUbhjYdgxetDNQPPl2pMakSyejkRi1ICiVNpaqvZkzeNve4BudFFXyAiFWAsUAuDXl8LyytTdiiZ7RRnyf5Wu2/siTp6hB0oN8hFrobL9QxR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7YOOyzq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7YOOyzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744622935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h6mEhCnzkEXjChm2SjgPnZvwRxNU31/ix+OVhJF6OqE=;
	b=c7YOOyzqRw8VvR4bi3YZd+FGKEIv8ELxS46jFg2lad9TGUnYujyjvVtQKeoz4wZKyeqpEy
	8UE1LExkXatcnnug1aGkJMQARAtnFee4g1Rh06m+bT3R8dvMz0gqjfys4W1/rlaZzvTd3C
	V9VUVSG6Qx+myUPC1VzsQR4SKy0NeiA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ELG8uNnHNY6PDwMmq7M2zg-1; Mon, 14 Apr 2025 05:28:52 -0400
X-MC-Unique: ELG8uNnHNY6PDwMmq7M2zg-1
X-Mimecast-MFC-AGG-ID: ELG8uNnHNY6PDwMmq7M2zg_1744622932
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3913f97d115so2011607f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622931; x=1745227731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6mEhCnzkEXjChm2SjgPnZvwRxNU31/ix+OVhJF6OqE=;
        b=k5MFUl/KyZBn6CjckbM855beL2Zlyrv0W8nAHYSnuuUzf+EZ5dEK8xrfgweMr8zgyV
         n0+Bq492XvFy5c5v9EwOXqBf16HniFTGGp9BGoiOlUZUwvho02GxaZGHPOB/MqLdnTUI
         W/2T2Ym3lSASFEwXkd+ph7sJEeHvp67/lEEc3EyenmxeAtmJuCCmLuT4ofMKs5CM1opu
         vohSoNg1m/GSt37JgFBbaOn/RHoqgwPY6BZKEGWqYhJCH4kjPoePGGGsssoGvidf/V9X
         n/FM0u7uE9SK/iRm1V4rLqXOjEYKoGYIIARqVKaP6vYXxDQ4NLYpiAOQxvexBg1PAp5h
         y0aw==
X-Gm-Message-State: AOJu0YxBjDls7J+6hmd/P8ff3MPMAe7Lz/zlRfTe3HU4ILkasW951Dvu
	SbT7UIkpLLOQLfhyRneD8KIsWwgWtmpDB/Z4NoD1+1TPuflydcyYM0RO9iFOqI2wY3Su8AAudst
	wTOnOPi0/ciWIWiWDxIFlgY2g6po4ovt/Gc1yzLd+gTbOs7xziblyG4iXl3Oxlg==
X-Gm-Gg: ASbGnctXzHziYzEBlwWJPFmCHoQASLXnQ5hmGI1Foh2Y/xGerSXKKtyg0nGglQrTs/Q
	N0mWPZwKOt+m1k3bkoR/LI8hY2EqSjUGS5iQCaAM6Z/FrPzCxdSLv9U/zEvDS4fOR6TgJPScxfr
	quLB4gqjuwjMrdc4DoUQafPXkcLNmI0qsQxzlaeev7GpVOHyQcyJXYvlIdVbrKhTGcpeRDjGY5U
	HqfSgkXaYggW3I4ygNmkO+J3nHVFf6LSPMY4ipiMnadjeB92CyHn63DuDwoTRArsSN0Zi2ANy2a
	SC4+ARLp3wu64+1aHyg6Kp2KsISkHe6q540EiEtnsA==
X-Received: by 2002:a5d:598e:0:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-39d8f21d531mr12444795f8f.0.1744622931519;
        Mon, 14 Apr 2025 02:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZq9+vWhpkNR4AVUn5w9bDZGe/quGIq9bRvrXc0VcBb36KGHrf/fzkdF/nZ3IyPEikfTj6EA==
X-Received: by 2002:a5d:598e:0:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-39d8f21d531mr12444768f8f.0.1744622931035;
        Mon, 14 Apr 2025 02:28:51 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.27.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235b050fsm175501555e9.40.2025.04.14.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:28:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:28:48 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
Message-ID: <Z_zVULdTgt9J4rqf@jlelli-thinkpadt14gen4.remote.csb>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-5-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412060258.3844594-5-jstultz@google.com>

Hi John,

On 11/04/25 23:02, John Stultz wrote:
> Without proxy-exec, we normally charge the "current" task for
> both its vruntime as well as its sum_exec_runtime.
> 
> With proxy, however, we have two "current" contexts: the
> scheduler context and the execution context. We want to charge
> the execution context rq->curr (ie: proxy/lock holder) execution
> time to its sum_exec_runtime (so it's clear to userland the
> rq->curr task *is* running).
> 
> Then instead of charging the execution context (rq->curr) for
> the vruntime, we charge the vruntime against the scheduler context
> (rq->donor) task, because that is the time it is donating when
> it is used as the scheduler-context.
> 
> If the donor and curr tasks are the same, then it's the same as
> without proxy.
> 
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Qais Yousef <qyousef@layalina.io>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Zimuzo Ezeozue <zezeozue@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Metin Kaya <Metin.Kaya@arm.com>
> Cc: Xuewen Yan <xuewen.yan94@gmail.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Suleiman Souhlal <suleiman@google.com>
> Cc: kernel-team@android.com
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> +static s64 update_se_times(struct rq *rq, struct sched_entity *se)
>  {
>  	u64 now = rq_clock_task(rq);
>  	s64 delta_exec;
>  
> -	delta_exec = now - curr->exec_start;
> +	delta_exec = now - se->exec_start;
>  	if (unlikely(delta_exec <= 0))
>  		return delta_exec;
>  
> -	curr->exec_start = now;
> -	curr->sum_exec_runtime += delta_exec;
> +	se->exec_start = now;
> +	if (entity_is_task(se)) {
> +		struct task_struct *running = rq->curr;
> +		/*
> +		 * If se is a task, we account the time against the running
> +		 * task, as w/ proxy-exec they may not be the same.
> +		 */
> +		running->se.exec_start = now;
> +		running->se.sum_exec_runtime += delta_exec;
> +	} else {
> +		/* If not task, account the time against se */
> +		se->sum_exec_runtime += delta_exec;
> +	}

...

> @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
>  	struct task_struct *donor = rq->donor;
>  	s64 delta_exec;
>  
> -	delta_exec = update_curr_se(rq, &donor->se);
> +	delta_exec = update_se_times(rq, &donor->se);
>  	if (likely(delta_exec > 0))
>  		update_curr_task(donor, delta_exec);

Considering that we calculate delta_exec in updated_se_times using
exec_start of the sched_entity passed as argument, is it correct to use
donor in the above?

Thanks,
Juri

