Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941663D;
	Fri,  7 Feb 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927401; cv=none; b=M1qmkWGgh2GeZfDaZCvhGc/9+wkn1R+Aw0O4PgBbbpENwslGuhTdXYuyYFMBrS3C2SWotFOS6zGN951fK+bOZWDPCVv5ILv5kUMrdjnto8YJPrBCtSu3Zk8oX3dsfwNVl82NmcXN4gYpBxE3bLeVQNLuTC3y//zXZtjviegKJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927401; c=relaxed/simple;
	bh=rDgXon4XKyyTMnJg1H62oo5N0HIvd7uVkSQLqUIRFiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqfSVplQ42DhXiQxzyqTgXKfMM9Dnpid+RyYw9TQjQmyKrAaxwC8ASKeu+BdAjPqmPi8IXgoyz/tW2AHtjCyZjgiJWAgYgwHkTl2epC++lXNZZwtpUJOQ96B9oK49xTHcRyP9tgpaKulZ5PsHXtKu5vxGNhO0XKDWATcI6++Qhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kwCdosD+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kwCdosD+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PmphW+4DB1a61lgsB8ZJX+ZVNXH/wKdDVQsDZgHKw+8=; b=kwCdosD+cOi+lWLcG4/G/f7npw
	o/MkPTtd35xzntrKkdy+RkjEVf2DfNWenKz5MPzuEtH9Wga/2Cwlkntb3qBVh/3AWzfHnMnoAnxgd
	gi3/SUZ8QZ4Qwg924cL/XaEnKhJ+j06TeooTGECC6kEBaxGPLqeZEFkAC1df+0iGfqA92JmZnGDjT
	UsFKdHKSpNNFFOodHHNFHS/NeQTvD6HbBBKGsskk9aJ9B2b1xMgQvn00T1WrhsYENouDFE/JLbamP
	A/3kWM+OLQ3oOusAjWS00T9vgLJ8w5YewXWPgIVllJwd4PYE6Fb2WwD3ZrMzLwnlKjp2yKMSiKMs5
	QMxv8n1Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMS0-00000007hoU-1DCe;
	Fri, 07 Feb 2025 11:23:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2DC3D300310; Fri,  7 Feb 2025 12:23:11 +0100 (CET)
Date: Fri, 7 Feb 2025 12:23:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	bibo mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Frederic Weisbecker <frederic@kernel.org>,
	Youling Tang <tangyouling@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] loongson: Fix idle VS timer enqueue
Message-ID: <20250207112311.GE7145@noisy.programming.kicks-ass.net>
References: <20250206162922.3028861-1-marco.crivellari@suse.com>
 <20250206162922.3028861-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206162922.3028861-2-marco.crivellari@suse.com>

On Thu, Feb 06, 2025 at 05:29:22PM +0100, Marco Crivellari wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Loongson re-enables interrupts on its idle routine and performs a
> TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.
> 
> The IRQs firing between the check and the idling instruction may set the
> TIF_NEED_RESCHED flag. In order to deal with the such a race, IRQs
> interrupting __arch_cpu_idle() rollback their return address to the
> beginning of __arch_cpu_idle() so that TIF_NEED_RESCHED is checked
> again before going back to sleep.
> 
> However idle IRQs can also queue timers that may require a tick
> reprogramming through a new generic idle loop iteration but those timers
> would go unnoticed here because __arch_cpu_idle() only checks
> TIF_NEED_RESCHED. It doesn't check for pending timers.
> 
> Fix this with fast-forwarding idle IRQs return value to the end of the
> idle routine instead of the beginning, so that the generic idle loop
> handles both TIF_NEED_RESCHED and pending timers.
> 
> Fixes: 0603839b18f4 ("LoongArch: Add exception/interrupt handling")
> Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>

Feel free to make that:

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>


> Cc: WANG Xuerui <kernel@xen0n.name>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  arch/loongarch/kernel/genex.S | 33 +++++++++++++++++++--------------
>  arch/loongarch/kernel/idle.c  |  3 +--
>  arch/loongarch/kernel/reset.c | 23 ++++++++++++++---------
>  3 files changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
> index 86d5d90ebefe..ab2e9a262ee2 100644
> --- a/arch/loongarch/kernel/genex.S
> +++ b/arch/loongarch/kernel/genex.S
> @@ -18,28 +18,33 @@
>  
>  	.align	5
>  SYM_FUNC_START(__arch_cpu_idle)
> -	/* start of rollback region */
> -	LONG_L	t0, tp, TI_FLAGS
> -	nop
> -	andi	t0, t0, _TIF_NEED_RESCHED
> -	bnez	t0, 1f
> -	nop
> -	nop
> -	nop
> +	/* start of idle interrupt region */
> +	li.w	t0, CSR_CRMD_IE
> +	/* idle instruction needs irq enabled */
> +	csrxchg	t0, t0, LOONGARCH_CSR_CRMD
> +	/*
> +	 * If an interrupt lands here; between enabling interrupts above and
> +	 * going idle on the next instruction, we must *NOT* go idle since the
> +	 * interrupt could have set TIF_NEED_RESCHED or caused an timer to need
> +	 * reprogramming. Fall through -- see handle_vint() below -- and have
> +	 * the idle loop take care of things.
> +	 */
>  	idle	0
> -	/* end of rollback region */
> -1:	jr	ra
> +	nop
> +	/* end of idle interrupt region */
> +SYM_INNER_LABEL(__arch_cpu_idle_exit, SYM_L_LOCAL)
> +	jr	ra
>  SYM_FUNC_END(__arch_cpu_idle)
>  
>  SYM_CODE_START(handle_vint)
>  	UNWIND_HINT_UNDEFINED
>  	BACKUP_T0T1
>  	SAVE_ALL
> -	la_abs	t1, __arch_cpu_idle
> +	la_abs	t1, __arch_cpu_idle_exit
>  	LONG_L	t0, sp, PT_ERA
> -	/* 32 byte rollback region */
> -	ori	t0, t0, 0x1f
> -	xori	t0, t0, 0x1f
> +	/* 16 byte idle interrupt region */
> +	ori	t0, t0, 0x0f
> +	addi.d	t0, t0, 1
>  	bne	t0, t1, 1f
>  	LONG_S	t0, sp, PT_ERA
>  1:	move	a0, sp
> diff --git a/arch/loongarch/kernel/idle.c b/arch/loongarch/kernel/idle.c
> index 0b5dd2faeb90..54b247d8cdb6 100644
> --- a/arch/loongarch/kernel/idle.c
> +++ b/arch/loongarch/kernel/idle.c
> @@ -11,7 +11,6 @@
>  
>  void __cpuidle arch_cpu_idle(void)
>  {
> -	raw_local_irq_enable();
> -	__arch_cpu_idle(); /* idle instruction needs irq enabled */
> +	__arch_cpu_idle();
>  	raw_local_irq_disable();
>  }
> diff --git a/arch/loongarch/kernel/reset.c b/arch/loongarch/kernel/reset.c
> index 1ef8c6383535..d78e8a1064a1 100644
> --- a/arch/loongarch/kernel/reset.c
> +++ b/arch/loongarch/kernel/reset.c
> @@ -20,6 +20,11 @@
>  void (*pm_power_off)(void);
>  EXPORT_SYMBOL(pm_power_off);
>  
> +static __always_inline void native_halt(void)
> +{
> +	asm volatile("idle 0" : : : "memory");
> +}
> +
>  void machine_halt(void)
>  {
>  #ifdef CONFIG_SMP
> @@ -32,9 +37,9 @@ void machine_halt(void)
>  	pr_notice("\n\n** You can safely turn off the power now **\n\n");
>  	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>  
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>  }
>  
>  void machine_power_off(void)
> @@ -52,9 +57,9 @@ void machine_power_off(void)
>  	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
>  #endif
>  
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>  }
>  
>  void machine_restart(char *command)
> @@ -73,7 +78,7 @@ void machine_restart(char *command)
>  	if (!acpi_disabled)
>  		acpi_reboot();
>  
> -	while (true) {
> -		__arch_cpu_idle();
> -	}
> +	while (1) {
> +		native_halt();
> +	};
>  }
> -- 
> 2.48.1
> 
