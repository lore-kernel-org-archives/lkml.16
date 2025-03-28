Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01955212FA1;
	Fri, 28 Mar 2025 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743151059; cv=none; b=Bpm8Rz/K+LJ4zqCfYnq8Kt1Qs+8fsQxfhUznFFWOBtb0asNFwqG2+ei7dSx9PnRjxXAQm1k9IK1kM7UlNv9AZq5i5CoWjJITqOcv/gyimoT6hTtF4+ZKxYh4NH70gTnUZwWkyoui4aI1jx0wt8aGAFyo1LwS7lQ9CUXOpy0FYsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743151059; c=relaxed/simple;
	bh=p7l/YosBDhxAEFU++sA6L3zaEVejf9OcRhzmBwb3Ymo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmjCB+pSYos/F1mxY4+9gzmS+Y0zGoabMGhbF8ysGnFLlr/7WOdIcvzSgc/KIk13NwjchvvU1pJN39L+UTJqR9Q+sGjZH53SskozH6JUrie9nedrB+eRUk7j0bqWRc3pJGd/TLGFEojpiqtqfi/6JG6Fq5hSNBaKnVnsWFXAurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5Mk04WO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5Mk04WO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4625CC4CEE4;
	Fri, 28 Mar 2025 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743151058;
	bh=p7l/YosBDhxAEFU++sA6L3zaEVejf9OcRhzmBwb3Ymo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5Mk04WOOVOdryvynoOdNe3VxXsqA8v55HqRtM319hVNGb2nzfmHV7EmX5l/lMLsR
	 GvHFFS7Dh6YNeRt5yfTN3WFLEzL1f/VeaR6boT5HHtmgOrtPmWEHXp0WueA4L6Mh7+
	 zqACs+ExNC/u2iQqNzPU1zBzFau4b2/ALruwzQVWHyI1HLtlZcJ7+XvZnnuDNlDSHN
	 KBicg6QDyru7SMgq5h2BOniWC+smFVn0WdcPONbYY/kAC8xeCFPnBqJLzjmDMkdJwU
	 yTQiXp7UJaiTxefBDnya4Mr1FxFI62Z91kEWnGqzv8qTTkEkpeYXcvsNE6R5o0N9Kc
	 zsirgigJXWqmw==
Date: Fri, 28 Mar 2025 08:37:34 +0000
From: Lee Jones <lee@kernel.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Felix Blix Everberg <felix.blix@prevas.dk>
Subject: Re: [PATCH 1/8] mfd: ocelot: refactor bus-specific regmap
 initialization
Message-ID: <20250328083734.GC585744@google.com>
References: <20250319123058.452202-1-ravi@prevas.dk>
 <20250319123058.452202-2-ravi@prevas.dk>
 <Z9skKTf30m9DVaC5@colin-ia-desktop>
 <20250321114159.GJ1750245@google.com>
 <87r02qeexm.fsf@prevas.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r02qeexm.fsf@prevas.dk>

On Fri, 21 Mar 2025, Rasmus Villemoes wrote:

> On Fri, Mar 21 2025, Lee Jones <lee@kernel.org> wrote:
> 
> > On Wed, 19 Mar 2025, Colin Foster wrote:
> >
> >> On Wed, Mar 19, 2025 at 01:30:51PM +0100, Rasmus Villemoes wrote:
> >> > diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
> >> > index 41aff27088548..78b5fe15efdd2 100644
> >> > --- a/drivers/mfd/ocelot-core.c
> >> > +++ b/drivers/mfd/ocelot-core.c
> >> > @@ -200,10 +200,12 @@ static const struct mfd_cell vsc7512_devs[] = {
> >> >  static void ocelot_core_try_add_regmap(struct device *dev,
> >> >                                        const struct resource *res)
> >> >  {
> >> > +       struct ocelot_ddata *ddata = dev_get_drvdata(dev);
> >> > +
> >> >         if (dev_get_regmap(dev, res->name))
> >> >                 return;
> >> > 
> >> > -       ocelot_spi_init_regmap(dev, res);
> >> > +       ddata->init_regmap(dev, res);
> >> 
> >> I remember changing this from function pointers to the direct function
> >> call during initial development, per Lee's suggestion. I like it though,
> >> and I'm glad to see multiple users now.
> >
> > Yeah, we're still not going to be putting call-backs into device data.
> 
> OK. Can you explain why that is such a bad design?

It opens things up for all kinds of other 'cleverness' (a.k.a. hackery).

Save call-backs for things like class-level ops, not driver level hacks.

> > Either pass the differentiating config through to the core driver
> 
> So you mean something like defining a new struct ocelot_backend_ops { } with
> those function pointers, and pass an instance of that to
> ocelot_core_init (and from there down to the static helper functions)?
> That should be doable.

No call-backs at all.  Pass a pointer to the Regmap data.

> > or handle the differentiation inside the *-i2c.c / *-spi.c files.
> 
> I really fail to see how that could be done. Currently, the core file
> has a hard-coded call of ocelot_spi_init_regmap(). I don't suppose you
> mean to teach that function to realize "hey, this struct device is not
> really a struct spi_device, let's delegate to ocelot_mdio_init_regmap()
> instead". So _somehow_ the core will need to know to call one or the
> other init_regmap implementation. I could add some "enum ocelot_type"
> and switch on that and then call the appropriate bus-specific function,
> but that's morally equivalent to having the function pointers.

Enums are acceptable for this use-case.  Opaque function pointers that
are troublesome to debug / read without; running the code, printing
pointers then conducting a system table look-up, are not.

It's not that function pointers wouldn't work perfectly well in this
scenario.  The issue is the precedent it (or any of the previous
attempts to do this) would set and the chaos that would follow.

-- 
Lee Jones [李琼斯]
