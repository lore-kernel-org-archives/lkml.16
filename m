Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1F28EB
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748103119; cv=none; b=VgsRdmeyoJ2bJGdZCy9Q7bhp3yyzh1R8N3DqPgnhIRFP5myrwnippUZlrV6xK8etfa/7eN71bGSsupVtDITwOR8JPytLjrLZ+3RP7r9RNH6rzuLkmepf6hehfkkR5XqMi06wQ6GhUxTQXTmNAtSAGVy/IggGHm74yWJNfEgoz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748103119; c=relaxed/simple;
	bh=O5FSdALDcd5jEgo/Yt3jUQcaxUEz5I2sa80UpoTeaKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyFk30gENdsqZ6ZaTiWXS52ClDJNd/Q1t2/2awhQmWOODh80K1WYgYMPM8qoD2xP/MvkN7DcJ6IJ9NZjrnU2+T+A42atoVeDNavcZfbzZHmh8rpDsgYABV5uWO3AUIA8bXitt0nYk6DwpuOQijyuuNo1cFMUkpCc3399xbVhWtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=J77U/opx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="J77U/opx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4747040E0266;
	Sat, 24 May 2025 16:11:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HZshFD4OyqD4; Sat, 24 May 2025 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748103107; bh=4bTAPZDxjpjpqOwthZTMiJfnMuCdUdzuEQzhw1DN280=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J77U/opx08pUeCuIQ+Rxu3If8febjrgxXBa0BUkvGJ+bpLKlV4ViBLYtcnO+WEAtv
	 s5jTeh3tWc3em2zkDfdUlS0jTJSFoos4+t1gytjzxhdfJe/yGzN0QHkPRIKuaubYh8
	 8ejv0u228Ky3EiyUSc5BHV9V0Pyyp3OAaYEkflMV5RODXgukquNrGmFrFTdq6gMHMr
	 XjUdouWAgi8PLRYwZpVj0n1e9zws7H9TFfTCcS4V74H6/WkaDt9EIzHpAUi1DacI8t
	 Hy93v+jkPz0cdfdVHPIWgpLup6kt8ZfZ9oRJoimEyHRfOme2gYjhtPYeot4+aIJMEg
	 glGIY8geNEXd7exdJ9wiO/Zcv0Mu6GpiTO2O4FO8hb2hyHUJAzusWEdWPImhsC2PNS
	 3ERdMghfXPUqhsrUIO6mvWLDwRkpWbEuCuUFhytPskfNmNmCS7vrZr+CKDfGShSbVt
	 OooRQzdjM6TFfnmlvDoEqJMPsRecdPpZS+qtuRW4LdDaqdxVLmTxqvK1z1WZb2sxXa
	 AkB+zySRZgBuqjy1B2W9imLVQ3zV5KcfWSqZz4kHa3MaMWs+2GBLhldF8MBIGrZ7s1
	 j6BJvYGy3dfe7pUTttnIezWcHhUfduq13XZN+wdp0Oy5ScBXx+svUaMqmhU45DJxTy
	 ALLUxkxjc/cJdXrNSa297y/U=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 82A0C40E0264;
	Sat, 24 May 2025 16:11:40 +0000 (UTC)
Date: Sat, 24 May 2025 18:11:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
Message-ID: <20250524161133.GBaDHvtdqNIztnFogw@fat_crate.local>
References: <20250524145319.209075-1-me@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250524145319.209075-1-me@mixaill.net>

On Sat, May 24, 2025 at 05:53:19PM +0300, Mikhail Paulyshka wrote:
> AMD Cyan Skillfish (Family 17h, Model 47h, Stepping 0h) has an
> error that causes RDSEED to always return 0xffffffff, while RDRAND
> works correctly.
> 
> This patch masks the RDSEED cap for this CPU so that both

s/This patch masks/Mask/

> /proc/cpuinfo and direct CPUID read report RDSEED as unavailable.
> 
> 
> v2:
>   * Limit changes to AMD Cyan Skillfish
>   * Replace the runtime RDSEED sanity check with a simple
>     family/model/stepping match

Changelog stuff goes...

> 
> Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
> ---

<--- ... here, under the "---" so that patch handling scripts can ignore it.

>  arch/x86/include/asm/msr-index.h       | 1 +
>  arch/x86/kernel/cpu/rdrand.c           | 9 +++++++++
>  tools/arch/x86/include/asm/msr-index.h | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index e7d2f460fcc6..2333f4e7bc2f 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -624,6 +624,7 @@
>  #define MSR_AMD64_OSVW_STATUS		0xc0010141
>  #define MSR_AMD_PPIN_CTL		0xc00102f0
>  #define MSR_AMD_PPIN			0xc00102f1
> +#define MSR_AMD64_CPUID_FN_7		0xc0011002
>  #define MSR_AMD64_CPUID_FN_1		0xc0011004
>  #define MSR_AMD64_LS_CFG		0xc0011020
>  #define MSR_AMD64_DC_CFG		0xc0011022
> diff --git a/arch/x86/kernel/cpu/rdrand.c b/arch/x86/kernel/cpu/rdrand.c
> index eeac00d20926..c474d0a5c317 100644
> --- a/arch/x86/kernel/cpu/rdrand.c
> +++ b/arch/x86/kernel/cpu/rdrand.c
> @@ -11,6 +11,7 @@
>  #include <asm/processor.h>
>  #include <asm/archrandom.h>
>  #include <asm/sections.h>
> +#include <asm/msr.h>
>  
>  /*
>   * RDRAND has Built-In-Self-Test (BIST) that runs on every invocation.
> @@ -47,4 +48,12 @@ void x86_init_rdrand(struct cpuinfo_x86 *c)
>  		clear_cpu_cap(c, X86_FEATURE_RDSEED);
>  		pr_emerg("RDRAND is not reliable on this platform; disabling.\n");
>  	}
> +
> +	/* disable RDSEED on AMD Cyan Skillfish because of hw bug */

Not a hw bug - "... has an error" above was closer :-)

> +	if (c->x86_vendor == X86_VENDOR_AMD && c->x86 == 0x17 &&
> +	    c->x86_model == 0x47 && c->x86_stepping == 0x0) {
> +		clear_cpu_cap(c, X86_FEATURE_RDSEED);
> +		msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
> +		pr_emerg("RDSEED is not reliable on this platform; disabling.\n");
> +	}
>  }
> diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
> index e6134ef2263d..8b48a54b627a 100644
> --- a/tools/arch/x86/include/asm/msr-index.h
> +++ b/tools/arch/x86/include/asm/msr-index.h
> @@ -616,6 +616,7 @@
>  #define MSR_AMD64_OSVW_STATUS		0xc0010141
>  #define MSR_AMD_PPIN_CTL		0xc00102f0
>  #define MSR_AMD_PPIN			0xc00102f1
> +#define MSR_AMD64_CPUID_FN_7		0xc0011002
>  #define MSR_AMD64_CPUID_FN_1		0xc0011004
>  #define MSR_AMD64_LS_CFG		0xc0011020
>  #define MSR_AMD64_DC_CFG		0xc0011022
> -- 

In any case, those are just minor nits which can be dealt with when applying.

Otherwise, patch looks good, thanks.

We have merge window upcoming next week so I'll take it after that but it is
on my list of patches to take after the MW.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
