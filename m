Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94922157E;
	Thu, 17 Apr 2025 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879465; cv=none; b=Xd2CIt2AJbFUrQzJhgNwnKGM7qRYKF8gJqvYZSd6Qn0pPziugJfozb5AIKu9T/V5Tidpd9pYnFHuUagxT2CRiyXSfixYMBAU8o3nDLqy1rnFoWC/VeO1zSmPv3q+Dpo/wLZl9vY6BL/s3eWlHJTa4jLytQxowkeeUghESINTkxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879465; c=relaxed/simple;
	bh=A9Faa6Hi06Qb+FMxB+xHx14Tv/SX93t05l35ho7ZmuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVkqQFrY9RP7/3mfyuIMVL9mcwswmPoOWU961atm3r97gFbNYV3GYRL9yJjEKgVdp6uCgRwKFRAoohE57GR+p4hgUDwzFRAPzaL8J3UqsIpluLBpyRefgVJ9E6fQdNDJNIhWXeIVWH9vq84eg+pim6LfPJW2wPrA6bL5THnIGM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+KQFRw0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+KQFRw0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB73EC4CEE4;
	Thu, 17 Apr 2025 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744879464;
	bh=A9Faa6Hi06Qb+FMxB+xHx14Tv/SX93t05l35ho7ZmuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+KQFRw0/kn8KZrGZh2+3SvkvdkVsh3YQgjbvbIMID2194SEhzy5tJwwcadGkgjyQ
	 h4u33pTtYqlqrPwvt5l2l13hs+wu8TUkn9gnITtPrW6almo9xbnF9NdZSiYSJ94j2s
	 yb4FPaO2fpWJHRkBYu+zSAXKEPpxB75JAUuUMSBRoOunyYM0ncdt+e61gQRWGo/yD3
	 a2IUbCqey4ePsOGn/ByP5xOVJSL9m8gZ+kFKbSfZ5M9ViDRNofhKDQMyef3/+jBhdF
	 2t5pcwFHDZhObOAxf8IzV86b5pTgTiTeCFv1Rmly0HCCUhIEiywIoPkIqnZPmeGq2Y
	 UAC1wYop90Qqg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5KrA-000000001ZO-0bIc;
	Thu, 17 Apr 2025 10:44:24 +0200
Date: Thu, 17 Apr 2025 10:44:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <aAC_aPHD4Ik-DW0x@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
 <Z__cuT5IW0Sbjqpg@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__cuT5IW0Sbjqpg@pluto>

On Wed, Apr 16, 2025 at 05:37:13PM +0100, Cristian Marussi wrote:
> On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> > On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:

> > > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > > +{
> > > +	struct scmi_revision_info *rev = &info->version;
> > > +	const char *compatible = NULL;
> > > +	struct device_node *root;
> > > +
> > > +	root = of_find_node_by_path("/");
> > > +	if (root) {
> > > +		of_property_read_string(root, "compatible", &compatible);
> > 
> > Looks like you still only allow matching on the most specific compatible
> > string.
> > 
> > As we discussed in the RFC thread, this will result in one quirk entry
> > for each machine in a SoC family in case the issue is not machine
> > specific.
> 
> Well, yes but the solution would be to add multiple compatible on the
> same quirk line, which is definitely less cumbersome than adding
> multiple quirk defs for the same quirk but does NOT scale anyway....
> 
> ...anyway I will add that possibility..or I am missing something more ?

I was referring to the need to match on other compatible strings than
the most specific one. For the ThinkPad T14s the strings are:

	"lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
	"qcom,x1e78100", "qcom,x1e80100"

Here you most certainly would not want to match on
"lenovo,thinkpad-t14s-lcd" but rather on "lenovo,thinkpad-t14s" or one
of the SoC compatibles.

For the FC quirk we may have to match on compatible and then a single
SoC entry could cover tens of machines (and their SKU variants).

of_machine_is_compatible() can be used to match on any compatible
string, but not sure if that fits with your current implementation.
 
> > > +		of_node_put(root);
> > > +	}
> > > +
> > > +	/* Enable applicable quirks */
> > > +	scmi_quirks_enable(info->dev, compatible,
> > > +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > > +}

Johan
