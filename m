Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B2A25B67B;
	Thu, 15 May 2025 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328410; cv=none; b=LpzOG5aytboLYawdMSGiOGTSIO2FVtRveMNBazN0bZlObMgnOiiRzFV6Nmre9Mg5de8ocfpo+Y7QZWhO9xkxfMA3BNJYKsW2M4qWnIb5n03JnDLJOvckAUYDokG+fkDHk7EhLPtI/ETUwpuaXtxenFbtbd0dgH4cS4x4JtngVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328410; c=relaxed/simple;
	bh=5qeMLE6ej4uOKJekPHmct9MV2OdhfF5qaIcfM+oEXOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSVUzOG5CaekJUn23144HdWiN+6UV+7VpD3SO1zcW2Cuf/ZIZz5skyMXAIeYhc+/Rtr9krJedNHzqjRVv29qvErWTBUKewzTFAZlzN1n9saHOCzzoOAD/UWEgeuvZeBAd3pSPnQstt2/Crtcz/k5sGgRBmJ5bftqDF97I/qe3DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOnN0xQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOnN0xQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8E2C4CEE7;
	Thu, 15 May 2025 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747328409;
	bh=5qeMLE6ej4uOKJekPHmct9MV2OdhfF5qaIcfM+oEXOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOnN0xQAZho2QwHXBaCZLXn//1oVLI0C2LsISF839YM1HTRLlBct9NYu1dtqO0Ul1
	 mooH9Y49amxHCiSBf9UVuvbZnGHfSbmJFCECia47CJpfR4eSMlm4B5f1XOehgyCs4Z
	 DAxEkJ4Qhf/JeFynyRTz/e1Cxfsp5p4VSJ2Bj/ba7d7ITYDzDoDoziZciD+HBqAjb8
	 HXliOEmpHTtInzuuDTgZ4t1kt0tJXUID58Mk4oL54a/TskRMyNmUaLoDPHC0VbvUNb
	 NsnZ4DFZ+1NII5cek/xH2GnqmIqbg8pjN6kAhvQ5aIhCV1FI9xc5/3DhnoZEDGv7Lh
	 B8GvWmkeSToQw==
Date: Thu, 15 May 2025 19:00:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 8/9] x86/cpuid: Rename native_cpuid() to cpuid_native()
Message-ID: <aCYdlAgG0rrEXtFK@gmail.com>
References: <20250508150240.172915-1-darwi@linutronix.de>
 <20250508150240.172915-9-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508150240.172915-9-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
> namespace, rename native_cpuid() to cpuid_native().
> 
> Adjust all call-sites accordingly.
> 
> Suggested-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/boot/compressed/sev.c           | 6 +++---
>  arch/x86/include/asm/cpuid/api.h         | 6 +++---
>  arch/x86/kernel/cpu/microcode/intel.c    | 2 +-
>  arch/x86/kernel/cpu/microcode/internal.h | 4 ++--
>  arch/x86/kernel/paravirt.c               | 2 +-
>  arch/x86/mm/mem_encrypt_identity.c       | 6 +++---
>  arch/x86/xen/enlighten_pv.c              | 4 ++--
>  7 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index f054bf52c10a..4b617f8f9b7f 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -494,7 +494,7 @@ static int sev_check_cpu_support(void)
>  	/* Check for the SME/SEV support leaf */
>  	eax = 0x80000000;
>  	ecx = 0;
> -	native_cpuid(&eax, &ebx, &ecx, &edx);
> +	cpuid_native(&eax, &ebx, &ecx, &edx);
>  	if (eax < 0x8000001f)
>  		return -ENODEV;

I'm torn about this one.

native_*() is a pretty generic way to denote baremetal methods, all 
around the x86 tree:

  starship:~/tip> git grep -E '\<native_' arch/x86/ | wc -l
  682

Likewise for:

	native_cpuid_eax()
	native_cpuid_ebx()
	native_cpuid_ecx()
	native_cpuid_edx()

I think it might be better to leave these as native_cpuid_*, because 
shifting a naming inconsistency into another namespace isn't really a 
net improvement.

'git grep cpuid_eax' will still give meaningful results, so 
greppability of cpuid_ APIs only suffers somewhat. The for_each_cpuid_ 
methods are already outliers.

There's always a bigger fish^W prefix. ;-)

Thanks,

	Ingo
