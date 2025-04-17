Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD612522A2;
	Thu, 17 Apr 2025 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901390; cv=none; b=NFI9aC3vXmSHMR7u+b6+ND0KaT71XZl4cLbN1G7WcRETfilhlr4Tw0p3di8JTzzTgNw4Wx/FhoApsGAWwNG2Lia9p5+aHnRA8v7NnzSGrRZHIZSci80BIO9vD+ArrJ/atzsxFspaIgcqTNVvfqEmRc5YVbrB00BriRyXL6hMxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901390; c=relaxed/simple;
	bh=Y7Ov+PkxBtSJbpqygju98/xVM6r8zkCzNHMncrX/WXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQ8nA5UYFHptAJ8KQo6vTX0CBgfEBOe9LI/ZoTC41cdjFq65kJiSTL0Hs3dHIh6PTmN5hQhKZpd9MGuK8UpgSQ4J89e71l6PoFLNra4R5c/tuPvlYMcl1mqLeQEYXMIh7eSi09rllmYxbaFtVGYnaOPV0HbzedGq4mySJP+R45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWZa7Ns2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWZa7Ns2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA81C4CEEA;
	Thu, 17 Apr 2025 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901390;
	bh=Y7Ov+PkxBtSJbpqygju98/xVM6r8zkCzNHMncrX/WXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWZa7Ns2UI35IUdO3AWf8Rgvxl3v9kLKuQYI+hh5qssiVNFy5XO9jMUJ3gjGg0U3v
	 BRIA+bdUMhKuujlECrD7v2xDS0S6tkimACnv4XoaVYh5taHq7WwQWI/Ub6bIzWmZW/
	 Z8c03WPWok5FCSkMk2k/3k0gLRW3CaSTLMJVR2Sguf8YjQ/tnMjm6T8yb937j1JmhC
	 auq7dICFiGF2Ll1Z9w2AkEKPzDt9xB78VJrFFAvkITwhF9JXgGVGYqeUzfWUCohEqk
	 OofrLr0IxCKnV4pJiSWv8Q4qp4D7k0Tx11kIBOBe37f7DK5KYLwZzp8bhomXvndna0
	 JNgQuI4KZFjbg==
Date: Thu, 17 Apr 2025 16:49:43 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aAEVB9GpJ2SxTd51@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
 <877c3uuy7u.ffs@tglx>
 <Z/YiLNzRvXUgcHFc@lpieralisi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/YiLNzRvXUgcHFc@lpieralisi>

On Wed, Apr 09, 2025 at 09:30:52AM +0200, Lorenzo Pieralisi wrote:

[...]

> > > +static int __init gicv5_of_init(struct device_node *node,
> > > +				struct device_node *parent)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = gicv5_init_domains(&node->fwnode);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	gicv5_set_cpuif_pribits();
> > > +
> > > +	ret = gicv5_starting_cpu(smp_processor_id());
> > 
> > You invoke the CPU hotplug callback for the boot CPU explicitly, but
> > what the heck installs the actual hotplug callback for the secondary
> > CPUs?
> 
> That comes with a subsequent patch[21]. I mentioned in the cover letter
> that I tried to split the functionality into interrupt types to ease
> review (well, it does not look like I succeeded, sorry) and then in
> patch [21] (when LPIs backing IPIs are implemented), enable SMP.
> 
> The point is, we need patches [18-21] to enable SMP booting.
> 
> I can squash [18-21] all together or I can enable the hotplug callback
> here but this patch stand alone is not functional for the reasons
> above, let me know please what's best in your opinion and I will do.

I would squash patches [18-21] for v2 because that's the only option to
have a single logical and functional SMP working entity, unless you are
against it.

We need IPIs for SMP booting, those are built on LPIs that in turn
requires the IRS code to function - I tried to split all this code
but whatever I came up with makes no sense from a functional
perspective.

The only thing I could do is taking SPI enablement code (SPI IRQs are
optional) out of [18-21] and make it a separate patch, to be honest
SPI management I don't think it is a lot of code so that won't change
much IMO.

Please let me know, thanks a lot.

Lorenzo
