Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBFB29DB9E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629306; cv=none; b=FqYvugaODA9k13L6OSEdDFyujWjBLGili00H6z1WRw0Wm6H9M0PteD/fD51tc8D3itS3YMvEUXbZnmQYDZAO88zMgO5kRKxBVW5+VgyTeForN5VvcqW6OUVkc9PDzEd33NS/L6UCpAlcMEgs7fiYMrDwh0+SVN7pk1J7JTJmWu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629306; c=relaxed/simple;
	bh=8yHKkbWoft8F9o9x75jDIA+cD6IIJndCHKNdCRxUXB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJPqWkaRg9hyxyz38CNcJip2mp14JVhVbE+92MBFaUnbJft164pbJx8CVA8parvf4XiQ2IftYcGuZyRmI08Vz9nuF+EuIPwd99nMGS21fvtzHyzcP//rEwJMOywahUPdvLbG7XnQzsRF5USXgXbqePhhpnZFgxh23gOsS9g+irQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIiY88Lq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIiY88Lq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225BDC4CEE2;
	Mon, 14 Apr 2025 11:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744629305;
	bh=8yHKkbWoft8F9o9x75jDIA+cD6IIJndCHKNdCRxUXB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIiY88LqfgtcHo/NfiDeMJp/NkC1MUfTzb8mUF3W9UC47qtCUJXwswFVuszSOoYDj
	 mAv4NgnZHBDNgK76G8J9imNBkukYlejO+ypo8D5CJasPRzSqGZHp3Z/qQAAvIdFYSu
	 ABiv1sHU2mOjushl3E5q+VzsnpQ6sKKrm8OqCdtpb29739iONLKqyYJgLywqct9z+W
	 iLIdkLfVhFXfLq8UBH4CpWW5bB5a1osu+yVn5b8n+Xf4OGgnA4sORfaPltYPqCtm0U
	 gbcqTN1ElfPLwaam8/IMSK7mc+Ehom0vE9bJ7jnjcM13u4YBQPQCFNi32db1f+cIgB
	 kJNytXd9WS9Zg==
Date: Mon, 14 Apr 2025 13:14:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <Z_zuMvZq43nc0SoO@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com>
 <20250414110259.GF5600@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414110259.GF5600@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Apr 14, 2025 at 08:32:29AM +0200, Ingo Molnar wrote:
> 
> > >  static inline void clear_page(void *page)
> > >  {
> > > +	unsigned int length = PAGE_SIZE;
> > >  	/*
> > > -	 * Clean up KMSAN metadata for the page being cleared. The assembly call
> > > +	 * Clean up KMSAN metadata for the pages being cleared. The assembly call
> > >  	 * below clobbers @page, so we perform unpoisoning before it.
> > 
> > >  	 */
> > > -	kmsan_unpoison_memory(page, PAGE_SIZE);
> > > -	alternative_call_2(clear_page_orig,
> > > -			   clear_page_rep, X86_FEATURE_REP_GOOD,
> > > -			   clear_page_erms, X86_FEATURE_ERMS,
> > > +	kmsan_unpoison_memory(page, length);
> > > +
> > > +	alternative_call_2(clear_pages_orig,
> > > +			   clear_pages_rep, X86_FEATURE_REP_GOOD,
> > > +			   clear_pages_erms, X86_FEATURE_ERMS,
> > >  			   "=D" (page),
> > > -			   "D" (page),
> > > +			   ASM_INPUT("D" (page), "S" (length)),
> > >  			   "cc", "memory", "rax", "rcx");
> > >  }
> > >  
> > > diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
> > > index a508e4a8c66a..bce516263b69 100644
> > > --- a/arch/x86/lib/clear_page_64.S
> > > +++ b/arch/x86/lib/clear_page_64.S
> > > @@ -13,20 +13,35 @@
> > >   */
> > >  
> > >  /*
> > > - * Zero a page.
> > > - * %rdi	- page
> > > + * Zero kernel page aligned region.
> > > + *
> > > + * Input:
> > > + * %rdi	- destination
> > > + * %esi	- length
> > > + *
> > > + * Clobbers: %rax, %rcx
> > >   */
> > > -SYM_TYPED_FUNC_START(clear_page_rep)
> > > -	movl $4096/8,%ecx
> > > +SYM_TYPED_FUNC_START(clear_pages_rep)
> > > +	movl %esi, %ecx
> > >  	xorl %eax,%eax
> > > +	shrl $3,%ecx
> > >  	rep stosq
> > >  	RET
> > > -SYM_FUNC_END(clear_page_rep)
> > > -EXPORT_SYMBOL_GPL(clear_page_rep)
> > > +SYM_FUNC_END(clear_pages_rep)
> > > +EXPORT_SYMBOL_GPL(clear_pages_rep)
> > >  
> > > -SYM_TYPED_FUNC_START(clear_page_orig)
> > > +/*
> > > + * Original page zeroing loop.
> > > + * Input:
> > > + * %rdi	- destination
> > > + * %esi	- length
> > > + *
> > > + * Clobbers: %rax, %rcx, %rflags
> > > + */
> > > +SYM_TYPED_FUNC_START(clear_pages_orig)
> > > +	movl   %esi, %ecx
> > >  	xorl   %eax,%eax
> > > -	movl   $4096/64,%ecx
> > > +	shrl   $6,%ecx
> > 
> > So if the natural input parameter is RCX, why is this function using 
> > RSI as the input 'length' parameter? Causes unnecessary register 
> > shuffling.
> 
> This symbol is written as a C function with C calling convention, even
> though it is only meant to be called from that clear_page() alternative.
>
> If we want to go change all this, then we should go do the same we do
> for __clear_user() and write it thusly:
> 
> 	asm volatile(ALTERNATIVE("rep stosb",
> 				 "call rep_stos_alternative", ALT_NOT(X86_FEATURE_FSRS)
> 				 : "+c" (size), "+D" (addr), ASM_CALL_CONSTRAINT
> 				 : "a" (0))
> 
> And forget about all those clear_page_*() thingies.

Yeah.

Thanks,

	Ingo
