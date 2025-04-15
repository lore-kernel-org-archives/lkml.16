Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014C21930B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737157; cv=none; b=UXdOMeWThFE9jQYcpzzoCk5JXnMnfRn5GgmVbwEjji2VsLibege4aEQPNo8GbHAufTlOnzamf/VZz/fL6GcuHrhM9C2Fv9J/tLRlAyzY351ukURBhVz2yzFAfVvVyAOPGwheaTQHyK4Qbul2eLzK8F3kAabbtocFflZHcZ8S+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737157; c=relaxed/simple;
	bh=KsUegg4duEWHcNjxusZVDWGq165UXAWPP+T6hRPHNFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fut2FJUSBgIB5nNeL06LvSteSzoOq0qZZlWVAi68CVEug6UB9wD9Pez95lgkleC7hBfgmTOJW8cO97FoXsk3KGANAo04pBeGh2Ps+3J9YsId+lQ58irqC34I95RXkrBFpL4crdF2eRyeRjF9gChQiMExuz9dRqh8E69ujSMmAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YJA0Hd69; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YJA0Hd69"
Date: Tue, 15 Apr 2025 10:12:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744737152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UZlxHE/PMbbkteqFpAZs5FG6AXCNdqDMrVPzocoft9A=;
	b=YJA0Hd6969e9muOdARDfAIzNX7YV3lzqLiQMrcIJ8oQO07vov55VixBq+G81cQHzPMegxs
	ZNg3GYzIgyjlqElFtCeT4NvRCuQLlou5VjBsntXSdZNvroYfj67Z2D+68kazZahR19ZZxG
	TGhqLOI/EM0wX2e4tL9beWLl4ZEDSdw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: errata: Work around AmpereOne's erratum
 AC03_CPU_36
Message-ID: <Z_6Te1TjMqyXChvQ@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415154711.1698544-1-scott@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 15, 2025 at 08:47:10AM -0700, D Scott Phillips wrote:
> AC03_CPU_36 can cause asynchronous exceptions to be routed to the wrong
> exception level if an async exception coincides with an update to the
> controls for the target exception level in HCR_EL2. On affected
> machines, always do writes to HCR_EL2 with async exceptions blocked.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
> ---
>  arch/arm64/Kconfig              | 17 +++++++++++++++++
>  arch/arm64/include/asm/sysreg.h | 18 ++++++++++++++++--
>  arch/arm64/kernel/cpu_errata.c  | 14 ++++++++++++++
>  arch/arm64/tools/cpucaps        |  1 +
>  4 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a182295e6f08b..e5fd87446a3b8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -445,6 +445,23 @@ menu "Kernel Features"
>  
>  menu "ARM errata workarounds via the alternatives framework"
>  
> +config AMPERE_ERRATUM_AC03_CPU_36
> +        bool "AmpereOne: AC03_CPU_36: CPU can take an invalid exception, if an asynchronous exception to EL2 occurs while EL2 software is changing the EL2 exception controls."
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around Ampere
> +	  errata AC03_CPU_36 on AmpereOne.
> +
> +	  If an async exception happens at the same time as an update to the
> +	  controls for the target EL for async exceptions, an exception can be
> +	  delivered to the wrong EL. For example, an EL may be routed from EL2
> +	  to EL1.
> +
> +	  The workaround masks all asynchronous exception types when writing
> +	  to HCR_EL2.
> +
> +	  If unsure, say Y.
> +
>  config AMPERE_ERRATUM_AC03_CPU_38
>          bool "AmpereOne: AC03_CPU_38: Certain bits in the Virtualization Translation Control Register and Translation Control Registers do not follow RES0 semantics"
>  	default y
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 2639d3633073d..e7781f7e7f7a7 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1136,14 +1136,28 @@
>  	__val;							\
>  })
>  
> +#define __sysreg_is_hcr_el2(r)					\
> +	(__builtin_strcmp("hcr_el2", __stringify(r)) == 0)

This looks fragile. What about:

	write_sysreg(hcr, HCR_EL2);

or:

	write_sysreg_s(hcr, SYS_HCR_EL2);


Thanks,
Oliver
