Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901225A35F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230193; cv=none; b=GpmhetkTL+GRveQRYom9fg6TrNVhCCwre3KeGXUtpne+mhcUV135nRD3qXoAahbgFnKfbscdBMbwFR0u9H4mJmp0uVZZefaUkiTSme/HVUsEgJaRNlWYdKN7OYwoOjtEuQu5Sa2Lktg/Tr6AMZjrpr6Rmy7z2VL1XApBCBC5JFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230193; c=relaxed/simple;
	bh=gMFSn39Bo/fj/THCfDmaYQBOUDonIKZUGIznXtBUMII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvFaM2mGY/Os6laxHSyU49ArrTnd3hp09jpptt7SzfwyZManF4M2v6tnbrCIvska1yLZ73kHlkf8nPPw39bd/6NmUHw6fqN0qmbn8RHTwJKsBQ9JCgh1ylTGo6Jw0HkHjLt9fSQpk0ms5c0g9tOBmvV5VHsPR4CFT9rEtGroSEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f25yr+Lp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f25yr+Lp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCF0C4CED1;
	Mon, 10 Feb 2025 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739230193;
	bh=gMFSn39Bo/fj/THCfDmaYQBOUDonIKZUGIznXtBUMII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f25yr+LpBbFRGtC7EvlvThEQD/vMSec3Cr49aCobG3t9juQ6ZljCRImjWGSNXmtY6
	 NmI8wBhEb19CKd4wPvhEe2OYtC/nelGSUrbsq5itjWFkeazl85lZ5+bHVEBlvZpwRQ
	 p5WHrqr/NLrNDfkeP1pRtKbV4ZGkaj3KEstAgKvnEjBsY52uvSixznAY0F5uMrszdn
	 ik7Ec6APQJ4zlETzCAGWq9nHC57xFuNCOeCCd0ezp34EFndglKN0hptJfFyzWSHIvH
	 zryyfDpMkXM7jggZW3VmVKw0iQbwu+7lF8ponx2y2VzIAil7B2eaRd6rFmTGA9fKHX
	 zaKJQUKzJJiWA==
Date: Mon, 10 Feb 2025 15:29:51 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/35] x86/bugs: Restructure mmio mitigation
Message-ID: <20250210232951.x4mbmpjy57jpunb5@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-7-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-7-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:46PM -0600, David Kaplan wrote:
> Restructure mmio mitigation to use select/update/apply functions to
> create consistent vulnerability handling.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 60 ++++++++++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 7beb2d6c43bb..a8da097ab2d5 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -68,6 +68,8 @@ static void __init taa_select_mitigation(void);
>  static void __init taa_update_mitigation(void);
>  static void __init taa_apply_mitigation(void);
>  static void __init mmio_select_mitigation(void);
> +static void __init mmio_update_mitigation(void);
> +static void __init mmio_apply_mitigation(void);
>  static void __init srbds_select_mitigation(void);
>  static void __init l1d_flush_select_mitigation(void);
>  static void __init srso_select_mitigation(void);
> @@ -190,6 +192,7 @@ void __init cpu_select_mitigations(void)
>  	l1tf_select_mitigation();
>  	mds_select_mitigation();
>  	taa_select_mitigation();
> +	mmio_select_mitigation();
>  	md_clear_select_mitigation();
>  	srbds_select_mitigation();
>  	l1d_flush_select_mitigation();
> @@ -207,9 +210,11 @@ void __init cpu_select_mitigations(void)
>  	 */
>  	mds_update_mitigation();
>  	taa_update_mitigation();
> +	mmio_update_mitigation();
>  
>  	mds_apply_mitigation();
>  	taa_apply_mitigation();
> +	mmio_apply_mitigation();
>  }
>  
>  /*
> @@ -510,6 +515,45 @@ static void __init mmio_select_mitigation(void)
>  		return;
>  	}
>  
> +	if (mmio_mitigation == MMIO_MITIGATION_OFF)
> +		return;

Another seemingly pointless return, the only thing after this is the
MMIO_MITIGATION_AUTO check.

> +	/* Microcode will be checked in mmio_update_mitigation(). */
> +	if (mmio_mitigation == MMIO_MITIGATION_AUTO)
> +		mmio_mitigation = MMIO_MITIGATION_VERW;
> +
> +}

Extra whitespace.

> +
> +static void __init mmio_update_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA) || cpu_mitigations_off())
> +		return;
> +
> +	if (verw_mitigation_enabled())
> +		mmio_mitigation = MMIO_MITIGATION_VERW;
> +
> +	if (mmio_mitigation == MMIO_MITIGATION_VERW) {
> +		/*
> +		 * Check if the system has the right microcode.
> +		 *
> +		 * CPU Fill buffer clear mitigation is enumerated by either an explicit
> +		 * FB_CLEAR or by the presence of both MD_CLEAR and L1D_FLUSH on MDS
> +		 * affected systems.
> +		 */
> +		if (!((x86_arch_cap_msr & ARCH_CAP_FB_CLEAR) ||
> +		      (boot_cpu_has(X86_FEATURE_MD_CLEAR) &&
> +		       boot_cpu_has(X86_FEATURE_FLUSH_L1D) &&
> +		     !(x86_arch_cap_msr & ARCH_CAP_MDS_NO))))
> +			mmio_mitigation = MMIO_MITIGATION_UCODE_NEEDED;
> +	}
> +
> +	pr_info("%s\n", mmio_strings[mmio_mitigation]);
> +	if (boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN))
> +		pr_info("Unknown: No mitigations\n");

Seems weird to print two messages for the X86_BUG_MMIO_UNKNOWN case?

And note that if it gets enabled by verw_mitigation_enabled() it prints:

  MMIO Stale Data: Mitigation: Clear CPU buffers
  MMIO Stale Data: Unknown: No mitigations

which is confusing at best :-)

It should probably just print either one or the other, like it did
before (and like mmio_stale_data_show_state() does).

> @@ -538,21 +582,6 @@ static void __init mmio_select_mitigation(void)
>  	if (!(x86_arch_cap_msr & ARCH_CAP_FBSDP_NO))
>  		static_branch_enable(&mds_idle_clear);

Right here it does the following:

	/*
	 * Enable CPU buffer clear mitigation for host and VMM, if also affected
	 * by MDS or TAA. Otherwise, enable mitigation for VMM only.
	 */
	if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
					      boot_cpu_has(X86_FEATURE_RTM)))
		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);

Isn't that a cross-mitigation dependency?  i.e. if
X86_FEATURE_CLEAR_CPU_BUF gets enabled here then the other mitigations
would need to update their mitigation reporting?

Maybe that check can be done in mmio_select_mitigation()?


Then, after that there's:

	/*
	 * X86_FEATURE_CLEAR_CPU_BUF could be enabled by other VERW based
	 * mitigations, disable KVM-only mitigation in that case.
	 */
	if (boot_cpu_has(X86_FEATURE_CLEAR_CPU_BUF))
		static_branch_disable(&mmio_stale_data_clear);
	else
		static_branch_enable(&mmio_stale_data_clear);

which assumes this is called after the other VERW-enabling
*_apply_mitigation() functions.   It feels like this decision should be
made in mmio_update_mitigation().

-- 
Josh
