Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085EA224B10
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748883327; cv=none; b=CUelY5VEEMj7tikloxBoJaTjUo3wSmqWhbc/wQ0hY9lE591QQ+2Zfi3LnvR8ZQVvrH4rI7iDiHlYLpRYk0+jL2ByWiu6xoUK6ctuql6Cqf7kqcog0qz6BHVHbNVNGKSlePHLQcNN3ESQ6eMtReCgNqbVlqQPST1FLADOIVZg5sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748883327; c=relaxed/simple;
	bh=wMPjns6bDceR0VEgoKeUYNYbIAl8CTpAwsj8mQxdBO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPOuc2hW6kwDgq61o5Eyq4Gc3PDcNaztI/JXyOaCZVc7uVR8g5P3RWC8P7l8JEAFRlt71QGQrICWHOwlPK3stnnS6hZRUxG5POqJmUG9hl+jTW7cpqV9K6u5EXwy6ExDxf+y1aKN2Nu2Ecul15D9idomQFM26OEEAEx2degmbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LitofpgN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LitofpgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748883326; x=1780419326;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wMPjns6bDceR0VEgoKeUYNYbIAl8CTpAwsj8mQxdBO8=;
  b=LitofpgNhyey/KVlwNkfqr4f5fPd8afeC1G292b6x3pWjaKNusXQyLa6
   kMUinwUHcSIpZd0fV4ddF+qr7AdRaaOHYRO4IDymi4cWdiF8Dyl5Z3Jco
   CkOX/HX/LxR7kfJtuYOFTL0tKaXUEfL7YcewytdMzJNtt9wiBu9X4NVEW
   6UyZqw/rQEhM6wj63phGtUqSKUoe2nvlICJHagbajvUMysCtHqBAldSbS
   sFuNfjX/NO5H1qzKdLytpBSN8kWqu68bup9fpvWIrYPWdOaFxhBU/XYlz
   s1c02o7CIXHiKfl4lF5zS7+bXoFFrwsugreheZYatuaqMcgzuw3fz9vGl
   A==;
X-CSE-ConnectionGUID: 7KpCz/FiRU6YBMfXzzz7oA==
X-CSE-MsgGUID: O66LO/ZTQSKchn/BadYIYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62247719"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="62247719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 09:55:25 -0700
X-CSE-ConnectionGUID: wvZ2yCAbSViO5nMDEBx2hg==
X-CSE-MsgGUID: /Lw31xiySYysszbIIxRAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144556663"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [10.125.110.163]) ([10.125.110.163])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 09:55:24 -0700
Message-ID: <83a671ed-4862-4a0f-b91d-d4598b4a82d7@intel.com>
Date: Mon, 2 Jun 2025 09:55:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/mm: Fix potential overflow in
 user_pcid_flush_mask
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, bp@alien8.de, x86@kernel.org, yu-cheng.yu@intel.com,
 Rik van Riel <riel@meta.com>, stable@kernel.org
References: <20250602133402.3385163-1-riel@surriel.com>
 <20250602133402.3385163-2-riel@surriel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250602133402.3385163-2-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 06:30, Rik van Riel wrote:
> Currently no system with AMD INVLPGB support requires the page table
> isolation mitigation. However, people could still enable PTI manually,
> or a vulnerability could be found in the future that makes PTI useful
> on certain AMD CPUs.
> 
> Additionally, there are systems that support Intel RAR TLB invalidation,
> where PTI is a useful mitigation.

Let's just leave this mention of RAR out for now.

> The combination of PTI and broadcast TLB flush has a problem:
> - invalidate_user_asid() sets a bit corresponding to the process PCID in user_pcid_flush_mask
> - SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PCID in user_pcid_flush_mask

The other bit of background here is that there are currently only 6
PCIDs that might need to be flushed in this way (TLB_NR_DYN_ASIDS).
There are obviously more than 6 bits in an unsigned long, so this is all
fine.

But the INVLPGB support vastly expanded the number of ASIDs that might
be used.

> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index e9b81876ebe4..cc9935bbbd45 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -23,6 +23,31 @@ void __flush_tlb_all(void);
>  #define TLB_FLUSH_ALL	-1UL
>  #define TLB_GENERATION_INVALID	0
>  
> +/*
> + * When enabled, MITIGATION_PAGE_TABLE_ISOLATION consumes a single bit for
> + * user/kernel switches
> + */
> +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
> +# define PTI_CONSUMED_PCID_BITS	1
> +#else
> +# define PTI_CONSUMED_PCID_BITS	0
> +#endif
> +
> +#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)
> +
> +/*
> + * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
> + * for them being zero-based.  Another -1 is because PCID 0 is reserved for
> + * use by non-PCID-aware users.
> + */
> +#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 2)
> +
> +#ifdef CONFIG_BROADCAST_TLB_FLUSH
> +# define CR3_AVAIL_PCID_LONGS ((1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG)
> +#else
> +# define CR3_AVAIL_PCID_LONGS 1
> +#endif

I wonder if we can make this easier to understand. Is there something
preventing us from using good old DECLARE_BITMAP()?

	DECLARE_BITMAP(user_pcid_flush_mask, MAX_KERN_ASID);

#ifdef CONFIG_BROADCAST_TLB_FLUSH
# define MAX_KERN_PCID (1 << CR3_AVAIL_PCID_BITS - 1)
#else
  /* PCID 0 is reserved. Dynamic asids 0->5 map to PCIDs 1->6 */
# define MAX_KERN_PCID (TLB_NR_DYN_ASIDS + 1)
#endif

The TLB_NR_DYN_ASIDS portion of this could even be a preparatory patch
before the CONFIG_BROADCAST_TLB_FLUSH gets added. That might also make
the whole thing more clear.

>  void cr4_update_irqsoff(unsigned long set, unsigned long clear);
>  unsigned long cr4_read_shadow(void);
>  
> @@ -115,14 +140,6 @@ struct tlb_state {
>  	 */
>  	u8 lam;
>  #endif
> -
> -	/*
> -	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
> -	 * the corresponding user PCID needs a flush next time we
> -	 * switch to it; see SWITCH_TO_USER_CR3.
> -	 */
> -	unsigned short user_pcid_flush_mask;
> -
>  	/*
>  	 * Access to this CR4 shadow and to H/W CR4 is protected by
>  	 * disabling interrupts when modifying either one.
> @@ -149,6 +166,15 @@ struct tlb_state {
>  	 * context 0.
>  	 */
>  	struct tlb_context ctxs[TLB_NR_DYN_ASIDS];
> +
> +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
> +	/*
> +	 * Mask that contains TLB_NR_DYN_ASIDS+1 bits to indicate
> +	 * the corresponding user PCID needs a flush next time we
> +	 * switch to it; see SWITCH_TO_USER_CR3.
> +	 */
> +	unsigned long user_pcid_flush_mask[CR3_AVAIL_PCID_LONGS];
> +#endif
>  };
>  DECLARE_PER_CPU_ALIGNED(struct tlb_state, cpu_tlbstate);

This adds an #ifdef. I guess it makes sense to do it for the now larger
user_pcid_flush_mask[] while it didn't for a single long. But that's
another logically separate bit that adds complexity to reading this
whole mess.

Honestly, I'd just leave this out for the bug fix. If someone really
cares, we can come back and fix it up in mainline.

> diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
> index 6259b474073b..8c41a2e5a53e 100644
> --- a/arch/x86/kernel/asm-offsets.c
> +++ b/arch/x86/kernel/asm-offsets.c
> @@ -103,8 +103,10 @@ static void __used common(void)
>  	BLANK();
>  	DEFINE(PTREGS_SIZE, sizeof(struct pt_regs));
>  
> +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
>  	/* TLB state for the entry code */
>  	OFFSET(TLB_STATE_user_pcid_flush_mask, tlb_state, user_pcid_flush_mask);
> +#endif

Because it necessitates this hunk too...

>  	/* Layout info for cpu_entry_area */
>  	OFFSET(CPU_ENTRY_AREA_entry_stack, cpu_entry_area, entry_stack_page);
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 39f80111e6f1..f5761e8be77f 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -90,25 +90,6 @@
>   *
>   */
>  
> -/*
> - * When enabled, MITIGATION_PAGE_TABLE_ISOLATION consumes a single bit for
> - * user/kernel switches
> - */
> -#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
> -# define PTI_CONSUMED_PCID_BITS	1
> -#else
> -# define PTI_CONSUMED_PCID_BITS	0
> -#endif
> -
> -#define CR3_AVAIL_PCID_BITS (X86_CR3_PCID_BITS - PTI_CONSUMED_PCID_BITS)
> -
> -/*
> - * ASIDs are zero-based: 0->MAX_AVAIL_ASID are valid.  -1 below to account
> - * for them being zero-based.  Another -1 is because PCID 0 is reserved for
> - * use by non-PCID-aware users.
> - */
> -#define MAX_ASID_AVAILABLE ((1 << CR3_AVAIL_PCID_BITS) - 2)
> -
>  /*
>   * Given @asid, compute kPCID
>   */
> @@ -543,10 +524,7 @@ static void broadcast_tlb_flush(struct flush_tlb_info *info)
>   */
>  static inline void invalidate_user_asid(u16 asid)
>  {
> -	/* There is no user ASID if address space separation is off */
> -	if (!IS_ENABLED(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION))
> -		return;
> -
> +#ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
>  	/*
>  	 * We only have a single ASID if PCID is off and the CR3
>  	 * write will have flushed it.
> @@ -557,8 +535,8 @@ static inline void invalidate_user_asid(u16 asid)
>  	if (!static_cpu_has(X86_FEATURE_PTI))
>  		return;
>  
> -	__set_bit(kern_pcid(asid),
> -		  (unsigned long *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));
> +	__set_bit(kern_pcid(asid), this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask[0]));
> +#endif
>  }
... and this one.
