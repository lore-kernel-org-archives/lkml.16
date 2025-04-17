Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F222356BB;
	Thu, 17 Apr 2025 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888232; cv=none; b=ue7uQIjz8Q3khD7JaHYB00G9uTaa+v5fYexofRDGwrumGLSF7YyiuUL4HuwC3fB/lcTKDaaUl/fPiLBc+kjNSpxXWPOc05kyBh8el60HtemxnX9PFrD76ZANzQ8x6ksao4IL4cQpV1P1glNKMyV4Zm670QXDUGDwbrwainU617E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888232; c=relaxed/simple;
	bh=QhOYF78PgWc7llUCwEwkKLC0Tj0uJp2h9b/hwAa2F6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYRRizKcFM80aY5n1w8TU5hybJf28TO4Wdpflg1mOj2MSB0J+8Z7zvCpCwvrxAd2ZhNKslwyscBggQeRH+1wuBrQ3BwAgZhar8Q/tgawz762rqyXT/G5tmdvAts4FG12KDec+Ss+8v5seqIj593ss6rTjvokDtbEdSAIAs+w67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA3871515;
	Thu, 17 Apr 2025 04:10:26 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D1533F59E;
	Thu, 17 Apr 2025 04:10:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 12:10:25 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aADhoX4Rkx8Eu_er@pluto>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>

On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> 
> > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > +{
> > > > +	struct scmi_revision_info *rev = &info->version;
> > > > +	const char *compatible = NULL;
> > > > +	struct device_node *root;
> > > > +
> > > > +	root = of_find_node_by_path("/");
> > > > +	if (root) {
> > > > +		of_property_read_string(root, "compatible", &compatible);
> > > 
> > > Looks like you still only allow matching on the most specific compatible
> > > string.
> > > 
> > > As we discussed in the RFC thread, this will result in one quirk entry
> > > for each machine in a SoC family in case the issue is not machine
> > > specific.
> > 
> > Well, yes but the solution would be to add multiple compatible on the
> > same quirk line, which is definitely less cumbersome than adding
> > multiple quirk defs for the same quirk but does NOT scale anyway....
> > 
> > ...anyway I will add that possibility..or I am missing something more ?
> 
> I was referring to the need to match on other compatible strings than
> the most specific one. For the ThinkPad T14s the strings are:
> 
> 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> 	"qcom,x1e78100", "qcom,x1e80100"
> 
> Here you most certainly would not want to match on
> "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> of the SoC compatibles.
> 
> For the FC quirk we may have to match on compatible and then a single
> SoC entry could cover tens of machines (and their SKU variants).
> 
> of_machine_is_compatible() can be used to match on any compatible
> string, but not sure if that fits with your current implementation.
>  

Yes I know, it will need a bit of rework on my side...the problem is
that anyway does not scale at all, even though matching on SoC could be
less cumbersome ... and the reason is that it is fundamentally wrong
to match SCMI Quirks on anything different from the SCMI vendor/subv/impl_ver
since these are fixes/workarounds against quirks that are completely Vendor
and fw-version specific...

...instead now we are considering using compatibles to overcome the fact
that the vendor probably messed (or will mess up) also the side of
the story related to SCMI fw versions management ... "quirking" SCMI stuff
on platform/sku compatibles is basically a quirk against their broken
fw release process...

...moreover this kind of carpet-quirking that hides the issue on any possible
fw version gives ZERO incentives to the aforementioned vendor to fix its
firmware...(or it fw-release process)...

Indeed, cross posting from your other mail thread, as of now we cannot
even be sure if the Vendor has somehow already updated the SCMI-related
firmware NEITHER we can be sure about this in the future since it has not
even confirmed how they are (or they will) be handling the Impl_Version field...

Having said that, I would add that in this specific case (FC quirk) since the
only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
is having working FCs and, since it's clear that our lovely vendor wont
certainly break this other lovely OS way of working with SCMI, MAYBE it could
be safe to just apply the quirk to this Vendor forever no matter what the
platform or FW version will be in the future...(so not using compats at all)

...but I will be very happy to leave all of these political/phylosophycal
decisions to Sudeep :P

Thanks,
Cristian
