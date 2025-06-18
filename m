Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3342F533A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219514; cv=none; b=aGRxmxuX7My2tsAhJOW/QA+rj71cDC/necc/IMFZ9xZSKBdNxxQcckBv/jWP41VRjhx/KgIdVbh1luyj6Z9S46cp306qfrtd6IkKNrb3HYoB3IwCwKXb36lbFXGmCtWBsIcSDjpSbsCVZZx48njr0NNDpRbGrKab1RSw0SAX1qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219514; c=relaxed/simple;
	bh=7a7G6Dl97BM3ChtHIr4rSU8yy6jJ3BvwF0Jy5TyQVWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqFmyqqvzKtmk+VNdlpzZu5fIHy/lXhLZH5cohEtZMSujvYy5d2hWofJHkldumIz1N21OqtBj9awBkvWcCFPi9/fN6QUvQeC4Tc8VkNSFDgNnexKrSqC8Gbd9IJG9SWQLeepL+oPdblgLMkXvb/fhnOKwTh7PWy/YBOdLJAX3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZVX7BXm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZVX7BXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76812C4CEE7;
	Wed, 18 Jun 2025 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750219514;
	bh=7a7G6Dl97BM3ChtHIr4rSU8yy6jJ3BvwF0Jy5TyQVWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZVX7BXmD/B7LGZa/P6a92a1ZGmr+fBDFOeDWEPKNfxUvY9wKodsAYPZRxJNn+xrs
	 Gv5I3yGaINrv8uX6dplQ5lki3ynUkwhWcqEQRiHrtdg59brHeD6v4HyxM5TsfYGyFp
	 kz9Ev9lIvDfatLA+DiMh3xdxaafbhgLyhyFfrSjoaGQ8dUbGGVR8UCrvahO/Qb4cY0
	 hbo+otyDD258WsAgKKIIUmNTuCKIqxWqDF+A730UHfSfpQrmuFVXXE/GS5Kuxzovu3
	 1nMyR3DwVWS0GoGH2r9pThme5FeCIPnEInQvrdI6Py6DQpQeSZL8amidICRwthNYDZ
	 +ajKQXGyWWaeg==
Date: Wed, 18 Jun 2025 09:30:56 +0530
From: Naveen N Rao <naveen@kernel.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Sairaj Kodilkar <sarunkod@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Babu Moger <babu.moger@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 2/2] x86/cpu/topology: Use initial APICID from XTOPOEXT
 on AMD/HYGON
Message-ID: <2vanc3xxtjx3ytcl2dwcu3vmn7d2ixpco3mj6p7qyloga5j25p@5ldwqxycaeko>
References: <20250612072921.15107-1-kprateek.nayak@amd.com>
 <20250612072921.15107-3-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612072921.15107-3-kprateek.nayak@amd.com>

On Thu, Jun 12, 2025 at 07:29:21AM +0000, K Prateek Nayak wrote:
> Prior to the topology parsing rewrite and the switchover to the new
> parsing logic for AMD processors in commit c749ce393b8f ("x86/cpu: Use
> common topology code for AMD"), the "initial_apicid" on these platforms
> was:
> 
> - First initialized to the LocalApicId from CPUID leaf 0x1 EBX[31:24].
> 
> - Then overwritten by the ExtendedLocalApicId in CPUID leaf 0xb
>   EDX[31:0] on processors that supported topoext.
> 
> With the new parsing flow introduced in commit f7fb3b2dd92c ("x86/cpu:
> Provide an AMD/HYGON specific topology parser"), parse_8000_001e() now
> unconditionally overwrites the "initial_apicid" already parsed during
> cpu_parse_topology_ext().
> 
> Although this has not been a problem on baremetal platforms, on
> virtualized AMD guests that feature more than 255 cores, QEMU 0's out
> the CPUID leaf 0x8000001e on CPUs with "CoreID" > 255 to prevent
> collision of these IDs in EBX[7:0] which can only represent a maximum of
> 255 cores [1].
> 
> This results in the following FW_BUG being logged when booting a guest
> with more than 255 cores:
> 
>     [Firmware Bug]: CPU 512: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0200
> 
> Rely on the APICID parsed during cpu_parse_topology_ext() from CPUID
> leaf 0x80000026 or 0xb and only use the APICID from leaf 0x8000001e if
> cpu_parse_topology_ext() failed (has_topoext is false).
> 
> On platforms that support the 0xb leaf (Zen2 or later, AMD guests on
> QEMU) or the extended leaf 0x80000026 (Zen4 or later), the
> "initial_apicid" is now set to the value parsed from EDX[31:0].
> 
> On older AMD/Hygon platforms that does not support the 0xb leaf but
> supports the TOPOEXT extension (Fam 0x15, 0x16, 0x17[Zen1], and Hygon),
> the current behavior is retained where "initial_apicid" is set using
> the 0x8000001e leaf.
> 
> Link: https://github.com/qemu/qemu/commit/35ac5dfbcaa4b [1]
> Debugged-by: Naveen N Rao (AMD) <naveen@kernel.org>
> Debugged-by: Sairaj Kodilkar <sarunkod@amd.com>
> Fixes: c749ce393b8f ("x86/cpu: Use common topology code for AMD")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  arch/x86/kernel/cpu/topology_amd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/topology_amd.c b/arch/x86/kernel/cpu/topology_amd.c
> index fec849fff82f..2ff6988e020a 100644
> --- a/arch/x86/kernel/cpu/topology_amd.c
> +++ b/arch/x86/kernel/cpu/topology_amd.c
> @@ -80,7 +80,13 @@ static bool parse_8000_001e(struct topo_scan *tscan, bool has_topoext)
>  
>  	cpuid_leaf(0x8000001e, &leaf);
>  
> -	tscan->c->topo.initial_apicid = leaf.ext_apic_id;
> +	/*
> +	 * Prefer initial_apicid parsed from CPUID leaf 0x8000026 or 0xb
> +	 * if available. Otherwise prefer the one from leaf 0x8000001e
> +	 * over 0x1.
> +	 */
> +	if (!has_topoext)
> +		tscan->c->topo.initial_apicid = leaf.ext_apic_id;

My understanding is that the rest of this function continues to work 
properly with an all-zero return value from CPUID leaf 0x8000001e - data 
from topoext is preferred where available, and other sources are used 
for llc_id.

And, this fixes the firmware bug warning seen during a guest boot in 
qemu for me, so for this patch:
Tested-by: Naveen N Rao (AMD) <naveen@kernel.org>


Thanks,
Naveen

