Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0F433AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214580; cv=none; b=mY3v+rw+5bT74DJyBr2Wj/4Kp/VUl/g+E6c6YgiPVKN8kU7bjAcLYlR6o1uMvuiL6OdvGk+MRnZZ7CQqrCcyacQl11C2tu3ORRTzRI2oWIcdk2NJMuBe4XH7vj9Pws4JQl1PvfGSkECwl+vNGhp+PVVrojTsO2F6fDNelVtJ4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214580; c=relaxed/simple;
	bh=ksRX+bRA7T+1C/mvp6DxfIWqG3y2j5bfqsUahLv2kaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIswHxaQLMsyfWw2B5pTTi4NjAFiazfrnUqbPEcCD+uQcXKKyfxwJCBzEYI5CrqsYJImw32BBFHrntG07XnJexhMXxMI7RfOIxRhCkTsnJB0a/E08oQ3pUMQzjh/xIM7APrZhDWuFhPYgMB40TqLnUXtjiP0F1HG6MzjTwEilYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BVW5gIRg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BVW5gIRg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so11512263a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744214577; x=1744819377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42GXMqXTgHSEbdFJL9v/SA8e4fwkOBIeGkhqojukuws=;
        b=BVW5gIRgBY10Jr5AuLhC4Fm17KPjRm49Y9yHfTz/m8sAbv31LLSmbTs5R4PwqOSwcf
         JHwKeCBVA2bh+klNSaxPMZWH+us7XOHUIr2Eg+8PNtMcHknV6VPvUrW+v7HZF7NdAz+D
         JKUZxLQMXVr6cZpG83Cjl5Rqy/95+1/6zQwMUetmOepAYxXRY9+SDavPjTXys92zpASc
         78/TQYqygXvfWsxGQwaFhO08xdzjZyLujqmnQpsfp6q9avjivRoc/y7czkj6MJ6RREYY
         n4LXDYAyEpPpr3wPlqKmXpPIn0jA187zsvi6r9bXMmY+KFl8nieIpGJJpcD48jbqzhb6
         0isQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744214577; x=1744819377;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42GXMqXTgHSEbdFJL9v/SA8e4fwkOBIeGkhqojukuws=;
        b=ebXtpAQR8pMb726Jhd26/kpu8elwWwRRHRssee4FzfI5P/ukg5QFpgRGo/MnxFLs7o
         kcQ+aaEqFO/TH2689pQX6dJcLOyoHjR+lMsU64oyudIskezN3y1BMIxNqAificOJbF1C
         x/ydj2KYdvKyLXpGyq2B9wH8nQfdzFc6UuRcwroWfzTaEmAh/Td2gYsJDMTBbkEG9JsO
         UYCg7ek+jbhAbMJZuPxe5XEF9al065xGcU6lryFuNSPBQTCQ7CG7auGAtAMjciuG3/21
         KMxdKYYKbQIbcwNn5rmwXDP0UgEYzkC+HY77kNfTP3RFGTfHKj8CTyxgHVdCeevldod9
         t2xw==
X-Gm-Message-State: AOJu0YyKnWdClKYIMAwfdmKugDjpUTVh+XGS2MWcGvcmI1aHpzsX59fH
	aHau3bOVHjCPOLpN6pBMXZNFXxHDl24Zyl1BqyodOrEo8UKHCDxJmwldBSgXUYM=
X-Gm-Gg: ASbGnct5QcBlxCrdsHepRJohIX+q6sghkNeznF+r/NnKzemTP3JEehVqdG7iqxDE/y9
	al8pvPtPT2x8+eCH5mI/prTqSr4zDfy+uaSUlqN9PDwzp9ObikldsMwr2N4vmwEW+IivxnZESo0
	XonAhJdni0rfRSsg62oqsu7Q9RcTX3tIQDuAzbmd6J9cL87mwSl0lfB9zTO0ZOsKkWOJb0q4OOd
	A74EcbF1guC8cjIaWJQ+fDlTtVGP9dfcPWUMag+dbqrUszQqYAtmagKUZRkxElJwrmDY0y2NADF
	GUh3MmR/c3IBVxm6gN7i9hM2ODUKcrjd+0f84G7HYH+Krw==
X-Google-Smtp-Source: AGHT+IETtUUcclvChzfkVjayUT4NIFQtFSY18CMht9bvCbnGlLSXyRVI68LXIT4UJlpIFvINkBP8nA==
X-Received: by 2002:a17:907:944c:b0:ac3:f1dc:f3db with SMTP id a640c23a62f3a-aca9b65dc96mr289301466b.13.1744214575980;
        Wed, 09 Apr 2025 09:02:55 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb34eesm119172366b.16.2025.04.09.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 09:02:55 -0700 (PDT)
Message-ID: <8d5412a3-5742-43d0-b7aa-a0091dc30cf8@suse.com>
Date: Wed, 9 Apr 2025 19:02:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for
 SEV-SNP guests
To: Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kevin Loughlin <kevinloughlin@google.com>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9.04.25 г. 2:55 ч., Dan Williams wrote:
> Dave Hansen wrote:
>> On 4/8/25 06:43, Tom Lendacky wrote:
>>>> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV
>>>> guests?
>>> Not sure why we would suddenly not allow that.
>>
>> Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
>> Disallowing access to the individually troublesome regions can fix
>> _part_ of the problem. But suddenly blocking access is guaranteed to fix
>> *ALL* the problems forever.
> 
> ...or at least solicits practical use cases for why the kernel needs to
> poke holes in the policy.
> 
>> Or, maybe we just start returning 0's for all reads and throw away all
>> writes. That is probably less likely to break userspace that doesn't
>> know what it's doing in the first place.
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
>   memory by default
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
>   arch/x86/Kconfig                |  2 ++
>   arch/x86/include/asm/x86_init.h |  2 ++
>   arch/x86/kernel/x86_init.c      |  6 ++++++
>   arch/x86/mm/init.c              | 14 +++++++++++---
>   4 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 15f346f02af0..6d4f94a79314 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -888,6 +888,7 @@ config INTEL_TDX_GUEST
>   	depends on X86_64 && CPU_SUP_INTEL
>   	depends on X86_X2APIC
>   	depends on EFI_STUB
> +	depends on STRICT_DEVMEM
>   	select ARCH_HAS_CC_PLATFORM
>   	select X86_MEM_ENCRYPT
>   	select X86_MCE
> @@ -1507,6 +1508,7 @@ config AMD_MEM_ENCRYPT
>   	bool "AMD Secure Memory Encryption (SME) support"
>   	depends on X86_64 && CPU_SUP_AMD
>   	depends on EFI_STUB
> +	depends on STRICT_DEVMEM
>   	select DMA_COHERENT_POOL
>   	select ARCH_USE_MEMREMAP_PROT
>   	select INSTRUCTION_DECODER
> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> index 213cf5379a5a..0ae436b34b88 100644
> --- a/arch/x86/include/asm/x86_init.h
> +++ b/arch/x86/include/asm/x86_init.h
> @@ -305,6 +305,7 @@ struct x86_hyper_runtime {
>    * 				semantics.
>    * @realmode_reserve:		reserve memory for realmode trampoline
>    * @realmode_init:		initialize realmode trampoline
> + * @devmem_is_allowed		restrict /dev/mem and PCI sysfs resource access
>    * @hyper:			x86 hypervisor specific runtime callbacks
>    */
>   struct x86_platform_ops {
> @@ -323,6 +324,7 @@ struct x86_platform_ops {
>   	void (*set_legacy_features)(void);
>   	void (*realmode_reserve)(void);
>   	void (*realmode_init)(void);
> +	bool (*devmem_is_allowed)(unsigned long pfn);
>   	struct x86_hyper_runtime hyper;
>   	struct x86_guest guest;
>   };
> diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
> index 0a2bbd674a6d..346301375bd4 100644
> --- a/arch/x86/kernel/x86_init.c
> +++ b/arch/x86/kernel/x86_init.c
> @@ -143,6 +143,11 @@ static void enc_kexec_begin_noop(void) {}
>   static void enc_kexec_finish_noop(void) {}
>   static bool is_private_mmio_noop(u64 addr) {return false; }
>   
> +static bool platform_devmem_is_allowed(unsigned long pfn)
> +{
> +	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> +}
> +
>   struct x86_platform_ops x86_platform __ro_after_init = {
>   	.calibrate_cpu			= native_calibrate_cpu_early,
>   	.calibrate_tsc			= native_calibrate_tsc,
> @@ -156,6 +161,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
>   	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
>   	.realmode_reserve		= reserve_real_mode,
>   	.realmode_init			= init_real_mode,
> +	.devmem_is_allowed		= platform_devmem_is_allowed,
>   	.hyper.pin_vcpu			= x86_op_int_noop,
>   	.hyper.is_private_mmio		= is_private_mmio_noop,
>   
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index bfa444a7dbb0..c8679ae1bc8b 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -867,6 +867,8 @@ void __init poking_init(void)
>    */
>   int devmem_is_allowed(unsigned long pagenr)
>   {
> +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
> +
>   	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
>   				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
>   			!= REGION_DISJOINT) {
> @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
>   	 * restricted resource under CONFIG_STRICT_DEVMEM.
>   	 */
>   	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
> -		/* Low 1MB bypasses iomem restrictions. */
> -		if (pagenr < 256)
> +		/*
> +		 * Low 1MB bypasses iomem restrictions unless the
> +		 * platform says "no", in which case map zeroes
> +		 */
> +		if (pagenr < 256) {
> +			if (!platform_allowed)
> +				return 2;

That'll work but I hate the way this interface works. The sole user of 
this 0/1/2 convention is page_is_allowed() and the check for 1  inside 
write_mem(). The proper patch will need to document this...

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

>   			return 1;
> +		}
>   
>   		return 0;
>   	}
>   
> -	return 1;
> +	return platform_allowed;
>   }
>   
>   void free_init_pages(const char *what, unsigned long begin, unsigned long end)

