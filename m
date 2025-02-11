Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103D2512CC
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299293; cv=none; b=UsckGwG3jAiVjW5FsEwzgiVBQk7D9q4jL5OqaatAIjYM+dI0XiXbxj+2DqcpB1OznwhgJBYDOwBmagEFcW8RaukzvwoASH4CnC2yzGMbg4PUYrZbU88UiENZ1OYhPPA231CrOyXP8MAFoRn8tFzyFpX4qLRuav5IbtBVGKk8Hp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299293; c=relaxed/simple;
	bh=IlOAT2KMwPvKVsN8bCZVZd6h0yzbQr8WBHOWEtAxWFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToyNq7qdykJbrCAJ86qYkJmqhEKniR28MILRtAPSUWlo2lD236q/EwVdJpGxguVrx8xVMef+2Ygwmp7uOK4KHj5ssOegMZ2HpY1FmL+WieQww9NaxRc3pmjC/D1xZhHgNGjFjZ2599Ty3a5gxpHBgqYNaNk0CTPW58yjgvLYreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmi29tJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmi29tJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EB1C4CEDD;
	Tue, 11 Feb 2025 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739299293;
	bh=IlOAT2KMwPvKVsN8bCZVZd6h0yzbQr8WBHOWEtAxWFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmi29tJgyATJWtt2RpShqEyAKsNY6JiNtXGNIdaEoE63rr0U6xIto6DsqNVGzC4Xd
	 /nmOKMF88/JmYELk5y8j1gZEKU7LO9RqoPaFlJ83PmUui6P7TFd/uMQkwQIsRFGUX0
	 pD/EYPMSq9kCHKUJQNkqUNSvbLiTQ4oRjKVBhxFbaFTPfReVLdG4w6eczuzuAHvzRG
	 wV6GS3/xVSzhuf/slYC03fNDJmmIfzGuZwU9VeS3w5tpvdhHew5v+RQ48UMNvaP3sT
	 KHoZovR1y5VYRQ/Qn0iu1HhZDV3Ws5ih+oPnrkdOB2DY9J4ZHk6xo9DfhipcJU4ku1
	 Dkq9jSQbVwY0g==
Date: Tue, 11 Feb 2025 10:41:30 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/35] x86/bugs: Determine relevant vulnerabilities
 based on attack vector controls.
Message-ID: <20250211184130.2fl4jvdwd4e5y32a@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-22-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-22-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:25:01PM -0600, David Kaplan wrote:
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 88eba8e4c7fb..175dbbf9b06e 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -347,6 +347,75 @@ static void x86_amd_ssb_disable(void)
>  		wrmsrl(MSR_AMD64_LS_CFG, msrval);
>  }
>  
> +/*
> + * Returns true if vulnerability should be mitigated based on the
> + * selected attack vector controls

This needs a period.

> + *
> + * See Documentation/admin-guide/hw-vuln/attack_vector_controls.rst
> + */
> +static bool __init should_mitigate_vuln(unsigned int bug)
> +{
> +	switch (bug) {
> +	/*
> +	 * The only spectre_v1 mitigations in the kernel are related to
> +	 * SWAPGS protection on kernel entry.  Therefore, protection is
> +	 * only required for the user->kernel attack vector.
> +	 */

This comment isn't quite correct, there are things like
array_index_nospec() and barrier_nospec() being used, but those aren't
being controlled by bugs.c.  They should at least be mentioned here.

> +	case X86_BUG_SPECTRE_V1:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_KERNEL);
> +
> +	/*
> +	 * Both spectre_v2 and srso may allow user->kernel or
> +	 * guest->host attacks through branch predictor manipulation.
> +	 */

I don't think this comment adds anything, the code already makes this
obvious.

> +	case X86_BUG_SPECTRE_V2:
> +	case X86_BUG_SRSO:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_KERNEL) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_HOST);

This needs aligned:

		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_KERNEL) ||
		       cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_HOST);

Also, aren't cross-thread attacks possible here, thus the need for
STIBP?  More questions about the cross-thread "vector" below, at the
bottom.

> +	/*
> +	 * spectre_v2_user refers to user->user or guest->guest branch
> +	 * predictor attacks only.  Other indirect branch predictor attacks
> +	 * are covered by the spectre_v2 vulnerability.
> +	 */

The code is already self-evident IMO, I don't think the comment adds
anything.

> +	case X86_BUG_SPECTRE_V2_USER:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_USER) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_GUEST);

Another alignment issue.

> +
> +	/* L1TF is only possible as a guest->host attack */

That's not quite correct, PTE inversion is also done to protect against
the user->kernel vector.

Also, IIRC the full l1tf mitigation requires disabling SMT, does that
not qualify as CPU_MITIGATE_CROSS_THREAD?

> +	case X86_BUG_L1TF:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_HOST);
> +
> +	/*
> +	 * All the vulnerabilities below allow potentially leaking data
> +	 * across address spaces.  Therefore, mitigation is required for
> +	 * any of these 4 attack vectors.
> +	 */
> +	case X86_BUG_MDS:
> +	case X86_BUG_TAA:
> +	case X86_BUG_MMIO_STALE_DATA:
> +	case X86_BUG_RFDS:
> +	case X86_BUG_SRBDS:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_KERNEL) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_HOST) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_USER_USER) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_GUEST);

Some of these also require disabling SMT for their complete mitigations?

> +	/*
> +	 * GDS can potentially leak data across address spaces and
> +	 * threads.  Mitigation is required under all attack vectors.
> +	 */
> +	case X86_BUG_GDS:
> +		return cpu_mitigate_attack_vector(CPU_MITIGATE_USER_KERNEL) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_HOST) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_USER_USER) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_GUEST_GUEST) ||
> +			cpu_mitigate_attack_vector(CPU_MITIGATE_CROSS_THREAD);

I'm confused by CPU_MITIGATE_CROSS_THREAD here, as the GDS mitigation
doesn't seem to disable SMT?

Am I just completely misunderstanding the meaning of
CPU_MITIGATE_CROSS_THREAD?

I assumed it's not a vector per se, but rather it means to force nosmt
if one of the other enabled mitigations requires doing so for its "full"
mitigation.  But the implementation doesn't seem to match that.

On the other hand if it really is considered to be its own vector, that
doesn't make sense either, as "cross-thread attack" is really a subset
of each of the other vectors.  For example, a user->kernel attack can
often be done either via syscall/irq or via cross-thread.

So I'm really confused.  Am I missing something?

-- 
Josh
