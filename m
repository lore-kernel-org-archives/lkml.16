Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42C9155C82;
	Mon, 28 Apr 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877966; cv=none; b=P4hVEspfi8VxY1YNW2YufoQujAtwz98aVS5uAQ/IzgDickGFa5OeRv9sB48yISYAnusJEh05qBXtQ/9cPEW6gDZJMuOa99I8c1h2eY92LNDK1doD4UrEZHb/unPbsKJA7x0ShSZO8F17hZvGUa3jYG1VyrLytKGoE+TnKD7kSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877966; c=relaxed/simple;
	bh=rh0mXKcXTapzeEarbYwt4U6w174nT0PhAR8s8IiTQAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g88zwPnWhLFk6d+1rtlBRShKIjntgE4hwRBKrw3eT2CXNzt9RJeUesIxDq7t147djKhWCLb1AVdwXZpiEfHczHoZR/wUY85vmMatw0ZITh4h8u4Sn35cOLT6dLwTait2f1AqEgy/m8mib4TyV7h73CbZh9I+AVDE3aUIFgK4I9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsubwQgN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsubwQgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745877962; x=1777413962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rh0mXKcXTapzeEarbYwt4U6w174nT0PhAR8s8IiTQAk=;
  b=IsubwQgNB3nYlXVLiuE8L6QTRHC6G4cOOHOHuzvbKBWY4nXuYOBhCXgV
   xEYDEqqiT4p4QtYTGg33eDZpiGh3R1KQdHLKE+QMkrjJUFGcxBUrSwusC
   YEpmHtMwKlQW/3Kkb6qFkcvoSR1SeN13FehmJxZYannM+vi8PdOzLeG5f
   RHBCwl8iGjKFC8MqNSeN+qzSWaEXWKE4TIOZ4UJwpPGS8zCfSkngO3CfN
   SwDuB+0goJiSfdJpCoaPeuH92qeBc4RLMLX6JlPmTDym9KYE6zmPwslI6
   V1mWEdWMmxgfcAfWDDEhysDrlLHvB+eQPow5bs3i0+QNcnXP1w8+CUszG
   g==;
X-CSE-ConnectionGUID: vZI0JErXS06IaHupvS2PfQ==
X-CSE-MsgGUID: 2Nav/lQyTqq0OYbqcebP9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="64905738"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="64905738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 15:06:01 -0700
X-CSE-ConnectionGUID: gJCBoSoISICnp5j5zJezcw==
X-CSE-MsgGUID: p8G+22QSS0SpqII0tBJYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133366791"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.222.199]) ([10.124.222.199])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 15:05:58 -0700
Message-ID: <35c58191-f774-40cf-8d66-d1e2aaf11a62@intel.com>
Date: Mon, 28 Apr 2025 15:05:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/14] x86: add KHO support
To: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com,
 pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org,
 ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org,
 saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
References: <20250411053745.1817356-1-changyuanl@google.com>
 <20250411053745.1817356-12-changyuanl@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250411053745.1817356-12-changyuanl@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 22:37, Changyuan Lyu wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> We now have all bits in place to support KHO kexecs. This patch adds

Please use imperative voice and also avoid the "this patch" stuff.

...
> +/*
> + * If KHO is active, only process its scratch areas to ensure we are not
> + * stepping onto preserved memory.
> + */

Same thing on the imperative voice here.

I'm also not fully understanding the comment. Do these "scratch" regions
basically represent all the memory that's not being handed over? It's
not obvious.

> +#ifdef CONFIG_KEXEC_HANDOVER
> +static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
> +{
> +	struct kho_scratch *kho_scratch;
> +	struct setup_data *ptr;
> +	int i, nr_areas = 0;

Do these really need actual #ifdefs or will a nice IS_ENABLED() check
work instead?

> +	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;

What's with the double cast?

> +	while (ptr) {
> +		if (ptr->type == SETUP_KEXEC_KHO) {
> +			struct kho_data *kho = (struct kho_data *)ptr->data;
> +
> +			kho_scratch = (void *)kho->scratch_addr;
> +			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
> +
> +			break;
> +		}
> +
> +		ptr = (struct setup_data *)(unsigned long)ptr->next;
> +	}

Wow, there are a solid number of these loops, each with similarly fun
casting.

> +	if (!nr_areas)
> +		return false;
> +
> +	for (i = 0; i < nr_areas; i++) {
> +		struct kho_scratch *area = &kho_scratch[i];
> +		struct mem_vector region = {
> +			.start = area->addr,
> +			.size = area->size,
> +		};
> +
> +		if (process_mem_region(&region, minimum, image_size))
> +			break;
> +	}
> +
> +	return true;
> +}
> +#else
> +static inline bool process_kho_entries(unsigned long minimum,
> +				       unsigned long image_size)
> +{
> +	return false;
> +}
> +#endif
> +
>  static unsigned long find_random_phys_addr(unsigned long minimum,
>  					   unsigned long image_size)
>  {
> @@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
>  		return 0;
>  	}
>  
> -	if (!process_efi_entries(minimum, image_size))
> +	if (!process_kho_entries(minimum, image_size) &&
> +	    !process_efi_entries(minimum, image_size))
>  		process_e820_entries(minimum, image_size);

Oh, so KHO really does replace the other memory maps here. That seems
important to call out.

>  	phys_addr = slots_fetch_random();
> diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
> index ad9212df0ec0c..906ab5e6d25fe 100644
> --- a/arch/x86/include/asm/setup.h
> +++ b/arch/x86/include/asm/setup.h
> @@ -67,6 +67,10 @@ extern void x86_ce4100_early_setup(void);
>  static inline void x86_ce4100_early_setup(void) { }
>  #endif
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +#include <linux/kexec_handover.h>
> +#endif

Please do this #ifdef'ing inside the kexec_handover.h header if at all
possible.

> diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
> index 50c45ead4e7c9..2671c4e1b3a0b 100644
> --- a/arch/x86/include/uapi/asm/setup_data.h
> +++ b/arch/x86/include/uapi/asm/setup_data.h
> @@ -13,7 +13,8 @@
>  #define SETUP_CC_BLOB			7
>  #define SETUP_IMA			8
>  #define SETUP_RNG_SEED			9
> -#define SETUP_ENUM_MAX			SETUP_RNG_SEED
> +#define SETUP_KEXEC_KHO			10
> +#define SETUP_ENUM_MAX			SETUP_KEXEC_KHO
>  
>  #define SETUP_INDIRECT			(1<<31)
>  #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
> @@ -78,6 +79,16 @@ struct ima_setup_data {
>  	__u64 size;
>  } __attribute__((packed));
>  
> +/*
> + * Locations of kexec handover metadata
> + */
> +struct kho_data {
> +	__u64 fdt_addr;
> +	__u64 fdt_size;
> +	__u64 scratch_addr;
> +	__u64 scratch_size;
> +} __attribute__((packed));
> +
>  #endif /* __ASSEMBLER__ */
>  
>  #endif /* _UAPI_ASM_X86_SETUP_DATA_H */
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 57120f0749cc3..c314212a5ecd5 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -1300,6 +1300,24 @@ void __init e820__memblock_setup(void)
>  		memblock_add(entry->addr, entry->size);
>  	}
>  
> +	/*
> +	 * At this point with KHO we only allocate from scratch memory.
> +	 * At the same time, we configure memblock to only allow
> +	 * allocations from memory below ISA_END_ADDRESS which is not
> +	 * a natural scratch region, because Linux ignores memory below
> +	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
> +	 * allocations, we must allocate real-mode trapoline below

						trampoline ^

> +	 * ISA_END_ADDRESS.
> +	 *
> +	 * To make sure that we can actually perform allocations during
> +	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
> +	 * so we can allocate from there in a scratch-only world.
> +	 *
> +	 * After real mode trampoline is allocated, we clear scratch
> +	 * marking from the memory below ISA_END_ADDRESS
> +	 */
> +	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);

This isn't making a whole ton of sense to me.

Is this *only* to facilitate possible users that need <ISA_END_ADDRESS
allocations? If so, please say that.

I _think_ this is trying to say that KHO kernels are special and are
trying to only allocate from scratch areas. But <ISA_END_ADDRESS
allocations are both necessary and not marked by KHO _as_ a scratch area
which causes a problem.

Also, it's a bit goofy that this code does the "mark" with
ISA_END_ADDRESS and the clear with SZ_1M:

	memblock_clear_kho_scratch(0, SZ_1M);

That seems unnecessarily oblique.

>  	/* Throw away partial pages: */
>  	memblock_trim_memory(PAGE_SIZE);
>  
> diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
> index 68530fad05f74..518635cc0876c 100644
> --- a/arch/x86/kernel/kexec-bzimage64.c
> +++ b/arch/x86/kernel/kexec-bzimage64.c
> @@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
>  #endif /* CONFIG_IMA_KEXEC */
>  }
>  
> +static void setup_kho(const struct kimage *image, struct boot_params *params,
> +		      unsigned long params_load_addr,
> +		      unsigned int setup_data_offset)
> +{
> +#ifdef CONFIG_KEXEC_HANDOVER

Can this #ifdef be replaced with IS_ENABLED()?

> +	struct setup_data *sd = (void *)params + setup_data_offset;
> +	struct kho_data *kho = (void *)sd + sizeof(*sd);
> +
> +	sd->type = SETUP_KEXEC_KHO;
> +	sd->len = sizeof(struct kho_data);
> +
> +	/* Only add if we have all KHO images in place */
> +	if (!image->kho.fdt || !image->kho.scratch)
> +		return;
> +
> +	/* Add setup data */
> +	kho->fdt_addr = image->kho.fdt;
> +	kho->fdt_size = PAGE_SIZE;
> +	kho->scratch_addr = image->kho.scratch->mem;
> +	kho->scratch_size = image->kho.scratch->bufsz;
> +	sd->next = params->hdr.setup_data;
> +	params->hdr.setup_data = params_load_addr + setup_data_offset;
> +#endif /* CONFIG_KEXEC_HANDOVER */
> +}
> +
>  static int
>  setup_boot_parameters(struct kimage *image, struct boot_params *params,
>  		      unsigned long params_load_addr,
> @@ -312,6 +337,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
>  				     sizeof(struct ima_setup_data);
>  	}
>  
> +	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
> +		/* Setup space to store preservation metadata */
> +		setup_kho(image, params, params_load_addr, setup_data_offset);
> +		setup_data_offset += sizeof(struct setup_data) +
> +				     sizeof(struct kho_data);
> +	}

This is a bit weird that it needs this IS_ENABLED() check and the
earlier #ifdef. But I guess  it's following the IMA_KEXEC code's pattern
at least.

>  	/* Setup RNG seed */
>  	setup_rng_seed(params, params_load_addr, setup_data_offset);
>  
> @@ -479,6 +511,10 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
>  		kbuf.bufsz += sizeof(struct setup_data) +
>  			      sizeof(struct ima_setup_data);
>  
> +	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER))
> +		kbuf.bufsz += sizeof(struct setup_data) +
> +			      sizeof(struct kho_data);
> +
>  	params = kzalloc(kbuf.bufsz, GFP_KERNEL);
>  	if (!params)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 766176c4f5ee8..496dae89cf95d 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -451,6 +451,28 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
>  }
>  #endif
>  
> +static void __init add_kho(u64 phys_addr, u32 data_len)
> +{
> +#ifdef CONFIG_KEXEC_HANDOVER
> +	struct kho_data *kho;
> +	u64 addr = phys_addr + sizeof(struct setup_data);
> +	u64 size = data_len - sizeof(struct setup_data);
> +
> +	kho = early_memremap(addr, size);
> +	if (!kho) {
> +		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
> +			addr, size);
> +		return;
> +	}
> +
> +	kho_populate(kho->fdt_addr, kho->fdt_size, kho->scratch_addr, kho->scratch_size);
> +
> +	early_memunmap(kho, size);
> +#else
> +	pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
> +#endif
> +}

Please axe the #ifdef in the .c file if at all possible, just like the
others.

>  static void __init parse_setup_data(void)
>  {
>  	struct setup_data *data;
> @@ -479,6 +501,9 @@ static void __init parse_setup_data(void)
>  		case SETUP_IMA:
>  			add_early_ima_buffer(pa_data);
>  			break;
> +		case SETUP_KEXEC_KHO:
> +			add_kho(pa_data, data_len);
> +			break;
>  		case SETUP_RNG_SEED:
>  			data = early_memremap(pa_data, data_len);
>  			add_bootloader_randomness(data->data, data->len);
> diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
> index f9bc444a3064d..9b9f4534086d2 100644
> --- a/arch/x86/realmode/init.c
> +++ b/arch/x86/realmode/init.c
> @@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
>  	 * setup_arch().
>  	 */
>  	memblock_reserve(0, SZ_1M);
> +
> +	memblock_clear_kho_scratch(0, SZ_1M);

Eek. Needs a comment, badly.

Overall this doesn't look bad. It might be useful to break it up into a
couple of patches, but it's not horrific as-is.
