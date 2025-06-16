Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD44F1DED70
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084553; cv=none; b=fcD1iWQ/6D/vuIpDhjS+KcatpAb8ZltGlHWeyNqRXhOGvs0z2FO1mUQBh7gEPR8kZk2PPZ6FFo9ePd0RXqBIJnGoNMiwC3+sqjm9bqrEXv4r9L6gSUN9LU3Ef8/qgg0k5J6cpxVVRczZ9zuw1/tT4za4JxulCORVQBT0tKDWBwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084553; c=relaxed/simple;
	bh=2/I7pMzYXm5DZZAxEoNW/kDOBKIaP9ZGqcqzI2qOH6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMAmzIXjhVLE1yuYnuJ8T2SN7+Zlufd1Qk7kPZodqZ3TiauKHDG9274kxlAsCaC510/sLjynM66N/YiiKBfZ59Zs4OZe2j+jYkekqASBmMEoCIc+9tKbWGIkE9K1cbzEOwOSnS+qw1xH9XX5zBnnlySBWZH/4OB/S4kBzMXpufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOjLaU4l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOjLaU4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750084551; x=1781620551;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2/I7pMzYXm5DZZAxEoNW/kDOBKIaP9ZGqcqzI2qOH6g=;
  b=OOjLaU4lagDWsYLNpOSWVN0q4KXcEczN3ZpoxUt4iiCpXxiL6u4LkmPG
   lJIb0RuZrexMGa2ByPJr+JZh7DhGcgf8wMVzMkC+T0zwlxGOfhkbcO87d
   YpYsq3yTv2wNHGT+5cIXN+25B6wegfphdKf7D7GLiiqKgxZp+eaJJoiNK
   5F6XFaBKhW3FtP4tXEghCyE8dD7LCWj6cA2ZWOg/1sHKW/0X6Lt50+Qmp
   Wv0ERhxLd7mV/hlumRNIislWOMEMy7EZ1/vWKYdR9pLia7EZspPtyxJyN
   YSYJr7fqRMBCV3LCELnShrrnpb93I3xxEeyaq3Bf7dbyagll7pk4/cdHG
   g==;
X-CSE-ConnectionGUID: h0LHsCkBT4CgYr0Dc/PmEg==
X-CSE-MsgGUID: Uw/SnIhPRy6Y0AN7ObDSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39838639"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39838639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 07:35:50 -0700
X-CSE-ConnectionGUID: 7PLTTM50R2+KvNynGxlxbQ==
X-CSE-MsgGUID: vhpZlixnR3qEbKQKZotZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179486859"
Received: from msatwood-mobl.amr.corp.intel.com (HELO [10.125.108.25]) ([10.125.108.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 07:35:49 -0700
Message-ID: <b53d59de-1aba-41f0-a908-e574f3db5958@intel.com>
Date: Mon, 16 Jun 2025 07:35:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
 raghavendra.kt@amd.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-11-ankur.a.arora@oracle.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250616052223.723982-11-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/15/25 22:22, Ankur Arora wrote:
> clear_page_rep() and clear_page_erms() are wrappers around "REP; STOS"
> variations. Inlining gets rid of the costly call/ret (for cases with
> speculative execution related mitigations.)

Could you elaborate a bit on which "speculative execution related
mitigations" are so costly with these direct calls?


> -	kmsan_unpoison_memory(page, PAGE_SIZE);
> -	alternative_call_2(clear_page_orig,
> -			   clear_page_rep, X86_FEATURE_REP_GOOD,
> -			   clear_page_erms, X86_FEATURE_ERMS,
> -			   "=D" (page),
> -			   "D" (page),
> -			   "cc", "memory", "rax", "rcx");

I've got to say, I don't dislike the old code. It's utterly clear from
that code what's going on. It's arguable that it's not clear that the
rep/erms variants are just using stosb vs. stosq, but the high level
concept of "use a feature flag to switch between three implementations
of clear page" is crystal clear.

> +	kmsan_unpoison_memory(page, len);
> +	asm volatile(ALTERNATIVE_2("call memzero_page_aligned_unrolled",
> +				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
> +				   "rep stosb", X86_FEATURE_ERMS)
> +			: "+c" (len), "+D" (page), ASM_CALL_CONSTRAINT
> +			: "a" (0)
> +			: "cc", "memory");
>  }

This is substantially less clear. It also doesn't even add comments to
make up for the decreased clarity.

>  void copy_page(void *to, void *from);
> diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
> index a508e4a8c66a..27debe0c018c 100644
> --- a/arch/x86/lib/clear_page_64.S
> +++ b/arch/x86/lib/clear_page_64.S
> @@ -6,30 +6,15 @@
>  #include <asm/asm.h>
>  
>  /*
> - * Most CPUs support enhanced REP MOVSB/STOSB instructions. It is
> - * recommended to use this when possible and we do use them by default.
> - * If enhanced REP MOVSB/STOSB is not available, try to use fast string.
> - * Otherwise, use original.
> + * Zero page aligned region.
> + * %rdi	- dest
> + * %rcx	- length
>   */

That comment was pretty useful, IMNHO.

How about we add something like this above it? I think it explains the
whole landscape, including the fact that X86_FEATURE_REP_GOOD is
synthetic and X86_FEATURE_ERMS is not:

Switch between three implementation of page clearing based on CPU
capabilities:

 1. memzero_page_aligned_unrolled(): the oldest, slowest and universally
    supported method. Uses a for loop (in assembly) to write a 64-byte
    cacheline on each loop. Each loop iteration writes to memory using
    8x 8-byte MOV instructions.
 2. "rep stosq": Really old CPUs had crummy REP implementations.
    Vendor CPU setup code sets 'REP_GOOD' on CPUs where REP can be
    trusted. The instruction writes 8 bytes per REP iteration but CPUs
    internally batch these together and do larger writes.
 3. "rep stosb": CPUs that enumerate 'ERMS' have an improved STOS
    implementation that is less picky about alignment and where STOSB
    (1 byte at a time) is actually faster than STOSQ (8 bytes at a
    time).


