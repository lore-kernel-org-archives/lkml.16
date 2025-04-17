Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED9925178D;
	Thu, 17 Apr 2025 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900924; cv=none; b=UKEGMP3YGaH90gfgcjetxIzG5eNKo6UyakZEz2Owe6IfgZstwpNmQWBg0OAgwmlfD3YugHV7OOI8n3lsJaIVvEJlr9PUuKr50Bl76Du1YqseIb/JWKpMsCDZ7dPSIiVQ5gGzF8pItVWDOR5TKmeIjAcb8F4+mUkJ6YFT6bUyWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900924; c=relaxed/simple;
	bh=DCj4wV+HtaRAx/iATqsBwAlOGrZWM7b3RYCTouHM4yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrbvgUOWqKrrePJLi7hEvnRkEmhOEfWa9OgpR8g3xStkew+wIpezInD3Xvg3Iw0rAETiVt2/yPa8V1n9bMUYl4ig9hgwgBlkDWlR5F8F8HzDJ6jaY3G5uTQBpxxoj1l3n6Lcb0+Qc8yY/sjxbXXLuMibpCEnSoldCd2lkoJKvuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356E91515;
	Thu, 17 Apr 2025 07:41:59 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61CFE3F66E;
	Thu, 17 Apr 2025 07:41:59 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:41:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Johan Hovold <johan@kernel.org>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <peng.fan@oss.nxp.com>,
	<michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <maz@kernel.org>
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aADhoX4Rkx8Eu_er@pluto>

On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> > On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > 
> > > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > > +{
> > > > > +	struct scmi_revision_info *rev = &info->version;
> > > > > +	const char *compatible = NULL;
> > > > > +	struct device_node *root;
> > > > > +
> > > > > +	root = of_find_node_by_path("/");
> > > > > +	if (root) {
> > > > > +		of_property_read_string(root, "compatible", &compatible);
> > > > 
> > > > Looks like you still only allow matching on the most specific compatible
> > > > string.
> > > > 
> > > > As we discussed in the RFC thread, this will result in one quirk entry
> > > > for each machine in a SoC family in case the issue is not machine
> > > > specific.

Agreed, but we can predict that. You can infer just from the current state
of affairs. Today all machines based on soc X may need the quirk but the
firmware may vary across machines with same SoC.

> > > 
> > > Well, yes but the solution would be to add multiple compatible on the
> > > same quirk line, which is definitely less cumbersome than adding
> > > multiple quirk defs for the same quirk but does NOT scale anyway....
> > > 
> > > ...anyway I will add that possibility..or I am missing something more ?
> > 
> > I was referring to the need to match on other compatible strings than
> > the most specific one. For the ThinkPad T14s the strings are:
> > 
> > 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> > 	"qcom,x1e78100", "qcom,x1e80100"
> > 
> > Here you most certainly would not want to match on
> > "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> > of the SoC compatibles.
> > 

SoC compatibles is debatable but if we are sure, we can do that.

> > For the FC quirk we may have to match on compatible and then a single
> > SoC entry could cover tens of machines (and their SKU variants).
> > 

Well theoretically I agree, but even if one machine based on that SoC
doesn't need it we need to fall back to specific compatibles. That's the
argument IIUC as the firmwares depend to be machine specific most of
the time and also newer machines based on the same SoC may carry fixes
that may remove the need for the quirks.

> > of_machine_is_compatible() can be used to match on any compatible
> > string, but not sure if that fits with your current implementation.
> > 

I was thinking about the same when I looked at the code. Using it is
more elegant IMO.

> 
> Yes I know, it will need a bit of rework on my side...the problem is
> that anyway does not scale at all, even though matching on SoC could be
> less cumbersome ... and the reason is that it is fundamentally wrong
> to match SCMI Quirks on anything different from the SCMI vendor/subv/impl_ver
> since these are fixes/workarounds against quirks that are completely Vendor
> and fw-version specific...
> 

Agree!

> ...instead now we are considering using compatibles to overcome the fact
> that the vendor probably messed (or will mess up) also the side of
> the story related to SCMI fw versions management ... "quirking" SCMI stuff
> on platform/sku compatibles is basically a quirk against their broken
> fw release process...
> 

😄

> ...moreover this kind of carpet-quirking that hides the issue on any possible
> fw version gives ZERO incentives to the aforementioned vendor to fix its
> firmware...(or it fw-release process)...
> 

+1

> Indeed, cross posting from your other mail thread, as of now we cannot
> even be sure if the Vendor has somehow already updated the SCMI-related
> firmware NEITHER we can be sure about this in the future since it has not
> even confirmed how they are (or they will) be handling the Impl_Version field...
> 
> Having said that, I would add that in this specific case (FC quirk) since the
> only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
> is having working FCs and, since it's clear that our lovely vendor wont
> certainly break this other lovely OS way of working with SCMI, MAYBE it could
> be safe to just apply the quirk to this Vendor forever no matter what the
> platform or FW version will be in the future...(so not using compats at all)
> 

🤣

> ...but I will be very happy to leave all of these political/phylosophycal
> decisions to Sudeep :P
> 

Nice! I am happy to have generic compatible if we are sure all the machines
based on or using it needs it. We can fix it up in the future if required
by dropping generic compatibles and add all the more specific ones if the
generic compatible breaks(meaning it doesn't need quirk) on any of the
machines based on it as it is always hard to predict such things.


> Thanks,
> Cristian

-- 
Regards,
Sudeep
