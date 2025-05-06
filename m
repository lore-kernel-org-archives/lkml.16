Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066C17A2EB;
	Tue,  6 May 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519936; cv=none; b=eS+5E+qvfMHuoyI1BX/YrWOKxmUo5UhakH3COCstLEaZ1erNsSX0/EXybwm8tuU2/mAnH+NUDP5sDKE5lCJgHymicAaaxSsviGdNS7n/wFETd2PUcibT6sFV5KpdvDkCEBO2IYQQleJhC4154XhpWVd53qQXF6LVrFdfmnx11l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519936; c=relaxed/simple;
	bh=9yV3LyzeKiUxHwUxf6m0FaczSx9+xCpgWW08Je15hHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzrK2xzo+IUnp+e15bR4lXhP3Yd0oltIXX+RqFy3x3vvZowgqKJjO65oF3n4zQAv5uMCJFvRwpVFfOxgbof5gZpEuHnJQrrhjEyWo/L3Ao2Xzcdp8Fty4Rw+UITVWW6MrOzvYkHJ2B1BDsrJXnTMYV+xaC57ahxfFcsBv9M1x6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3WAxl3z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3WAxl3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A3CC4CEE4;
	Tue,  6 May 2025 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746519935;
	bh=9yV3LyzeKiUxHwUxf6m0FaczSx9+xCpgWW08Je15hHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3WAxl3z/Pwil/YaDsUwVuDG6aEWoNq6ULh0of+ysCaU8Ogyo1CeFNFUmmnLfKm5G
	 6YZ+7kwkYRsyaF1dXjcfzcW1dor4cAKPm9aCR1jtWXcRyyD8ke3Yv2R0IMh+KMK6YB
	 uCq3nKodtAwH2fyXWhuVUZ3GAyqXnsbGzexfa0FjnQWH/AMmG6TkWK0cyGNy3PhXVb
	 mOLQqg8X3TrUwoidmWz3w4Ooh0CHljcn5nQixiz3N4hPMkyXYYrzIDXimapT7vmqzb
	 81TOvLgZPqwNdpFouSOVM0lQks8ztT8m7DT/4W4gYp144uxxufYJeV2UHWBdvk3u/A
	 lf6jfrLBARCkw==
Date: Tue, 6 May 2025 10:25:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 12/26] x86/cpu: Use scanned CPUID(0x1)
Message-ID: <aBnHeoNq_LBY0xxj@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-13-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-13-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Use scanned CPUID(0x1) access, instead of a direct CPUID query, at early
> boot CPU detection code.
> 
> Beside the centralization benefits of the scanned CPUID API, this allows
> using the auto-generated <cpuid/leaves.h> CPUID leaf data types and their
> full C99 bitfields instead of performing ugly bitwise operations on CPUID
> register output.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/common.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 59ddf6b074f2..a08340a5e6a5 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -895,6 +895,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
>  void cpu_detect(struct cpuinfo_x86 *c)
>  {
>  	const struct leaf_0x0_0 *l0 = cpudata_cpuid(c, 0x0);
> +	const struct leaf_0x1_0 *l1 = cpudata_cpuid(c, 0x1);
>  
>  	c->cpuid_level = l0->max_std_leaf;
>  	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
> @@ -902,17 +903,14 @@ void cpu_detect(struct cpuinfo_x86 *c)
>  	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
>  
>  	c->x86 = 4;
> -	/* Intel-defined flags: level 0x00000001 */
> -	if (c->cpuid_level >= 0x00000001) {
> -		u32 junk, tfms, cap0, misc;
>  
> -		cpuid(0x00000001, &tfms, &misc, &junk, &cap0);
> -		c->x86		= x86_family(tfms);
> -		c->x86_model	= x86_model(tfms);
> -		c->x86_stepping	= x86_stepping(tfms);
> +	if (l1) {
> +		c->x86		= cpuid_family(l1);
> +		c->x86_model	= cpuid_model(l1);
> +		c->x86_stepping	= l1->stepping;
>  
> -		if (cap0 & (1<<19)) {
> -			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
> +		if (l1->clflush) {
> +			c->x86_clflush_size = l1->clflush_size * 8;
>  			c->x86_cache_alignment = c->x86_clflush_size;
>  		}

Nice patch, it really nicely demonstrates the maintainability 
advantages of the new CPUID parser.

Thanks,

	Ingo
