Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E411E515;
	Tue, 29 Apr 2025 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745925607; cv=none; b=jezBTiwzyultlMiIjqHNUFbea/depA40G+rAmaYz+RrPrUMVDZJn9JcY3UWrZBSTyd/45MCMs28vg7OohBshJjMXVS+QOE9a6+KVfZoeFmgsLpQog02AtToMQSraOj37cjfCp0qK55DoNZ5GPbG+p9w4E7jHXwsYRtXU/CxKmvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745925607; c=relaxed/simple;
	bh=u+0gdMWMSYuRtMYk3VUjuG61dFzk1pC1LDJTnsyEa3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkXsWekS/ryZASZBssKplsNbOE6CgWx/GhJK+RIDCKtXt6VKFZXjj7VRx7cqKO9hWQLSx+MKtsY+mSVrd1ScP1VCeU9UbXoQVeSJD6pkEwwIVsY9DUevM+WnfO0PYaREXnh+BPsvVVm61hkWCYaeZkPE+7TLYW3/QQJDECfMEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoKIaDwY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoKIaDwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BABC4CEE3;
	Tue, 29 Apr 2025 11:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745925606;
	bh=u+0gdMWMSYuRtMYk3VUjuG61dFzk1pC1LDJTnsyEa3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aoKIaDwY/xb45oY72JY/BRGb+W+OWRF7/1r/YrOz0KE6LAFRMfU0HgJgfg1QfNXdM
	 I5a+6oi6V3WKBi5gH0WcU+TP9amgRQe5C8k0uCwS4tHU6M3zTdibURGvIjJ6k+0R8x
	 gQQVUrKmDJLI6mVtvCaJSFFLaW0KZqnyVAxerqbt0UnxwaYorUbTWtsYxMqAt49yzT
	 SINuoXkOTasyRABSb0bUKGBIm/EX8kU23KJbJfZ7E+DNGCHBh6nwdU9WDPOF7IFYYf
	 /q2lIslPP6bGsJM5FDHlT0PSQDzX0iD9Q+aviNIM2BS2Djgtwtmw/SnroxVVRu5Tci
	 ZKBbQ2Is03m7Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9j0S-000000003cC-08Pc;
	Tue, 29 Apr 2025 13:20:08 +0200
Date: Tue, 29 Apr 2025 13:20:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBC16CGDhZ_XO3Xr@hovoldconsulting.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
 <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
 <aBCuSpToEklg340R@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCuSpToEklg340R@pluto>

On Tue, Apr 29, 2025 at 11:47:54AM +0100, Cristian Marussi wrote:
> On Sun, Apr 27, 2025 at 04:38:48PM +0200, Johan Hovold wrote:
> > On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> > > Add a common framework to describe SCMI quirks and associate them with a
> > > specific platform or a specific set of SCMI firmware versions.
> > > 
> > > All the matching SCMI quirks will be enabled when the SCMI core stack
> > > probes and after all the needed SCMI firmware versioning information was
> > > retrieved using Base protocol.

> > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > +{
> > > +	struct scmi_revision_info *rev = &info->version;
> > > +	const char *compatible = NULL;
> > > +	struct device_node *root;
> > > +
> > > +	root = of_find_node_by_path("/");
> > > +	if (root) {
> > > +		of_property_read_string(root, "compatible", &compatible);
> > > +		of_node_put(root);
> > > +	}
> > > +
> > > +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> > > +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > 
> > You're now just looking up the most specific compatible string in order
> > to include it in this dev_dbg(). Since you're now matching on all
> > compatible strings, perhaps you can consider just dropping it.
> > 
> 
> Yes indeed I was not sure to keep all of this machinery just to print
> the machine compatible that is used to try to match against the
> (possible) list of compats....on the other side seemed useful to know
> exactly what you are trying to match against....but maybe we can simply
> assume that the machine compatible is well-known....

Perhaps it would have been more useful if you printed all the compatible
strings here and not just the most specific one, but yeah, there are
other ways to read this strings through sysfs.

Keeping as-is should be fine too.

> > > +		/*
> > > +		 * Note that there could be multiple matches so we
> > > +		 * will enable multiple quirk part of an hash collision
> > 
> > nit: "quirks that are part of a"?
> > 
> 
> mmm...as a non-native and poor English speaker I am, though, reasonably
> confident that a/an is chosen based on the vowel/consonant SOUND of the
> next word NOT on the effective letter...am I wrong ?
> (then we could digress about which is the sound of a[n] 'hash' :P ...)

That's my understanding as well, but 'hash' begins with a consonant
sound so I'm pretty sure it's "a hash".

> > > +		 * domain...BUT we cannot assume that ALL quirks on the
> > > +		 * same collision domain are a full match.
> > > +		 */
> > > +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> > > +			if (quirk->enabled || quirk->hkey != hkey ||
> > > +			    impl < quirk->start_range ||
> > > +			    impl > quirk->end_range)
> > > +				continue;
> > > +
> > > +			if (quirk->compats[0] &&
> > > +			    !of_machine_compatible_match(quirk->compats))
> > > +				continue;
> > > +
> > > +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> > > +				 quirk->name);
> > > +
> > > +			dev_dbg(dev,
> > > +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> > > +				quirk->compats[0], quirk->vendor,
> > 
> > You can now match on more than one compats string, but I guess printing
> > just the first one is fine.
> > 
> 
> Yes, same as above dev_dbg...not sure if it was meaningful really to
> dump all the list and overload the log with all such info...

Right, indicating there is some compatible string that's being used is
still useful to know.

> > > +				quirk->sub_vendor_id,
> > > +				quirk->start_range, quirk->end_range);
> > > +
> > > +			static_branch_enable(quirk->key);
> > > +			quirk->enabled = true;
> > > +		}
> > > +	}
> > > +}
> > 
> > This seems to work as intended and I've tried matching on machine and
> > SoC compatible strings and/or vendor and protocol version:
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> 
> Thanks for the review Johan.
> 
> Since you have tested the effective final quirk patch, may I ask you to
> post straight away your final tested quirk patch on top of my next V3
> (with your authorship of course..)...I will drop the [NOT FOR UPSTREAM]
> example patch so that Sudeep can easily pick-up your patch.

Sure, I'll do so. Thanks for your help with getting this sorted!

Johan
