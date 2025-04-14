Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF45019D07A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612357; cv=none; b=VN0/WmcvJv7XHJl6Komd7id5ptk2tjb5m4Y8wsmF5iOj8XeME6fbxKnRhfr9od26xsp1+JF32GQGjrYguoR23JiSZYr44be0OzUdl3GpGG2974qBmDY1zc9k3yIiXZTfqKB2rXdnM1AUpOnCXPVi/Y5LlByxcaGzmD5QUf0kh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612357; c=relaxed/simple;
	bh=EsnzLqlAA53UvsolhqObhC929/tsG0a5GbdMQu0r4vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1egXUY2SR2J8cdWtGgEDFXAjYKDkESKg/yZcqyodz3Y74fdAIiB43wu1TixojJpWtDIUa08fKCOq08OXcOVcb0l++BffQMqjaovcGOxQSdSI4SoJUUlvspSbLVpbJK0vDAitLldGzbAyQRmNqap7RPp0KGNlmTVryHuBSL1AQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktR1h8Ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktR1h8Ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA8C4CEE2;
	Mon, 14 Apr 2025 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744612357;
	bh=EsnzLqlAA53UvsolhqObhC929/tsG0a5GbdMQu0r4vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ktR1h8Jul5fv6V5VgCcaDbnGMQD3A4vvm97Cgd45ocrhZXIeMXMuyRV985aglOziD
	 OPXYJDddj9JmuPYWdclGblAouOjwToz8LFwKC4pOf3DFmmSkTfXzp6Dq2IcBTT6f0C
	 HbAp+0aKeWM+5QwWIr395EENiedS956r9FO3fvGJGFMSLu2QwuxNIDvjeRZI22udYs
	 dpOXShyqvoObbmA5Yyt/h7VZJeUvMSyZuYC+ZNxajGX4AlgO8R3fcumafjj2wspdmQ
	 y0LQKUL7EMpqfrSExErORJhobIylJcURmgYp9InrGRZseucQG17XKZXQ7cbSrI5+jv
	 XvNhrvWIVaI4Q==
Date: Mon, 14 Apr 2025 08:32:29 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
Message-ID: <Z_yr_cmXti4kXHaX@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-2-ankur.a.arora@oracle.com>


* Ankur Arora <ankur.a.arora@oracle.com> wrote:

> clear_page*() variants now take a page-aligned length parameter and
> clears the whole region.

Please read your changelogs and fix typos. ;-)

> +void clear_pages_orig(void *page, unsigned int length);
> +void clear_pages_rep(void *page, unsigned int length);
> +void clear_pages_erms(void *page, unsigned int length);

What unit is 'length' in? If it's bytes, why is this interface 
artificially limiting itself to ~4GB? On x86-64 there's very little (if 
any) performance difference between a 32-bit and a 64-bit length 
iterations.

Even if we end up only exposing a 32-bit length API to the generic MM 
layer, there's no reason to limit the x86-64 assembly code in such a 
fashion.

>  static inline void clear_page(void *page)
>  {
> +	unsigned int length = PAGE_SIZE;
>  	/*
> -	 * Clean up KMSAN metadata for the page being cleared. The assembly call
> +	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
>  	 * below clobbers @page, so we perform unpoisoning before it.

>  	 */
> -	kmsan_unpoison_memory(page, PAGE_SIZE);
> -	alternative_call_2(clear_page_orig,
> -			   clear_page_rep, X86_FEATURE_REP_GOOD,
> -			   clear_page_erms, X86_FEATURE_ERMS,
> +	kmsan_unpoison_memory(page, length);
> +
> +	alternative_call_2(clear_pages_orig,
> +			   clear_pages_rep, X86_FEATURE_REP_GOOD,
> +			   clear_pages_erms, X86_FEATURE_ERMS,
>  			   "=D" (page),
> -			   "D" (page),
> +			   ASM_INPUT("D" (page), "S" (length)),
>  			   "cc", "memory", "rax", "rcx");
>  }
>  
> diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
> index a508e4a8c66a..bce516263b69 100644
> --- a/arch/x86/lib/clear_page_64.S
> +++ b/arch/x86/lib/clear_page_64.S
> @@ -13,20 +13,35 @@
>   */
>  
>  /*
> - * Zero a page.
> - * %rdi	- page
> + * Zero kernel page aligned region.
> + *
> + * Input:
> + * %rdi	- destination
> + * %esi	- length
> + *
> + * Clobbers: %rax, %rcx
>   */
> -SYM_TYPED_FUNC_START(clear_page_rep)
> -	movl $4096/8,%ecx
> +SYM_TYPED_FUNC_START(clear_pages_rep)
> +	movl %esi, %ecx
>  	xorl %eax,%eax
> +	shrl $3,%ecx
>  	rep stosq
>  	RET
> -SYM_FUNC_END(clear_page_rep)
> -EXPORT_SYMBOL_GPL(clear_page_rep)
> +SYM_FUNC_END(clear_pages_rep)
> +EXPORT_SYMBOL_GPL(clear_pages_rep)
>  
> -SYM_TYPED_FUNC_START(clear_page_orig)
> +/*
> + * Original page zeroing loop.
> + * Input:
> + * %rdi	- destination
> + * %esi	- length
> + *
> + * Clobbers: %rax, %rcx, %rflags
> + */
> +SYM_TYPED_FUNC_START(clear_pages_orig)
> +	movl   %esi, %ecx
>  	xorl   %eax,%eax
> -	movl   $4096/64,%ecx
> +	shrl   $6,%ecx

So if the natural input parameter is RCX, why is this function using 
RSI as the input 'length' parameter? Causes unnecessary register 
shuffling.

> +/*
> + * Zero kernel page aligned region.
> + *
> + * Input:
> + * %rdi	- destination
> + * %esi	- length
> + *
> + * Clobbers: %rax, %rcx
> + */
> +SYM_TYPED_FUNC_START(clear_pages_erms)
> +	movl %esi, %ecx
>  	xorl %eax,%eax
>  	rep stosb
>  	RET

Same observation: unnecessary register shuffling.

Also, please rename this (now-) terribly named interface:

> +void clear_pages_orig(void *page, unsigned int length);
> +void clear_pages_rep(void *page, unsigned int length);
> +void clear_pages_erms(void *page, unsigned int length);

Because the 'pages' is now a bit misleading, and why is the starting 
address called a 'page'?

So a more sensible namespace would be to follow memset nomenclature:

	void memzero_page_aligned_*(void *addr, unsigned long len);

... and note the intentional abbreviation to 'len'.

Also, since most of these changes are to x86 architecture code, this is 
a new interface only used by x86, and the MM glue is minimal, I'd like 
to merge this series via the x86 tree, if the glue gets acks from MM 
folks.

Thanks,

	Ingo
