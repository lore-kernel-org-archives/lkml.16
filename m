Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2301F8676
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750091854; cv=none; b=I/qnO8nI8DekCqIsGYGxjd91e8fa2SGfxceVRvSrWEjxONoGKhFqHgIyz/DV+HHMevyrdP+VxRkZN3jcW9mAsVZk1NyL3a7SFDX4Dz55t1VXVhuQeTWdgXESh5krGXm7Li0eMlSEE6Cv3WLA/+Ih+VJiQPuE5V86Pn6SARn8t9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750091854; c=relaxed/simple;
	bh=x4t+MvDwLAU2Nq2/1sPa8kbPV4XxyiEbaytSzs1ay+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IelDJEvEM2DTd0fkWRRy7aq5c/o4j4wJig2cIHWhDqhNieMh0sN831y/EHtWItEfPEXX3IufVzVFw844nr89WxbhZcnRMbHsAySebkl3LvkCOvrBIizseLl7m8rIpv2xMYDgMqk5f68LOy32Dhi6cqbQlTWN0BzR66f7akxkrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79D8C1424;
	Mon, 16 Jun 2025 09:37:10 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6007F3F673;
	Mon, 16 Jun 2025 09:37:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:37:19 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, catalin.marinas@arm.com,
	will@kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, maddy@linux.ibm.com, tglx@linutronix.de,
	bigeasy@linutronix.de, vschneid@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] sched: preempt: Move dynamic keys into kernel/sched
Message-ID: <aFBIPxOGbWfTCWLm@J2N7QTR9R3>
References: <20250610075344.1379597-1-sshegde@linux.ibm.com>
 <20250610075344.1379597-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610075344.1379597-2-sshegde@linux.ibm.com>

On Tue, Jun 10, 2025 at 01:23:44PM +0530, Shrikanth Hegde wrote:
> Dynamic preemption can be static key or static call based.
> Static key is used to check kernel preemption depending on
> the current preemption model. i.e enable for lazy, full. 
> 
> Code is spread currently across entry/common.c, arm64 and latest being
> powerpc. There is little arch specific to it. For example, arm64,
> powerpc does the same thing. It is better to move it into kernel/sched 
> since preemption is more closely associated with scheduler.  
> 
> Plus, Any new arch that wants dynamic preemption enabled need to have 
> only HAVE_PREEMPT_DYNAMIC_KEY. 
> 
> This is more of code movement. No functional change. 
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

I've tested this on arm64 atop v6.16-rc2, building and booting defconfig
and defconfig + PREEMPT_DYNAMIC=y.

It builds cleanly, boots fine, and I think this is obviously correct
given it's just moving things around, so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Catalin, Will, are you happy with this?

I assume this would go via the tip tree?

Mark.

> ---
>  arch/arm64/include/asm/preempt.h   |  1 -
>  arch/arm64/kernel/entry-common.c   |  8 --------
>  arch/powerpc/include/asm/preempt.h | 16 ----------------
>  arch/powerpc/kernel/interrupt.c    |  4 ----
>  include/linux/entry-common.h       |  1 -
>  include/linux/sched.h              |  8 ++++++++
>  kernel/entry/common.c              |  1 -
>  kernel/sched/core.c                |  4 ++++
>  8 files changed, 12 insertions(+), 31 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/preempt.h
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f..a9348e65d75e 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -87,7 +87,6 @@ void preempt_schedule_notrace(void);
>  
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_preempt_schedule(void);
>  #define __preempt_schedule()		dynamic_preempt_schedule()
>  void dynamic_preempt_schedule_notrace(void);
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..b1c854fb4884 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -259,14 +259,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs)
>  		lockdep_hardirqs_on(CALLER_ADDR0);
>  }
>  
> -#ifdef CONFIG_PREEMPT_DYNAMIC
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
> -#endif
> -
>  static void __sched arm64_preempt_schedule_irq(void)
>  {
>  	if (!need_irq_preemption())
> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
> deleted file mode 100644
> index 000e2b9681f3..000000000000
> --- a/arch/powerpc/include/asm/preempt.h
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __ASM_POWERPC_PREEMPT_H
> -#define __ASM_POWERPC_PREEMPT_H
> -
> -#include <asm-generic/preempt.h>
> -
> -#if defined(CONFIG_PREEMPT_DYNAMIC)
> -#include <linux/jump_label.h>
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#define need_irq_preemption() \
> -	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> -#else
> -#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
> -#endif
> -
> -#endif /* __ASM_POWERPC_PREEMPT_H */
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index e0c681d0b076..4d62d785ad26 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -25,10 +25,6 @@
>  unsigned long global_dbcr0[NR_CPUS];
>  #endif
>  
> -#if defined(CONFIG_PREEMPT_DYNAMIC)
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#endif
> -
>  #ifdef CONFIG_PPC_BOOK3S_64
>  DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>  static inline bool exit_must_hard_disable(void)
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index f94f3fdf15fc..8624faa1f8b9 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -549,7 +549,6 @@ void raw_irqentry_exit_cond_resched(void);
>  DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
>  #define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
>  #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> -DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_irqentry_exit_cond_resched(void);
>  #define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
>  #endif
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 45e5953b8f32..ebd230382027 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2115,6 +2115,14 @@ static inline int _cond_resched(void)
>  
>  #endif /* !CONFIG_PREEMPTION || CONFIG_PREEMPT_DYNAMIC */
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#define need_irq_preemption() \
> +	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> +#else
> +#define need_irq_preemption()   (IS_ENABLED(CONFIG_PREEMPTION))
> +#endif
> +
>  #define cond_resched() ({			\
>  	__might_resched(__FILE__, __LINE__, 0);	\
>  	_cond_resched();			\
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index a8dd1f27417c..b8ffd7127338 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -268,7 +268,6 @@ void raw_irqentry_exit_cond_resched(void)
>  #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
>  DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
>  #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>  void dynamic_irqentry_exit_cond_resched(void)
>  {
>  	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 62b3416f5e43..6af2bab187cb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -7083,6 +7083,10 @@ EXPORT_SYMBOL(dynamic_preempt_schedule_notrace);
>  
>  #endif /* CONFIG_PREEMPTION */
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#endif
> +
>  /*
>   * This is the entry point to schedule() from kernel preemption
>   * off of IRQ context.
> -- 
> 2.43.0
> 
