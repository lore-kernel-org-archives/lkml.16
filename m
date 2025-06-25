Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DACD3594E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839600; cv=none; b=VS9zjVHhRPpreAn4vRBn0A/O9/S2Rj4O0NOJ4klkpxUsoVQSnmn6p7SgtrWHjJ3134lrFcZuueH3xSU+vNjkO7PKncPJiS+NTjA3QQf1J0WjfgQqcCyeag8jF6kmIEAGSCTFQMXN0WzFxphI6xPYMFFiQorp/ORENx+CBHJhGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839600; c=relaxed/simple;
	bh=uByTntrZCnidudNvqPLoVgyHCXk2V+WPtHjPH6J36Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ibg0XTw6poThh0jfkeSAzYiX5iW8zYTfkFJLMPrlCKjOhlhclObftsvPntBBJBS8LPGsUEYaegRy+1wht8XFwSHwOlHLjozlP+Cswz3yo67NVU/beAZXY5GyGiDPpwLNvM/bpwF6PIItwJ0tih6W78qk5+3XeyUlkqLICYyiNqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U790Jpr4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U790Jpr4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3mfmKEh413JqFRThq/pWx7qpAVxemvd4cZeSRfG5+Gg=; b=U790Jpr4vo0nTEgM+I/UMIxjEj
	SpSUQZX38mcx+YKtjsn4IIUbLNA5Eb+R2OOtchFAddmVgJOVbLugHkoYQvAcV8/lxaknx2RnvGw4V
	KKLCsm52Kqffth5Ti2Xt0OSwzYOnPxLFqvM37yJWFAWjxgZvs2p9xY8jrg7yLjyTGrlB/R0AKxwrZ
	c2bQoyAI3Po/el1egcbE+qJbMBo22rNaqanmYswoHOBqy7kkdBkhqe1GWV9UMD/7o46UdLKqI8B+k
	oOJqnNdZFCMNCTMgvLI4mrUqBAQ7L1wROlKkfcq74/kkYllA5Mb/pshIZm0l8wyPUnmxaqOZikRCr
	kdbEyZ+A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULMG-00000005gIm-3bnh;
	Wed, 25 Jun 2025 08:19:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D692308983; Wed, 25 Jun 2025 10:19:51 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:19:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com
Subject: Re: [RFC PATCH] sched: Change nr_uninterruptible from unsigned to
 signed int
Message-ID: <20250625081951.GY1613200@noisy.programming.kicks-ass.net>
References: <20250625044836.3939605-1-aruna.ramakrishna@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250625044836.3939605-1-aruna.ramakrishna@oracle.com>


(Please, be careful not to wrap quoted text, unwrapped it for you)

On Wed, Jun 25, 2025 at 04:48:36AM +0000, Aruna Ramakrishna wrote:

> We have encountered a bug where the load average displayed in top is
> abnormally high and obviously incorrect. The real values look like this
> (this is a production env, not a simulated one):

Whoopie..

> The nr_uninterruptible values for each of the CPU runqueues is large,
> and when they are summed up, the sum exceeds UINT_MAX, and the result
> is stored in a long, which preserves this overflow.

Right, that's the problem spot.

> long calc_load_fold_active(struct rq *this_rq, long adjust)
> {
>         long nr_active, delta = 0;
> 
>         nr_active = this_rq->nr_running - adjust;
>         nr_active += (int)this_rq->nr_uninterruptible;
> ...

> From kernel/sched/loadavg.c:
> 
>  *  - cpu_rq()->nr_uninterruptible isn't accurately tracked per-CPU because
>  *    this would add another cross-CPU cacheline miss and atomic operation
>  *    to the wakeup path. Instead we increment on whatever CPU the task ran
>  *    when it went into uninterruptible state and decrement on whatever CPU
>  *    did the wakeup. This means that only the sum of nr_uninterruptible over
>  *    all CPUs yields the correct result.
>  *
> 
> It seems that rq->nr_uninterruptible can go to large (positive) values
> for one CPU if a lot of tasks were migrated off of that CPU after going
> into an uninterruptible state. If they’re woken up on another CPU -
> those target CPUs will have negative nr_uninterruptible values. I think
> the casting of an unsigned int to signed int and adding to a long is
> not preserving the sign, and results in a large positive value rather
> than the correct sum of zero.

So very close, yet so far...

> I suspect the bug surfaced as a side effect of this commit:
> 
> commit e6fe3f422be128b7d65de607f6ae67bedc55f0ca
> Author: Alexey Dobriyan <adobriyan@gmail.com>
> Date:   Thu Apr 22 23:02:28 2021 +0300
> 
>     sched: Make multiple runqueue task counters 32-bit
> 
>     Make:
> 
>             struct dl_rq::dl_nr_migratory
>             struct dl_rq::dl_nr_running
> 
>             struct rt_rq::rt_nr_boosted
>             struct rt_rq::rt_nr_migratory
>             struct rt_rq::rt_nr_total
> 
>             struct rq::nr_uninterruptible
> 
>     32-bit.
> 
>     If total number of tasks can't exceed 2**32 (and less due to futex pid
>     limits), then per-runqueue counters can't as well.
> 
>     This patchset has been sponsored by REX Prefix Eradication Society.
> ...
> 
> which changed the counter nr_uninterruptible from unsigned long to unsigned
> int.
> 
> Since nr_uninterruptible can be a positive or negative number, change
> the type from unsigned int to signed int.

(Strictly speaking it's making things worse, since signed overflow is UB
in regular C -- luckily we kernel folks have our own dialect and signed
and unsigned are both expected to wrap 2s-complement).

Also, we're already casting to (int) in the only place where we consume
the value. So changing the type should make no difference what so ever,
right?

> Another possible solution would be to partially rollback e6fe3f422be1,
> and change nr_uninterruptible back to unsigned long.

I think I prefer this.
