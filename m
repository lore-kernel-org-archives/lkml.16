Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5DF219A8D;
	Tue, 22 Apr 2025 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321635; cv=none; b=YrECgtsLDfGk1jeCztHxIkWEg6GeL4OCm7q2GONXk5knmyM6OBAeSjM4rrfzhqk4+M8cEiDVXoLlZtj+oyBfv4d4ofJ2HCwwVHKDjqT2GNH/PLjcjneB7QIEpumg8LMZ6i1r7H+XjNfmvF8YpO+bj464o1nXKnoNpKT34Rzkycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321635; c=relaxed/simple;
	bh=Ytd+GWLnDggquXZAdMccPb/CJPfui4WPyUExQmPjCZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utx07OkWXBpLIdNDa6tZRub72IQqisaUr4HcXGKmmOrh7jHUO8G9xnAv837IzEWrsE1RMb7QCm7HUn1gk0wTNyaKyyr0xlRxcMeAXlkEacQOzktU4qjRBihAU+sk1lIu1DPlnIIJ/f8axp3vrOn8Y88UelBZhKjVWh85StqFLF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0C8152B;
	Tue, 22 Apr 2025 04:33:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7D1B3F5A1;
	Tue, 22 Apr 2025 04:33:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 12:33:40 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAd-lIzIGxzxfWXC@pluto>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
 <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
 <aADhoX4Rkx8Eu_er@pluto>
 <20250417-teal-sidewinder-of-courtesy-d0473d@sudeepholla>
 <aAdya5rephGNP_Tw@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAdya5rephGNP_Tw@hovoldconsulting.com>

On Tue, Apr 22, 2025 at 12:41:47PM +0200, Johan Hovold wrote:
> On Thu, Apr 17, 2025 at 03:41:56PM +0100, Sudeep Holla wrote:
> > On Thu, Apr 17, 2025 at 12:10:25PM +0100, Cristian Marussi wrote:
> > > On Thu, Apr 17, 2025 at 10:44:24AM +0200, Johan Hovold wrote:
> > > > On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> > > > > On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > > > > > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > > > 
> > > > > > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > > > > > +{
> > > > > > > +	struct scmi_revision_info *rev = &info->version;
> > > > > > > +	const char *compatible = NULL;
> > > > > > > +	struct device_node *root;
> > > > > > > +
> > > > > > > +	root = of_find_node_by_path("/");
> > > > > > > +	if (root) {
> > > > > > > +		of_property_read_string(root, "compatible", &compatible);
> > > > > > 
> > > > > > Looks like you still only allow matching on the most specific compatible
> > > > > > string.
> > > > > > 
> > > > > > As we discussed in the RFC thread, this will result in one quirk entry
> > > > > > for each machine in a SoC family in case the issue is not machine
> > > > > > specific.
> >

Hi,

a quick one that I am away from the keyboard currently ...
 
> > Agreed, but we can predict that. You can infer just from the current state
> > of affairs. Today all machines based on soc X may need the quirk but the
> > firmware may vary across machines with same SoC.
> 
> Sure, I was just highlighting this limitation in the current
> implementation...
> 
> > > > I was referring to the need to match on other compatible strings than
> > > > the most specific one. For the ThinkPad T14s the strings are:
> > > > 
> > > > 	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
> > > > 	"qcom,x1e78100", "qcom,x1e80100"
> > > > 
> > > > Here you most certainly would not want to match on
> > > > "lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
> > > > of the SoC compatibles.
> 
> ...and the fact that even if you want to avoid matching on SoC
> compatible, the current implementation seems to be too limited to allow
> matching on machine compatibles generally (i.e. given that there may be
> variants of a particular machine).
> 
> We may not even need this for the FC quirk, this was just a general
> observation.
> 
> > > > of_machine_is_compatible() can be used to match on any compatible
> > > > string, but not sure if that fits with your current implementation.
> > > > 
> > 
> > I was thinking about the same when I looked at the code. Using it is
> > more elegant IMO.
> 
> It would be more flexible, even if you never intend to accept any quirks
> that matches for an entire SoC.
> 


I already have a V2 under test that will define a quirk using a
__VA_ARGS__ so that you can specify a variable number of compats to
match against the platform running using of_machine_compatible_match()

+/*
+ * Define a quirk by name (_qn) and provide the matching tokens where:
+ *
+ *  _ven : SCMI Vendor ID string, NULL means any.
+ *  _sub : SCMI SubVendor ID string, NULL means any.
+ *  _impl : SCMI Implementation Version string, NULL means any.
+ *          This version string can express ranges using the following
+ *          syntax:
+ *
+ *                     NULL            [0, 0xFFFFFFFF]
+ *                     "X"             [X, X]
+ *                     "X-"            [X, 0xFFFFFFFF]
+ *                     "-X"            [0, X]
+ *                     "X-Y"           [X, Y]
+ *
+ *          where <v> in [MIN, MAX] means:
+ *
+ *             MIN <= <v> <= MAX  && MIN <= MAX
+ *
+ *  _comps : NULL terminated array of compatible strings.
+ *          An empty array means any.
+ *
+ *  This implicitly define also a properly named global static-key that
+ *  will be used to dynamically enable the quirk at initialization time.
+ *
+ *  Note that it is possible to associate multiple quirks to the same
+ *  matching pattern, if your firmware quality is really astounding :P
+ */
+#define DEFINE_SCMI_QUIRK(_qn, _ven, _sub, _impl, ...)                 \

I will post V2 soon.

> > > ...moreover this kind of carpet-quirking that hides the issue on any possible
> > > fw version gives ZERO incentives to the aforementioned vendor to fix its
> > > firmware...(or it fw-release process)...
> 
> If a vendor truly only cares about some other OS then perhaps this
> argument isn't that strong and we'll just increase our own maintenance
> burden.
> 

indeed.

> > > Indeed, cross posting from your other mail thread, as of now we cannot
> > > even be sure if the Vendor has somehow already updated the SCMI-related
> > > firmware NEITHER we can be sure about this in the future since it has not
> > > even confirmed how they are (or they will) be handling the Impl_Version field...
> > > 
> > > Having said that, I would add that in this specific case (FC quirk) since the
> > > only way to make use of all of this SCMI stuff from the MicroZoft/ACPI world
> > > is having working FCs and, since it's clear that our lovely vendor wont
> > > certainly break this other lovely OS way of working with SCMI, MAYBE it could
> > > be safe to just apply the quirk to this Vendor forever no matter what the
> > > platform or FW version will be in the future...(so not using compats at all)
> 
> My understanding is that the version has been bumped now albeit for
> other reasons than fixing this particular bug. And since enabling FC for
> these messages should be safe we will probably be able to match on
> vendor/impl_version here.

So what is your latest Firmware version read ? no more 0x20000

[    0.116746] arm-scmi arm-scmi.0.auto: SCMI Protocol ?? 'Qualcom:' Firmware version ???????

> 
> Sibi is looking into this and should be able to provide an answer
> shortly.
> 

Good.

Thanks,
Cristian
