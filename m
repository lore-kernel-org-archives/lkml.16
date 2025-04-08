Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA581EB9F9;
	Tue,  8 Apr 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124580; cv=none; b=Www86w9DdCUe28ttnY1wLK0OrxDwxuFn2Pwb0dzc32z/p11CWhw5OKg4p5nKt/BvhKjqk3MIYi5Cg4u2pVYahln7q+wgWdMbwy60t7nJHIKigDZ1TpB/JtEclgtw8tZgmg9WKDEj9afuIQiN3H2ecV9DS/lYP/tzjnWpPDegvS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124580; c=relaxed/simple;
	bh=LKvavUYgpGR64gZmKbXgsDUtOXVLw5hcAok6WXy6l2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGYADMZQwApPkvznHJM7lWOR/mDA9Fpo6oLxf3121NSRJQBB1cLaLBK/eEu/pZzrt02L1FpIbWCwask9S+8CtnPan3csy6540g+ie6wnz93PhUddSW+EWst64xUNSFuzKCjUzlnkQgemu+VzzcWp8fxoFh+KrAbHn/wMW1v266I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1A0ss6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1A0ss6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16087C4CEE5;
	Tue,  8 Apr 2025 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124579;
	bh=LKvavUYgpGR64gZmKbXgsDUtOXVLw5hcAok6WXy6l2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1A0ss6HLnm9h4iZmE3GGxq7KgMcTItcndCwA9TrvJ15cN8gdHxIAtMQuUDLaqm99
	 0KZ6n+1XpUrmR3N9EPmN0TR/w26ve6ew02oqFcqz3gfPkFmpt4aGOF8xKDnhNuXLhn
	 lFA4g4QrP3/0RGYEzYOt4WAbQB5svqsyZ51z6tH/tSP6b8QDM01UCHimmHW7RvDfyy
	 JPH67kVjPetJUMEiZ+7TTXxRqD0a/O/khNPzP6UWtVz2T6SjAgfTK+QCzYNMKwMn2i
	 W+4Jvfo01tAc+8CqOD38twNOzVomSZs1vMnjZsRjOerTk4w/Obn6QBi50mY0sUhcyz
	 +1wy+SIS1t7cw==
Date: Tue, 8 Apr 2025 17:02:53 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <Z/U6nVugAnrE2I7e@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-16-1f26db465f8d@kernel.org>
 <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_UH0808dGkS3v7-@J2N7QTR9R3.cambridge.arm.com>

On Tue, Apr 08, 2025 at 12:26:11PM +0100, Mark Rutland wrote:
> On Tue, Apr 08, 2025 at 12:50:15PM +0200, Lorenzo Pieralisi wrote:
> > Implement the GCIE capability as a strict boot cpu capability to
> > detect whether architectural GICv5 support is available in HW.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> This looks good; I have a minor consistency/bikeshedding concern below.
> 
> > ---
> >  arch/arm64/kernel/cpufeature.c | 7 +++++++
> >  arch/arm64/tools/cpucaps       | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 9c4d6d552b25cb3a31d1fb267bd73d3f82513e69..8c60591633f3d435ad9b80a10e484f26af328964 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -3041,6 +3041,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = has_pmuv3,
> >  	},
> >  #endif
> > +	{
> > +		.desc = "GCIE",
> > +		.type = ARM64_CPUCAP_STRICT_BOOT_CPU_FEATURE,
> > +		.capability = ARM64_HAS_GCIE,
> > +		.matches = has_cpuid_feature,
> > +		ARM64_CPUID_FIELDS(ID_AA64PFR2_EL1, GCIE, IMP)
> > +	},
> 
> I reckon it's worth making the desc a bit clearer, e.g. "GICv5 CPU
> interface".
> 
> It might be worth cleaning up the existing ARM64_HAS_GIC_CPUIF_SYSREGS
> feature, e.g. making that have "GICv3 CPU interface" as its desc.
> 
> Likewise, could make the names consistent, e.g. have:
> 
> 	ARM64_HAS_GICV3_CPUIF
> 	ARM64_HAS_GICV5_CPUIF
> 
> ... ?

This makes sense to me, I will do it in preparation for v2.

Thanks,
Lorenzo
