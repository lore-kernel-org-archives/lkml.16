Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53E419342F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187615; cv=none; b=Y5EjbIbF8OhT38COIDsBp/TZxIyEP2NGz+lZDfB2DORmhn7ktOy6yaM3U2vbw95oTph0VFaQ/gPY+k2MunreAVl+yzADPMSmscXGGecBbaSbMQBL/RecDPDmt4rH7EShVeYZcR1yAb7t/65TngZVgI2xeLXyyi2XehOplkB+RUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187615; c=relaxed/simple;
	bh=qezRuAIBrBFcI9KEUzjTRRq13g/Om3B705dyWQQzesY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPQE0oMmSVtOy7FYkpzl+0glzPe0vh9kyhdlfXdpvM5rJogBMbPqu4VXIusQ4h59TrvS545xkixzv4DNQeWX+mGZuAuk5aEc4QOxuA5olEDIm3qL2uBSqwO8mQOjlf/KmZ7CWxUP90JLxMX1/UizV/OFOAbusuqQ2GvvIiqhEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5354F1424;
	Mon, 10 Feb 2025 03:40:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C3A3F5A1;
	Mon, 10 Feb 2025 03:40:05 -0800 (PST)
Date: Mon, 10 Feb 2025 11:40:03 +0000
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
Subject: Re: [PATCH -next v5 05/22] arm64: entry: Use preempt_count() and
 need_resched() helper
Message-ID: <Z6nlkyxAZEtY_M7T@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-6-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:27PM +0800, Jinjie Ruan wrote:
> The generic entry code uses preempt_count() and need_resched() helpers to
> check if it is time to resched. Currently, arm64 use its own check logic,
> that is "READ_ONCE(current_thread_info()->preempt_count == 0", which is
> equivalent to "preempt_count() == 0 && need_resched()".

Hmm. The existing code relies upon preempt_fold_need_resched() to work
correctly. If we want to move from:

	READ_ONCE(current_thread_info()->preempt_count) == 0

... to:

	!preempt_count() && need_resched()

... then that change should be made *before* we change the preemption
logic to preempt non-IRQ exceptions in patch 3. Otherwise, that logic is
consuming stale data most of the time.

Mark.

> In preparation for moving arm64 over to the generic entry code, use
> these helpers to replace arm64's own code and move it ahead.
> 
> No functional changes.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index da68c089b74b..efd1a990d138 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -88,14 +88,6 @@ static inline bool arm64_need_resched(void)
>  	if (!need_irq_preemption())
>  		return false;
>  
> -	/*
> -	 * Note: thread_info::preempt_count includes both thread_info::count
> -	 * and thread_info::need_resched, and is not equivalent to
> -	 * preempt_count().
> -	 */
> -	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
> -		return false;
> -
>  	/*
>  	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
>  	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> @@ -141,8 +133,10 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		if (arm64_need_resched())
> -			preempt_schedule_irq();
> +		if (!preempt_count() && need_resched()) {
> +			if (arm64_need_resched())
> +				preempt_schedule_irq();
> +		}
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 
