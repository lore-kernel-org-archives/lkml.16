Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C965661;
	Sun, 27 Apr 2025 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745764727; cv=none; b=DRGkLoZqts2jkhIoUz+BwfkcO2GZkddnI7oKnUQ9ocU4//7Gk6WtNsD3V2ZrCGFPYGIy9SZjviHn9n5fd/TRX0P8mCfWQY9M8PyIlUuVOs969SsAFZRKb8WrcdbvIjgDD9/oZi82laKdrfAl2L1hic3UhtkUG31OwsO0gAo/xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745764727; c=relaxed/simple;
	bh=iqNyrXhXtNWzKzdJcnAl3HmTmEDJLWGh4BiARlXXw+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fn8lVFZ7SVHWyXFI+AwOvGxb48hxI6+iujBpvDjJbvx6VX2wugKCFq2p3vAad/6oNyLfdMva0CSlwxzMoPHJi6SFZ5vDC0SI85Ktn9JHpDuN+8x/fFM/hN0E3QP0aIXyHjtgWIrPJdZn9NojJFGwiuFQzpdeq0+/8Qm6gQYJMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYminJdb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYminJdb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC2CC4CEE3;
	Sun, 27 Apr 2025 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745764726;
	bh=iqNyrXhXtNWzKzdJcnAl3HmTmEDJLWGh4BiARlXXw+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYminJdb1iacYydize7B8EO9+rtgl1RduKYbdZt/fehYyNTEJ6uAUbOFdIGe9PyUA
	 yD6YMMJGPnXxIn1kTDztj8Yg1QtlvwEU1GXYepn47jUqvLgt2Cj165flaPrG3X0ORT
	 YgPa/hQUJC0FADRBzgYKWmX81JRAry0SYqEIZ/i2vt1v9s19jhobaYp6440SKt7A/n
	 bG6XzUCp12D1FRzuFv/lcjSknDTMXxuJnzWUDiFGRIrLsKnv3JLqu4rAnwq6vLK86b
	 YM3FYhkJopA70DAo54k5ShGcWsvMka3tn0rETGw15PrvlCXxNn+iPABHAosXp5RKhG
	 I7PnYt4mVGh/Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u939c-000000005vL-0heY;
	Sun, 27 Apr 2025 16:38:48 +0200
Date: Sun, 27 Apr 2025 16:38:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aA5BeONpC3CJE5-Z@hovoldconsulting.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
 <20250425125250.1847711-3-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425125250.1847711-3-cristian.marussi@arm.com>

On Fri, Apr 25, 2025 at 01:52:48PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> V1 -> V2
> - compile quirk snippets even when SCMI Quirks are disabled
> - added support for quirks matches on multiple compatibles
>   (via NULl terminated compats strings)
> - removed stale unneeded include
> - added some more docs

> +static void scmi_enable_matching_quirks(struct scmi_info *info)
> +{
> +	struct scmi_revision_info *rev = &info->version;
> +	const char *compatible = NULL;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		of_property_read_string(root, "compatible", &compatible);
> +		of_node_put(root);
> +	}
> +
> +	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
> +		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);

You're now just looking up the most specific compatible string in order
to include it in this dev_dbg(). Since you're now matching on all
compatible strings, perhaps you can consider just dropping it.

> +
> +	/* Enable applicable quirks */
> +	scmi_quirks_enable(info->dev, rev->vendor_id,
> +			   rev->sub_vendor_id, rev->impl_ver);
> +}

> +/**
> + * DOC: Theory of operation
> + *
> + * A framework to define SCMI quirks and their activation conditions based on
> + * existing static_keys Kernel facilities.

nit: kernel

> +/*
> + * Define a quirk by name and provide the matching tokens where:
> + *
> + *  _qn: A string which will be used to build the quirk and the global
> + *	 static_key names.
> + *  _ven : SCMI Vendor ID string match, NULL means any.
> + *  _sub : SCMI SubVendor ID string match, NULL means any.
> + *  _impl : SCMI Implementation Version string match, NULL means any.
> + *          This string can be used to express version ranges which will be
> + *          interpreted as follows:
> + *
> + *			NULL		[0, 0xFFFFFFFF]
> + *			"X"		[X, X]
> + *			"X-"		[X, 0xFFFFFFFF]
> + *			"-X"		[0, X]
> + *			"X-Y"		[X, Y]
> + *
> + *          with X <= Y and <v> in [X, Y] meaning X <= <v> <= Y
> + *
> + *  ... : An optional variadic macros argument used to provide a coma-separated

comma

> + *	  list of compatible strings matches; when no variadic argument is
> + *	  provided, ANY compatible will match this quirk.

> +void scmi_quirks_enable(struct device *dev, const char *vend,
> +			const char *subv, const u32 impl)
> +{
> +	for (int i = 3; i >= 0; i--) {
> +		struct scmi_quirk *quirk;
> +		unsigned int hkey;
> +
> +		hkey = scmi_quirk_signature(i > 1 ? vend : NULL,
> +					    i > 2 ? subv : NULL);
> +
> +		/*
> +		 * Note that there could be multiple matches so we
> +		 * will enable multiple quirk part of an hash collision

nit: "quirks that are part of a"?

> +		 * domain...BUT we cannot assume that ALL quirks on the
> +		 * same collision domain are a full match.
> +		 */
> +		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
> +			if (quirk->enabled || quirk->hkey != hkey ||
> +			    impl < quirk->start_range ||
> +			    impl > quirk->end_range)
> +				continue;
> +
> +			if (quirk->compats[0] &&
> +			    !of_machine_compatible_match(quirk->compats))
> +				continue;
> +
> +			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
> +				 quirk->name);
> +
> +			dev_dbg(dev,
> +				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
> +				quirk->compats[0], quirk->vendor,

You can now match on more than one compats string, but I guess printing
just the first one is fine.

> +				quirk->sub_vendor_id,
> +				quirk->start_range, quirk->end_range);
> +
> +			static_branch_enable(quirk->key);
> +			quirk->enabled = true;
> +		}
> +	}
> +}

This seems to work as intended and I've tried matching on machine and
SoC compatible strings and/or vendor and protocol version:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
