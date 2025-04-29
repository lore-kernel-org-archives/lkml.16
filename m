Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1532022A7EA;
	Tue, 29 Apr 2025 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923694; cv=none; b=EjgSJx/zH1OvTJqCeMId98Rq5M//4qXffxNpR9g4pqd04fLAMtN5tSSCU4JX0XAB3+LKbVHfKqJPf/fWobORoxclMLjpUzuc5rVkKnMreEIQiIdMOlne79i0xBr75InrIIOzjzj1ng82vGenP9Ez+vc1/M4aHRCZDul6jkT9bzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923694; c=relaxed/simple;
	bh=Ljhod7oHwZgRFJhUmVrNzrxMh8yev70ww0UqsX3m72Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhZVjPXO0RcJtbRyM4w1nbWxHprAXEN923AlKZeHxJKGwIr2G5UDLwFHYfSVvJSsAUB99ZfbJotoJMdwLtrOhwyjF1SCOx8a0OB1Gi+HzDEtDlu/aE2J8YXYh/hGe9nOrHKVpTJ9IqVLARr1PxH6eFD1DAOApeKKbHTotqUzkXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4571515;
	Tue, 29 Apr 2025 03:48:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D45A3F66E;
	Tue, 29 Apr 2025 03:48:09 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:47:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBCuSpToEklg340R@pluto>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
 <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA5BeONpC3CJE5-Z@hovoldconsulting.com>

On Sun, Apr 27, 2025 at 04:38:48PM +0200, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> > Add a common framework to describe SCMI quirks and associate them with a
> > specific platform or a specific set of SCMI firmware versions.
> > 
> > All the matching SCMI quirks will be enabled when the SCMI core stack
> > probes and after all the needed SCMI firmware versioning information was
> > retrieved using Base protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > V1 -> V2
> > - compile quirk snippets even when SCMI Quirks are disabled
> > - added support for quirks matches on multiple compatibles
> >   (via NULl terminated compats strings)
> > - removed stale unneeded include
> > - added some more docs
> 
> > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > +{
> > +	struct scmi_revision_info *rev = &info->version;
> > +	const char *compatible = NULL;
> > +	struct device_node *root;
> > +
> > +	root = of_find_node_by_path("/");
> > +	if (root) {
> > +		of_property_read_string(root, "compatible", &compatible);
> > +		of_node_put(root);
> > +	}
> > +
> > +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> > +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> 
> You're now just looking up the most specific compatible string in order
> to include it in this dev_dbg(). Since you're now matching on all
> compatible strings, perhaps you can consider just dropping it.
> 

Yes indeed I was not sure to keep all of this machinery just to print
the machine compatible that is used to try to match against the
(possible) list of compats....on the other side seemed useful to know
exactly what you are trying to match against....but maybe we can simply
assume that the machine compatible is well-known....

> > +
> > +	/* Enable applicable quirks */
> > +	scmi_quirks_enable(info->dev, rev->vendor_id,
> > +			   rev->sub_vendor_id, rev->impl_ver);
> > +}
> 
> > +/**
> > + * DOC: Theory of operation
> > + *
> > + * A framework to define SCMI quirks and their activation conditions based on
> > + * existing static_keys Kernel facilities.
> 
> nit: kernel
>

Yep.
 
> > +/*
> > + * Define a quirk by name and provide the matching tokens where:
> > + *
> > + *  _qn: A string which will be used to build the quirk and the global
> > + *	 static_key names.
> > + *  _ven : SCMI Vendor ID string match, NULL means any.
> > + *  _sub : SCMI SubVendor ID string match, NULL means any.
> > + *  _impl : SCMI Implementation Version string match, NULL means any.
> > + *          This string can be used to express version ranges which will be
> > + *          interpreted as follows:
> > + *
> > + *			NULL		[0, 0xFFFFFFFF]
> > + *			"X"		[X, X]
> > + *			"X-"		[X, 0xFFFFFFFF]
> > + *			"-X"		[0, X]
> > + *			"X-Y"		[X, Y]
> > + *
> > + *          with X <= Y and <v> in [X, Y] meaning X <= <v> <= Y
> > + *
> > + *  ... : An optional variadic macros argument used to provide a coma-separated
> 
> comma
> 

...ah

> > + *	  list of compatible strings matches; when no variadic argument is
> > + *	  provided, ANY compatible will match this quirk.
> 
> > +void scmi_quirks_enable(struct device *dev, const char *vend,
> > +			const char *subv, const u32 impl)
> > +{
> > +	for (int i = 3; i >= 0; i--) {
> > +		struct scmi_quirk *quirk;
> > +		unsigned int hkey;
> > +
> > +		hkey = scmi_quirk_signature(i > 1 ? vend : NULL,
> > +					    i > 2 ? subv : NULL);
> > +
> > +		/*
> > +		 * Note that there could be multiple matches so we
> > +		 * will enable multiple quirk part of an hash collision
> 
> nit: "quirks that are part of a"?
> 

mmm...as a non-native and poor English speaker I am, though, reasonably
confident that a/an is chosen based on the vowel/consonant SOUND of the
next word NOT on the effective letter...am I wrong ?
(then we could digress about which is the sound of a[n] 'hash' :P ...)

> > +		 * domain...BUT we cannot assume that ALL quirks on the
> > +		 * same collision domain are a full match.
> > +		 */
> > +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> > +			if (quirk->enabled || quirk->hkey != hkey ||
> > +			    impl < quirk->start_range ||
> > +			    impl > quirk->end_range)
> > +				continue;
> > +
> > +			if (quirk->compats[0] &&
> > +			    !of_machine_compatible_match(quirk->compats))
> > +				continue;
> > +
> > +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> > +				 quirk->name);
> > +
> > +			dev_dbg(dev,
> > +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> > +				quirk->compats[0], quirk->vendor,
> 
> You can now match on more than one compats string, but I guess printing
> just the first one is fine.
> 

Yes, same as above dev_dbg...not sure if it was meaningful really to
dump all the list and overload the log with all such info...

> > +				quirk->sub_vendor_id,
> > +				quirk->start_range, quirk->end_range);
> > +
> > +			static_branch_enable(quirk->key);
> > +			quirk->enabled = true;
> > +		}
> > +	}
> > +}
> 
> This seems to work as intended and I've tried matching on machine and
> SoC compatible strings and/or vendor and protocol version:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 

Thanks for the review Johan.

Since you have tested the effective final quirk patch, may I ask you to
post straight away your final tested quirk patch on top of my next V3
(with your authorship of course..)...I will drop the [NOT FOR UPSTREAM]
example patch so that Sudeep can easily pick-up your patch.

Thanks,
Cristian
