Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E88E22578E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189137; cv=none; b=uGvx/2STllfpDQkPgYM6/cTn61RcSeNodbp6yCMUZ9+2b3H1oTJ44Uh29bhNA2lPiUrs9uxr6GtrYxczJHyCWzLD1aJXZE2u6Vlcnkd5DXBSwnlZ0+xmY0D3kN7ltRtMtSnJCbPQLbsS7D4Nn0IkDVCUyoI5o1Y5GbU5plVMg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189137; c=relaxed/simple;
	bh=JVYzedpcdZkALjv9t1HlOzlBf8Ceni2gYptb8/R82ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6w6dFwFqCqExwB24Yl3Ys1DiCrCyUi0yS74YNoUOjN+OI3Gbfze8nU4LLXBnOnyaC1mA6BsrPPrEXvqNJ1Ym345ipuTY/aJ78jUkEgkuFADPfnGk7Gi+zO/iSwFYtO2xuof/erOLFkEVt4jE7rZ9CdKfDi89ElnTOujnP7DU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 408A21BC0;
	Mon, 10 Feb 2025 04:05:57 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44E13F5A1;
	Mon, 10 Feb 2025 04:05:28 -0800 (PST)
Date: Mon, 10 Feb 2025 12:05:26 +0000
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
Subject: Re: [PATCH -next v5 10/22] entry: Add
 arch_irqentry_exit_need_resched() for arm64
Message-ID: <Z6nrhhtTKQpScUd0@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-11-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-11-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:32PM +0800, Jinjie Ruan wrote:
> ARM64 requires an additional check whether to reschedule on return
> from interrupt.
> 
> Add arch_irqentry_exit_need_resched() as the default NOP
> implementation and hook it up into the need_resched() condition in
> raw_irqentry_exit_cond_resched().
> 
> This allows ARM64 to implement the architecture specific version for
> switching over to the generic entry code.

Please fold this into the earlier changes in this area mad over patches
6 to 8.

> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  kernel/entry/common.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index b82032777310..4aa9656fa1b4 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
>  	return ret;
>  }
>  
> +/**
> + * arch_irqentry_exit_need_resched - Architecture specific need resched function
> + *
> + * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
> + * Defaults return true.
> + *
> + * The main purpose is to permit arch to skip preempt a task from an IRQ.
> + */
> +static inline bool arch_irqentry_exit_need_resched(void);
> +
> +#ifndef arch_irqentry_exit_need_resched
> +static inline bool arch_irqentry_exit_need_resched(void) { return true; }
> +#endif
> +
>  void raw_irqentry_exit_cond_resched(void)
>  {
>  	if (!preempt_count()) {
> @@ -149,7 +163,7 @@ void raw_irqentry_exit_cond_resched(void)
>  		rcu_irq_exit_check_preempt();
>  		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
>  			WARN_ON_ONCE(!on_thread_stack());
> -		if (need_resched())
> +		if (need_resched() && arch_irqentry_exit_need_resched())
>  			preempt_schedule_irq();
>  	}
>  }
> -- 
> 2.34.1
> 
