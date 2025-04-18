Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E02B2DA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020154; cv=none; b=bDY0pygAeV1RmM0Jxxh3MDjiX5Jk2DPF899PjtANis7FVI3GWv9A1/mUboCMZXHwFwYVM9RIVc+TAC3Y/z0z9gGEe+aIjiM1Pp/8EidiIQj5zvT39LhCTz8DjHiX8zsRqA2fJRTYrgjkQy6TKQC4OnzgleNuZESJXaPa2MYtqRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020154; c=relaxed/simple;
	bh=vyjmsM+aW7aVkT2LcVBlUtWAhcR7RmqKBB7SolROCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E05bRKDrIhJ9v4hD2e05NH80HZsNAbEbGS07y8yS3MCqWwn9hz7tnIqbzpg/U6bCht474pmi8TeBo8+Stez4rmRPkl6hMRW2k1wHQJr1jx3Ilc4Rjt+d8WeAyd8cGdnzeQ9uZLU0I8TFX9MsbnWnL2+fgQ0YrABOC9HKsqre090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=2x0yjLEp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="2x0yjLEp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af9a6958a08so239379a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745020152; x=1745624952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdqN97xUgBh8g0GuFn3ELm+T4RLBmW8omURwaoa0VgI=;
        b=2x0yjLEpnZ/B3Yf+5cGoiM6GINuSDTIN37sCBheM0JbuFDBWV2MoYBbukg2caZmYiN
         OG57ycIUp+w+vkIe2QNWtyE83r+YA7x5yamfBCy9o5MMHDAtqH6cZYMAyIb32P8iGmz1
         MEnoQn56QtRz69ox3wSc/PVtuz7WN2KP3UWPjvQRY6dzTBznRArHlX/PcGsjUWi18PLt
         Na2+wtYBR3z5v7C4/h/bLrsumyJbkemYpqqGqGLRIC0q3ihsIRJVteQtNMqvwhsCaoxM
         A8GCWo5P3uCLp8yLy3KDFz7y2c+R/PTA2cWheqy2Miy3Xf3DE6uU/k+wNt4LgtK/CbdV
         N3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745020152; x=1745624952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdqN97xUgBh8g0GuFn3ELm+T4RLBmW8omURwaoa0VgI=;
        b=drruK+PdZbp1eV7KUBAqsjeygRd5+Gx5bel7VN+DA3KoAsLYb3wWzUUgUyqGQPbrmN
         BWQF/SLgQS9yBuaeBaau8Vpl+D1bv9qCv0TUgJprPFbVm41s+1BRXkIiAz+JWTJ8cbT9
         CoLNkENVUEGbwolQicxbnurzXwormR46qi6hfJ4g4Xscl0o0OIdoNYcIRWJI+yjPYnhj
         V+CV5UJwVDfR2rJCvJwpsDd/GhIMp5ZmbEOE1e4/9geCs0Y98GTWYiVlWue0Fl5I3vAX
         Y2Zw7LSzMPZ0M5XDBXdbaOFbXBmm87TvMD7AKGZitISmDbCC7H0hki16jLiL8+lbWPvI
         966A==
X-Forwarded-Encrypted: i=1; AJvYcCVO084wIVq68jzzUEnAXwMsUE3LNEwwppo+rAK+wUaFOjHj9UXn8531dg1fxzi/TReAU7+LRlX7zRY31dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxjeoVHMN/3XOtwgKOn1nD6yejpUX3RV7zAw9hG5005qLiqjKe
	8IZCI5raFpIKK0EX6pmHUnvDJ/Ki6rM9zFcwuJYLQPeC+BwL0B3NVcA7knzyia0=
X-Gm-Gg: ASbGncslSzNmdjNUmIyxmk9y7HCWs2/MQg/On/az2lRrDjREiewXehF0RBGZ/JbkNpR
	u9nX2dACqufEh7L6aXWvxby9jJBiOQ2jIvCrFo9Pt3vDaH+hKO0jlop9X7cCi54t73DDuErcdJu
	p6qSn35tq+2Fv0WO4IinPDwGStW61FtIDYZJihB7ovLD2aeSJkRkHlq8W3a1BuluvFq0DDiwpCw
	jqzVbsCcJrxGiRsRzm9vfEB2caXfE3lCLSjvxtWDjcv0niFTss3x/OTw5OEsRWbwQShrXxECCT9
	j9onMFzyXg3DGaLK9iYdFnTH
X-Google-Smtp-Source: AGHT+IGlRcpoKxmnktfi1TxMLHSk4WFMeByxP3JatUrK7v+PASF7Wn1Uc8cnJzvipZRkDvI0bD7qYg==
X-Received: by 2002:a05:6a00:3916:b0:72a:a7a4:99ca with SMTP id d2e1a72fcca58-73dc144da08mr2433867b3a.2.1745020152048;
        Fri, 18 Apr 2025 16:49:12 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5:4426])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d6c3sm2172565b3a.77.2025.04.18.16.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:49:11 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:49:08 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <aALk9DVfjTTHGdvA@telecaster>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418154438.GH17910@noisy.programming.kicks-ass.net>

On Fri, Apr 18, 2025 at 05:44:38PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 16, 2025 at 10:19:42AM -0400, Rik van Riel wrote:
> 
> > The most common warning by far, hitting
> > about 90% of the time we hit anything
> > in avg_vruntime_validate is the
> > WARN_ON_ONCE(cfs_rq->avg_vruntime != vruntime)
> > 
> > The most common code path to getting there,
> > covering about 85% of the cases:
> > 
> > avg_vruntime_validate
> > avg_vruntime_sub
> > __dequeue_entity
> > set_next_entity
> > pick_task_fair
> > pick_next_task_fair
> > __pick_next_task
> > pick_next_task
> > __schedule
> > schedule
> 
> (I'm assuming zero_vruntime patch here, the stock kernel has more
> problems vs min_vruntime getting stuck in the future etc..)
> 
> So I have a theory about this. Key is that you're running a PREEMPT-NONE
> kernel.
> 
> There is one important site the overflow patch does not cover:
> avg_vruntime_update().
> 
> However, due to PREEMPT_NONE, it is possible (Chris mentioned direct
> reclaim and OOM) to have very long (in-kernel) runtimes without
> scheduling.
> 
> (I suppose this should be visible by tracing sched_switch)
> 
> Were this to happen, then avg_vruntime_add() gets to deal with 'key *
> weight' for a relatively large key. But per the overflow checks there,
> this isn't hitting (much).
> 
> But then we try and update zero_vruntime, and that is doing 'delta *
> cfs_rq->avg_load', and avg_load is a larger number and might just cause
> overflow. We don't have a check there.
> 
> If that overflows then avg_vruntime is buggered, but none of the
> individual tree entities hit overflow, exactly as you observe.
> 
> I've modified the zero_vruntime patch a little (new one below) to update
> zero_vruntime in update_curr(). Additionally, I have every tick re-align
> it with the tree avg (the update and the tree can drift due to numerical
> funnies).
> 
> This should ensure these very long in-kernel runtimes are broken up in
> at most tick sized chunks, and by keeping zero_vruntime more or less
> around the actual 0-lag point, the key values are minimized.
> 
> I should probably go play with a kernel module that spins for a few
> seconds with preemption disabled, see if I can make it go BOOM :-) But
> I've not yet done so.
> 
> FWIW, you can add something like:
> 
> Index: linux-2.6/kernel/sched/fair.c
> ===================================================================
> --- linux-2.6.orig/kernel/sched/fair.c
> +++ linux-2.6/kernel/sched/fair.c
> @@ -652,6 +652,9 @@ avg_vruntime_sub(struct cfs_rq *cfs_rq,
>  static inline
>  void avg_vruntime_update(struct cfs_rq *cfs_rq, s64 delta)
>  {
> +	s64 tmp;
> +	WARN_ON_ONCE(__builtin_mul_overflow(cfs_rq->avg_load, delta, &tmp);
> +
>  	/*
>  	 * v' = v + d ==> avg_vruntime' = avg_runtime - d*avg_load
>  	 */
> 
> 
> To the overflow patch, to see if this mult goes splat.
> 
> 
> New zero_vruntime patch here:

Hey, Peter, thanks for your help with this. I have a question/potential
bug below.

> ---
>  kernel/sched/debug.c |    8 ++--
>  kernel/sched/fair.c  |   92 +++++++--------------------------------------------
>  kernel/sched/sched.h |    2 -
>  3 files changed, 19 insertions(+), 83 deletions(-)
> 
> Index: linux-2.6/kernel/sched/debug.c
> ===================================================================
> --- linux-2.6.orig/kernel/sched/debug.c
> +++ linux-2.6/kernel/sched/debug.c
> @@ -807,7 +807,7 @@ static void print_rq(struct seq_file *m,
>  
>  void print_cfs_rq(struct seq_file *m, int cpu, struct cfs_rq *cfs_rq)
>  {
> -	s64 left_vruntime = -1, min_vruntime, right_vruntime = -1, left_deadline = -1, spread;
> +	s64 left_vruntime = -1, zero_vruntime, right_vruntime = -1, left_deadline = -1, spread;
>  	struct sched_entity *last, *first, *root;
>  	struct rq *rq = cpu_rq(cpu);
>  	unsigned long flags;
> @@ -830,15 +830,15 @@ void print_cfs_rq(struct seq_file *m, in
>  	last = __pick_last_entity(cfs_rq);
>  	if (last)
>  		right_vruntime = last->vruntime;
> -	min_vruntime = cfs_rq->min_vruntime;
> +	zero_vruntime = cfs_rq->zero_vruntime;
>  	raw_spin_rq_unlock_irqrestore(rq, flags);
>  
>  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_deadline",
>  			SPLIT_NS(left_deadline));
>  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "left_vruntime",
>  			SPLIT_NS(left_vruntime));
> -	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "min_vruntime",
> -			SPLIT_NS(min_vruntime));
> +	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "zero_vruntime",
> +			SPLIT_NS(zero_vruntime));
>  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "avg_vruntime",
>  			SPLIT_NS(avg_vruntime(cfs_rq)));
>  	SEQ_printf(m, "  .%-30s: %Ld.%06ld\n", "right_vruntime",
> Index: linux-2.6/kernel/sched/fair.c
> ===================================================================
> --- linux-2.6.orig/kernel/sched/fair.c
> +++ linux-2.6/kernel/sched/fair.c
> @@ -526,24 +526,6 @@ void account_cfs_rq_runtime(struct cfs_r
>   * Scheduling class tree data structure manipulation methods:
>   */
>  
> -static inline __maybe_unused u64 max_vruntime(u64 max_vruntime, u64 vruntime)
> -{
> -	s64 delta = (s64)(vruntime - max_vruntime);
> -	if (delta > 0)
> -		max_vruntime = vruntime;
> -
> -	return max_vruntime;
> -}
> -
> -static inline __maybe_unused u64 min_vruntime(u64 min_vruntime, u64 vruntime)
> -{
> -	s64 delta = (s64)(vruntime - min_vruntime);
> -	if (delta < 0)
> -		min_vruntime = vruntime;
> -
> -	return min_vruntime;
> -}
> -
>  static inline bool entity_before(const struct sched_entity *a,
>  				 const struct sched_entity *b)
>  {
> @@ -556,7 +538,7 @@ static inline bool entity_before(const s
>  
>  static inline s64 entity_key(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
> -	return (s64)(se->vruntime - cfs_rq->min_vruntime);
> +	return (s64)(se->vruntime - cfs_rq->zero_vruntime);
>  }
>  
>  #define __node_2_se(node) \
> @@ -608,13 +590,13 @@ static inline s64 entity_key(struct cfs_
>   *
>   * Which we track using:
>   *
> - *                    v0 := cfs_rq->min_vruntime
> + *                    v0 := cfs_rq->zero_vruntime
>   * \Sum (v_i - v0) * w_i := cfs_rq->avg_vruntime
>   *              \Sum w_i := cfs_rq->avg_load
>   *
> - * Since min_vruntime is a monotonic increasing variable that closely tracks
> - * the per-task service, these deltas: (v_i - v), will be in the order of the
> - * maximal (virtual) lag induced in the system due to quantisation.
> + * Since zero_vruntime closely tracks the per-task service, these
> + * deltas: (v_i - v), will be in the order of the maximal (virtual) lag
> + * induced in the system due to quantisation.
>   *
>   * Also, we use scale_load_down() to reduce the size.
>   *
> @@ -673,7 +655,7 @@ u64 avg_vruntime(struct cfs_rq *cfs_rq)
>  		avg = div_s64(avg, load);
>  	}
>  
> -	return cfs_rq->min_vruntime + avg;
> +	return cfs_rq->zero_vruntime + avg;
>  }
>  
>  /*
> @@ -734,7 +716,7 @@ static int vruntime_eligible(struct cfs_
>  		load += weight;
>  	}
>  
> -	return avg >= (s64)(vruntime - cfs_rq->min_vruntime) * load;
> +	return avg >= (s64)(vruntime - cfs_rq->zero_vruntime) * load;
>  }
>  
>  int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se)
> @@ -742,42 +724,21 @@ int entity_eligible(struct cfs_rq *cfs_r
>  	return vruntime_eligible(cfs_rq, se->vruntime);
>  }
>  
> -static u64 __update_min_vruntime(struct cfs_rq *cfs_rq, u64 vruntime)
> +static void __update_zero_vruntime(struct cfs_rq *cfs_rq, s64 delta)
>  {
> -	u64 min_vruntime = cfs_rq->min_vruntime;
> -	/*
> -	 * open coded max_vruntime() to allow updating avg_vruntime
> -	 */
> -	s64 delta = (s64)(vruntime - min_vruntime);
> -	if (delta > 0) {
> -		avg_vruntime_update(cfs_rq, delta);
> -		min_vruntime = vruntime;
> -	}
> -	return min_vruntime;
> +	if (!delta)
> +		return;
> +
> +	avg_vruntime_update(cfs_rq, delta);
> +	cfs_rq->zero_vruntime += delta;
>  }
>  
> -static void update_min_vruntime(struct cfs_rq *cfs_rq)
> +static void update_zero_vruntime(struct cfs_rq *cfs_rq)
>  {
> -	struct sched_entity *se = __pick_root_entity(cfs_rq);
> -	struct sched_entity *curr = cfs_rq->curr;
> -	u64 vruntime = cfs_rq->min_vruntime;
> +	u64 vruntime = avg_vruntime(cfs_rq);
> +	s64 delta = (s64)(vruntime - cfs_rq->zero_vruntime);
>  
> -	if (curr) {
> -		if (curr->on_rq)
> -			vruntime = curr->vruntime;
> -		else
> -			curr = NULL;
> -	}
> -
> -	if (se) {
> -		if (!curr)
> -			vruntime = se->min_vruntime;
> -		else
> -			vruntime = min_vruntime(vruntime, se->min_vruntime);
> -	}
> -
> -	/* ensure we never gain time by being placed backwards. */
> -	cfs_rq->min_vruntime = __update_min_vruntime(cfs_rq, vruntime);
> +	__update_zero_vruntime(cfs_rq, delta);
>  }
>  
>  static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
> @@ -850,6 +811,7 @@ RB_DECLARE_CALLBACKS(static, min_vruntim
>  static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
>  	avg_vruntime_add(cfs_rq, se);
> +	update_zero_vruntime(cfs_rq);

Won't this double-count cfs_rq->curr in the avg_vruntime() calculation
in update_zero_vruntime()? When cfs_rq->curr->on_rq, put_prev_entity()
calls this with se == cfs_rq->curr _before_ setting cfs_rq->curr to
NULL. So the avg_vruntime_add() call will add entity_key(cfs_rq->curr)
to cfs_rq->avg_vruntime and se_weight(cfs_rq->curr) to cfs_rq->avg_load.
Then update_zero_vruntime() calls avg_vruntime(), which still sees
curr->on_rq and will add curr's key and weight again. This throws
zero_vruntime off, maybe by enough to bust zero_vruntime and/or
avg_vruntime?

Should the call to update_zero_vruntime() go before avg_vruntime_add()?

Thanks,
Omar
