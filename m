Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9514724729E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639284; cv=none; b=e7lXSIvRubmsu+7wq/xVWHtJDABZQQC/OCe8l8y/IYv9jPJAs6P1gOLsOSIoK1tGsRQ/jLaEQM2vJrnYtAUyOj98BnLxQpTl5jz30Lchwm26H+qrmgR32/mIpOaXuhlY8uPMRj9JGBMQdjEcirJKDoj4x10HhBHkXLKMJoOqHxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639284; c=relaxed/simple;
	bh=+YodFNNTUuQhUEBZab6r6F10eQt952ve/wIQC9RSQ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyvZLyd+Khqh0/bdxQTzS5DXcyR9J0Gg6pjcYO2+N1TuSf0Nsl8nJl3lQkulVokzhS2qSxRG7aJZak6Ve9xv4RysbTQBLh+HH+ykXcVKgHmeqRdIiSvA1i3sQ3YZ2NRgDuEZju6n3vXUsBDOr71m+4W9HClPim7nfGtSXSIq7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lb5cLzqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lb5cLzqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B2EC4CEE2;
	Mon, 14 Apr 2025 14:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639284;
	bh=+YodFNNTUuQhUEBZab6r6F10eQt952ve/wIQC9RSQ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lb5cLzqbKEQZeiPHNFs7vn1FgagHY0WucQZtCbf6NoKfzfH63YBpLhoClGHY2PT02
	 N0Bc1yFqTiaO1a+tu8559J5GZylaeq60IK2ujm9D0+0YMkz42sbLvBKMZbImykdTPr
	 TwhKWCw3fI/Tig04mfhE6LhL/21nruX+VOts0seIjcsp5a6166SQxSY099ocl/Ey1e
	 ZONalVhK/+uqRxuiZdeTHnIEQ6z9atPVMVR62/TvRcMisu3CO/GlH4TGPNudBAI4oY
	 hxR6sec1UcxiIOjSdE+7x2nfIeS+NiKpR+L4Ubyz/Eiepn0VVgOlLsqCr2Umryciim
	 ZyWYmz3OML3vQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4KNE-000000004jy-2RWP;
	Mon, 14 Apr 2025 16:01:20 +0200
Date: Mon, 14 Apr 2025 16:01:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mux: suppress lookup errors for mux controls
Message-ID: <Z_0VMCmfnDZxd4GC@hovoldconsulting.com>
References: <20250414124220.30578-1-johan+linaro@kernel.org>
 <c0f63b8a-7197-050a-ca01-a1050a2e287e@axentia.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0f63b8a-7197-050a-ca01-a1050a2e287e@axentia.se>

On Mon, Apr 14, 2025 at 03:18:03PM +0200, Peter Rosin wrote:
> 2025-04-14 at 14:42, Johan Hovold wrote:
> > Since commit eec611d26f84 ("ASoC: codecs: wcd938x: add mux control
> > support for hp audio mux") we have drivers looking up mux controls that
> > are optional. This results in errors incorrectly being logged on
> > machines like the Lenovo ThinkPad X13s where the mux is missing:
> > 
> >     wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)
> > 
> > Suppress the error message when lookup of mux controls fails and make
> > sure to return -ENOENT consistently also when looking up controls by
> > name so that consumer drivers can easily determine how to proceed.
> > 
> > Note that most current consumers already log mux lookup failures
> > themselves.
> > 
> > Fixes: eec611d26f84 ("ASoC: codecs: wcd938x: add mux control support for hp audio mux")
> > Link: https://lore.kernel.org/lkml/Z-z_ZAyVBK5ui50k@hovoldconsulting.com/
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> > --- a/drivers/mux/core.c
> > +++ b/drivers/mux/core.c
> > @@ -544,8 +544,13 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
> >  			index = of_property_match_string(np, "mux-control-names",
> >  							 mux_name);
> >  		if (index < 0) {
> > -			dev_err(dev, "mux controller '%s' not found\n",
> > -				mux_name);
> > +			if (!state && index == -EINVAL)
> > +				index = -ENOENT;
> 
> Why exclude states? For me, that's entirely random and inconsistent. If there's
> a reason to exclude them, I'd like to hear about it. If there is no reason and
> this is just defensive programming, then I'd like for someone to dig into it
> and either find a reason for the difference or clean up the inconsistency.

I only found one user of "mux states" and I'm still not quite sure why
there are two interfaces for looking up muxes. But my impression was
that if you need a mux set to a specific state and you even encode that
directly in DT, then there should be no need to support optional
resources.

After taking a closer look at the single consumer now, I see that it
already implements optional lookups itself and thus could benefit from
generalising this.

There's no other reason for why this could not be extended to "mux
states".

> I think the model of explicitly marking when you'd like a mux to be optional
> is a better and less fragile model. Who is to say that -EINVAL from some other
> call is, and will remain, a perfect match for the optional case you are aiming
> for?

-EINVAL is simply the error returned from the OF helpers when the name
properties are missing. I map that to -ENOENT for consistency with index
lookups (i.e. when the "mux-controls" property is missing) and that
error is much less likely to be returned for other reasons.

> Srinivas Kandagatla is looking into optional muxes as a side issue to
> exclusive muxes.
> https://lore.kernel.org/all/20250326154613.3735-1-srinivas.kandagatla@linaro.org/

The audio codec change introduces a de-facto regression so if you want
something different, we'll have to fix this in the codec driver directly
by checking for a "mux-controls" property before doing the lookup for
now (i.e. like is done in the TI driver looking up an optional "mux
state").

Johan
