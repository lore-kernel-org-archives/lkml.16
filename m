Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6D1AF4D5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868465; cv=none; b=oFUijMl0VD4TwHNCyMEXz0Jsoy9Uo0Jmn0M4pw1p4O3mYkS2h2Evil+GIAZ3FqCiN4V9LRj14lc/UyyefysTZXYoUHM4mQK2xIFc6zNLawBcqmoTL536uh2xrX5WR/wQg6NqrURNfxrAKS6Ua8iGsthhrKOsq7k7vwcQE1NgJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868465; c=relaxed/simple;
	bh=HW3Z90l7RNBksiCHnADYX0xsQ1oyiXxM4OgllXOR9NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFROqv+a6cnWQmxDn9YEGYf8T5XvaH+Z37pruawhaC6xkj42n2GeXKH1FLAbFQqheepDIL5CjRxlOgKgE50O0LAsVDCVusvMNJw3DNxi6Y0MQtsmVrbc6MmFnEp81+NU/qMmxVYzacWl+z3Dy1i6ZKwtNfXfWsvlUJOzqSwsSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqZqdg19; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqZqdg19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B763C4CEEB;
	Mon,  2 Jun 2025 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868465;
	bh=HW3Z90l7RNBksiCHnADYX0xsQ1oyiXxM4OgllXOR9NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqZqdg19cTQfnr3uMJSzkWMJI11jMh9dsJ72dji6DqM43sBlwThnQuG9afVGw6mFq
	 oDGJN2F2kJL9QibiX49oi7WfgDzBtizvE2MQCoXV9NTeYhhBcqvwfLuRceoft7dEn+
	 auQmA3lF+wnjyK9uqJ60dfprBsEdpDbdbCLWwNTNs57GUtzwyVZkr4yodlKj/ksKxW
	 WxvDspEtJXk1p3hktrgbJdrZjuQ+oBVmF1CTskUbngqJx2rMAUIHVMez/kQwXszSxN
	 qJRI1pv0qTLoVQLDOAYE3UY4W6U2KBQyAhVO5FZ4gmV0fSCTU+J9YM2d97fnEX/zeG
	 ZO1380svXV1LA==
Date: Mon, 2 Jun 2025 13:47:39 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, geert@linux-m68k.org, broonie@kernel.org,
	mcgrof@kernel.org, joey.gouly@arm.com, kristina.martsenko@arm.com,
	rppt@kernel.org, pcc@google.com, bigeasy@linutronix.de,
	ptosi@google.com, mark.rutland@arm.com, james.morse@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ada.coupriediaz@arm.com
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <20250602124738.GD1227@willie-the-truck>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530092723.3307630-1-yeoreum.yun@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

[+Ada]

On Fri, May 30, 2025 at 10:27:23AM +0100, Yeoreum Yun wrote:
> When a kernel thread hits BUG() outside of an interrupt handler and
> panic_on_oops is not set, it exits via make_task_dead(), which is called by die().
> In this case, the nmi_nesting value in context_tracking becomes
> inconsistent because the proper context tracking exit functions are not reached.
> 
> Here’s an example scenario on arm64:
>   1. A kernel thread hits the BUG() macro outside an interrupt handler,
>      and panic_on_oops is not set (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE).
> 
>   2. The exception handler jumps to el1_dbg() and calls arm64_enter_el1_dbg(),
>      which invokes ct_nmi_enter(). (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE + 2)
> 
>   3. bug_handler() runs, and if the bug type is BUG_TRAP_TYPE_BUG, it calls die().
> 
>   4. die() then calls make_task_dead(), which terminates the kernel thread and
>      schedules another task—assume this is the idle_task.

This sounds like there is a genuine imbalance, then, as we're scheduling
in the context of an exception taken from EL1.

>   5. The idle_task attempts to enter the idle state by calling ct_idle_enter().
>      However, since the current ct->nmi_nesting value is CT_NESTING_IRQ_NONIDLE + 2,
>      ct_kernel_exit() triggers a WARN_ON_ONCE() warning.
> 
> Because the kernel thread couldn’t call the appropriate context tracking exit
> function in step 3, the ct->nmi_nesting value remains incorrect.
> This leads to warnings like the following:
> 
> [    7.133093] ------------[ cut here ]------------
> [    7.133129] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:127 ct_kernel
> [    7.134157] Modules linked in:
> [    7.134158]     not ok 62 kasan_strings
> [    7.134280]
> [    7.134506] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G    B D W        N
> [    7.134930] Tainted: [B]=BAD_PAGE, [D]=DIE, [W]=WARN, [N]=TEST
> [    7.135150] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    7.135441] pc : ct_kernel_exit+0xa4/0xb0
> [    7.135656] lr : ct_kernel_exit+0x1c/0xb0
> [    7.135866] sp : ffff8000829bbd90
> [    7.136011] x29: ffff8000829bbd90 x28: ffff80008224ecf0 x27: 0000000000000004
> [    7.136379] x26: ffff80008228ed30 x25: ffff80008228e000 x24: 0000000000000000
> [    7.137016] x23: f3ff000800a52280 x22: 0000000000000000 x21: ffff00087b6c7408
> [    7.137380] x20: ffff80008224b408 x19: 0000000000000005 x18: 0000000000000000
> [    7.137741] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    7.311316] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [    7.311673] x11: 0000000000000000 x10: 0000000000000000 x9 : 4000000000000000
> [    7.312031] x8 : 4000000000000002 x7 : 0000000000000000 x6 : 0000000000000000
> [    7.312387] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [    7.312740] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8007f947c000
> [    7.313096] Call trace:
> [    7.313210]  ct_kernel_exit+0xa4/0xb0 (P)
> [    7.313445]  ct_idle_enter+0x14/0x28
> [    7.313666]  default_idle_call+0x2c/0x60
> [    7.313902]  do_idle+0xec/0x320
> [    7.314104]  cpu_startup_entry+0x40/0x50
> [    7.314331]  secondary_start_kernel+0x120/0x1a0
> 
> This behavior is specific to the arm64 architecture, where ct_nmi_enter()
> is called when handling a debug exception.
> In contrast, on other architectures, ct_nmi_enter() is not called when
> handling BUG().
> (i.e) when handling X86_TRAP_UD via handle_invalid_op(), it doesn't call
> ct_nmi_enter(). so it doesn’t cause any issues
> (While irq_entry_enter() does call ct_nmi_enter() for idle tasks,
> that doesn’t apply to debug exception handling).

It sounds like you're suggesting that we don't update the
context-tracking NMI state for BRK exceptions from EL1, to align
with x86. I think Ada's pending series might make that easier, but then
the patch you propose:

> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 529cff825531..9cf03b9ce691 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -227,8 +227,14 @@ void die(const char *str, struct pt_regs *regs, long err)
> 
>  	raw_spin_unlock_irqrestore(&die_lock, flags);
> 
> -	if (ret != NOTIFY_STOP)
> +	if (ret != NOTIFY_STOP) {
> +#ifdef CONFIG_CONTEXT_TRACKING_IDLE
> +		long nmi_nesting = ct_nmi_nesting();
> +		if (nmi_nesting && nmi_nesting != CT_NESTING_IRQ_NONIDLE)
> +			ct_nmi_exit();
> +#endif

tries to undo the context-tracking when we realise we're going to kill
the task, which feels like a hack.

Will
