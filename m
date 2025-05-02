Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3551C1EFFBB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212996; cv=none; b=hSTldVN2hgWGb/7v7EX1JKFDBMs5lVl7iop8htQc6d7gNCtXhasCyu8sm9jpvSrf0sXBdMhSbjULVrYjF/EsTiPWNzwojjMFnQdRFQ1YlCbZjOq4KdKpQHSrMSDeYENrSktJJrRz950He/PodnkRq0UeVq6gvzuTqUNDlnFKzIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212996; c=relaxed/simple;
	bh=GJ2pIjBchyImO+6fT+NNHDZxYbsmpgk+t2LIWLflrk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVzPtMkTXSM48HvseG0JBMziAVcR6IYTWupU5yzPmx3tZTtntzjJmlFPO50I1cSZVo5A8Lp3WzoBOGx+KdIYthIe9fERIvrx+oAGdUz1BVw1ZruUIwxh7sCGv9OK3FpvsZQk1LIes/R4jQNTOAgXsRVM3Q+8OcwQtU/gJ5qFLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tLKGNqPs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tLKGNqPs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pqT1CsyDucN3pt8NP7y+prQ7/LGXACbbn0G9sn9Egp0=; b=tLKGNqPsFgqT2Qjcsyz63JrvoT
	pvPJ2lsbTZ2Snh6b6qeZBmtN8L2aSm01cloc4ublKiUU8My7d1S44jBfpESszgYddAOi7+Oq13bg5
	PgHFLZvZcNWDUQVUUYw4/FmnYMaJx5/cw4VT/qbKo8sG2uWAkZvulcJL9KRSFE1lBjfznV8doUJ6z
	cqN2fbjSwTaPnEM31xx/OinJO7ZPMQjwCi/ua8WngSOsZ82S3Atcxv3PbvgXOY3W3J6swbJcMlRrH
	7l3KZKTsUDEatCsqRWRCgwagAFhyX5K4PACfvN4zwoi6C4gp6gCOVB4QZv74jWaeUzBC6PA7+W7O9
	uebq4YbA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAvkp-0000000AtAh-1eng;
	Fri, 02 May 2025 19:09:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 99217300321; Fri,  2 May 2025 21:08:38 +0200 (CEST)
Date: Fri, 2 May 2025 21:08:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 21/21] selftests/futex: Add futex_numa_mpol
Message-ID: <20250502190838.GB24078@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-22-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-22-bigeasy@linutronix.de>

On Wed, Apr 16, 2025 at 06:29:21PM +0200, Sebastian Andrzej Siewior wrote:
> diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
> index 9d305520e849b..b664e8f92bfd7 100644
> --- a/tools/testing/selftests/futex/include/futex2test.h
> +++ b/tools/testing/selftests/futex/include/futex2test.h
> @@ -8,6 +8,11 @@
>  
>  #define u64_to_ptr(x) ((void *)(uintptr_t)(x))
>  
> +struct futex32_numa {
> +	futex_t futex;
> +	futex_t numa;
> +};
> +
>  /**
>   * futex_waitv - Wait at multiple futexes, wake on any
>   * @waiters:    Array of waiters
> @@ -20,3 +25,32 @@ static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned lon
>  {
>  	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
>  }
> +
> +static inline int futex2_wait(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
> +			      unsigned long flags, struct timespec *timo, clockid_t clockid)
> +{
> +	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);

I'm confused, sure this should be __NR_futex_wait

> +}
> +
> +/*
> + * futex_wait2() - block on uaddr with optional timeout
> + * @val:	Expected value
> + * @flags:	FUTEX2 flags
> + * @timeout:	Relative timeout
> + * @clockid:	Clock id for the timeout
> + */
> +static inline int futex2_wait2(void *uaddr, long val, unsigned int flags,
> +			      struct timespec *timeout, clockid_t clockid)

And this should be futex2_wait().


> +{
> +	return syscall(__NR_futex_wait, uaddr, val, 1, flags, timeout, clockid);
> +}
> +
> +/*
> + * futex2_wake() - Wake a number of futexes
> + * @nr:		Number of threads to wake at most
> + * @flags:	FUTEX2 flags
> + */
> +static inline int futex2_wake(void *uaddr, int nr, unsigned int flags)
> +{
> +	return syscall(__NR_futex_wake, uaddr, 1, nr, flags);
> +}
> -- 
> 2.49.0
> 
