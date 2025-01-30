Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350301DDD1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248853; cv=none; b=Rl7N7/tFbTWRqKtJlVPsejU5zyZNX+2egx85E1l+GhffMfb3jmFCEaVcckjzs519lT4qCAkjh0Iyb966e8+2ACDjJ4EYzp7LGQcTiW5m035jlVaL05XT7JvNIp/E/iBOthU9a7EuwGdG/oPyduZ1kGkWsWdA6RGIzJiRj0+hQ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248853; c=relaxed/simple;
	bh=NevGpmdmE5bakoAlAAq6wIM1jNqOsQrJugzNRuqpePw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ1f4kzWK0Kvu31IZgyyw5uwiNQWc/n939f2R9mGCIvBf2INm0h6E4ADc2IzLNmT7CTYmzZL3hpj70YfCOFdhZQQ4Wc+8tTnod5H/LvZlgem6JEWN1EhWC9iWbkx0SUAh4rJc3QqB5wbMFICKXOq3R7COr2hbRl2ichmBqCjdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CCHH87qT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r/Dszy6a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CCHH87qT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r/Dszy6a"
Date: Thu, 30 Jan 2025 15:54:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738248850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWMw4aDNMt361EsCHVNvPU7UiHMTHVWLVcti5oKqreE=;
	b=CCHH87qT5uCIW/N0OxMeFKBSmGr8veG9wkdBtfe21MGlFEiUA2HWAQlDDBWgUEPl8urxNE
	xIQVO+cwUDhUIBrUDjYCiphdDwjKTEKezbSftd94ot2UXGTefU4+UlNO43FuvBQArVo7W3
	GbjLvhnccAwcMnoFP+yRtfEqW/XjzE9ORstzTjVppYaaz8xQXz8+vWMyHEKWAagy0krijo
	GMf9UH3HbkyTGf+HjBBncec9xngiXlkxIjSPhXksjfXFUfeazn1MeFAMKp6vl++H0R0VKl
	tkFy3X8gK8UHppNiyUzQnKDi8UnzC586B6XL9wsPOovn54c7JzCrnFCvbQmf6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738248850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWMw4aDNMt361EsCHVNvPU7UiHMTHVWLVcti5oKqreE=;
	b=r/Dszy6agS6EyceeKfZ9vueiKkyHGnMG5SYufs7wflS1KMOqNHMttXFFWzpNwdE3qiYW+v
	A+tLzwyFgbbSmPBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130145409.D_so_mR1@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106051919.55020-2-sshegde@linux.ibm.com>

On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -25,6 +25,10 @@
>  unsigned long global_dbcr0[NR_CPUS];
>  #endif
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#endif

I am uncertain here: Do you need to DEFINE it? It is set by the sched
core which also defines it. It should be same thing after all, right?

> +
>  #ifdef CONFIG_PPC_BOOK3S_64
>  DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>  static inline bool exit_must_hard_disable(void)
> @@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>  		/* Returning to a kernel context with local irqs enabled. */
>  		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>  again:
> -		if (IS_ENABLED(CONFIG_PREEMPTION)) {
> +		if (preempt_model_preemptible()) {

CONFIG_HAVE_PREEMPT_DYNAMIC_KEY is the only option, right? Wouldn't

| #DEFINE need_irq_preemption() \
|          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
| 
| 	if (need_irq_preemption()) {

be a bit smaller/ quicker? This could be a fast path ;)

>  			/* Return to preemptible kernel context */
>  			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>  				if (preempt_count() == 0)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index edf5cabe5dfd..2556fa8ec019 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>  	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>  	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>  	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       preempt_model_none()      ? "none" :
> +	       preempt_model_voluntary() ? "voluntary" :
> +	       preempt_model_full()      ? "full" :
> +	       preempt_model_lazy()      ? "lazy" :
> +	       "",

So intend to rework this part. I have patches stashed at
	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=preemption_string

which I didn't sent yet due to the merge window. Just a heads up ;)

>  	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>  	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",

Sebastian
