Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7CD1F3D3E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188341; cv=none; b=Wk6kVGqvJV38c6txwblARwSiTOLRuOf9+qiwlWrhK6gRw4igijgnAMYHrk0hz2GnHC+Wa3Gis7SgkTVHTpDsUDCNtsidrhCepMryMjQeA4dV6AXGWSLHnFLIO5ghh7dCCI0pfa05mSgNlRUG73QAqjH2PySGC8jXQ52yzX3brgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188341; c=relaxed/simple;
	bh=xOhQ+fdNe3wr9Cj1c0JEMx45J1exZqq3GdSRvhhhabY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3uV4furZXbNoXGM6AEXfHDA2h7cevqvSo7CGZK73/cPYfnHQ8pl5lX846UyucE5MbAogc3W8KNXnO0oGEuAst1B2ZYTHq08mG9lqerm0yAUK1ZyL3QJkuets5wZmZsJgbfa1f8NqNzawy3b2JngcZWanRZu/nijAQi9Lef1mHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AAF1424;
	Mon, 10 Feb 2025 03:52:40 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19BC3F5A1;
	Mon, 10 Feb 2025 03:52:11 -0800 (PST)
Date: Mon, 10 Feb 2025 11:52:09 +0000
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
Subject: Re: [PATCH -next v5 07/22] arm64: entry: preempt_schedule_irq() only
 if PREEMPTION enabled
Message-ID: <Z6noaWUwn4uCeNN3@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-8-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-8-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:29PM +0800, Jinjie Ruan wrote:
> The generic entry check PREEMPTION for both PREEMPT_DYNAMIC
> enabled and PREEMPT_DYNAMIC disabled.
> 
> Whether PREEMPT_DYNAMIC enabled or not, PREEMPTION should
> be enabled to allow reschedule before EL1 exception return, so
> move PREEMPTION check ahead in preparation for moving arm64 over
> to the generic entry code.

This is just moving the IS_ENABLED() check. It'd be clearer to say
something like "hoist the IS_ENABLED() check earlier", but equally we
could do that earleir in the series by folding this into the prior
patch.

Mark.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 80b47ca02db2..029f8bd72f8a 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -109,9 +109,6 @@ void raw_irqentry_exit_cond_resched(void)
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>  		return;
> -#else
> -	if (!IS_ENABLED(CONFIG_PREEMPTION))
> -		return;
>  #endif
>  
>  	if (!preempt_count()) {
> @@ -142,7 +139,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		raw_irqentry_exit_cond_resched();
> +		if (IS_ENABLED(CONFIG_PREEMPTION))
> +			raw_irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 
