Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF7C1E835B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613255; cv=none; b=bVKh43MRXNCjFhtoX8q1nhZoSk9WtUYdiNlJs/ZZcPNHE0iCGdlA3yMhQlimdmwejp6+neuGhdlguIlKBvZR/FXFSWVwA4EIvdamFSvlxCpzkz2GhnPvZSNXyk+NwD2HyQNxUdK1tWt/KPhgWjZN5jyW+KBykt4JpW8dIX1QNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613255; c=relaxed/simple;
	bh=e2dVSQg48wAkt0ejRhppG/FQr6UjvLNPP1LXHo8tjHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItxUHjRwtVvIi5NFbfACXPq4cH3JFs3kmSXIlKQ0cherc/iiaVkYRjUaDhnJcSKC1gJesXti+Mg7XauFxhQdAyzvP6JWErX+mhYk4loIYZhfbZfLIXw9LuEHBcUi19Jjhvly/PJk5BXgtaRIbeRIZpT98jqEmcD0ZPQf8yGhk/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 948DF168F;
	Tue, 10 Jun 2025 20:40:31 -0700 (PDT)
Received: from [10.164.146.17] (J09HK2D2RT.blr.arm.com [10.164.146.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4693F66E;
	Tue, 10 Jun 2025 20:40:48 -0700 (PDT)
Message-ID: <68d762d4-a755-4ede-976b-0616bf3aab28@arm.com>
Date: Wed, 11 Jun 2025 09:10:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>, linux-kernel@vger.kernel.org
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-2-anshuman.khandual@arm.com>
 <aEhnzsXHfilVhJ1s@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aEhnzsXHfilVhJ1s@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/06/25 10:43 PM, Mark Rutland wrote:
> On Tue, Jun 10, 2025 at 11:01:27AM +0530, Anshuman Khandual wrote:
>> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
>> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
>> macros become redundant and hence can be dropped off completely. While here
>> convert all variables handling MDSCR_EL1 register as u64 which reflects its
>> true width as well.
> 
> I think that for now it'd be best to *only* change over to the
> generated MDSCR_EL1_* defintions, and leave the register sizes as-is.

I had tried doing that originally but without changing mdscr register size,
there is a build warning because MDSCR_EL1_MDE is defined as GENMASK(15, 15)
which is represented as 'long unsigned int'.

#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))

arch/arm64/kernel/debug-monitors.c: In function ‘disable_debug_monitors’:
arch/arm64/kernel/debug-monitors.c:108:13: warning: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709518847’ to ‘4294934527’ [-Woverflow]
  108 |   disable = ~MDSCR_EL1_MDE;
      |             ^

MDSCR_EL1 is a 64 bit system register as per ARM DDI 0487 L.A (D24.3.20).
Representing it as u32 does not seem right irrespective of whether the
extended break point support is enabled or not. Besides even arm64 kvm
uses u64 for mdscr register.

arch/arm64/kvm/debug.c: u64 mdscr = vcpu_read_sys_reg(vcpu, MDSCR_EL1) & ~(MDSCR_EL1_SS |
arch/arm64/kvm/debug.c:         mdscr |= MDSCR_EL1_SS;
arch/arm64/kvm/debug.c:         mdscr |= MDSCR_EL1_MDE | MDSCR_EL1_KDE;
arch/arm64/kvm/debug.c: vcpu->arch.external_mdscr_el1 = mdscr;
arch/arm64/kvm/debug.c: u64 mdscr;
arch/arm64/kvm/debug.c:         setup_external_mdscr(vcpu);
arch/arm64/kvm/debug.c:         mdscr = vcpu_read_sys_reg(vcpu, MDSCR_EL1);
arch/arm64/kvm/debug.c:         if (mdscr & (MDSCR_EL1_KDE | MDSCR_EL1_MDE))

> 
> Those are logically distinct changes, and AFAICT the latter is a
> requirement for using extended breakpoints, where it would be clearer to
> have that change as part of the series adding that support, with an
> explanation as to why we care.
> 
> Mark.
> 
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/assembler.h      |  4 ++--
>>  arch/arm64/include/asm/debug-monitors.h |  6 ------
>>  arch/arm64/kernel/debug-monitors.c      | 22 +++++++++++-----------
>>  arch/arm64/kernel/entry-common.c        |  4 ++--
>>  4 files changed, 15 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
>> index ad63457a05c5..f229d96616e5 100644
>> --- a/arch/arm64/include/asm/assembler.h
>> +++ b/arch/arm64/include/asm/assembler.h
>> @@ -53,7 +53,7 @@
>>  	.macro	disable_step_tsk, flgs, tmp
>>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>>  	mrs	\tmp, mdscr_el1
>> -	bic	\tmp, \tmp, #DBG_MDSCR_SS
>> +	bic	\tmp, \tmp, #MDSCR_EL1_SS
>>  	msr	mdscr_el1, \tmp
>>  	isb	// Take effect before a subsequent clear of DAIF.D
>>  9990:
>> @@ -63,7 +63,7 @@
>>  	.macro	enable_step_tsk, flgs, tmp
>>  	tbz	\flgs, #TIF_SINGLESTEP, 9990f
>>  	mrs	\tmp, mdscr_el1
>> -	orr	\tmp, \tmp, #DBG_MDSCR_SS
>> +	orr	\tmp, \tmp, #MDSCR_EL1_SS
>>  	msr	mdscr_el1, \tmp
>>  9990:
>>  	.endm
>> diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
>> index 8f6ba31b8658..1f37dd01482b 100644
>> --- a/arch/arm64/include/asm/debug-monitors.h
>> +++ b/arch/arm64/include/asm/debug-monitors.h
>> @@ -13,14 +13,8 @@
>>  #include <asm/ptrace.h>
>>  
>>  /* Low-level stepping controls. */
>> -#define DBG_MDSCR_SS		(1 << 0)
>>  #define DBG_SPSR_SS		(1 << 21)
>>  
>> -/* MDSCR_EL1 enabling bits */
>> -#define DBG_MDSCR_KDE		(1 << 13)
>> -#define DBG_MDSCR_MDE		(1 << 15)
>> -#define DBG_MDSCR_MASK		~(DBG_MDSCR_KDE | DBG_MDSCR_MDE)
>> -
>>  #define	DBG_ESR_EVT(x)		(((x) >> 27) & 0x7)
>>  
>>  /* AArch64 */
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
>> index 58f047de3e1c..08f1d02507cd 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -34,7 +34,7 @@ u8 debug_monitors_arch(void)
>>  /*
>>   * MDSCR access routines.
>>   */
>> -static void mdscr_write(u32 mdscr)
>> +static void mdscr_write(u64 mdscr)
>>  {
>>  	unsigned long flags;
>>  	flags = local_daif_save();
>> @@ -43,7 +43,7 @@ static void mdscr_write(u32 mdscr)
>>  }
>>  NOKPROBE_SYMBOL(mdscr_write);
>>  
>> -static u32 mdscr_read(void)
>> +static u64 mdscr_read(void)
>>  {
>>  	return read_sysreg(mdscr_el1);
>>  }
>> @@ -79,16 +79,16 @@ static DEFINE_PER_CPU(int, kde_ref_count);
>>  
>>  void enable_debug_monitors(enum dbg_active_el el)
>>  {
>> -	u32 mdscr, enable = 0;
>> +	u64 mdscr, enable = 0;
>>  
>>  	WARN_ON(preemptible());
>>  
>>  	if (this_cpu_inc_return(mde_ref_count) == 1)
>> -		enable = DBG_MDSCR_MDE;
>> +		enable = MDSCR_EL1_MDE;
>>  
>>  	if (el == DBG_ACTIVE_EL1 &&
>>  	    this_cpu_inc_return(kde_ref_count) == 1)
>> -		enable |= DBG_MDSCR_KDE;
>> +		enable |= MDSCR_EL1_KDE;
>>  
>>  	if (enable && debug_enabled) {
>>  		mdscr = mdscr_read();
>> @@ -100,16 +100,16 @@ NOKPROBE_SYMBOL(enable_debug_monitors);
>>  
>>  void disable_debug_monitors(enum dbg_active_el el)
>>  {
>> -	u32 mdscr, disable = 0;
>> +	u64 mdscr, disable = 0;
>>  
>>  	WARN_ON(preemptible());
>>  
>>  	if (this_cpu_dec_return(mde_ref_count) == 0)
>> -		disable = ~DBG_MDSCR_MDE;
>> +		disable = ~MDSCR_EL1_MDE;
>>  
>>  	if (el == DBG_ACTIVE_EL1 &&
>>  	    this_cpu_dec_return(kde_ref_count) == 0)
>> -		disable &= ~DBG_MDSCR_KDE;
>> +		disable &= ~MDSCR_EL1_KDE;
>>  
>>  	if (disable) {
>>  		mdscr = mdscr_read();
>> @@ -415,7 +415,7 @@ void kernel_enable_single_step(struct pt_regs *regs)
>>  {
>>  	WARN_ON(!irqs_disabled());
>>  	set_regs_spsr_ss(regs);
>> -	mdscr_write(mdscr_read() | DBG_MDSCR_SS);
>> +	mdscr_write(mdscr_read() | MDSCR_EL1_SS);
>>  	enable_debug_monitors(DBG_ACTIVE_EL1);
>>  }
>>  NOKPROBE_SYMBOL(kernel_enable_single_step);
>> @@ -423,7 +423,7 @@ NOKPROBE_SYMBOL(kernel_enable_single_step);
>>  void kernel_disable_single_step(void)
>>  {
>>  	WARN_ON(!irqs_disabled());
>> -	mdscr_write(mdscr_read() & ~DBG_MDSCR_SS);
>> +	mdscr_write(mdscr_read() & ~MDSCR_EL1_SS);
>>  	disable_debug_monitors(DBG_ACTIVE_EL1);
>>  }
>>  NOKPROBE_SYMBOL(kernel_disable_single_step);
>> @@ -431,7 +431,7 @@ NOKPROBE_SYMBOL(kernel_disable_single_step);
>>  int kernel_active_single_step(void)
>>  {
>>  	WARN_ON(!irqs_disabled());
>> -	return mdscr_read() & DBG_MDSCR_SS;
>> +	return mdscr_read() & MDSCR_EL1_SS;
>>  }
>>  NOKPROBE_SYMBOL(kernel_active_single_step);
>>  
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index 7c1970b341b8..171f93f2494b 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, __in_cortex_a76_erratum_1463225_wa);
>>  
>>  static void cortex_a76_erratum_1463225_svc_handler(void)
>>  {
>> -	u32 reg, val;
>> +	u64 reg, val;
>>  
>>  	if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
>>  		return;
>> @@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
>>  
>>  	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
>>  	reg = read_sysreg(mdscr_el1);
>> -	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
>> +	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
>>  	write_sysreg(val, mdscr_el1);
>>  	asm volatile("msr daifclr, #8");
>>  	isb();
>> -- 
>> 2.25.1
>>

