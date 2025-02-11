Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481961D54FE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297279; cv=none; b=EmCvAosmMRk3bDZa9sL400f++XpzQp4K9xAKXxLzNmOomqmiwQw0f/3yx8AhH3Dee2j/0LmD2N/Ver5+6Ls87hC/0jg+ZrEXxcap2K3dPnmaubojyOgZ5j6gRhjyWeOxF4PePFGCYjFXmJwN6cOTSY89OcuWGbyeBHem9d/7Oeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297279; c=relaxed/simple;
	bh=qmler+I90pvNUtay43C9/PfAUR+W7075zQKpIXXi7sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJ0cFHANhO4FuhU5KlnZTM+2SAsPUtu7VvgLWbx2Yr85af/0LgCagNUsX4acHNYbM+vORleLMkKPZF8VAYyE34jVu5QPehE18FPh19fHxCyVhgBcjVqs/Zpk/B4svRloIsPZrzngtBYLW+rhtU7RzC+f5QUZ496CReNnle4x3fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYgrCHCP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYgrCHCP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F405C4CEDD;
	Tue, 11 Feb 2025 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297278;
	bh=qmler+I90pvNUtay43C9/PfAUR+W7075zQKpIXXi7sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYgrCHCPXCsHabBTusYJ35h+8Qd8HRI4/KtRrrek0b9LAvtSHikzUMVLqX/BWT8er
	 zG5nAc0RQkWueaiD+mGxDLHm9I/qsuI/jiiB5wveclflpWDxFpfSiEz8DsjdXdNZ5R
	 PBOlXmXWWL4pBUV1usKNVRTyGbRzhwPmvju87KkT/5iSEm/lur00b+NI0BfioqLCaJ
	 kD3zwu+rF8vWwRJxPIhyOrzVK0gztdTlX4CbHj8LyAaQyl0SCrThGukt4pxrzeKnTc
	 6WJG2fAJghmmWLPC7lnyuHRdqcD7ABSy0irVXCvBGimFXwqmIZo7Pmx83EbEsN7+Xb
	 lYL1wX/mXb2Xw==
Date: Tue, 11 Feb 2025 10:07:52 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/35] x86/bugs: Define attack vectors
Message-ID: <20250211180752.pfsjvz62bztpnmoi@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-21-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-21-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:25:00PM -0600, David Kaplan wrote:
> Define 5 new attack vectors that are used for controlling CPU
> speculation mitigations and associated command line options.  Each
> attack vector may be enabled or disabled, which affects the CPU
> mitigations enabled.
> 
> The default settings for these attack vectors are consistent with
> existing kernel defaults, other than the automatic disabling of VM-based
> attack vectors if KVM support is not present.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/include/asm/bugs.h | 11 +++++++
>  arch/x86/kernel/cpu/bugs.c  | 60 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/arch/x86/include/asm/bugs.h b/arch/x86/include/asm/bugs.h
> index f25ca2d709d4..354d04a964f0 100644
> --- a/arch/x86/include/asm/bugs.h
> +++ b/arch/x86/include/asm/bugs.h
> @@ -12,4 +12,15 @@ static inline int ppro_with_ram_bug(void) { return 0; }
>  
>  extern void cpu_bugs_smt_update(void);
>  
> +enum cpu_attack_vectors {
> +	CPU_MITIGATE_USER_KERNEL,
> +	CPU_MITIGATE_USER_USER,
> +	CPU_MITIGATE_GUEST_HOST,
> +	CPU_MITIGATE_GUEST_GUEST,
> +	CPU_MITIGATE_CROSS_THREAD,
> +	NR_CPU_ATTACK_VECTORS,
> +};
> +
> +bool cpu_mitigate_attack_vector(enum cpu_attack_vectors v);
> +
>  #endif /* _ASM_X86_BUGS_H */
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index aee2945bdef9..88eba8e4c7fb 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -169,6 +169,66 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
>  DEFINE_STATIC_KEY_FALSE(mmio_stale_data_clear);
>  EXPORT_SYMBOL_GPL(mmio_stale_data_clear);
>  
> +#ifdef CONFIG_CPU_MITIGATIONS
> +/*
> + * All except the cross-thread attack vector are mitigated by default.
> + * Cross-thread mitigation often requires disabling SMT which is too expensive
> + * to be enabled by default.
> + *
> + * Guest-to-Host and Guest-to-Guest vectors are only needed if KVM support is
> + * present.
> + */
> +static bool cpu_mitigate_attack_vectors[NR_CPU_ATTACK_VECTORS] __ro_after_init = {
> +	[CPU_MITIGATE_USER_KERNEL] = true,
> +	[CPU_MITIGATE_USER_USER] = true,
> +	[CPU_MITIGATE_GUEST_HOST] = IS_ENABLED(CONFIG_KVM),
> +	[CPU_MITIGATE_GUEST_GUEST] = IS_ENABLED(CONFIG_KVM),
> +	[CPU_MITIGATE_CROSS_THREAD] = false
> +};
> +
> +#define DEFINE_ATTACK_VECTOR(opt, v) \

s/opt/name/ to distinguish it from v.

> +	static int __init v##_parse_cmdline(char *arg) \

Instead of "CPU_MITIGATE_USER_KERNEL_parse_cmdline" it should really be
"mitigate_user_kernel_cmdline".

Also this line shouldn't be indented.

Also it's more readable to tab align all the line continuation
backslashes.

> +{ \
> +	if (!strcmp(arg, "off")) \
> +		cpu_mitigate_attack_vectors[v] = false; \
> +	else if (!strcmp(arg, "on")) \
> +		cpu_mitigate_attack_vectors[v] = true; \
> +	else \
> +		pr_warn("Unsupported " opt "=%s\n", arg); \
> +	return 0; \
> +} \
> +early_param(opt, v##_parse_cmdline)
> +
> +bool cpu_mitigate_attack_vector(enum cpu_attack_vectors v)
> +{
> +	if (v < NR_CPU_ATTACK_VECTORS)
> +		return cpu_mitigate_attack_vectors[v];
> +
> +	WARN_ON_ONCE(v >= NR_CPU_ATTACK_VECTORS);
> +	return false;
> +}

This error can be checked at build time.

> +#else

This needs a /* !CONFIG_CPU_MITIGATIONS */ comment.

> #endif

As does this.


So, something like so:

#ifdef CONFIG_CPU_MITIGATIONS
/*
 * All except the cross-thread attack vector are mitigated by default.
 * Cross-thread mitigation often requires disabling SMT which is too expensive
 * to be enabled by default.
 *
 * Guest-to-Host and Guest-to-Guest vectors are only needed if KVM support is
 * present.
 */
static bool cpu_mitigate_attack_vectors[NR_CPU_ATTACK_VECTORS] __ro_after_init = {
	[CPU_MITIGATE_USER_KERNEL] = true,
	[CPU_MITIGATE_USER_USER] = true,
	[CPU_MITIGATE_GUEST_HOST] = IS_ENABLED(CONFIG_KVM),
	[CPU_MITIGATE_GUEST_GUEST] = IS_ENABLED(CONFIG_KVM),
	[CPU_MITIGATE_CROSS_THREAD] = false
};

#define DEFINE_ATTACK_VECTOR(name, v)					\
static int __init name##_parse_cmdline(char *arg)			\
{									\
	if (!strcmp(arg, "off"))					\
		cpu_mitigate_attack_vectors[v] = false;			\
	else if (!strcmp(arg, "on"))					\
		cpu_mitigate_attack_vectors[v] = true;			\
	else								\
		pr_warn("Unsupported " __stringify(name) "=%s\n", arg);	\
	return 0;							\
}									\
early_param(__stringify(name), name##_parse_cmdline)

#define cpu_mitigate_attack_vector(v)					\
({									\
	BUILD_BUG_ON(v >= NR_CPU_ATTACK_VECTORS);			\
	cpu_mitigate_attack_vectors[v];					\
})

#else /* !CONFIG_CPU_MITIGATIONS */

#define DEFINE_ATTACK_VECTOR(name, v)					\
static int __init name##_parse_cmdline(char *arg)			\
{									\
	pr_crit("Kernel compiled without mitigations, ignoring %s; system may still be vulnerable\n", \
		__stringify(name));					\
	return 0;							\
}									\
early_param(__stringify(name), name##_parse_cmdline)

#define cpu_mitigate_attack_vector(v) false

#endif /* !CONFIG_CPU_MITIGATIONS */

DEFINE_ATTACK_VECTOR(mitigate_user_kernel, CPU_MITIGATE_USER_KERNEL);
DEFINE_ATTACK_VECTOR(mitigate_user_user, CPU_MITIGATE_USER_USER);
DEFINE_ATTACK_VECTOR(mitigate_guest_host, CPU_MITIGATE_GUEST_HOST);
DEFINE_ATTACK_VECTOR(mitigate_guest_guest, CPU_MITIGATE_GUEST_GUEST);
DEFINE_ATTACK_VECTOR(mitigate_cross_thread, CPU_MITIGATE_CROSS_THREAD);
