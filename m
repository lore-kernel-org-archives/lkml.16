Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5C20CCE1;
	Tue,  4 Feb 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673758; cv=none; b=OvVpfYiDQV+9M0oCW4V6ILLq8KbcL/1wH/x214EtHFIceo+9VV512n70+d5qZKIfesSRz7SXcgj7uaWpPEDZVoJq9LSkWQOCrf+U05WB3wnMIEzIibkYov+Pf3nuFReIEREkEJg7K9GQrD8RCjs3TQTIYJsEBnflV3Xuaj5kJOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673758; c=relaxed/simple;
	bh=79+RV3wfyZJvCYZPLtCDhJ7ch5O4tDc5RyLCB6Sl5uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdSIUTyHZLUcNL8giEhHVT7C2QGvZGgGDny7BgrECWoAeXAOpXNifEnuO5FOstS+aGkXNMmE8G7R71tKbK++u3ujCs/YvtIXpyfXowpbo5jZrgimJ86jC4ZBeZ/pfAf4vBMnij0KwGtEnGVvzhX9cZhq4A9IJdLIh/brKgr10NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=no85a8d3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="no85a8d3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAEBC4CEDF;
	Tue,  4 Feb 2025 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738673757;
	bh=79+RV3wfyZJvCYZPLtCDhJ7ch5O4tDc5RyLCB6Sl5uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=no85a8d3ZgHd1rJTADs/tMTTpMjKlhzUTcqCMjSjx0Uj4KnYiSCvt9UkEVAsO6qt1
	 ope9AG6O0xeLeYU7BaLeMtnpC9BUaoCq3vqeHUZcknNjhJ6aquoP0YaaDfq/WEnSBd
	 oWa50VnC6LRQapalaMR9qEpPwjoDj9iNEUW+Smfs=
Date: Tue, 4 Feb 2025 13:55:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Message-ID: <2025020458-overpass-pebbly-f4b9@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <Z6H9g_bvvMf5pPyc@cassiopeiae>
 <2025020435-earwig-zesty-87ea@gregkh>
 <Z6ICPc3A5Cy1dgw_@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ICPc3A5Cy1dgw_@cassiopeiae>

On Tue, Feb 04, 2025 at 01:04:13PM +0100, Danilo Krummrich wrote:
> On Tue, Feb 04, 2025 at 12:52:34PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Feb 04, 2025 at 12:44:03PM +0100, Danilo Krummrich wrote:
> > > On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > > > Many drivers abuse the platform driver/bus system as it provides a
> > > > simple way to create and bind a device to a driver-specific set of
> > > > probe/release functions.  Instead of doing that, and wasting all of the
> > > > memory associated with a platform device, here is a "faux" bus that
> > > > can be used instead.
> > > > 
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > >  v2: - renamed bus and root device to just "faux" thanks to Thomas
> > > >      - removed the one-driver-per-device and now just have one driver
> > > >        entirely thanks to Danilo
> > > >      - kerneldoc fixups and additions and string handling bounds checks
> > > >        hanks to Andy
> > > >      - coding style fix thanks to Jonathan
> > > >      - tested that the destroy path actually works
> > > > 
> > > >  drivers/base/Makefile       |   2 +-
> > > >  drivers/base/base.h         |   1 +
> > > >  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
> > > >  drivers/base/init.c         |   1 +
> > > >  include/linux/device/faux.h |  31 ++++++
> > > >  5 files changed, 230 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/base/faux.c
> > > >  create mode 100644 include/linux/device/faux.h
> > > 
> > > I really like it, it's as simply as it can be.
> > > 
> > > Please find one nit below, otherwise
> > > 
> > > Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> > > 
> > > > 
> > > > +/**
> > > > + * faux_device_destroy - destroy a faux device
> > > > + * @faux_dev: faux device to destroy
> > > > + *
> > > > + * Unregister and free all memory associated with a faux device that was
> > > > + * previously created with a call to faux_device_create().
> > > 
> > > Can we really claim that this frees all memory? Someone can still have a
> > > reference to the underlying struct device, right?
> > 
> > That "someone" is the person that had the original device pointer passed
> > to it, so if that person then calls faux_device_destroy(), yes, that
> > should all be properly cleaned up.
> > 
> > But even if it isn't, the device is destroyed and gone from sysfs, and
> > whenever that final final put_device() is called, the memory will then
> > be freed by the driver core itself.
> 
> Oh indeed, the code here is perfectly fine. I just wanted to say that calling
> faux_device_destroy() is not a guarantee that "all memory associated with a
> faux device" is actually freed, as the kernel-doc comment above says (or at
> least implies).
> 
> So, the concern only was that the comment could be confusing, as in "How can
> faux_device_destroy() free the memory, if I still have a separate reference to
> this thing?" (which it clearly would not).

Documentation is hard :)

Can you think of some wording here that would explain this better?
Something like "after you call this, you can't touch the pointer you
passed into here" is what I'm going for.

I guess the documentation for device_destroy() would work here as well,
which says:

	 * This call unregisters and cleans up a device that was created with a
	 * call to device_create().

Would that be better?

thanks,

greg k-h
