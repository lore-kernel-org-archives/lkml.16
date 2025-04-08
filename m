Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A841DF749;
	Tue,  8 Apr 2025 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124340; cv=none; b=hWk8GPgugMMf/ODsABj3ka0vkMhKxKpvJdJK2rv+c96CPXmAkOXNO+4zWJa4aXeGi1oCsgc1xfM1pEiuAQQ4NnF0NthLeMNVjyKUYhunYz+rBIT8noBgzHMtXILbo23MJ+61E0iHqlg41CrWdVfkT1IZ61DK6aFiwXhS19ggdsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124340; c=relaxed/simple;
	bh=YvdHl1/Z4vQg1X2njDEqwyEHsxKugzx7tWbrj/mGuto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGGZJOmKsAAr0bnBPFxOG7qWtv0RPnuiVDx+LnnpmcFdFxEuIpWlgxTjEybYr78KTu6rCGktWqooKz6rnQ+O8jhx7UMup6QSVrji8eDyhLWt9WZywLW+S4cpKaqZEa1H5wYLeobZ5dot/cI9n7ci/2ftP2ZaQI782fjULyl6xwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nl0emsqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nl0emsqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0970C4CEE5;
	Tue,  8 Apr 2025 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124339;
	bh=YvdHl1/Z4vQg1X2njDEqwyEHsxKugzx7tWbrj/mGuto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl0emsqpUJ0D+aADf9ENV/mLocPn8KFDil18e0TyKmPCQ6PGjlZ2x+d3+7TSj8CQ0
	 qgEUx2j2jv3lZo2G+SKJBfWwkkp8N/fOT9+TDG+xXsuEwbp4w2sBnHIGAvv8CpMFCM
	 buMpRieSWXok7HFoLlUk/HFsiKaqbVMkLcXTuA7d5vKf+DMny8hIRFK24AKKwSs146
	 1gq8QsXfx2ir1fR1TpkHGqKgWJwzdppxbe7MuTsK7ZTkIiUyrmORQBest5MMCf8PVx
	 D0jG6462EwGU8W9Yy4feQm27Olp1ANlMfouSLrcjdZQvIf3ZhSbxow9z4zpUS6sj66
	 FclbqQBHQLFJA==
Date: Tue, 8 Apr 2025 16:58:54 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5 DT
 bindings
Message-ID: <Z/U5rvfU9CWUpYCc@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
 <174411521311.1639476.6777663294037851144.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174411521311.1639476.6777663294037851144.robh@kernel.org>

On Tue, Apr 08, 2025 at 07:26:53AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 08 Apr 2025 12:50:00 +0200, Lorenzo Pieralisi wrote:
> > The GICv5 interrupt controller architecture is composed of:
> > 
> > - one or more Interrupt Routing Service (IRS)
> > - zero or more Interrupt Translation Service (ITS)
> > - zero or more Interrupt Wire Bridge (IWB)
> > 
> > Describe a GICv5 implementation by specifying a top level node
> > corresponding to the GICv5 system component.
> > 
> > IRS nodes are added as GICv5 system component children.
> > 
> > An ITS is associated with an IRS so ITS nodes are described
> > as IRS children - use the hierarchy explicitly in the device
> > tree to define the association.
> > 
> > IWB nodes are described as GICv5 system component children - to make it
> > explicit that are part of the GICv5 system component; an IWB is
> > connected to a single ITS but the connection is made explicit through
> > the msi-parent property and therefore is not required to be explicit
> > through a parent-child relationship in the device tree.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 275 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dts:43.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Validated the bindings, not the example within, that caused this to trigger,
apologies.

Already fixed it - please review the bindings though, feedback on them
appreciated, thanks.

Lorenzo
