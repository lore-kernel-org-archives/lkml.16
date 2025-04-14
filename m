Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52659280A42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628596; cv=none; b=FLs2FJEsKossenBnPskwRh1if7LuV0ip7C4SjIITyLyEhPDeS8C+/0rsJq1OQWhhLiR6YyEhnWCo10H0zNVY33uYo0W0y3T5AXHFhkooVOGQmP5caON3/iBtyPME9Nx5AkOmXf3nRu8ptvVEnqkfycq23qSK9MdVf9eYvuylNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628596; c=relaxed/simple;
	bh=zYJKnl3PDwp5H0lIKmAxF7LW4fQ9/Nl+0aQEeHh2vcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTqNes2NT4ly/QcReiznVzhOaqLCwlPf/BCuu/MZloV7z2OF2PSumFCS4wv/MKGGGSm5QVIlH26deO5N2zJBSivo4FWxJjcAL3QVRLXrFT33TzkttP/MaItVSi5UtI4lhb3ef77Ca9dLAlmsN+QV0yhBiZmHXYosPBmWfDnTXAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=foEEhtHb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="foEEhtHb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J51COviT85jkxZC45WlXUOb6zfUsYs6A6My0uyWu7Gw=; b=foEEhtHb1SJx/XuYekuXhZpSvN
	gY+h57P+xOo1PYpLv/RGnu+gQdvjqIhFDrTdYKVk/BGQ0Zzokv1qiBTc28VYLo50OQ79RbP+UHTOF
	8Q/BcLKkY9HaXm4hVcQm2R7fo7Fm84iZhT2Dj6o/d1eYJUsHRR9n2sRv7jkteob8RUH12wu5YtgdR
	kP3UPx/DLCcG7do8CVkO9TlO9yeijcJ0CoL4HW80HsU/SxpsS8GVl/qWa2y4sD7TiX+RrTqI6y0Zc
	ziadRRuAOU9TYnCqgqdxILp+GAxDrDtiUwlqXhFg6zZKuvWGbZXlgnR0cwBttLX/rMDf9KESL1AEu
	yqvR8VZg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4Hae-00000009f8d-1u5R;
	Mon, 14 Apr 2025 11:03:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E6767300619; Mon, 14 Apr 2025 13:02:59 +0200 (CEST)
Date: Mon, 14 Apr 2025 13:02:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
	luto@kernel.org, paulmck@kernel.org, rostedt@goodmis.org,
	tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
	bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
Message-ID: <20250414110259.GF5600@noisy.programming.kicks-ass.net>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_yr_cmXti4kXHaX@gmail.com>

On Mon, Apr 14, 2025 at 08:32:29AM +0200, Ingo Molnar wrote:

> >  static inline void clear_page(void *page)
> >  {
> > +	unsigned int length = PAGE_SIZE;
> >  	/*
> > -	 * Clean up KMSAN metadata for the page being cleared. The assembly call
> > +	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
> >  	 * below clobbers @page, so we perform unpoisoning before it.
> 
> >  	 */
> > -	kmsan_unpoison_memory(page, PAGE_SIZE);
> > -	alternative_call_2(clear_page_orig,
> > -			   clear_page_rep, X86_FEATURE_REP_GOOD,
> > -			   clear_page_erms, X86_FEATURE_ERMS,
> > +	kmsan_unpoison_memory(page, length);
> > +
> > +	alternative_call_2(clear_pages_orig,
> > +			   clear_pages_rep, X86_FEATURE_REP_GOOD,
> > +			   clear_pages_erms, X86_FEATURE_ERMS,
> >  			   "=D" (page),
> > -			   "D" (page),
> > +			   ASM_INPUT("D" (page), "S" (length)),
> >  			   "cc", "memory", "rax", "rcx");
> >  }
> >  
> > diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
> > index a508e4a8c66a..bce516263b69 100644
> > --- a/arch/x86/lib/clear_page_64.S
> > +++ b/arch/x86/lib/clear_page_64.S
> > @@ -13,20 +13,35 @@
> >   */
> >  
> >  /*
> > - * Zero a page.
> > - * %rdi	- page
> > + * Zero kernel page aligned region.
> > + *
> > + * Input:
> > + * %rdi	- destination
> > + * %esi	- length
> > + *
> > + * Clobbers: %rax, %rcx
> >   */
> > -SYM_TYPED_FUNC_START(clear_page_rep)
> > -	movl $4096/8,%ecx
> > +SYM_TYPED_FUNC_START(clear_pages_rep)
> > +	movl %esi, %ecx
> >  	xorl %eax,%eax
> > +	shrl $3,%ecx
> >  	rep stosq
> >  	RET
> > -SYM_FUNC_END(clear_page_rep)
> > -EXPORT_SYMBOL_GPL(clear_page_rep)
> > +SYM_FUNC_END(clear_pages_rep)
> > +EXPORT_SYMBOL_GPL(clear_pages_rep)
> >  
> > -SYM_TYPED_FUNC_START(clear_page_orig)
> > +/*
> > + * Original page zeroing loop.
> > + * Input:
> > + * %rdi	- destination
> > + * %esi	- length
> > + *
> > + * Clobbers: %rax, %rcx, %rflags
> > + */
> > +SYM_TYPED_FUNC_START(clear_pages_orig)
> > +	movl   %esi, %ecx
> >  	xorl   %eax,%eax
> > -	movl   $4096/64,%ecx
> > +	shrl   $6,%ecx
> 
> So if the natural input parameter is RCX, why is this function using 
> RSI as the input 'length' parameter? Causes unnecessary register 
> shuffling.

This symbol is written as a C function with C calling convention, even
though it is only meant to be called from that clear_page() alternative.

If we want to go change all this, then we should go do the same we do
for __clear_user() and write it thusly:

	asm volatile(ALTERNATIVE("rep stosb",
				 "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRS)
				 : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
				 : "a" (0))

And forget about all those clear_page_*() thingies.
