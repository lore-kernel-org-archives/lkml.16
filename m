Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10CD212FBC;
	Tue,  4 Feb 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677439; cv=none; b=jxW/Lc0npN7MK7MpfbMIC417uR+jKITZfhrFv7M9Watm+WS7vMkfu+xAePmeLJnu9XH0fMlOQclDe478pLdcacH6MiGed8wp7hpKiO7CZHctxHn/YvSzijAavZp94X0ppMUp/RQ6ewo02+La+6fAKFzvaYADEtxHjBfs+1HsTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677439; c=relaxed/simple;
	bh=7k7oDJf5DbZufBYekhtPBUkxAHwlD36vRQTlqfFevzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YG18p/zvuGUwYEWS3mcyvmL3A/ZO/tbWXxNICQHuYEVesraTWi6CWpGBGCHEFdlBRZXC4h1c3nSwL97V8NG9PcTUFdMvTxPL9jRbBWhU1k35fvXoVbkVp+kWjk1RuI5VTzxKTWXorQ2TdgTDTiMPvKKxW7nTCHZ+Xt0QSc2u2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BesNMMPV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BesNMMPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DA2C4CEE2;
	Tue,  4 Feb 2025 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738677438;
	bh=7k7oDJf5DbZufBYekhtPBUkxAHwlD36vRQTlqfFevzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BesNMMPVujcNaO6cuAWEZyo/CHCAg5PsmIlDuDoKgD26YnfogwxLBR8Ug3BLIfsjo
	 uT5hu62P6189it89OA2fU1NH/9e+VWT20cU9CebpfuIfDQ4IbZAVxRB40xyA1Nfx4N
	 su38yWGWm8EKOpv+6AIMwskzSfsZ2XPPXlY7NP9caE8ndywHqFnMCDXisspJ8/VFnm
	 gHCMoQHOt8o0eTsoNAZ6V7YtvwFGT1Su6Dzbpi6N9QgzCdCV0e2Ud0iPPzoVS+QzPd
	 Bc7TeJBkOnTPx67Wu7/SfaAu+ZSLGxOGmfBLUaiN6FeI9l/3DTuV0BMbtO6aDakxHI
	 J7C7hUoSlQsTQ==
Date: Tue, 4 Feb 2025 14:57:12 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <Z6IcuEPSO3QwIWzW@pollux>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <Z6H9g_bvvMf5pPyc@cassiopeiae>
 <2025020435-earwig-zesty-87ea@gregkh>
 <Z6ICPc3A5Cy1dgw_@cassiopeiae>
 <2025020458-overpass-pebbly-f4b9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020458-overpass-pebbly-f4b9@gregkh>

On Tue, Feb 04, 2025 at 01:55:54PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 04, 2025 at 01:04:13PM +0100, Danilo Krummrich wrote:
> > On Tue, Feb 04, 2025 at 12:52:34PM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Feb 04, 2025 at 12:44:03PM +0100, Danilo Krummrich wrote:
> > > > On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > > > > Many drivers abuse the platform driver/bus system as it provides a
> > > > > simple way to create and bind a device to a driver-specific set of
> > > > > probe/release functions.  Instead of doing that, and wasting all of the
> > > > > memory associated with a platform device, here is a "faux" bus that
> > > > > can be used instead.
> > > > > 
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > ---
> > > > >  v2: - renamed bus and root device to just "faux" thanks to Thomas
> > > > >      - removed the one-driver-per-device and now just have one driver
> > > > >        entirely thanks to Danilo
> > > > >      - kerneldoc fixups and additions and string handling bounds checks
> > > > >        hanks to Andy
> > > > >      - coding style fix thanks to Jonathan
> > > > >      - tested that the destroy path actually works
> > > > > 
> > > > >  drivers/base/Makefile       |   2 +-
> > > > >  drivers/base/base.h         |   1 +
> > > > >  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
> > > > >  drivers/base/init.c         |   1 +
> > > > >  include/linux/device/faux.h |  31 ++++++
> > > > >  5 files changed, 230 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 drivers/base/faux.c
> > > > >  create mode 100644 include/linux/device/faux.h
> > > > 
> > > > I really like it, it's as simply as it can be.
> > > > 
> > > > Please find one nit below, otherwise
> > > > 
> > > > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > > > 
> > > > > 
> > > > > +/**
> > > > > + * faux_device_destroy - destroy a faux device
> > > > > + * @faux_dev: faux device to destroy
> > > > > + *
> > > > > + * Unregister and free all memory associated with a faux device that was
> > > > > + * previously created with a call to faux_device_create().
> > > > 
> > > > Can we really claim that this frees all memory? Someone can still have a
> > > > reference to the underlying struct device, right?
> > > 
> > > That "someone" is the person that had the original device pointer passed
> > > to it, so if that person then calls faux_device_destroy(), yes, that
> > > should all be properly cleaned up.
> > > 
> > > But even if it isn't, the device is destroyed and gone from sysfs, and
> > > whenever that final final put_device() is called, the memory will then
> > > be freed by the driver core itself.
> > 
> > Oh indeed, the code here is perfectly fine. I just wanted to say that calling
> > faux_device_destroy() is not a guarantee that "all memory associated with a
> > faux device" is actually freed, as the kernel-doc comment above says (or at
> > least implies).
> > 
> > So, the concern only was that the comment could be confusing, as in "How can
> > faux_device_destroy() free the memory, if I still have a separate reference to
> > this thing?" (which it clearly would not).
> 
> Documentation is hard :)
> 
> Can you think of some wording here that would explain this better?
> Something like "after you call this, you can't touch the pointer you
> passed into here" is what I'm going for.

I would probably just say that it drops the initial reference created by
faux_device_create(), e.g.:

"Unregister a faux device and drop the initial reference obtained through
faux_device_create()."

--

From the formal side of things:

The thing with "can't touch the pointer you passed into here" is that it
depends on the conditions and on the definition of what it means for a pointer
to be valid.

Let's say I have another pointer (B) to the device with (of course) a separate
reference.

Now, when I call faux_device_destroy(A), and given that I know for sure that the
reference of (B) does out-live this operation, I could also argue that I
downgraded my strong reference to a weak reference.

So, technically I could still touch the pointer, but formally it probably
wouldn't be valid anymore.
