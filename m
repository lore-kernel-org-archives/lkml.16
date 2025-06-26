Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E182ECD16
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952474; cv=none; b=IZUlgCcHgja+P62Sm4e0IPK0DwC50pKjSDrm9YLVERTLlNX7vGg+IjGbnaby6VfeZozIcuSqGHc7HB23yclRu4EIeprhXQHJQEOiCnAW63m2BsNXEpzUroDCo0aBhIhWK7dgJW6POEPAFdCc4b/jhLGtMBW2BhyxkFsX7Q6JTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952474; c=relaxed/simple;
	bh=YkJR8d6ubtTpEaTiVh9a/jfRWhx1ls1YJ7tNoNM2FbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REjHx+kwiQJw+E87Ea3JXi2M41kHaNCI4OVd7MtpR5wVznZm6gd60EE4FDDWSEJbWuOteCWLpIwns3Mwf2fHr7PBJ+TMYQ6TTrx9oA3Ej6/NpDdaOYbka6MzXerbc6BzaG38O3MKI1kby/rAdl3le8zEjzk+kQqJE5vNpboF4ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ZA0JVE4p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EfhVjMNd; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ZA0JVE4p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EfhVjMNd"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B53BD7A006F;
	Thu, 26 Jun 2025 11:41:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 26 Jun 2025 11:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1750952468; x=
	1751038868; bh=gCXFosW0Spg3ARmU5uEzXAndCmge2domGUZBMHNVsNE=; b=Z
	A0JVE4pfTz4RALC2pvaAipTlB66EtfLrRIpsUZ549olwuNJ55iWV5RIGxipcS24/
	S022NHRK0/DRwsO0gBIujF9BKmzFOUYqj5IfGBByy8pPNEw27nyR2CxeAnyNU+aw
	cL318pPDU5mhOJXGzmW50yCjeKdIN0v8lTD8emtYm1Q4aKAknGo1mZ46LN9nWrLr
	hj+AfDRW9DCB66tlFS6S2tBmOTmMgkz+UH9v4tdaCHJY/Wk9Ud6xbPeTj7A/Mixa
	S5dPlMaMHmwBQuQNF3VP3o3pkVieMZlC9sZNfNTfHCqwfepwVUX/TcCh3hGBPT5R
	ipEwcs++DQ8MskikQXmkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750952468; x=1751038868; bh=gCXFosW0Spg3ARmU5uEzXAndCmge2domGUZ
	BMHNVsNE=; b=EfhVjMNdm5UGpiLlfjZ9/IRPtJ9HBkKBQpzwW7qIPCZql5jlD4q
	b7bbecI1hraVimT56oDZTOnSpwtHwYiHXThyWhYP/qGleXx2XYDO+czzwLxF5tPl
	6VKg9PgBHnhghGJuE46jwsmscHJ4iujK3EMPt8zbBZnSQayLQ20Nx0V7NdNmg4Tw
	7CKO6PxyLBoRHEnSsJBpcFdEDDiGJdxryT4c8UO35TnQKvGXRSt4tHzPVm7BIK4Z
	jGQPRJ37xjlyzb1XoopL34FojNnfd0JWvBKFx5ZA0deAzcKn4v4MwxbUprOoBMtE
	IK1RbXvu0rDFuZ/7YO2QmhgBthSLLg2u3tw==
X-ME-Sender: <xms:FGpdaENceBhLYSD1hYGe3xlANiMztW13JHRyTN0EboLYrWKVrSNRPQ>
    <xme:FGpdaK-W3f1SFr_AdLnskIwb2XUekP30S7wLwJRdqf2-rAzzxUpEQ-_xU3_mYWw1-
    0kSH0dGHzI3sLV_hyk>
X-ME-Received: <xmr:FGpdaLS6bs_xFce3ImuUj4TdsicBAjagpotdVifJsIWenJwvWFJF9L-MlZbmVHcdGEn6Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpedfmfhirhhilhhlucet
    rdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvgeqne
    cuggftrfgrthhtvghrnhepffdvveeuteduhffhffevlefhteefveevkeelveejudduvedv
    uddvleetudevhfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhivghlsehsuhhrrhhivg
    hlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesmhgvthgrrdgtohhmpd
    hrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehluhhtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghpsegrlhhivghnkedruggv
    pdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgruggrvh
    drrghmihhtsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:FGpdaMuitkhfU8HAIJpdXwKaAIGNwguyNpwdOA-ERKpmC01tsF2KwQ>
    <xmx:FGpdaMd2bWXoJcbzFZLAlXcSoFl2aPkTA1kCcr0JyXlu2toeOvqJHg>
    <xmx:FGpdaA35rBpsgIcEB4vSJ0qbfK1LFAR0HhjdWmwgUDqrmTxbatQTfA>
    <xmx:FGpdaA9KARTtFjxJqM7R5hcplqCmpmOVCQm0OgyqRaIhOwmEvsejSg>
    <xmx:FGpdaNpXLE7vPnC8_7ybj8shifSyjzw4IS6_U4olKuveVvYEplNDH9-->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 11:41:03 -0400 (EDT)
Date: Thu, 26 Jun 2025 18:41:00 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, bp@alien8.de, 
	x86@kernel.org, nadav.amit@gmail.com, seanjc@google.com, tglx@linutronix.de, 
	mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
Message-ID: <2wis5t6gys734pzky7vfpsw5tefmymww6n7sqylnlbx7o4ll7e@j2cah4e2cns2>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-6-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200442.1694583-6-riel@surriel.com>

On Thu, Jun 19, 2025 at 04:03:57PM -0400, Rik van Riel wrote:
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
>  arch/x86/include/asm/rar.h  |  76 ++++++++++++
>  arch/x86/kernel/cpu/intel.c |   8 +-
>  arch/x86/mm/Makefile        |   1 +
>  arch/x86/mm/rar.c           | 236 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 320 insertions(+), 1 deletion(-)
>  create mode 100644 arch/x86/include/asm/rar.h
>  create mode 100644 arch/x86/mm/rar.c
> 
> diff --git a/arch/x86/include/asm/rar.h b/arch/x86/include/asm/rar.h
> new file mode 100644
> index 000000000000..c875b9e9c509
> --- /dev/null
> +++ b/arch/x86/include/asm/rar.h
> @@ -0,0 +1,76 @@
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

Bitfield of 8 bit? Why not just u8?

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
> +	union {
> +		u64 initiator_cr3;

Initiator? It is CR3 to flush, not CR3 of the initiator.

> +		struct {
> +			u64 pcid	: 12;
> +			u64 ignored	: 52;
> +		};
> +	};
> +	u64 linear_address;
> +
> +	/*
> +	 * Padding
> +	 */
> +	u64 padding[4];

But it is not padding. It is available for SW, according to spec.

> +};

As far as I can see, only RAR_TYPE_INVPCID is used. Maybe it worth
defining payload struct specifically for this type and get rid of union.

> +
> +void rar_cpu_init(void);
> +void rar_boot_cpu_init(void);
> +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> +		       unsigned long start, unsigned long end);
> +
> +#endif /* _ASM_X86_RAR_H */
> diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> index 0cc4ae27127c..ddc5e7d81077 100644
> --- a/arch/x86/kernel/cpu/intel.c
> +++ b/arch/x86/kernel/cpu/intel.c
> @@ -22,6 +22,7 @@
>  #include <asm/microcode.h>
>  #include <asm/msr.h>
>  #include <asm/numa.h>
> +#include <asm/rar.h>
>  #include <asm/resctrl.h>
>  #include <asm/thermal.h>
>  #include <asm/uaccess.h>
> @@ -624,6 +625,9 @@ static void init_intel(struct cpuinfo_x86 *c)
>  	split_lock_init();
>  
>  	intel_init_thermal(c);
> +
> +	if (cpu_feature_enabled(X86_FEATURE_RAR))
> +		rar_cpu_init();

So, boot CPU gets initialized twice right? Once via rar_boot_cpu_init()
in intel_detect_tlb() and the second time here.

>  }
>  
>  #ifdef CONFIG_X86_32
> @@ -725,8 +729,10 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
>  
>  		rdmsrl(MSR_IA32_CORE_CAPS, msr);
>  
> -		if (msr & MSR_IA32_CORE_CAPS_RAR)
> +		if (msr & MSR_IA32_CORE_CAPS_RAR) {
>  			setup_force_cpu_cap(X86_FEATURE_RAR);
> +			rar_boot_cpu_init();
> +		}
>  	}
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
> index 000000000000..76959782fb03
> --- /dev/null
> +++ b/arch/x86/mm/rar.c
> @@ -0,0 +1,236 @@
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
> +#define RAR_SUCCESS	0x00
> +#define RAR_PENDING	0x01
> +#define RAR_FAILURE	0x80
> +
> +#define RAR_MAX_PAYLOADS 64UL
> +
> +/* How many RAR payloads are supported by this CPU */
> +static int rar_max_payloads __ro_after_init = RAR_MAX_PAYLOADS;
> +
> +/*
> + * RAR payloads telling CPUs what to do. This table is shared between
> + * all CPUs; it is possible to have multiple payload tables shared between
> + * different subsets of CPUs, but that adds a lot of complexity.
> + */
> +static struct rar_payload rar_payload[RAR_MAX_PAYLOADS] __page_aligned_bss;

On machines without RAR it would waste 4k. Not a big deal, I guess. But it
would be neat to reclaim it if unused.

> +/*
> + * Reduce contention for the RAR payloads by having a small number of
> + * CPUs share a RAR payload entry, instead of a free for all with all CPUs.
> + */
> +struct rar_lock {
> +	union {
> +		raw_spinlock_t lock;
> +		char __padding[SMP_CACHE_BYTES];
> +	};
> +};
> +
> +static struct rar_lock rar_locks[RAR_MAX_PAYLOADS] __cacheline_aligned;

One more 4k.

> +/*
> + * The action vector tells each CPU which payload table entries
> + * have work for that CPU.
> + */
> +static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);
> +
> +/*
> + * TODO: group CPUs together based on locality in the system instead
> + * of CPU number, to further reduce the cost of contention.
> + */
> +static int cpu_rar_payload_number(void)
> +{
> +	int cpu = raw_smp_processor_id();
> +	return cpu % rar_max_payloads;
> +}
> +
> +static int get_payload_slot(void)
> +{
> +	int payload_nr = cpu_rar_payload_number();
> +	raw_spin_lock(&rar_locks[payload_nr].lock);
> +	return payload_nr;
> +}
> +
> +static void free_payload_slot(unsigned long payload_nr)
> +{
> +	raw_spin_unlock(&rar_locks[payload_nr].lock);
> +}
> +
> +static void set_payload(struct rar_payload *p, u16 pcid, unsigned long start,
> +			long pages)
> +{
> +	p->must_be_zero_1	= 0;
> +	p->must_be_zero_2	= 0;
> +	p->must_be_zero_3	= 0;
> +	p->page_size		= RAR_INVLPG_PAGE_SIZE_4K;
> +	p->type			= RAR_TYPE_INVPCID;
> +	p->pcid			= pcid;
> +	p->linear_address	= start;
> +
> +	if (pcid) {
> +		/* RAR invalidation of the mapping of a specific process. */
> +		if (pages < RAR_INVLPG_MAX_PAGES) {
> +			p->num_pages = pages;
> +			p->subtype = RAR_INVPCID_ADDR;
> +		} else {
> +			p->subtype = RAR_INVPCID_PCID;
> +		}
> +	} else {
> +		/*
> +		 * Unfortunately RAR_INVPCID_ADDR excludes global translations.
> +		 * Always do a full flush for kernel invalidations.
> +		 */
> +		p->subtype = RAR_INVPCID_ALL;
> +	}
> +
> +	/* Ensure all writes are visible before the action entry is set. */
> +	smp_wmb();
> +}
> +
> +static void set_action_entry(unsigned long payload_nr, int target_cpu)
> +{
> +	u8 *bitmap = per_cpu(rar_action, target_cpu);
> +
> +	/*
> +	 * Given a remote CPU, "arm" its action vector to ensure it handles
> +	 * the request at payload_nr when it receives a RAR signal.
> +	 * The remote CPU will overwrite RAR_PENDING when it handles
> +	 * the request.
> +	 */
> +	WRITE_ONCE(bitmap[payload_nr], RAR_PENDING);
> +}
> +
> +static void wait_for_action_done(unsigned long payload_nr, int target_cpu)
> +{
> +	u8 status;
> +	u8 *rar_actions = per_cpu(rar_action, target_cpu);
> +
> +	status = READ_ONCE(rar_actions[payload_nr]);
> +
> +	while (status == RAR_PENDING) {
> +		cpu_relax();
> +		status = READ_ONCE(rar_actions[payload_nr]);
> +	}
> +
> +	WARN_ON_ONCE(rar_actions[payload_nr] != RAR_SUCCESS);
> +}
> +
> +void rar_cpu_init(void)
> +{
> +	u8 *bitmap;
> +	u64 r;
> +
> +	/* Check if this CPU was already initialized. */
> +	rdmsrl(MSR_IA32_RAR_PAYLOAD_BASE, r);
> +	if (r == (u64)virt_to_phys(rar_payload))
> +		return;
> +
> +	bitmap = this_cpu_ptr(rar_action);
> +	memset(bitmap, 0, RAR_MAX_PAYLOADS);
> +	wrmsrl(MSR_IA32_RAR_ACT_VEC, (u64)virt_to_phys(bitmap));
> +	wrmsrl(MSR_IA32_RAR_PAYLOAD_BASE, (u64)virt_to_phys(rar_payload));
> +
> +	/*
> +	 * Allow RAR events to be processed while interrupts are disabled on
> +	 * a target CPU. This prevents "pileups" where many CPUs are waiting
> +	 * on one CPU that has IRQs blocked for too long, and should reduce
> +	 * contention on the rar_payload table.
> +	 */
> +	wrmsrl(MSR_IA32_RAR_CTRL, RAR_CTRL_ENABLE | RAR_CTRL_IGNORE_IF);

Hmm. How is RAR_CTRL_IGNORE_IF safe? Wouldn't it break GUP_fast() which
relies on disabling interrupts to block TLB flush and page table freeing?

> +}
> +
> +void rar_boot_cpu_init(void)
> +{
> +	int max_payloads;
> +	u64 r;
> +
> +	/* The MSR contains N defining the max [0-N] rar payload slots. */
> +	rdmsrl(MSR_IA32_RAR_INFO, r);
> +	max_payloads = (r >> 32) + 1;
> +
> +	/* If this CPU supports less than RAR_MAX_PAYLOADS, lower our limit. */
> +	if (max_payloads < rar_max_payloads)
> +		rar_max_payloads = max_payloads;
> +	pr_info("RAR: support %d payloads\n", max_payloads);
> +
> +	for (r = 0; r < rar_max_payloads; r++)
> +		rar_locks[r].lock = __RAW_SPIN_LOCK_UNLOCKED(rar_lock);
> +
> +	/* Initialize the boot CPU early to handle early boot flushes. */
> +	rar_cpu_init();
> +}
> +
> +/*
> + * Inspired by smp_call_function_many(), but RAR requires a global payload
> + * table rather than per-CPU payloads in the CSD table, because the action
> + * handler is microcode rather than software.
> + */
> +void smp_call_rar_many(const struct cpumask *mask, u16 pcid,
> +		       unsigned long start, unsigned long end)
> +{
> +	unsigned long pages = (end - start + PAGE_SIZE) / PAGE_SIZE;
> +	int cpu, this_cpu = smp_processor_id();
> +	cpumask_t *dest_mask;
> +	unsigned long payload_nr;
> +
> +	/* Catch the "end - start + PAGE_SIZE" overflow above. */
> +	if (end == TLB_FLUSH_ALL)
> +		pages = RAR_INVLPG_MAX_PAGES + 1;
> +
> +	/*
> +	 * Can deadlock when called with interrupts disabled.
> +	 * Allow CPUs that are not yet online though, as no one else can
> +	 * send smp call function interrupt to this CPU and as such deadlocks
> +	 * can't happen.
> +	 */
> +	if (cpu_online(this_cpu) && !oops_in_progress && !early_boot_irqs_disabled) {
> +		lockdep_assert_irqs_enabled();
> +		lockdep_assert_preemption_disabled();
> +	}
> +
> +	/*
> +	 * A CPU needs to be initialized in order to process RARs.
> +	 * Skip offline CPUs.
> +	 *
> +	 * TODO:
> +	 * - Skip RAR to CPUs that are in a deeper C-state, with an empty TLB
> +	 *
> +	 * This code cannot use the should_flush_tlb() logic here because
> +	 * RAR flushes do not update the tlb_gen, resulting in unnecessary
> +	 * flushes at context switch time.
> +	 */
> +	dest_mask = this_cpu_ptr(&rar_cpu_mask);
> +	cpumask_and(dest_mask, mask, cpu_online_mask);
> +
> +	/* Some callers race with other CPUs changing the passed mask */
> +	if (unlikely(!cpumask_weight(dest_mask)))
> +		return;
> +
> +	payload_nr = get_payload_slot();
> +	set_payload(&rar_payload[payload_nr], pcid, start, pages);
> +
> +	for_each_cpu(cpu, dest_mask)
> +		set_action_entry(payload_nr, cpu);
> +
> +	/* Send a message to all CPUs in the map */
> +	native_send_rar_ipi(dest_mask);
> +
> +	for_each_cpu(cpu, dest_mask)
> +		wait_for_action_done(payload_nr, cpu);
> +
> +	free_payload_slot(payload_nr);
> +}
> +EXPORT_SYMBOL(smp_call_rar_many);
> -- 
> 2.49.0
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
