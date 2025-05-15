Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E41221562;
	Thu, 15 May 2025 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747327217; cv=none; b=U5VX47OSPQ+ANT/2Nw1CwZsERAl+Croczcc6FNMCBi77eee9X80b4rO4Hz2VU0b5hISQ3v0ZxhYPKBTa4AQDhSeSm5ergVSRWH2jCnMm2ImLEN0wc2+rj3a9edWyEIGhfM3iPIiSH9r7RBdN1yEIx4Z/rDz8+cHMLoANfmLXehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747327217; c=relaxed/simple;
	bh=XXJbH6ABghuJ/ft7lMNxkt09sjneicuIuW/QQ6uiTN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZtXGAKpzUsJGKidNJQoTVqTmaFuflD5JppmxE4NI3uzp/AJOxCRYDbxSOg0zuGdxEe/XXhWIzAoGk4C0Y5MBXC/72EHl2Hd4BOWTbwUMWVjjah2VCKo+W5djlNXfftLjtG2PGUzymfGGOmlS3Su0h99DZ7KlgIshDhehZwPFH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2V7gbJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2V7gbJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B51DC4CEE7;
	Thu, 15 May 2025 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747327217;
	bh=XXJbH6ABghuJ/ft7lMNxkt09sjneicuIuW/QQ6uiTN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2V7gbJk4XjqdDYv8B4Z5wpfW7a1Nj9x7qN72qq7LFLFcQwfpw0BJWfpo0ZD005I6
	 YiYQReuXuVd+oij4YkiczK850YkFm8VNkt2QkfI0b8lbOePTXkglmNpghyUSnPdYSH
	 c0UDA5XX+35ACJ/Bci3wsTymdPwSSpWrkZ7pgSy5NI3dMlDlne6nuJw9JuZEfsZEp5
	 NA+MQuDCW5yw/bcCo/fu2FK0zwU+lBwaCgENKztsReUZFNqAm4TX5pYdhcJYiPUNoU
	 rAo4Mm3CYvb80ybntwbotJIQ5Cx1R8dxaz6m2jgo8YviAQa/je3TslEU9Rpc1WeiTk
	 wilAcMB5YBv9g==
Date: Thu, 15 May 2025 18:40:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/9] x86/cpuid: Rename hypervisor_cpuid_base() to
 cpuid_hypervisor_base()
Message-ID: <aCYY7CE57Al9ydWa@gmail.com>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-5-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508150240.172915-5-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
> namespace, rename hypervisor_cpuid_base() to cpuid_hypervisor_base().
> 
> To align with the new style, also rename:
> 
>     for_each_possible_hypervisor_cpuid_base(function)
> 
> to:
> 
>     for_each_possible_cpuid_hypervisor_base(function)
> 
> Adjust all call-sites accordingly.
> 
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/include/asm/acrn.h           | 2 +-
>  arch/x86/include/asm/cpuid/api.h      | 6 +++---
>  arch/x86/include/asm/xen/hypervisor.h | 2 +-
>  arch/x86/kernel/jailhouse.c           | 2 +-
>  arch/x86/kernel/kvm.c                 | 2 +-
>  arch/x86/kvm/cpuid.c                  | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)

> -#define for_each_possible_hypervisor_cpuid_base(function) \
> +#define for_each_possible_cpuid_hypervisor_base(function) \
>  	for (function = 0x40000000; function < 0x40010000; function += 0x100)


> --- a/arch/x86/include/asm/xen/hypervisor.h
> +++ b/arch/x86/include/asm/xen/hypervisor.h
> @@ -43,7 +43,7 @@ extern struct start_info *xen_start_info;
>  
>  static inline uint32_t xen_cpuid_base(void)
>  {
> -	return hypervisor_cpuid_base(XEN_SIGNATURE, 2);
> +	return cpuid_hypervisor_base(XEN_SIGNATURE, 2);
>  }

So the interaction here looks a bit weird IMO (what is a 'hypervisor 
base'?), and I think the 'CPUID base' phrase should be immutable.

Ie. I think it would be more natural to call this method 
cpuid_base_hypervisor(), which would mix reasonably well with:

	kvm_cpuid_base()
	xen_cpuid_base()
	jailhouse_cpuid_base()

These lower level methods are prefixed with kvm_/xen_/jailhouse_, as 
most of their internal methods are.

Likewise, for_each_possible_cpuid_base_hypervisor()?

Thanks,

	Ingo
