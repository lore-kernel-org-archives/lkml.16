Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AF284B50
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550237; cv=none; b=XmlN1BFQqL2sp5SkmLX0eYD/6cbaXxdwrJEWtdtE/XGRMZWAsRQosFgk/BUq6GzpXYQg52gBe/Nwyk44lksjlYU/piOCdxZoSFzz2zLfX+tvf7qG6ZkowwsH3nVV6vgUWGvV9gtDKdIPJ/WuCncWs2YLxUL1kk5DtVLXaQaXCGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550237; c=relaxed/simple;
	bh=kbggSOeqaE0AXevljJu6LEUZ8LSwQjqjoNempFpQjLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhm3/KJ0M6EMtBqvJvLXpS88kcQf+g6od1FHJG8afDTApuT/jB5p7ehBPslXPuTOtaNb3nCyGY+Bwg88XGL9L6UQDRt3FkdoH2h9fmtFtvoV6o2NxQpVP0IQF5b3qUHyZWLw4g1nL+EmQ7NWT/4m9CqGNSiHUbn9UTYOhtexo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rafgFLRW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rafgFLRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3035AC4CEE4;
	Tue,  6 May 2025 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746550236;
	bh=kbggSOeqaE0AXevljJu6LEUZ8LSwQjqjoNempFpQjLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rafgFLRWtsCxafIXHDj/3PV6tgia/rLsKcDS4tMaDtBxJnbiI6dXbrU8+pKvFC2Yl
	 qRwnyQf8KOlQClSmr2LxQsRmaUter7Fe16x9uQO2cHQ8e8dwwFvB4QdzOCjLW1QSl6
	 S75wxKYdE9zkxqcNA/t3w9ssfbns7ZzYPqC3EbdyVsdxB3HqcQrQV/divNb9sSBEnY
	 fDeq2BfsucF1zcmdO3WOVYkXDOJQFUF693KSIH2kDKEqL+ErJ5E1slEKF4WmjKFMCL
	 BuolAfUH00ozFUETugHP8FiXZWhyAyYYjlrKRh6h4Eg4lxFPvhV1c6lMPaniwyaXLM
	 v7kIKqmqJWkcA==
Date: Tue, 6 May 2025 18:50:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
Message-ID: <aBo92LQh4WYXyRXK@gmail.com>
References: <20250506154532.1281909-5-ardb+git@google.com>
 <20250506154532.1281909-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506154532.1281909-8-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> +static inline int __attribute_const__ choose_l5_enabled(int yes, int no)
> +{
> +	int ret = no;
> +
> +	asm_inline(ALTERNATIVE_TERNARY("jmp 6f; 8:", %c[feat], "movl %[yes], %[ret]", "")
> +		"	.pushsection .altinstr_aux,\"ax\"	\n"
> +		"6:	pushfq					\n"
> +		"	testb	$1, %a[l5en]			\n"
> +		"	jz	7f				\n"
> +		"	movl	%[yes], %[ret]			\n"
> +		"7:	popfq					\n"
> +		"	jmp	8b				\n"
> +		"	.popsection				\n"
> +		: [ret]  "+rm" (ret)
> +		: [feat] "i" (X86_FEATURE_LA57),
> +		  [yes]	 "i" (yes),
> +		  [l5en] "i" (&__pgtable_l5_enabled));
> +
> +	return ret;

So why not create a new synthethic cpufeature flag, 
X86_FEATURE_LA57_ENABLED or so, which could then be queried via the 
regular facilities? This ternary logic is not really needed, because 
the hardware isn't ternary. :)

With that we could do with only a single, obvious line of ALTERNATIVE() 
assembly:

        #define ALTERNATIVES_CONST_U32(__val1, __val2, __feature)       \
        ({                                                              \
                u32 __val;                                              \
                                                                        \
                asm_inline (ALTERNATIVE("movl $" #__val1 ", %0", "movl $" __val2 ", %0", __feature) :"=g" (__val)); \
                                                                        \
                __val;                                                  \
        })

        ...

        #define MAX_PHYSMEM_BITS ALTERNATIVE_CONST_U32(46, 52, X86_FEATURE_LA57_ENABLED)

Thanks,

	Ingo
