Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE522126D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210540; cv=none; b=tz4x47db8+ZueBTs3l2rxg7Sg5Wml7X14j5tmFLUfCVouqjRco75160rc6jaYvkqf0sbCWn7m9w/dd0vbPU53JN2sEKB2ask1IalbTgqDl6S1FjvMCZwtaXTleSdNY97N4bN2TBeRb6kFJKALNyF/YqkvUjZNVcnfu+gnV22PPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210540; c=relaxed/simple;
	bh=JmFV/6TbRYWkoashtzIc4qEABXlVyLSaZRRjtdNIx9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEOiHRlUmQsxY54mHNpAlkHnvAwMOldKsCoWjvT0GEpMzmSMwjyOL337fsRYzmHsjPA0DleDLkLDENSKrKFU0wHIB6kWgOr9HFucx5BnvwX9rc+FFlhC0ncALHry7KkjXeWLDAT58np87HUunJHQaE0rQGm4+tWhwlJhGVDGqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+sGc+7L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+sGc+7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BCCC4CEE9;
	Wed, 14 May 2025 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210539;
	bh=JmFV/6TbRYWkoashtzIc4qEABXlVyLSaZRRjtdNIx9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+sGc+7LwX1Ej5RdW9jtRbYqSg1E6m/LKXtMus24cfw7YfxQnvqYo8IVEGamIjksi
	 ++++bQ82G+MBM+UmOQVCKQ2PoUf2ug7yHmMzm3gX1+lyNlNit68CxiAamEj7xX2GgP
	 dzbugGU2c7Ha3wkN35AShkaWZXDlKAPowTZU5w7tX9SzX0hzPEusbXlKiGaExiWtF6
	 rMuTKuWRxuo8FH2AVYvj5MBIx1zcxs4cdHPp9aCOKkW1FOXk8UIDQtRLaskCcyCsYN
	 AYLm1rQD1v46MCFc4Ibb/KJNnyA5Q6IsUxwDo6lHgJ2YX89SNDIv2MiWSoUlGYmAnN
	 NvH70dqoQ1+qw==
Date: Wed, 14 May 2025 10:15:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 4/6] x86/boot: Set 5-level paging CPU cap before
 entering C code
Message-ID: <aCRRJ_ahL2IRXxcj@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-12-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513111157.717727-12-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
> index ad4ea6fb3b6c..6259b474073b 100644
> --- a/arch/x86/kernel/asm-offsets.c
> +++ b/arch/x86/kernel/asm-offsets.c
> @@ -33,6 +33,14 @@
>  
>  static void __used common(void)
>  {
> +	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
> +	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
> +	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
> +	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
> +	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
> +	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
> +	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
> +
>  	BLANK();
>  	OFFSET(TASK_threadsp, task_struct, thread.sp);
>  #ifdef CONFIG_STACKPROTECTOR
> diff --git a/arch/x86/kernel/asm-offsets_32.c b/arch/x86/kernel/asm-offsets_32.c
> index 2b411cd00a4e..e0a292db97b2 100644
> --- a/arch/x86/kernel/asm-offsets_32.c
> +++ b/arch/x86/kernel/asm-offsets_32.c
> @@ -12,15 +12,6 @@ void foo(void);
>  
>  void foo(void)
>  {
> -	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
> -	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
> -	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
> -	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
> -	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
> -	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
> -	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
> -	BLANK();
> -

This is needed so that we can run (well, build) the setup_force_cpu_cap 
macro on x86-64 too, right?

Could you please split out this portion into a separate patch, to 
simplify the more dangerous half of the patch?

> -	if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> -		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);

> +#ifdef CONFIG_X86_5LEVEL
> +	/*
> +	 * Set the X86_FEATURE_5LEVEL_PAGING capability before calling into the
> +	 * C code, so that it is guaranteed to have a consistent view of any
> +	 * global pseudo-constants that are derived from pgtable_l5_enabled().
> +	 */
> +	mov	%cr4, %rax
> +	btl	$X86_CR4_LA57_BIT, %eax
> +	jnc	0f
> +
> +	setup_force_cpu_cap X86_FEATURE_5LEVEL_PAGING
> +0:
> +#endif

Nice!

Thanks,

	Ingo
