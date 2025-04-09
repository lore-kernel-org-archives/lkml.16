Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBE8442C;
	Wed,  9 Apr 2025 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220389; cv=none; b=Fbhtk5KD/EA8TMBCKN4ifzLaTKUr1inSSTyCAzWXffYLU8atVimavW0td45BBwxiHbk23G3wd61aQxYQFqrIc8Uavy3T2ifiG4D29oRAOAm+TFRs9er5jSuwecgqTMZ+D0NP1Jjcx5YpGuWxyabUBEPIruRuTWWKSu/z+Gw6pTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220389; c=relaxed/simple;
	bh=mul9IW3BttmicQ5NvyZx6Nnkfps8VkwCACyOPnh21Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcMi3WBXqJ+Hffy0nrYLbcjfIMUBZlGVN6XLXbLv0rAiSfazfcoaluSG38/OU5g/mv/IjEYxW1/LMz70uQDMxfInsL4EnLqfaqgp8Wb4evNrIvmTCecmxrwkl1HmNG4w2HetAZMM9ILETHFkkVOwx9XpQowfcxcKOrmo9+5/vDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3XkkK/u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3XkkK/u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77026C4CEE2;
	Wed,  9 Apr 2025 17:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744220388;
	bh=mul9IW3BttmicQ5NvyZx6Nnkfps8VkwCACyOPnh21Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3XkkK/uXBWoDC4uc2p/9MbLrqwt1v4HXbAIifAQq4DTano8Ocq420cS03ssG/eMK
	 SISXqq/qsG0p275fx0dQrXFfqRcaJljo7tf+hXm+/qUMWQuNYkC3heQeRtg7c9vtSo
	 YwuZbyU29qeaThszlbNuKEqNfOl41mauJj8bgejUSr9BANzxijqTReIMxnR8jy4qpN
	 zWnjlaBPpm/H6QlegAwYFrzj+hagB60y3O0lTUtqf1toLcQZo5MFG74Cm1V4ZfsjUM
	 Tpy4YnGGSsNAP+NQ8RcvSlZU88xca5kBjAsyGeqwvBSkdBcgbeTHBcM49RV4RGdDAd
	 qLrRUvfRRcyPQ==
Date: Wed, 9 Apr 2025 10:39:45 -0700
From: Kees Cook <kees@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-coco@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Kevin Loughlin <kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <202504091038.5D9B68A@keescook>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Apr 08, 2025 at 04:55:08PM -0700, Dan Williams wrote:
> Dave Hansen wrote:
> > On 4/8/25 06:43, Tom Lendacky wrote:
> > >> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV 
> > >> guests?
> > > Not sure why we would suddenly not allow that.
> > 
> > Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
> > Disallowing access to the individually troublesome regions can fix
> > _part_ of the problem. But suddenly blocking access is guaranteed to fix
> > *ALL* the problems forever.
> 
> ...or at least solicits practical use cases for why the kernel needs to
> poke holes in the policy.
> 
> > Or, maybe we just start returning 0's for all reads and throw away all
> > writes. That is probably less likely to break userspace that doesn't
> > know what it's doing in the first place.
> 
> Yes, and a bulk of the regression risk has already been pipe-cleaned by
> KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
> many scenarios.
> 
> Here is an updated patch that includes some consideration for mapping
> zeros for known legacy compatibility use cases.
> 
> -- 8< --
> From: Dan Williams <dan.j.williams@intel.com>
> Subject: [PATCH] x86: Restrict /dev/mem access for potentially unaccepted
>  memory by default
> 
> Nikolay reports [1] that accessing BIOS data (first 1MB of the physical
> address space) via /dev/mem results in an SEPT violation.
> 
> The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
> unencrypted mapping where the kernel had established an encrypted
> mapping previously.
> 
> An initial attempt to fix this revealed that TDX and SEV-SNP have
> different expectations about which and when address ranges can be mapped
> via /dev/mem.
> 
> Rather than develop a precise set of allowed /dev/mem capable TVM
> address ranges, lean on the observation that KERNEL_LOCKDOWN is already
> blocking /dev/mem access in many cases to do the same by default for x86
> TVMs. This can still be later relaxed as specific needs arise, but in
> the meantime close off this source of mismatched IORES_MAP_ENCRYPTED
> expectations.
> 
> Note that this is careful to map zeroes rather than reject mappings of
> the BIOS data space.
> 
> Cc: <x86@kernel.org>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Nikolay Borisov <nik.borisov@suse.com>
> Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
> Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/x86/Kconfig                |  2 ++
>  arch/x86/include/asm/x86_init.h |  2 ++
>  arch/x86/kernel/x86_init.c      |  6 ++++++
>  arch/x86/mm/init.c              | 14 +++++++++++---
>  4 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 15f346f02af0..6d4f94a79314 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -888,6 +888,7 @@ config INTEL_TDX_GUEST
>  	depends on X86_64 && CPU_SUP_INTEL
>  	depends on X86_X2APIC
>  	depends on EFI_STUB
> +	depends on STRICT_DEVMEM
>  	select ARCH_HAS_CC_PLATFORM
>  	select X86_MEM_ENCRYPT
>  	select X86_MCE
> @@ -1507,6 +1508,7 @@ config AMD_MEM_ENCRYPT
>  	bool "AMD Secure Memory Encryption (SME) support"
>  	depends on X86_64 && CPU_SUP_AMD
>  	depends on EFI_STUB
> +	depends on STRICT_DEVMEM
>  	select DMA_COHERENT_POOL
>  	select ARCH_USE_MEMREMAP_PROT
>  	select INSTRUCTION_DECODER
> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 213cf5379a5a..0ae436b34b88 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -305,6 +305,7 @@ struct x86_hyper_runtime {
>   * 				semantics.
>   * @realmode_reserve:		reserve memory for realmode trampoline
>   * @realmode_init:		initialize realmode trampoline
> + * @devmem_is_allowed		restrict /dev/mem and PCI sysfs resource access
>   * @hyper:			x86 hypervisor specific runtime callbacks
>   */
>  struct x86_platform_ops {
> @@ -323,6 +324,7 @@ struct x86_platform_ops {
>  	void (*set_legacy_features)(void);
>  	void (*realmode_reserve)(void);
>  	void (*realmode_init)(void);
> +	bool (*devmem_is_allowed)(unsigned long pfn);
>  	struct x86_hyper_runtime hyper;
>  	struct x86_guest guest;
>  };
> diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
> index 0a2bbd674a6d..346301375bd4 100644
> --- a/arch/x86/kernel/x86_init.c
> +++ b/arch/x86/kernel/x86_init.c
> @@ -143,6 +143,11 @@ static void enc_kexec_begin_noop(void) {}
>  static void enc_kexec_finish_noop(void) {}
>  static bool is_private_mmio_noop(u64 addr) {return false; }
>  
> +static bool platform_devmem_is_allowed(unsigned long pfn)
> +{
> +	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> +}
> +
>  struct x86_platform_ops x86_platform __ro_after_init = {
>  	.calibrate_cpu			= native_calibrate_cpu_early,
>  	.calibrate_tsc			= native_calibrate_tsc,
> @@ -156,6 +161,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
>  	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
>  	.realmode_reserve		= reserve_real_mode,
>  	.realmode_init			= init_real_mode,
> +	.devmem_is_allowed		= platform_devmem_is_allowed,
>  	.hyper.pin_vcpu			= x86_op_int_noop,
>  	.hyper.is_private_mmio		= is_private_mmio_noop,
>  
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index bfa444a7dbb0..c8679ae1bc8b 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -867,6 +867,8 @@ void __init poking_init(void)
>   */
>  int devmem_is_allowed(unsigned long pagenr)
>  {
> +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
> +
>  	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
>  				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
>  			!= REGION_DISJOINT) {
> @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
>  	 * restricted resource under CONFIG_STRICT_DEVMEM.
>  	 */
>  	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
> -		/* Low 1MB bypasses iomem restrictions. */
> -		if (pagenr < 256)
> +		/*
> +		 * Low 1MB bypasses iomem restrictions unless the
> +		 * platform says "no", in which case map zeroes
> +		 */
> +		if (pagenr < 256) {
> +			if (!platform_allowed)
> +				return 2;
>  			return 1;
> +		}
>  
>  		return 0;
>  	}
>  
> -	return 1;
> +	return platform_allowed;
>  }
>  
>  void free_init_pages(const char *what, unsigned long begin, unsigned long end)

I am reminded of this discussion:
https://lore.kernel.org/all/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com/

As in, mmap will bypass this restriction, so if you really want the low
1MiB to be unreadable, a solution for mmap is still needed...

-Kees

-- 
Kees Cook
