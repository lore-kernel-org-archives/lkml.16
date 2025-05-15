Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F4163
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296028; cv=none; b=BCV2efxhjp88xfX0h3OohqTi+S8MJ9r6SwgjNjtK46NEMzSgxYYgglu6H3we/v+Jy4xt4Zs9OplFwqyqNQ7SYA7SAaCAqjw+ChE/sonMXALDlC19IdNtDFnzHfECzO6hzR5D0xsR1dzf7uAG+X5oQsWzPRwJUhibmkXhqL4s9Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296028; c=relaxed/simple;
	bh=1Bs9G3Was84R+tGCI1A125VCotzR0p7Ia7lleEQtyxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaFeoBY2Cm7NqCLQrZCKI/nHSEKduvjxhlnKYaajvjQ/96LaZQ/vQI03ASRj4QLRrMjDiZ9fsGAqgIB4CJaWXmaCYU1JRIJNQKNrEQMafqKwoI/viMUhS74flXBpVGXyfjmAd1gZGTJ/7ZIITxdyIXe+mEKUjvV2zdXac0ahlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bgxn2RH3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M69cRAUC; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bgxn2RH3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M69cRAUC"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id ACEFD1140146;
	Thu, 15 May 2025 04:00:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 15 May 2025 04:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747296025; x=
	1747382425; bh=rOGctbp+2KGYtpjg5Y2dOaIdwKyNe/Z2nFy+nFXGFyg=; b=b
	gxn2RH3YcFWppNqpcfE4gtcLMRaU3qEvZkdtgbuFhKLXry7MXVCm+AGqReb1epdO
	Ln6eqao5tCjFSZw0PmIIMv6aXPJOo8PfVvcQKE9ZaLlcQrYizawoJbjwOwHzV0Nm
	oZ8j/1YglNCDgV2HxoJ5D+UOv+3XPLen3sek+9vvfLwT1LZL+iumJG6nU8Nz4+4M
	uE27V6JQLmjiIy8X7QeHEFN9Nt3oH3EqR8DghuEPaq0F8Su8+Pkw2NaXjVW5asjF
	20+r+J/jV78cVUNcnRTKLsQ7G51GOnfRcKKqU8bT0eb4TZDvc0qLns9MckB0RMwT
	elL6fk3xyVI+cN9DfCFEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747296025; x=1747382425; bh=rOGctbp+2KGYtpjg5Y2dOaIdwKyNe/Z2nFy
	+nFXGFyg=; b=M69cRAUCHeYmctiSJHMQdiHhvsq0Q9pZUJy9GeY4fcKmodv8RxR
	ecR4jr0oePF8VqNJPyZJ85t9AaWRJnOeJrF1eQIM2PIUZPLiuVe3rLWi3D+vENLL
	BrGSb7fGnCAaT5aBi+68MiNRnP7jOo9+fF7Nr8xp5f/gAuN+Eil1AyWlc/W4meTJ
	yjtoPTAMh/yue6YU491jT//xS84i9WMiPymSjM3dvmt+6C6LbQk4TnrmmYrZ7f67
	9taWjkuyTcWQ36c6Fc75VlHYUNHXqO7mJvlKXEyn7qW5cNYz4OkRyb339TBBdHJ1
	yZi7QlIoDd1S1vWWnyXVQyov+oTVxUzG0Aw==
X-ME-Sender: <xms:GZ8laKeIiUJzt58Rd_9D_kl4uj7vaBtw9om8uuzP9ASc14n44w6GEw>
    <xme:GZ8laENVP_lbrpDrbZ8X0iIGZiqLY9AzX4kWy_JQdyBtkVk80kqkdK60dxPO4T716
    WddxadC4s1kYuAj-Lw>
X-ME-Received: <xmr:GZ8laLjXtbF284NaTk2Nij0caxTV-olQVQ3HlLv5oVGVLltGUfWL_poagX_GuBbMlmc5Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddt
    vdenucfhrhhomhepfdfmihhrihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilh
    hlsehshhhuthgvmhhovhdrnhgrmhgvqeenucggtffrrghtthgvrhhnpeeukedttefgkedv
    keejhfegvdeuhffhgeeihfeulefffedtueejhffgheegtdevvdenucffohhmrghinhephh
    gvrggupgeigedrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtth
    hopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrhgusgdoghhithesghho
    ohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtohepsghrghgvrhhsthesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:GZ8laH-Vv7yIf7ySvFhcGEXMS2_2leHILRNsGC4jkx8k8NXfjDf8pQ>
    <xmx:GZ8laGuFOq0_oqJlhFXf8BTv4C9vev28XxqAX1RhDmau5oyFYyWcQg>
    <xmx:GZ8laOGMU59gnCcTTylMO3SX5Ory6WDEP8EUlahAbdlxCapDgMc_vA>
    <xmx:GZ8laFOzLlfJD1BeB1aAFlZ1Guec4RZhXnm4A49LwOBt-FTM9nyseA>
    <xmx:GZ8laHnlk3VpoAZuJBbKEgVoIADq-cYKsXK06VrKrf5L5SPmCTVrXLVq>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 May 2025 04:00:22 -0400 (EDT)
Date: Thu, 15 May 2025 11:00:19 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 4/7] x86/boot: Set 5-level paging CPU cap before
 entering C code
Message-ID: <loshl2p4k2p7pvgwsympb3f5jisv4cnt5eh4gqabd3cdaifoeu@bahujxd4qvrl>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-13-ardb+git@google.com>

On Wed, May 14, 2025 at 12:42:47PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> In order for pgtable_l5_enabled() to be reliable wherever it is used and
> however early, set the associated CPU capability from asm code before
> entering the startup C code.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/include/asm/cpufeature.h | 12 +++++++++---
>  arch/x86/kernel/cpu/common.c      |  3 ---
>  arch/x86/kernel/head_64.S         | 15 +++++++++++++++
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
> index 893cbca37fe9..1b5de40e7bf7 100644
> --- a/arch/x86/include/asm/cpufeature.h
> +++ b/arch/x86/include/asm/cpufeature.h
> @@ -2,10 +2,10 @@
>  #ifndef _ASM_X86_CPUFEATURE_H
>  #define _ASM_X86_CPUFEATURE_H
>  
> +#ifdef __KERNEL__
> +#ifndef __ASSEMBLER__
>  #include <asm/processor.h>
>  
> -#if defined(__KERNEL__) && !defined(__ASSEMBLER__)
> -
>  #include <asm/asm.h>
>  #include <linux/bitops.h>
>  #include <asm/alternative.h>
> @@ -137,5 +137,11 @@ static __always_inline bool _static_cpu_has(u16 bit)
>  #define CPU_FEATURE_TYPEVAL		boot_cpu_data.x86_vendor, boot_cpu_data.x86, \
>  					boot_cpu_data.x86_model
>  
> -#endif /* defined(__KERNEL__) && !defined(__ASSEMBLER__) */
> +#else /* !defined(__ASSEMBLER__) */
> +	.macro	setup_force_cpu_cap, cap:req
> +	btsl	$\cap % 32, boot_cpu_data+CPUINFO_x86_capability+4*(\cap / 32)(%rip)
> +	btsl	$\cap % 32, cpu_caps_set+4*(\cap / 32)(%rip)
> +	.endm
> +#endif /* !defined(__ASSEMBLER__) */
> +#endif /* defined(__KERNEL__) */
>  #endif /* _ASM_X86_CPUFEATURE_H */
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index f6f206743d6a..c8954dc2fb26 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1752,9 +1752,6 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
>  	setup_clear_cpu_cap(X86_FEATURE_PCID);
>  #endif
>  
> -	if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> -		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
> -
>  	detect_nopl();
>  }
>  
> diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
> index 069420853304..191d5947a762 100644
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -27,6 +27,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/smp.h>
>  #include <asm/thread_info.h>
> +#include <asm/cpufeature.h>
>  
>  /*
>   * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
> @@ -58,6 +59,20 @@ SYM_CODE_START_NOALIGN(startup_64)
>  	 */
>  	mov	%rsi, %r15
>  
> +#ifdef CONFIG_X86_5LEVEL

Is #ifdef really needed?

> +	/*
> +	 * Set the X86_FEATURE_5LEVEL_PAGING capability before calling into the
> +	 * C code, to give it a consistent view of any global pseudo-constants
> +	 * that are derived from pgtable_l5_enabled().
> +	 */
> +	mov	%cr4, %rax
> +	btl	$X86_CR4_LA57_BIT, %eax
> +	jnc	0f
> +
> +	setup_force_cpu_cap X86_FEATURE_5LEVEL_PAGING
> +0:
> +#endif
> +
>  	/* Set up the stack for verify_cpu() */
>  	leaq	__top_init_kernel_stack(%rip), %rsp
>  
> -- 
> 2.49.0.1101.gccaa498523-goog
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
