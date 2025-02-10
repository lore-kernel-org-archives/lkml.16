Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A5528E7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190277; cv=none; b=HnbBQmtQrIG2vrqLngMLquIJuBbraiEIJ+AZ1K8dBrdUB9wn0snmxi7oDaamjvjEA8xZH7irI3urupQrFsC9pKPu2KWwQW294TK/0SqUgW0HDBWE291kPOnWtZBqmjeM0OyNZ2SczexAtI/5AOqX9BGIx57Eo2bLwEZWum/F9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190277; c=relaxed/simple;
	bh=Kqrhr0Wgy/5YQg27ZGajKoNYJmIjcLnr92DzfXT8l8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebFoNML/KBWKsB7K1cXsHDGJNG6TmHzEbWkMfDzO9EvxGg5e2wxKI4590xtSzuxL9YXDjf+1s0AALDDpH5wO8Nu6i3jjbYSFcxm61XoquoM3NcSIszyDeJIPii7VaXQMGI7PdKTSWFLqdQy0Z+d2EwFgnwsBNnX0LJs+xFqks1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458241BA8;
	Mon, 10 Feb 2025 04:24:55 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C70A93F5A1;
	Mon, 10 Feb 2025 04:24:26 -0800 (PST)
Date: Mon, 10 Feb 2025 12:24:21 +0000
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
Subject: Re: [PATCH -next v5 11/22] arm64: entry: Switch to generic IRQ entry
Message-ID: <Z6nv9SLi0za8tE69@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-12-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-12-ruanjinjie@huawei.com>

On Fri, Dec 06, 2024 at 06:17:33PM +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> to use the generic entry infrastructure from kernel/entry/*.
> The generic entry makes maintainers' work easier and codes
> more elegant.
> 
> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
> LOC, and it will switch to generic entry completely later. Switch to
> generic entry in two steps according to Mark's suggestion will make
> it easier to review.
> 
> The changes are below:
>  - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>    irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>    and wrap with generic enter_from/exit_to_user_mode() because they
>    are exactly the same so far.
> 
>  - Remove arm64_enter/exit_nmi() and use generic irqentry_nmi_enter/exit()
>    because they're exactly the same, so the temporary arm64 version
>    irqentry_state can also be removed.
> 
>  - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>    if arm64 implement arch_irqentry_exit_need_resched().
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/Kconfig                    |   1 +
>  arch/arm64/include/asm/entry-common.h |  64 ++++++
>  arch/arm64/include/asm/preempt.h      |   6 -
>  arch/arm64/kernel/entry-common.c      | 307 ++++++--------------------
>  arch/arm64/kernel/signal.c            |   3 +-
>  5 files changed, 129 insertions(+), 252 deletions(-)
>  create mode 100644 arch/arm64/include/asm/entry-common.h

Superficially this looks nice, but to be clear I have *not* looked at
this in great detail; minor comments below.

[...]

> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> +						  unsigned long ti_work)
> +{
> +	local_daif_mask();
> +}
> +
> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare

I'm a little worried that this may be fragile having been hidden in the
common code, as it's not clear exactly when this will occur during the
return sequence, and the ordering requirements could easily be broken by
refactoring there.

I suspect we'll want to pull this later in the arm64 exit sequence so
that we can have it explicit in entry-common.c.

[...]

> index 14ac6fdb872b..84b6628647c7 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -9,6 +9,7 @@
>  #include <linux/cache.h>
>  #include <linux/compat.h>
>  #include <linux/errno.h>
> +#include <linux/irq-entry-common.h>
>  #include <linux/kernel.h>
>  #include <linux/signal.h>
>  #include <linux/freezer.h>
> @@ -1603,7 +1604,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
>   * the kernel can handle, and then we build all the user-level signal handling
>   * stack-frames in one go after that.
>   */
> -void do_signal(struct pt_regs *regs)
> +void arch_do_signal_or_restart(struct pt_regs *regs)
>  {
>  	unsigned long continue_addr = 0, restart_addr = 0;
>  	int retval = 0;

Is the expected semantic the same here, or is those more than just a
name change?

Mark.
