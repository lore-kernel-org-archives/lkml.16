Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19CF22576D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176778; cv=none; b=NUrN3VDZM0wzpLBPa6Gn1mo+0rWX+1/crR6AnXFz7JhiDV/a4kAhXizzOJyh2vHs4mRRwHnNBGVk3jAga8Y+BXSxPbxwfdM2R2DCKHXIzopT7ornNUc9ynrseqJBlfKkgq2QLkyL9z6e1nh44w0/PEL2ck6x++++14T5neJtfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176778; c=relaxed/simple;
	bh=M2oj46kMzUMSEbGNCUOFuda0AGjerO2qSWTOnylr0tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+A/sGWgryS+zqjCgKBsGgqSAfLhLFPwFHxkGFdkgycXOfJzP339GVbZ2ECKXLxmxRcMr/mNKb3xed3jYZvjuxp7AZvuRYCwX5yy8xfASeptxN0XpPCYzfNgXxjusxo32gwfzjNnMvVSlRAUbq1ef0mIPB+W5HO20tuf9Hu2I84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VxJqz33K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VxJqz33K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R6qvRY5edeMxG0ix5dbjscdMhwf5+XMxecbE1wVwGGY=; b=VxJqz33KsJo1jRDyslIgs3neOa
	/uIO/luCEUExbFGqwAqnnHsRcpbOXv5z82Agkv9GwrxhHHix+8A2HLOOZ86InzH40Lfy5pWc/OIyO
	Wtt1EG/dPUrIQujK+0/tumKxgNEmPSzfkg4nTd0dvAo8M30qNpqb7pQWdAvrlUYQM/upYRtskNN2H
	iPKkzymoguAo09u7mHZJc0x7H0Ogg9LdNeuORo6Pbd7d6+preVPEVpvN3J9tl82vPHOOComdBVUVp
	7khuzejBvvKevUnIdAe3lCyO3Z/aK7/C6iX1jAlotcW8TJ3P+lsX7l4J6WlQ2bs094YfHawlz5LyP
	o2xXWf0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmKs-0000000BaKr-3z1b;
	Fri, 02 May 2025 09:05:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 316373001D4; Fri,  2 May 2025 11:05:29 +0200 (CEST)
Date: Fri, 2 May 2025 11:05:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, tglx@linutronix.de,
	bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Message-ID: <20250502090529.GU4198@noisy.programming.kicks-ass.net>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502015955.3146733-2-prakash.sangappa@oracle.com>

On Fri, May 02, 2025 at 01:59:52AM +0000, Prakash Sangappa wrote:
> Add support for a thread to request extending its execution time slice on
> the cpu. The extra cpu time granted would help in allowing the thread to
> complete executing the critical section and drop any locks without getting
> preempted. The thread would request this cpu time extension, by setting a
> bit in the restartable sequences(rseq) structure registered with the kernel.
> 
> Kernel will grant a 50us extension on the cpu, when it sees the bit set.
> With the help of a timer, kernel force preempts the thread if it is still
> running on the cpu when the 50us timer expires. The thread should yield
> the cpu by making a system call after completing the critical section.
> 
> Suggested-by: Peter Ziljstra <peterz@infradead.org>
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---

> diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
> index c233aae5eac9..900cb75f6a88 100644
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -26,6 +26,7 @@ enum rseq_cs_flags_bit {
>  	RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT_BIT	= 0,
>  	RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT	= 1,
>  	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT	= 2,
> +	RSEQ_CS_FLAG_DELAY_RESCHED_BIT		= 3,
>  };
>  
>  enum rseq_cs_flags {
> @@ -35,6 +36,8 @@ enum rseq_cs_flags {
>  		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL_BIT),
>  	RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE	=
>  		(1U << RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE_BIT),
> +	RSEQ_CS_FLAG_DELAY_RESCHED		=
> +		(1U << RSEQ_CS_FLAG_DELAY_RESCHED_BIT),
>  };
>  
>  /*
> @@ -128,6 +131,10 @@ struct rseq {
>  	 * - RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE
>  	 *     Inhibit instruction sequence block restart on migration for
>  	 *     this thread.
> +	 * - RSEQ_CS_DELAY_RESCHED
> +	 *     Request by user task to try delaying preemption. With
> +	 *     use of a timer, extra cpu time upto 50us is granted for this
> +	 *     thread before being rescheduled.
>  	 */
>  	__u32 flags;

So while it works for testing, this really is a rather crap interface
for real because userspace cannot up front tell if its going to work or
not.

> +void rseq_delay_resched_fini(void)
> +{
> +#ifdef CONFIG_SCHED_HRTICK
> +	extern void hrtick_local_start(u64 delay);
> +	struct task_struct *t = current;
> +	/*
> +	 * IRQs off, guaranteed to return to userspace, start timer on this CPU
> +	 * to limit the resched-overdraft.
> +	 *
> +	 * If your critical section is longer than 50 us you get to keep the
> +	 * pieces.
> +	 */
> +	if (t->sched_time_delay)
> +		hrtick_local_start(50 * NSEC_PER_USEC);
> +#endif
> +}

Should not the interface at least reflect this SCHED_HRTICK status? One,
slightly hacky way of doing this might to be invert the bit. Have the
system write a 1 when the feature is present, and have userspace flip it
to 0 to activate.

A better way might be to add a second bit.

Also, didn't we all agree 50us was overly optimistic and this number
should be lower?

> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index cd38f4e9899d..1b2b64fe0fb1 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -1378,6 +1378,11 @@ static void do_sched_yield(void)
>   */
>  SYSCALL_DEFINE0(sched_yield)
>  {
> +	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay) {
> +		schedule();
> +		return 0;
> +	}
> +
>  	do_sched_yield();
>  	return 0;
>  }

Multiple people, very much including Linus, have already said this
'cute' hack isn't going to fly. Why is it still here?
