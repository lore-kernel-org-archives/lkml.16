Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2172AF1E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845541; cv=none; b=nzbfiFJ1CdAS/6f1lVltFuJgl41egirP+wnHWaP2M5BvVVzYg26UCkAD1Z4ijCFhyg7hog1dNEN2UjusLkB7ThY0PLvD+YDiPpW+PTUwqDjUKdhA7SeS64ukt2USyksyF5mSK/lEU2YoojW6nfV2iXtZ2nydMoLF0VqW2oAqK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845541; c=relaxed/simple;
	bh=YWLAfjWbnex0vOweBU0LegtMxBww1J3PlNd2wDBMPJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOyp2/4JqRvaspBnGJASMO8gWWdOBIuN9hFTyYpcV3tpARdUWJDU+E9HMLwoTiyVqyD5XHbqfV44Xub60w+PZ1UjztC3VwttrEtEY59bNFrt4cjlocGvMDxRwZMv/qwplrc1ikBGa2wY4FdO8bDHVnN8DrJuflz9zCICXvf/cF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtYwxdTB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtYwxdTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747845538; x=1779381538;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YWLAfjWbnex0vOweBU0LegtMxBww1J3PlNd2wDBMPJA=;
  b=BtYwxdTBPAxoTH7dHi6Sp3gJ9EMndM82H+SragD0f54Gehna/3Kmr78p
   dJeVPMSq2F7H8OUG8El2wboa3l80eZLx4e1txfVbxdhAVZRAtvZ7MiJso
   OTQ4zx2+y/MDocwX3XYO77KvCGKgz+30B3zp6VEprCw9bVZWFfD3vobfK
   eoqR9HfNWDYvPKuFk2a2iFeQnaavnC3T92HXCMC/HhCe7Zwy3/VuHadOS
   THQeW7s3PZytSWK5pPHV3YRK7DZDCZQ42N3ifOYTyvrh0VzMzDxum/tPi
   PsfR3iW1Nndb0XhwTR3ipEUGMsIp7GLdgljBpJiiK6pC1aCb8NTrxtgch
   g==;
X-CSE-ConnectionGUID: WA4ZMheIRUSjAdVTWAUU1w==
X-CSE-MsgGUID: ZmWyONhGQgSjpmxowFSocw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60494816"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60494816"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:38:57 -0700
X-CSE-ConnectionGUID: rpAY0ODjSW+lGA348uLohQ==
X-CSE-MsgGUID: /3/OVN+oRHy8F7KKIhY7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145021431"
Received: from spandruv-desk1.amr.corp.intel.com (HELO [10.125.109.108]) ([10.125.109.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:38:57 -0700
Message-ID: <2385d4ed-48d5-4d50-ae95-dbeb23432b71@intel.com>
Date: Wed, 21 May 2025 09:38:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 nadav.amit@gmail.com, Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <20250520010350.1740223-8-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 18:02, Rik van Riel wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Remote Action Request (RAR) is a TLB flushing broadcast facility.
> To start a TLB flush, the initiator CPU creates a RAR payload and
> sends a command to the APIC.  The receiving CPUs automatically flush
> TLBs as specified in the payload without the kernel's involement.
> 
> [ riel: add pcid parameter to smp_call_rar_many so other mms can be flushed ]
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/x86/include/asm/rar.h   |  69 +++++++++++++
>  arch/x86/kernel/cpu/common.c |   4 +
>  arch/x86/mm/Makefile         |   1 +
>  arch/x86/mm/rar.c            | 195 +++++++++++++++++++++++++++++++++++
>  4 files changed, 269 insertions(+)
>  create mode 100644 arch/x86/include/asm/rar.h
>  create mode 100644 arch/x86/mm/rar.c
> 
> diff --git a/arch/x86/include/asm/rar.h b/arch/x86/include/asm/rar.h
> new file mode 100644
> index 000000000000..78c039e40e81
> --- /dev/null
> +++ b/arch/x86/include/asm/rar.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_RAR_H
> +#define _ASM_X86_RAR_H
> +
> +/*
> + * RAR payload types
> + */
> +#define RAR_TYPE_INVPG		0
> +#define RAR_TYPE_INVPG_NO_CR3	1
> +#define RAR_TYPE_INVPCID	2
> +#define RAR_TYPE_INVEPT		3
> +#define RAR_TYPE_INVVPID	4
> +#define RAR_TYPE_WRMSR		5
> +
> +/*
> + * Subtypes for RAR_TYPE_INVLPG
> + */
> +#define RAR_INVPG_ADDR			0 /* address specific */
> +#define RAR_INVPG_ALL			2 /* all, include global */
> +#define RAR_INVPG_ALL_NO_GLOBAL		3 /* all, exclude global */
> +
> +/*
> + * Subtypes for RAR_TYPE_INVPCID
> + */
> +#define RAR_INVPCID_ADDR		0 /* address specific */
> +#define RAR_INVPCID_PCID		1 /* all of PCID */
> +#define RAR_INVPCID_ALL			2 /* all, include global */
> +#define RAR_INVPCID_ALL_NO_GLOBAL	3 /* all, exclude global */
> +
> +/*
> + * Page size for RAR_TYPE_INVLPG
> + */
> +#define RAR_INVLPG_PAGE_SIZE_4K		0
> +#define RAR_INVLPG_PAGE_SIZE_2M		1
> +#define RAR_INVLPG_PAGE_SIZE_1G		2
> +
> +/*
> + * Max number of pages per payload
> + */
> +#define RAR_INVLPG_MAX_PAGES 63
> +
> +struct rar_payload {
> +	u64 for_sw		: 8;
> +	u64 type		: 8;
> +	u64 must_be_zero_1	: 16;
> +	u64 subtype		: 3;
> +	u64 page_size		: 2;
> +	u64 num_pages		: 6;
> +	u64 must_be_zero_2	: 21;
> +
> +	u64 must_be_zero_3;
> +
> +	/*
> +	 * Starting address
> +	 */
> +	u64 initiator_cr3;
> +	u64 linear_address;
> +
> +	/*
> +	 * Padding
> +	 */
> +	u64 padding[4];
> +};
> +
> +void rar_cpu_init(void);
> +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> +		       unsigned long start, unsigned long end);
> +
> +#endif /* _ASM_X86_RAR_H */
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index dd662c42f510..b1e1b9afb2ac 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -71,6 +71,7 @@
>  #include <asm/tdx.h>
>  #include <asm/posted_intr.h>
>  #include <asm/runtime-const.h>
> +#include <asm/rar.h>
>  
>  #include "cpu.h"
>  
> @@ -2438,6 +2439,9 @@ void cpu_init(void)
>  	if (is_uv_system())
>  		uv_cpu_init();
>  
> +	if (cpu_feature_enabled(X86_FEATURE_RAR))
> +		rar_cpu_init();
> +
>  	load_fixmap_gdt(cpu);
>  }
>  
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 5b9908f13dcf..f36fc99e8b10 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_ACPI_NUMA)		+= srat.o
>  obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
>  obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
>  obj-$(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)	+= pti.o
> +obj-$(CONFIG_BROADCAST_TLB_FLUSH)		+= rar.o
>  
>  obj-$(CONFIG_X86_MEM_ENCRYPT)	+= mem_encrypt.o
>  obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_amd.o
> diff --git a/arch/x86/mm/rar.c b/arch/x86/mm/rar.c
> new file mode 100644
> index 000000000000..16dc9b889cbd
> --- /dev/null
> +++ b/arch/x86/mm/rar.c
> @@ -0,0 +1,195 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RAR TLB shootdown
> + */
> +#include <linux/sched.h>
> +#include <linux/bug.h>
> +#include <asm/current.h>
> +#include <asm/io.h>
> +#include <asm/sync_bitops.h>
> +#include <asm/rar.h>
> +#include <asm/tlbflush.h>
> +
> +static DEFINE_PER_CPU(struct cpumask, rar_cpu_mask);
> +
> +#define RAR_ACTION_OK		0x00
> +#define RAR_ACTION_START	0x01
> +#define RAR_ACTION_ACKED	0x02
> +#define RAR_ACTION_FAIL		0x80

These don't match up with the names that ended up in the public
documentation. Could we realign them, please?

> +#define RAR_MAX_PAYLOADS 32UL
> +
> +static unsigned long rar_in_use = ~(RAR_MAX_PAYLOADS - 1);
> +static struct rar_payload rar_payload[RAR_MAX_PAYLOADS] __page_aligned_bss;
> +static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);

At some point, there needs to be a description of the data structures.
For instance, there's nothing architecturally requiring all CPUs to
share a payload table. But this implementation chooses to have them
share. We need a discussion somewhere of those design decisions.

One thing that also needs discussion: 'rar_in_use' isn't really about
RAR itself. It's a bitmap of whether the payload is allocated.

> +static unsigned long get_payload(void)
> +{

This is more like "allocate a payload slot" than a "get payload"
operation, IMNHO.

> +	while (1) {
> +		unsigned long bit;
> +
> +		/*
> +		 * Find a free bit and confirm it with
> +		 * test_and_set_bit() below.
> +		 */
> +		bit = ffz(READ_ONCE(rar_in_use));
> +
> +		if (bit >= RAR_MAX_PAYLOADS)
> +			continue;
> +
> +		if (!test_and_set_bit((long)bit, &rar_in_use))
> +			return bit;
> +	}
> +}

This also serves like a kind of spinlock to wait for a payload slot to
become free.

> +static void free_payload(unsigned long idx)
> +{
> +	clear_bit(idx, &rar_in_use);
> +}
> +
> +static void set_payload(unsigned long idx, u16 pcid, unsigned long start,
> +			uint32_t pages)
> +{
> +	struct rar_payload *p = &rar_payload[idx];

I'd _probably_ just pass the 'struct rar_payload *' instead of an index.
It's harder to screw up a pointer.

> +	p->must_be_zero_1	= 0;
> +	p->must_be_zero_2	= 0;
> +	p->must_be_zero_3	= 0;
> +	p->page_size		= RAR_INVLPG_PAGE_SIZE_4K;
> +	p->type			= RAR_TYPE_INVPCID;
> +	p->num_pages		= pages;
> +	p->initiator_cr3	= pcid;
> +	p->linear_address	= start;
> +
> +	if (pcid) {
> +		/* RAR invalidation of the mapping of a specific process. */
> +		if (pages >= RAR_INVLPG_MAX_PAGES)
> +			p->subtype = RAR_INVPCID_PCID;
> +		else
> +			p->subtype = RAR_INVPCID_ADDR;
> +	} else {
> +		/*
> +		 * Unfortunately RAR_INVPCID_ADDR excludes global translations.
> +		 * Always do a full flush for kernel invalidations.
> +		 */
> +		p->subtype = RAR_INVPCID_ALL;
> +	}
> +
> +	smp_wmb();
> +}

The barrier could use a comment too.

> +static void set_action_entry(unsigned long idx, int target_cpu)

Just trying to read this, I think we probably should remove the 'idx'
nomenclature and call them "payload_nr"'s or something more descriptive.

> +{
> +	u8 *bitmap = per_cpu(rar_action, target_cpu);
> +
> +	WRITE_ONCE(bitmap[idx], RAR_ACTION_START);
> +}

Maybe a comment like this for set_action_entry() would be helpful:

/*
 * Given a remote CPU, "arm" its action vector to ensure it
 * handles payload number 'idx' when it receives the RAR signal.
 * The remote CPU will overwrite RAR_ACTION_START when it handles
 * the request.
 */

> +static void wait_for_done(unsigned long idx, int target_cpu)
> +{
> +	u8 status;
> +	u8 *rar_actions = per_cpu(rar_action, target_cpu);
> +
> +	status = READ_ONCE(rar_actions[idx]);
> +
> +	while ((status != RAR_ACTION_OK) && (status != RAR_ACTION_FAIL)) {

Should this be:

	while (status == RAR_ACTION_START) {
	...

? That would more clearly link it to set_action_entry() and would also
be shorter.

> +		cpu_relax();
> +		status = READ_ONCE(rar_actions[idx]);
> +	}
> +
> +	WARN_ON_ONCE(rar_actions[idx] == RAR_ACTION_FAIL);
> +}
> +
> +void rar_cpu_init(void)
> +{
> +	u64 r;
> +	u8 *bitmap;
> +	int this_cpu = smp_processor_id();
> +
> +	cpumask_clear(&per_cpu(rar_cpu_mask, this_cpu));
> +
> +	rdmsrl(MSR_IA32_RAR_INFO, r);
> +	pr_info_once("RAR: support %lld payloads\n", r >> 32);

Doesn't this need to get coordinated or checked against RAR_MAX_PAYLOADS?

It might also be nice to use one of the mask functions for this. It's
nice when you see a spec say "37:32" and then you see code actually see
a GENMASK(37, 32) somewhere to match it.

> +	bitmap = (u8 *)per_cpu(rar_action, this_cpu);
> +	memset(bitmap, 0, RAR_MAX_PAYLOADS);
> +	wrmsrl(MSR_IA32_RAR_ACT_VEC, (u64)virt_to_phys(bitmap));
> +	wrmsrl(MSR_IA32_RAR_PAYLOAD_BASE, (u64)virt_to_phys(rar_payload));

	please vertically align the virt_to_phys() ^

> +
> +	r = RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF;

Setting RAR_CTRL_IGNORE_IF is probably worth a _little_ discussion in
the changelog.

> +	// reserved bits!!! r |= (RAR_VECTOR & 0xff);

Is this just some cruft from testing?

> +	wrmsrl(MSR_IA32_RAR_CTRL, r);
> +}
> +
> +/*
> + * This is a modified version of smp_call_function_many() of kernel/smp.c,
> + * without a function pointer, because the RAR handler is the ucode.
> + */

It doesn't look _that_ much like smp_call_function_many(). I don't see
much that can be consolidated.

> +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> +		       unsigned long start, unsigned long end)
> +{
> +	unsigned long pages = (end - start + PAGE_SIZE) / PAGE_SIZE;
> +	int cpu, next_cpu, this_cpu = smp_processor_id();
> +	cpumask_t *dest_mask;
> +	unsigned long idx;
> +
> +	if (pages > RAR_INVLPG_MAX_PAGES || end == TLB_FLUSH_ALL)
> +		pages = RAR_INVLPG_MAX_PAGES;
> +
> +	/*
> +	 * Can deadlock when called with interrupts disabled.
> +	 * We allow cpu's that are not yet online though, as no one else can

Nit: at some point all of the "we's" need to be excised and moved over
to imperative voice.

> +	 * send smp call function interrupt to this cpu and as such deadlocks
> +	 * can't happen.
> +	 */
> +	WARN_ON_ONCE(cpu_online(this_cpu) && irqs_disabled()
> +		     && !oops_in_progress && !early_boot_irqs_disabled);
> +
> +	/* Try to fastpath.  So, what's a CPU they want?  Ignoring this one. */
> +	cpu = cpumask_first_and(mask, cpu_online_mask);
> +	if (cpu == this_cpu)
> +		cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
> +
> +	/* No online cpus?  We're done. */
> +	if (cpu >= nr_cpu_ids)
> +		return;

This little idiom _is_ in smp_call_function_many_cond(). I wonder if it
can be refactored out.

> +	/* Do we have another CPU which isn't us? */
> +	next_cpu = cpumask_next_and(cpu, mask, cpu_online_mask);
> +	if (next_cpu == this_cpu)
> +		next_cpu = cpumask_next_and(next_cpu, mask, cpu_online_mask);
> +
> +	/* Fastpath: do that cpu by itself. */
> +	if (next_cpu >= nr_cpu_ids) {
> +		idx = get_payload();
> +		set_payload(idx, pcid, start, pages);
> +		set_action_entry(idx, cpu);
> +		arch_send_rar_single_ipi(cpu);
> +		wait_for_done(idx, cpu);
> +		free_payload(idx);
> +		return;
> +	}

FWIW, I'm not sure this is that much of a fast path. I wouldn't be
shocked if _some_ hardware has a much faster way of IPI'ing a single CPU
versus a bunch. But I think arch_send_rar_single_ipi() and
arch_send_rar_ipi_mask() end up frobbing the hardware in pretty similar
ways.

I'd probably just axe this in the name of simplification unless there
are numbers behind it.

> +	dest_mask = this_cpu_ptr(&rar_cpu_mask);
> +	cpumask_and(dest_mask, mask, cpu_online_mask);
> +	cpumask_clear_cpu(this_cpu, dest_mask);
> +
> +	/* Some callers race with other cpus changing the passed mask */
> +	if (unlikely(!cpumask_weight(dest_mask)))
> +		return;
> +
> +	idx = get_payload();
> +	set_payload(idx, pcid, start, pages);
> +
> +	for_each_cpu(cpu, dest_mask)
> +		set_action_entry(idx, cpu);
> +
> +	/* Send a message to all CPUs in the map */
> +	arch_send_rar_ipi_mask(dest_mask);
> +
> +	for_each_cpu(cpu, dest_mask)
> +		wait_for_done(idx, cpu);

Naming nit: Let's give wait_for_done() a more RAR-specific name. It'll
make it clear that this is a RAR opertion and not soemthing generic.

> +	free_payload(idx);
> +}
> +EXPORT_SYMBOL(smp_call_rar_many);

