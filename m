Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0082211C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746213374; cv=none; b=KWljvITF5dfyuTRx8zle7tmgdWZPsMk3XW8ob6hGeSc6VeUC+m/j0+oxkzgDklWDP7CrcmceWVaxlooBFCkYd4HldV2tbASSN2m1b7aYytDWlOHYTzUm2iXxqWMaDMS5ZEWFFcMVpkXYLx2qaFu33IoPpbX4E5BH5yHMQVCGpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746213374; c=relaxed/simple;
	bh=jGSx0SC+EQQmPE9izuCTygtKK6eMSC0CZpMc7Bv2dLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTm2E9UcU+iMf8Sl2wU6DtknbA2Q1LfsghHlZdQYb8+Kvr8+kmzbpkCoAURNydilkGul5DWzGCi8HPXbDLvQx22mgfPMN/cJ2igmSMxethfPEXWoHXDN3UvxVKYyaWLgI69R8Irxd+5W+E3Jfsq/KubN54RNPkHccI07fKDPMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lya9V/Om; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lya9V/Om"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ag5BzIZ/GCij5dDXl45oisxlVYPSMfrlbrEANbQ09IM=; b=lya9V/Omyb6Dgr9JN6rUl0Zpif
	6c23EYS6bJd3KdCi9AXUvWn3nWTOaJ9IKCV310ErVkk5s5uydlPGm46dLOPNx+EwSx44jQuZJNgpc
	5RCr33uGM1JQ18+ANHONyB3VdlkUqbYwZ+jQMAFwLuce7w/ymKI+RRkB89bueIQhfi/8V2jdoPU2+
	93AtGQt4M+5xM5mddiOQTc0fl21XXrK3WEh9jmmd+3t9Z7+N/pbnZr9ig8LWpjgnbLVnjIbJ0sHeo
	bo9yHyOBXBgG1WrUL7lmMmmbMn4xAnESLoM2CbKQeehHfdtzWrfTT4kSxdJo8HOJ96MR7vSYE2PKG
	eqE5sdPw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAvri-0000000F5gk-2nxz;
	Fri, 02 May 2025 19:16:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 366B73001D4; Fri,  2 May 2025 21:16:06 +0200 (CEST)
Date: Fri, 2 May 2025 21:16:06 +0200
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
Message-ID: <20250502191606.GC24078@noisy.programming.kicks-ass.net>
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
> +}

So this one seemed unused, deleted it and

> +/*
> + * futex_wait2() - block on uaddr with optional timeout
> + * @val:	Expected value
> + * @flags:	FUTEX2 flags
> + * @timeout:	Relative timeout
> + * @clockid:	Clock id for the timeout
> + */
> +static inline int futex2_wait2(void *uaddr, long val, unsigned int flags,
> +			      struct timespec *timeout, clockid_t clockid)
> +{
> +	return syscall(__NR_futex_wait, uaddr, val, 1, flags, timeout, clockid);
> +}

renamed this one.

> +/*
> + * futex2_wake() - Wake a number of futexes
> + * @nr:		Number of threads to wake at most
> + * @flags:	FUTEX2 flags
> + */
> +static inline int futex2_wake(void *uaddr, int nr, unsigned int flags)
> +{
> +	return syscall(__NR_futex_wake, uaddr, 1, nr, flags);
> +}

Next question; you're setting bitmask to 1 instead of
FUTEX_BITSET_MATCH_ANY, which is the default value.

I'm going to make it ~0U unless you have a reason for this 1.
