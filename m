Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E663372638;
	Thu, 15 May 2025 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747327886; cv=none; b=AeN+FoPSKupo7pWPimqd6OS5P4txzdkGqEunZEsJo0LcIzkBg8rni7LPl/GbSiwMA2r6DBPriyGoRbldPepW4vugCab8H5YvbwHnUyU2KWCAk3alLJsM1I0e+erjquNaOxteDTir5fvNmEsz5dssWmcdMZLPy8hEV1LD5GpGQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747327886; c=relaxed/simple;
	bh=3DPNjyp/917C9IaWYsELtdTjRMZT/8tWz2u/wuB04SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhZsPal2Ct3t5er0kmweoIYdKHlwwiXCF0OHNtZV7uavdAs5hdX8/OSIWckeyLdRicPmcMWjMGmr9oldUiKpcxElILkS7jXl8e2RrKIs1ynTH2eMCcjQYZtcflHReALzevQo06re4K9Lm1j0NToZycKUdsiJrSw/RT3eGGUFz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDlNlmua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDlNlmua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EB0C4CEEF;
	Thu, 15 May 2025 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747327885;
	bh=3DPNjyp/917C9IaWYsELtdTjRMZT/8tWz2u/wuB04SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDlNlmua3Rv4A6wfHEhTsyY1fhtP9Ry6mwq6MfDez0T5Lb8JyCpcYnpN++S4PI572
	 fZRzIm9/Ov4x3q2DcEHfP/HEJWqXnPx2wFAxumsmOrrg+HtxlFYUckbC2sBA3dA2QY
	 TehhdkKoB4kEvz6WNEzFdkOrIkyXt1LNJg7VuSNaT+7J9JmoL4G+VEJUAbJlUxjxzr
	 AeTwfadkMrmqinXF3iMuuNq74naWBSEP+2hlZdWCftyIMBNEpp0jyBFAplMdd3zlMj
	 KZuUcdJLDTB4rrCSXG6EALUzrQlXy/sVifi/S1eOaEVH2CIaTGaFYSsDns3nS9SmCQ
	 k6GXdy9gIYliQ==
Date: Thu, 15 May 2025 18:51:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/9] x86/cpuid: Headers cleanup
Message-ID: <aCYbiLjkWM67Ogj_@gmail.com>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Hi,
> 
> This is a CPUID headers cleanup series, on top of tip:x86/cpu.  It is a
> precursor for the upcoming v2 of the CPUID parser:
> 
>     [PATCH v1 00/26] x86: Introduce centralized CPUID model
>     https://lore.kernel.org/lkml/20250506050437.10264-1-darwi@linutronix.de
> 
> as suggested by Ingo here:
> 
>     https://lore.kernel.org/lkml/aBnSgu_JyEi8fvog@gmail.com
> 
> * Summary:
> 
> The current CPUID header structure is:
> 
>     include/asm/
>     ├── cpuid
>     │   ├── api.h
>     │   ├── leaf_0x2_api.h
>     │   └── types.h
>     └── cpuid.h
> 
> Simplify it into:
> 
>     include/asm/
>     ├── api.h
>     └── types.h
> 
> Standardize the CPUID header namespace by enforcing a "cpuid_" prefix for
> all exported symbols.  That is:
> 
>     have_cpuid_p()		➤	cpuid_feature()
>     hypervisor_cpuid_base()	➤	cpuid_hypervisor_base()
>     native_cpuid()		➤	cpuid_native()
>     native_cpuid_REG()		➤	cpuid_native_REG()
> 
> Also rename:
> 
>     cpuid_get_leaf_0x2_regs()	➤	cpuid_leaf_0x2()
> 
> for consistency with the other <asm/cpuid/api.h> accessors that return
> full CPUID register output; i.e., cpuid_leaf() and cpuid_subleaf().
> 
> Finally, rename:
> 
>     for_each_leaf_0x2_entry()   ➤	for_each_cpuid_0x2_desc()
> 
> to include "cpuid" in the iterator name, and since what is being iterated
> upon is CPUID(0x2) cache and TLB "descriptos", not "entries".
> 
> * Testing:
> 
> - Basic one-by-one allyesconfig compilation
> 
> - Comparison of a before/after of below files:
> 
>   - /proc/cpuinfo
>   - /sys/devices/system/cpu/
>   - /sys/kernel/debug/x86/topo/
>   - dmesg --notime | grep 'Last level [id]TLB entries'
> 
> Thanks!
> 
> 8<--
> 
> Ahmed S. Darwish (9):
>   x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
>   x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
>   x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
>   x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()
>   x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
>   x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
>   x86/cpu: Rename CPUID(0x2) descriptors iterator parameter
>   x86/cpuid: Rename native_cpuid() to cpuid_native()
>   x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()

Thank you for doing this. I've reviewed the series and applied these:

    x86/cpuid: Move CPUID(0x2) APIs into <cpuid/api.h>
    x86/cpuid: Set <asm/cpuid/api.h> as the main CPUID header
    x86/cpuid: Rename have_cpuid_p() to cpuid_feature()
    x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
    x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
    x86/cpu/intel: Rename CPUID(0x2) descriptors iterator parameter

I had some questions about:

    x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()
    x86/cpuid: Rename native_cpuid() to cpuid_native()

and you had better ideas about:

    x86/cpuid: Rename native_cpuid_REG() to cpuid_native_REG()

Thanks,

	Ingo
