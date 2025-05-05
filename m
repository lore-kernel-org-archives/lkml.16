Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9BB17A318
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433908; cv=none; b=qzLUpNgwHQns6EiDFtNO0huMZ4kBdpimyi/0g0HYJcMfEPZ/QgS7rQnelUQLUJS4ba6aaebDB812VnZgI+L9vJ4yDFqo2Ln13Soxd3yV7tpuw+W63skdILf81KZ/ZBnV4P2oH78zuoBsYjE4zrKRPXf2cTTj8pqK6gEaAFfQfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433908; c=relaxed/simple;
	bh=pCg0wnbWiezuaxpCxgCMdpQXXIXHYITOoYTiLCpTE1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lzhhpp7+SJLal9RHSrhpEgmb47Rznak42Q/3WD09YLq6J+UsdnQux3yiFzAm8TVpa4VJBQIffxe2uCb5OBFvJ80QUryrJtKQgch0VXmBNurzn3NyapUZw5qf0eklaPsrMPdATh8W/B+0+wmkvxv6gjxW5xvAnC3FzGi+BbQVvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 402171007;
	Mon,  5 May 2025 01:31:35 -0700 (PDT)
Received: from [10.163.53.144] (unknown [10.163.53.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A2BD3F5A1;
	Mon,  5 May 2025 01:31:41 -0700 (PDT)
Message-ID: <18525a46-297f-4702-9de2-41afb96b522e@arm.com>
Date: Mon, 5 May 2025 14:01:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Cc: ada.coupriediaz@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250417105253.3188976-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250417105253.3188976-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 16:22, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2

Gentle ping, any updates on this.

> 
>  arch/arm64/include/asm/assembler.h      |  4 ++--
>  arch/arm64/include/asm/debug-monitors.h |  6 ------
>  arch/arm64/kernel/debug-monitors.c      | 22 +++++++++++-----------
>  arch/arm64/kernel/entry-common.c        |  2 +-
>  4 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index ad63457a05c5..f229d96616e5 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -53,7 +53,7 @@
>  	.macro	disable_step_tsk, flgs, tmp
>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>  	mrs	\tmp, mdscr_el1
> -	bic	\tmp, \tmp, #DBG_MDSCR_SS
> +	bic	\tmp, \tmp, #MDSCR_EL1_SS
>  	msr	mdscr_el1, \tmp
>  	isb	// Take effect before a subsequent clear of DAIF.D
>  9990:
> @@ -63,7 +63,7 @@
>  	.macro	enable_step_tsk, flgs, tmp
>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>  	mrs	\tmp, mdscr_el1
> -	orr	\tmp, \tmp, #DBG_MDSCR_SS
> +	orr	\tmp, \tmp, #MDSCR_EL1_SS
>  	msr	mdscr_el1, \tmp
>  9990:
>  	.endm
> diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
> index 8f6ba31b8658..1f37dd01482b 100644
> --- a/arch/arm64/include/asm/debug-monitors.h
> +++ b/arch/arm64/include/asm/debug-monitors.h
> @@ -13,14 +13,8 @@
>  #include <asm/ptrace.h>
>  
>  /* Low-level stepping controls. */
> -#define DBG_MDSCR_SS		(1 << 0)
>  #define DBG_SPSR_SS		(1 << 21)
>  
> -/* MDSCR_EL1 enabling bits */
> -#define DBG_MDSCR_KDE		(1 << 13)
> -#define DBG_MDSCR_MDE		(1 << 15)
> -#define DBG_MDSCR_MASK		~(DBG_MDSCR_KDE | DBG_MDSCR_MDE)
> -
>  #define	DBG_ESR_EVT(x)		(((x) >> 27) & 0x7)
>  
>  /* AArch64 */
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 58f047de3e1c..08f1d02507cd 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -34,7 +34,7 @@ u8 debug_monitors_arch(void)
>  /*
>   * MDSCR access routines.
>   */
> -static void mdscr_write(u32 mdscr)
> +static void mdscr_write(u64 mdscr)
>  {
>  	unsigned long flags;
>  	flags = local_daif_save();
> @@ -43,7 +43,7 @@ static void mdscr_write(u32 mdscr)
>  }
>  NOKPROBE_SYMBOL(mdscr_write);
>  
> -static u32 mdscr_read(void)
> +static u64 mdscr_read(void)
>  {
>  	return read_sysreg(mdscr_el1);
>  }
> @@ -79,16 +79,16 @@ static DEFINE_PER_CPU(int, kde_ref_count);
>  
>  void enable_debug_monitors(enum dbg_active_el el)
>  {
> -	u32 mdscr, enable = 0;
> +	u64 mdscr, enable = 0;
>  
>  	WARN_ON(preemptible());
>  
>  	if (this_cpu_inc_return(mde_ref_count) == 1)
> -		enable = DBG_MDSCR_MDE;
> +		enable = MDSCR_EL1_MDE;
>  
>  	if (el == DBG_ACTIVE_EL1 &&
>  	    this_cpu_inc_return(kde_ref_count) == 1)
> -		enable |= DBG_MDSCR_KDE;
> +		enable |= MDSCR_EL1_KDE;
>  
>  	if (enable && debug_enabled) {
>  		mdscr = mdscr_read();
> @@ -100,16 +100,16 @@ NOKPROBE_SYMBOL(enable_debug_monitors);
>  
>  void disable_debug_monitors(enum dbg_active_el el)
>  {
> -	u32 mdscr, disable = 0;
> +	u64 mdscr, disable = 0;
>  
>  	WARN_ON(preemptible());
>  
>  	if (this_cpu_dec_return(mde_ref_count) == 0)
> -		disable = ~DBG_MDSCR_MDE;
> +		disable = ~MDSCR_EL1_MDE;
>  
>  	if (el == DBG_ACTIVE_EL1 &&
>  	    this_cpu_dec_return(kde_ref_count) == 0)
> -		disable &= ~DBG_MDSCR_KDE;
> +		disable &= ~MDSCR_EL1_KDE;
>  
>  	if (disable) {
>  		mdscr = mdscr_read();
> @@ -415,7 +415,7 @@ void kernel_enable_single_step(struct pt_regs *regs)
>  {
>  	WARN_ON(!irqs_disabled());
>  	set_regs_spsr_ss(regs);
> -	mdscr_write(mdscr_read() | DBG_MDSCR_SS);
> +	mdscr_write(mdscr_read() | MDSCR_EL1_SS);
>  	enable_debug_monitors(DBG_ACTIVE_EL1);
>  }
>  NOKPROBE_SYMBOL(kernel_enable_single_step);
> @@ -423,7 +423,7 @@ NOKPROBE_SYMBOL(kernel_enable_single_step);
>  void kernel_disable_single_step(void)
>  {
>  	WARN_ON(!irqs_disabled());
> -	mdscr_write(mdscr_read() & ~DBG_MDSCR_SS);
> +	mdscr_write(mdscr_read() & ~MDSCR_EL1_SS);
>  	disable_debug_monitors(DBG_ACTIVE_EL1);
>  }
>  NOKPROBE_SYMBOL(kernel_disable_single_step);
> @@ -431,7 +431,7 @@ NOKPROBE_SYMBOL(kernel_disable_single_step);
>  int kernel_active_single_step(void)
>  {
>  	WARN_ON(!irqs_disabled());
> -	return mdscr_read() & DBG_MDSCR_SS;
> +	return mdscr_read() & MDSCR_EL1_SS;
>  }
>  NOKPROBE_SYMBOL(kernel_active_single_step);
>  
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..6dbfc1008007 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>  
>  	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>  	reg = read_sysreg(mdscr_el1);
> -	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
> +	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>  	write_sysreg(val, mdscr_el1);
>  	asm volatile("msr daifclr, #8");
>  	isb();
