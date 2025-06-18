Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A722F5301
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750206348; cv=none; b=ZMWAQ1XRKw16Ncgnl9v4R7bamjv7z7EQf2Vtjg8xFD2IL4faZXnX6QnbrArQ2Tvur/ds0QfdJSd+PDAKAYfoigEIlTZNHos8NBvjRg/jXfX5i9Bcbcrf+pVKc3CA98yiZMwFNueZEzPNmZ1p5hpqhDlPpTHTwxVWQfyC+a3DWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750206348; c=relaxed/simple;
	bh=grNSdOh7xltwFNxLMxeS/rpygzEfyl+lh904ZKR+HhA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gHs50EEMM9tC7dyzf60ngxSkn76xG5elVR0SJeTEh/hDsjUIQxhke6DkGbexTH6ljS0etVVC7Rtoqm/1SPNHRf9yBYfSnki3eaZNM2xtsRrKvs8Oiml48Unv4PNVEfKhx5U519/VX2TnmJEDNuz1d0WWiV9U6Kc7WJ+6Bfb+f5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BORxnhy4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BORxnhy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8E5C4CEE3;
	Wed, 18 Jun 2025 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750206348;
	bh=grNSdOh7xltwFNxLMxeS/rpygzEfyl+lh904ZKR+HhA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BORxnhy4BuuGukVUZdMqQ65TPjm3pQsgu5w7kMNTfGP2+P951TGchMDUjzcyuxtWZ
	 H3gALD8kHa9AFEL69dJ1QJVmLPvCYEJMr8/9LIf7Ko4b7PBR3NTcUQ9NCxnSX6uv0p
	 pX33s74HN622kx50CUGLJDgrqIXHzQAWzBbczZak=
Date: Tue, 17 Jun 2025 17:25:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhiguo Jiang <justinjiang@vivo.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH] mm: rt-threads retry mempool allocation without delay
Message-Id: <20250617172547.25af99b0f195379f6d6df9f8@linux-foundation.org>
In-Reply-To: <20250617091044.1062-1-justinjiang@vivo.com>
References: <20250617091044.1062-1-justinjiang@vivo.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 17:10:44 +0800 Zhiguo Jiang <justinjiang@vivo.com> wrote:

> The real-time(rt) threads are delayed for 5 seconds in mempool_alloc,
> which will seriously affect the timeliness of front-end applications
> and the user experience lag issues.

Oh God, do we really do that?

Yes we do!  I'm surprised this wasn't reported some time over the
intervening 13 years.

Yes, a hard-coded 5 second delay might be a slight problem in a
realtime kernel.

> The real-time(rt) threads should retry mempool allocation without
> delay and in order to obtain the required memory resources as soon as
> possible.

Well, does this actually work in your testing?

I guess it can improve the situation, some of the time.  If it's a
uniprocessor non-preemptible then perhaps interrupt-time writeback
completion might save us, otherwise it's time to hit the power button.

> The following example shows that the real-time(rt) QoSCoreThread
> prio=98 blocks 5 seconds in mempool_alloc, seriously affecting the
> user experience.
> 
> Running process:	system_server (pid 2245)
> Running thread:	QoSCoreThread 2529
> State:	Uninterruptible Sleep - Block I/O
> Start:	12,859.616 ms
> Systrace Time:	100,063.057104
> Duration:	5,152.591 ms
> On CPU:
> Running instead:	kswapd0
> Args:	{kernel callsite when blocked:: "mempool_alloc+0x130/0x1e8"}
> 
>    QoSCoreThread-2529  (   2245) [000] d..2. 100063.057104: sched_switch:
>    prev_comm=QoSCoreThread prev_pid=2529 prev_prio=000255001000098
>    prev_state=D ==> next_comm=kswapd0 next_pid=107
>    next_prio=000063310000120
>  [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209675: sched_waking:
>  comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
>  [GT]ColdPool#14-23937 (  23854) [000] dNs2. 100068.209676:
>  sched_blocked_reason: pid=2529 iowait=1 caller=mempool_alloc+0x130/0x1e8
>  [GT]ColdPool#14-23937 (  23854) [000] dNs3. 100068.209695: sched_wakeup:
>  comm=QoSCoreThread pid=2529 prio=98 target_cpu=000
>  [GT]ColdPool#14-23937 (  23854) [000] d..2. 100068.209732: sched_switch:
>  prev_comm=[GT]ColdPool#14 prev_pid=23937 prev_prio=000003010342130
>  prev_state=R ==> next_comm=QoSCoreThread next_pid=2529
>  next_prio=000255131000098

Do you have a call trace for these stalls?  I'm interested to see who
is calling mempool_alloc() here.  Perhaps a suitable solution is to
teach the caller(s) to stop passing __GFP_DIRECT_RECLAIM and to handle
the NULL return.

> --- a/mm/mempool.c
> +++ b/mm/mempool.c
> @@ -18,6 +18,7 @@
>  #include <linux/export.h>
>  #include <linux/mempool.h>
>  #include <linux/writeback.h>
> +#include <linux/sched/prio.h>
>  #include "slab.h"
>  
>  #ifdef CONFIG_SLUB_DEBUG_ON
> @@ -386,7 +387,7 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
>  	void *element;
>  	unsigned long flags;
>  	wait_queue_entry_t wait;
> -	gfp_t gfp_temp;
> +	gfp_t gfp_temp, gfp_src = gfp_mask;
>  
>  	VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
>  	might_alloc(gfp_mask);
> @@ -433,6 +434,16 @@ void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
>  		return NULL;
>  	}
>  
> +	/*
> +	 * We will try to direct reclaim cyclically, if the rt-thread

"synchronously"

> +	 * is without __GFP_NORETRY.
> +	 */
> +	if (!(gfp_src & __GFP_NORETRY) && current->prio < MAX_RT_PRIO) {
> +		spin_unlock_irqrestore(&pool->lock, flags);
> +		gfp_temp = gfp_src;
> +		goto repeat_alloc;
> +	}
> +
>  	/* Let's wait for someone else to return an element to @pool */
>  	init_wait(&wait);
>  	prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);

