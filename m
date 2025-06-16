Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FF01F55FA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061843; cv=none; b=BpoNy347W9Ewn9LMFI2DW02pv8lBLnqoWHxfUrJx/vi8YjOl4abO5pE8PlWuUuuclm5qBLhdB9JaVxjZx95zMlWD0174TjpsJWPdEGV/PJDNNf3hj2LXNDFywtftsBfTUF/D9A4GR8XAxIoUKv3TyyhOtNlWSn3jBgAz+9X8NXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061843; c=relaxed/simple;
	bh=b/i6D772U4j88mAXG9LkCWQ2SgkzM9Y41IoqieHTauo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWrCoATb3bBZTricGFgkoN+4HiHDR1xaxuXV+c+gHkJR0mXU6Jn0kJMlAhprcgax3GfYozyI5junL271M/l0SRlDSSCuMRVtMOimpipCl/A0yHrOxhcebPDjNjoLPXeCVsQ6cRyOA27TEHc/wf5202+2L5flcZ+8n83SXjEimSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DE7414BF;
	Mon, 16 Jun 2025 01:16:53 -0700 (PDT)
Received: from [192.168.178.71] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDA7A3F58B;
	Mon, 16 Jun 2025 01:17:13 -0700 (PDT)
Message-ID: <99643c17-80ba-4910-8238-3674d583c401@arm.com>
Date: Mon, 16 Jun 2025 10:16:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <64ae41a7-2c06-4082-a4d6-0db5b635ea01@arm.com>
 <20250613095119.GH2278213@noisy.programming.kicks-ass.net>
 <20250613104644.GB2273450@noisy.programming.kicks-ass.net>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250613104644.GB2273450@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:46, Peter Zijlstra wrote:
> On Fri, Jun 13, 2025 at 11:51:19AM +0200, Peter Zijlstra wrote:
>> On Fri, Jun 13, 2025 at 09:34:22AM +0200, Dietmar Eggemann wrote:
>>> On 20/05/2025 11:45, Peter Zijlstra wrote:

[...]

>>> I always get this fairly early with TTWU_QUEUE_DELAYED enabled, related
>>> to p->pi_lock not held in wakeup from interrupt.
>>>
>>> [   36.175285] WARNING: CPU: 0 PID: 162 at kernel/sched/core.c:679 __task_rq_lock+0xf8/0x128
>>
>> Thanks, let me go have a look.
> 
> I'm thinking this should cure things.
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -677,7 +677,12 @@ struct rq *__task_rq_lock(struct task_st
>  {
>  	struct rq *rq;
>  
> -	lockdep_assert_held(&p->pi_lock);
> +	/*
> +	 * TASK_WAKING is used to serialize the remote end of wakeup, rather
> +	 * than p->pi_lock.
> +	 */
> +	lockdep_assert(p->__state == TASK_WAKING ||
> +		       lockdep_is_held(&p->pi_lock) != LOCK_STATE_NOT_HELD);
>  
>  	for (;;) {
>  		rq = task_rq(p);

Yes, it does. I assume we can only end up in sched_ttwu_pending()'s 'if
(unlikely(p_rq != rq))' when ttwu_queue_wakelist() is called from
ttwu_runnable(), i.e. for sched_delayed tasks.

