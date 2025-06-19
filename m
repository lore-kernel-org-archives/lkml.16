Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A592111
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750374074; cv=none; b=WQluwizdOwYuuYUli9QZP8BrjihUaSN2w+ShHv/MG+Okk9FKpoVUS59J4Zj/Li8WRb0K7ynh7P7M3G8rQxPm0SKcl1RtWR8Bn6l1hsCAVXyv/ygRKfeyZcatu73VX0i7bwu/dHjcdalp/fKtIs3lXirHQsuqFFFGcvpzJ/LtMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750374074; c=relaxed/simple;
	bh=xGUJ7y0gHnbEyv19rSRjINPSGHum830lMfR/86FcRvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No1Eamnp3S+tljXRiLzlvPt6Y//3hX7zMss1CK+ulcGUOiTYmL2NtuqplrOF5mctF5fCEmLt9FHVZjwytDPNnxcnXjBMpYTNQ5hv3AV4K/eRqFWOJfXT65qWjpwrYotfNT1PHREzIrh9ze/S3/1jFZnR0ZCkLvQ9UKxx3T4jdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hopGCnEF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hopGCnEF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d3f72391so11897725e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750374069; x=1750978869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tlaKM/ALvHNsWfun0qrYkuP7m004FHs902XZtVBueXY=;
        b=hopGCnEFtDcnkpxOsz6zJT7w3aNGEfTP5YLcSqIa1LaOU+IAowGaYr158i0j9qlHhx
         JWPI9I/9J1zocLG0jdfFYIkyCMXYed/ZxhZo2Jb3iCX9/7kmxHcr+s1KmPPi2x5blp5M
         s/8Pt+m79TcuqqgVfka4v84tzrX96Cg6Ccm96emWaRsvK4mLOs1OvrKzytBkdWPVxibH
         4LdnW/vHsmmch9y2QPkCXdSg71iTssTxfiDiAocUUlFWmWxiuiTyE/7xSOsZsgg05Awd
         ZmGaIgYfDLDMbmP4YNkRqmKb3wWcH+j6aQDvA2DqsxF8Bz5dIF+gy6v8ii1N/NpQBQpb
         Pkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750374069; x=1750978869;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlaKM/ALvHNsWfun0qrYkuP7m004FHs902XZtVBueXY=;
        b=cxmugdoRosMiH4AmZpuU90hrME43Fh0EzGOLEv5LV63EB3jKZkLm2KEN1onAGcFLjv
         E0R2/BbjHbcuDyKDQfRzeM++8Kun80BR7tOOupwCeQHL03t3LWSKv2HdYWQ5aY3uzDe7
         Daxr780a3xXAJIb8KZqa8GzHBmfxhsqPIGMYpmdrgmcHESdKZc5D4JUD176HlSfWv2YB
         X6DNZ2p2WL0fmZaS4GfLzeVGfJ5q9YSICvzipiQXMgGks3eHaRUJU/PApTNuuiV2hA5B
         mLVe77VSnRiY/jUHeIiJJwA+sUvfEmSrup4IwNkidKTx9nHySL5U97nYRtb+viutUt+F
         HAsw==
X-Forwarded-Encrypted: i=1; AJvYcCUcxSiLt5UAh8cO2IZxc/QzHPTYruj4UMisRcyJAwb+pqcJoW8VHdfm0r2UVxylYkbRcgKE3AOqtkEyPXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uHZ64T1d3g7EDcAHMHfh7n7ULh8Vy9iv/wLd8HjHLUmAlPIA
	05+snbQhPzwxopFupKCaBjPrqrE8lpAYK4n+6g90n3jR7NkOnt0ljV6I
X-Gm-Gg: ASbGncswdD+gKuc09bOO0tuoEPNLE824WtxkUr07uhshAqvaFfunsuSqadbjSzWZUQX
	OEpZhwXJo5zhmgtkq2jLyKun6fjcqf79AlD4kryjv2Z9LByT0QgPLnaZmVD49rUFS+c/8/MAGla
	sRdegDSgwzJD5Q6UijYVCXWV10p+j8ZS1qAZ003ftS23Qz5SG4Qxs7wZ3GcrFTwt6JpirB9YPXn
	rXDIgnQewKDVT2jr/K3i8Fg9W09/mXdU5HdFmiCBieeA0+gMHM/G4Y9GTEHahJXHWz2cZdyVF5f
	PF6uT5lhRGBEOuc/0tjD25Gd5XEiJbOpfXraqJM93Y/x+R6Dw10FEi1nDhhN/vdBie+LFGZmbpW
	83w==
X-Google-Smtp-Source: AGHT+IG1N4YvjcRsQUkqmpmsYqrvgsHC/kALXQbc3kpJAZJ8hJ19qLmWdT1lRo+6SiTBrj25aAG4MQ==
X-Received: by 2002:a05:600c:c16f:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-453659d30c2mr3946625e9.15.1750374068770;
        Thu, 19 Jun 2025 16:01:08 -0700 (PDT)
Received: from [192.168.1.8] ([5.29.20.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10a4dsm507945f8f.8.2025.06.19.16.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 16:01:07 -0700 (PDT)
Message-ID: <6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com>
Date: Fri, 20 Jun 2025 02:01:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, bp@alien8.de, x86@kernel.org, seanjc@google.com,
 tglx@linutronix.de, mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
 <20250619200442.1694583-6-riel@surriel.com>
From: Nadav Amit <nadav.amit@gmail.com>
Content-Language: en-US
Autocrypt: addr=nadav.amit@gmail.com; keydata=
 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
In-Reply-To: <20250619200442.1694583-6-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2025 23:03, Rik van Riel wrote:
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
>   arch/x86/include/asm/rar.h  |  76 ++++++++++++
>   arch/x86/kernel/cpu/intel.c |   8 +-
>   arch/x86/mm/Makefile        |   1 +
>   arch/x86/mm/rar.c           | 236 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 320 insertions(+), 1 deletion(-)
>   create mode 100644 arch/x86/include/asm/rar.h
>   create mode 100644 arch/x86/mm/rar.c
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
> +};

I think __aligned(64) should allow you to get rid of the padding.

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
>   #include <asm/microcode.h>
>   #include <asm/msr.h>
>   #include <asm/numa.h>
> +#include <asm/rar.h>
>   #include <asm/resctrl.h>
>   #include <asm/thermal.h>
>   #include <asm/uaccess.h>
> @@ -624,6 +625,9 @@ static void init_intel(struct cpuinfo_x86 *c)
>   	split_lock_init();
>   
>   	intel_init_thermal(c);
> +
> +	if (cpu_feature_enabled(X86_FEATURE_RAR))
> +		rar_cpu_init();
>   }
>   
>   #ifdef CONFIG_X86_32
> @@ -725,8 +729,10 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
>   
>   		rdmsrl(MSR_IA32_CORE_CAPS, msr);
>   
> -		if (msr & MSR_IA32_CORE_CAPS_RAR)
> +		if (msr & MSR_IA32_CORE_CAPS_RAR) {
>   			setup_force_cpu_cap(X86_FEATURE_RAR);
> +			rar_boot_cpu_init();
> +		}
>   	}
>   }
>   
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 5b9908f13dcf..f36fc99e8b10 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_ACPI_NUMA)		+= srat.o
>   obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
>   obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
>   obj-$(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)	+= pti.o
> +obj-$(CONFIG_BROADCAST_TLB_FLUSH)		+= rar.o
>   
>   obj-$(CONFIG_X86_MEM_ENCRYPT)	+= mem_encrypt.o
>   obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= mem_encrypt_amd.o
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
> +
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

I think you can lose the __padding and instead have 
____cacheline_aligned (and then you won't need union).

> +
> +static struct rar_lock rar_locks[RAR_MAX_PAYLOADS] __cacheline_aligned;
> +
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

Why raw_* ?

> +	return cpu % rar_max_payloads;
> +}
> +
> +static int get_payload_slot(void)
> +{
> +	int payload_nr = cpu_rar_payload_number();
> +	raw_spin_lock(&rar_locks[payload_nr].lock);
> +	return payload_nr;
> +}

I think it would be better to open-code it to improve readability. If 
you choose not to, I think you should use sparse indications (e.g., 
__acquires() ).

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

I think you can propagate the stride to this point instead of using 
fixed 4KB stride.

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

I wonder whether it would be safer to set something to p->num_pages.
(then we can do it unconditionally)

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

Maybe you can drop the smp_wmb() here and instead change the 
WRITE_ONCE() in set_action_entry() to smp_store_release() ? It should 
have the same effect and I think would be cleaner and convey your intent 
better.

> +}
> +
> +static void set_action_entry(unsigned long payload_nr, int target_cpu)
> +{
> +	u8 *bitmap = per_cpu(rar_action, target_cpu);

bitmap? It doesn't look like one...

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

WARN_ON_ONCE(status != RAR_SUCCESS)

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

Seems a bit risky test. If anything, I would check that the MSR that is 
supposed to be set *last* (MSR_IA32_RAR_CTRL) have the expected value. 
But it would still be best to initialize the MSRs unconditionally or to 
avoid repeated initialization using a different scheme.

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

Not a fan of the reuse of r for different purposes.

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

I think "end" is not inclusive. See for instance flush_tlb_page() where 
"end" is set to "a + PAGE_SIZE". So this would flush one extra page.

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

cpumask_and() returns "false if *@dstp is empty, else returns true". So 
you can use his value instead of calling cpumask_weight().

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

