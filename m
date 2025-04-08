Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188B3268FC9;
	Tue,  8 Apr 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111583; cv=none; b=mtE9K64rB4ocQMCCHvayEGsPIDe2ldV/yX7H8ft+PWwVxoPIPHWU+GrgIRht0K3knHjUu58nFRkgog8laJzXLoNdayyNAV1d8fv0fre9NYKZNh+/rYb4Cd3ptOaNJuT9O8WV5voVFOKyVxu+IWfB1OciHP+h88g5iuabJ08JCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111583; c=relaxed/simple;
	bh=Le4vHaTBbaUs4r0cCQNyRklq5JDSJXBj4TB2yF2UJL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcnxSXohdzt6sDq1tf0pI6FA7HF7fH3t+Eb8PlP8Y6brilbYnCigxJMCOA/Rl3pBOGGirr4ySVV6LgHVZxwy9qD+rxSPsGW5WbdYjrZ9TcvZCxSfTQoz+S2LRCAQ9SYsN977ZWRj0pB4ecCTXn+cKGAxaBD96sGTAbhWCtyuJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E392106F;
	Tue,  8 Apr 2025 04:26:21 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36AB03F59E;
	Tue,  8 Apr 2025 04:26:18 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:26:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 16/24] arm64: cpucaps: Add GCIE capability
Message-ID: <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>

On Tue, Apr 08, 2025 at 12:50:15PM +0200, Lorenzo Pieralisi wrote:
> Implement the GCIE capability as a strict boot cpu capability to
> detect whether architectural GICv5 support is available in HW.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

This looks good; I have a minor consistency/bikeshedding concern below.

> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  arch/arm64/tools/cpucaps       | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..8c60591633f3d435ad9b80a10e484f26af328964 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_pmuv3,
>  	},
>  #endif
> +	{
> +		.desc = "GCIE",
> +		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
> +		.capability = ARM64_HAS_GCIE,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
> +	},

I reckon it's worth making the desc a bit clearer, e.g. "GICv5 CPU
interface".

It might be worth cleaning up the existing ARM64_HAS_GIC_CPUIF_SYSREGS
feature, e.g. making that have "GICv3 CPU interface" as its desc.

Likewise, could make the names consistent, e.g. have:

	ARM64_HAS_GICV3_CPUIF
	ARM64_HAS_GICV5_CPUIF

... ?

Mark.
