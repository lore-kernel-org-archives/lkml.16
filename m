Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFB01F3BA8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188143; cv=none; b=amKH+LDMG+mEz87CcR6LbNJGxoQg0mgkvRl7my1VDL/eyXv5zXu7Pc795LNdoiud3B5/2iaLl8KhoeI0QamsnqBRQfsQVdzexjztP+eJl18WFB/PT0c08u+iqlMWkDqn20JyiY7Vl0JVSqjffoSOomDNbRReNtS9JZfDxG8IMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188143; c=relaxed/simple;
	bh=agNU50GObrX2tseacOlJ8ke2fRnXg5Qt4qTZibWZMys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TP7pUoP5M0vRzo5bhVd0FOZlNkOg8l4TDZ4Ba94SBvayTXjzJ58nMuI73Eu8yOE4Iw0ums6BrtANTGNTprfBGUziJZ8ERM/Ak3aHm9ADF1lHRDLhfLpXERSJ+HKDH5aWh5ywIg/opo1stI0FgCA9jt8tUOBmmWDclIUw4Fdxz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D1B41424;
	Mon, 10 Feb 2025 03:49:22 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4A63F5A1;
	Mon, 10 Feb 2025 03:48:53 -0800 (PST)
Date: Mon, 10 Feb 2025 11:48:51 +0000
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
Subject: Re: [PATCH -next v5 06/22] arm64: entry: Expand the
 need_irq_preemption() macro ahead
Message-ID: <Z6nno7db_6iOYkT2@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-7-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-7-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:28PM +0800, Jinjie Ruan wrote:
> The generic entry has the same logic as need_irq_preemption()
> macro and use a helper function to check other resched condition.
> 
> In preparation for moving arm64 over to the generic entry code,
> check and expand need_irq_preemption() ahead and extract arm64 resched
> check code to a helper function.

I think this is just saying that the goal is to align the structure of
the code with raw_irqentry_exit_cond_resched() from the generic entry
code.

It'd be a bit clearer to say that, and to do this *before* moving the
call into __exit_to_kernel_mode().

Mark.

> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/preempt.h |  1 +
>  arch/arm64/kernel/entry-common.c | 28 +++++++++++++++++-----------
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f..d0f93385bd85 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
>  void preempt_schedule(void);
>  void preempt_schedule_notrace(void);
>  
> +void raw_irqentry_exit_cond_resched(void);
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  
>  DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index efd1a990d138..80b47ca02db2 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -77,17 +77,10 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
>  
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
>  #endif
>  
>  static inline bool arm64_need_resched(void)
>  {
> -	if (!need_irq_preemption())
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -111,6 +104,22 @@ static inline bool arm64_need_resched(void)
>  	return true;
>  }
>  
> +void raw_irqentry_exit_cond_resched(void)
> +{
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +		return;
> +#else
> +	if (!IS_ENABLED(CONFIG_PREEMPTION))
> +		return;
> +#endif
> +
> +	if (!preempt_count()) {
> +		if (need_resched() && arm64_need_resched())
> +			preempt_schedule_irq();
> +	}
> +}
> +
>  /*
>   * Handle IRQ/context state management when exiting to kernel mode.
>   * After this function returns it is not safe to call regular kernel code,
> @@ -133,10 +142,7 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		if (!preempt_count() && need_resched()) {
> -			if (arm64_need_resched())
> -				preempt_schedule_irq();
> -		}
> +		raw_irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 
