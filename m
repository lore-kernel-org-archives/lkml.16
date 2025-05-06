Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4D28368F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549098; cv=none; b=B+t9iZOB1Wh2bhGqlaWTBEDt6Uh7NfIVkp4XurK4PQ5/0FktjMQuFpe6ZBSo52jaNZyF+2Zin1k1+s2eMrgOqrbeUreVkacQX7y5Op/z0XOBkml0oY4044BedHEdf8SvvQnIcVdeoXhG21NyiTm8oHg7QVPiyRHXMGEhsuuvb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549098; c=relaxed/simple;
	bh=OzRPHBpO8XEBmvQK1Rg73sH4mr4o/RDx/lXBF6O6k+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKV/N8/Vs9NcnC/6dSzRji8kKNjBlONDjdsgUXk3J2DcfP4xRp0zO8WDvElu7W/P5EoRNCHKHlXdgSqLSLMxUkpZxRFKIbiNFZxa4+7Vn7LTGoXRA3o1ZhGSCVpNmURSLma7LCemRguMrAg921Db/O2A+jLIfnTe5VxyJIst/f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pav0vaxb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pav0vaxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309F8C4CEEF;
	Tue,  6 May 2025 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549098;
	bh=OzRPHBpO8XEBmvQK1Rg73sH4mr4o/RDx/lXBF6O6k+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pav0vaxbMMllmE6t1mjqj0ph/j4pP8Ry2K9QzzKqLfMl8tXN6UHzL+xUuOg/UaEow
	 fAtrroQjdkUi7wX/bwImJ1eChu8Bz+6lBMp1jPIzG4FzKpwQkxCm+QleR8yuiTbulD
	 B21uIpUix86mg6jUtwebxT5khP/rjKWeGnIefLmxEtkn1B1I5/+LXv7f0sC0KXZtZm
	 mB/g21theVgXjROmNJ1rvg+M9INYUn6y3aAG4HIgMuws65awp7du0/apxncCEKJZ3V
	 gcg88gV8F8goRsSXjEiGRwKgweMcBp9xm3U3qlSk0GL1p9iHNo9ZRYO9Gf/Cb4v09i
	 6eQxRKljS7Vbw==
Date: Tue, 6 May 2025 18:31:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC PATCH 7/9] x86/mm: Introduce Remote Action Request
Message-ID: <aBo5ZDvD-ME4dUc-@gmail.com>
References: <20250506003811.92405-1-riel@surriel.com>
 <20250506003811.92405-8-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506003811.92405-8-riel@surriel.com>


* Rik van Riel <riel@surriel.com> wrote:

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
> +typedef struct {
> +	uint64_t for_sw : 8;
> +	uint64_t type : 8;
> +	uint64_t must_be_zero_1 : 16;
> +	uint64_t subtype : 3;
> +	uint64_t page_size: 2;
> +	uint64_t num_pages : 6;
> +	uint64_t must_be_zero_2 : 21;
> +
> +	uint64_t must_be_zero_3;
> +
> +	/*
> +	 * Starting address
> +	 */
> +	uint64_t initiator_cr3;
> +	uint64_t linear_address;
> +
> +	/*
> +	 * Padding
> +	 */
> +	uint64_t padding[4];
> +} rar_payload_t;

- Please don't use _t typedefs for complex types. 'struct rar_payload' 
  should be good enough.

- Please use u64/u32 for HW ABI definitions.

- Please align bitfield definitions vertically, for better readability:

	u64 for_sw		:  8;
	u64 type		:  8;
	u64 must_be_zero_1	: 16;
	u64 subtype		:  3;
	u64 page_size		:  2;
	u64 num_pages		:  6;
	u64 must_be_zero_2	: 21;

> +++ b/arch/x86/mm/rar.c
> @@ -0,0 +1,226 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RAR Tlb shootdown

s/Tlb
 /TLB

> +#include <linux/kgdb.h>

Is this really needed? There's nothing KGDB specific in here AFAICS.

> +static DEFINE_PER_CPU_ALIGNED(u64[(RAR_MAX_PAYLOADS + 8) / 8], rar_action);

> +static void set_action_entry(unsigned long idx, int target_cpu)
> +{
> +	u8 *bitmap = (u8 *)per_cpu(rar_action, target_cpu);

> +	u8 *bitmap = (u8 *)per_cpu(rar_action, target_cpu);

> +	bitmap = (u8 *)per_cpu(rar_action, this_cpu);


So AFAICS all these ugly, forced type casts tp (u8 *) are needed only 
because rar_action has the wrong type: if it were an u8[], then these 
lines could be:

	static DEFINE_PER_CPU_ALIGNED(u8[RAR_MAX_PAYLOADS], rar_action);

	...

	u8 *bitmap = per_cpu(rar_action, target_cpu);

right?

Thanks,

	Ingo
