Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C092D1957FF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187199; cv=none; b=ChW79cs8G/6xmJ2VWaxETy+WCt+S58/hhFRGk2HQLlrdq18bMFsiLrdkZzTGdgEuzgVMw9MeixcS2lDDQLUURRkvDvHsjwZXEee3pRiMABXNwAg1aERkudI0azfQa8ZMNmgEQr0TTkrdUu18ldyyWBmxAqGIQEF8fK+cF/FrQ3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187199; c=relaxed/simple;
	bh=5/17RId6uUeNYmgqg757mgbxlgrWCyfGRDCPBd+59OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAEqOqegbkb1lkoQ/UOSk0iirYoGwhn7VKhO8fW6fyqpY2skSy1F7fAK9MlNDZZ2YL1qdtgH+KYwozQa67Xm0xXNkFx2FFxGMMA30RfQ4iXSW39HZkGcanQj17S5ptdd+9awQUP0z5uo2Knps0ho7pWi8k8cpoIe0c04uLDo72U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95BD41007;
	Mon, 10 Feb 2025 03:33:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DC243F5A1;
	Mon, 10 Feb 2025 03:33:09 -0800 (PST)
Date: Mon, 10 Feb 2025 11:33:07 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 04/22] arm64: entry: Rework
 arm64_preempt_schedule_irq()
Message-ID: <Z6nj81GG_dLOzozI@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-5-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:26PM +0800, Jinjie Ruan wrote:
> The generic entry do preempt_schedule_irq() by checking if need_resched()
> satisfied, but arm64 has some of its own additional checks such as
> GIC priority masking.
> 
> In preparation for moving arm64 over to the generic entry code, rework
> arm64_preempt_schedule_irq() to check whether it need resched in a check
> function called arm64_need_resched().

I think what this is saying is that the generic entry code has the form:

| raw_irqentry_exit_cond_resched()
| {
| 	if (!preempt_count()) {
| 		...
| 		if (need_resched())
| 			preempt_schedule_irq();
| 	}
| }

... but it's not obvious why it's better to have and
arm64_need_resched() rather than a arm64_preempt_schedule_irq().

Having some idea of the change you intend to make to the generic code
would be helpful, and/or that generic change should be made earlier as a
preparatory patch.

Mark.

> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7a588515ee07..da68c089b74b 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -83,10 +83,10 @@ DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  #define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
>  
> -static void __sched arm64_preempt_schedule_irq(void)
> +static inline bool arm64_need_resched(void)
>  {
>  	if (!need_irq_preemption())
> -		return;
> +		return false;
>  
>  	/*
>  	 * Note: thread_info::preempt_count includes both thread_info::count
> @@ -94,7 +94,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * preempt_count().
>  	 */
>  	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return;
> +		return false;
>  
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> @@ -103,7 +103,7 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * DAIF we must have handled an NMI, so skip preemption.
>  	 */
>  	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> -		return;
> +		return false;
>  
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
> @@ -113,8 +113,10 @@ static void __sched arm64_preempt_schedule_irq(void)
>  	 * Only allow a task to be preempted once cpufeatures have been
>  	 * enabled.
>  	 */
> -	if (system_capabilities_finalized())
> -		preempt_schedule_irq();
> +	if (!system_capabilities_finalized())
> +		return false;
> +
> +	return true;
>  }
>  
>  /*
> @@ -139,7 +141,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		arm64_preempt_schedule_irq();
> +		if (arm64_need_resched())
> +			preempt_schedule_irq();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 
