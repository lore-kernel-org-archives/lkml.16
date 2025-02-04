Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D6B13C9D4;
	Tue,  4 Feb 2025 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666188; cv=none; b=YiAyNdt1mpJBW5DN4cFy0XGr32g72gkrg8hgykUfl85lYpBI/65zSjfdJLmYTmGiTO2gQxLm5TSAB/lkbeqlsNHnABR33wRYJpqJKJ/MocpMn6q9/2JIjI3Uu2c6BiL4C8nWwmlIlI1NOeO8qxZJjybeGI6Iz+AEqWr1PJZfGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666188; c=relaxed/simple;
	bh=YSl+bmkUT0Smh4SCqXFTl3TPxSPeoAxpyD4kjjGxStc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvlFoBXC8db120GHWWrNb3LHo9BS3pvDbwPpy6IdwDcGYrMFRpiCMh96V8quYyjKC4NVU79gwECs5AE7DisV7uEyBTlDWO2j5ChQeRepfWvBRFOTVTCTkI0b56QyXPwc8nlRF9zyKn0G6BsWwC1wsuBRpybaUaiDLMovfS+z5Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2gC4J0Zt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2gC4J0Zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9552C4CEDF;
	Tue,  4 Feb 2025 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738666187;
	bh=YSl+bmkUT0Smh4SCqXFTl3TPxSPeoAxpyD4kjjGxStc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2gC4J0ZtAl60o2R4R1EBsS1zamLJb9fyNaligXSQzF/Ck5QqY0lmsz3xFwzWvBCIG
	 kQ0p8N6bEjp0U1xdhEJHjcXH5FyBew8LRTP2hzKpK5D03O2C9taYcFOYPA0b+H6gnk
	 mJhelK1KsZ+tV1u5mnE+8HGDrU+aorxC8lvryc7A=
Date: Tue, 4 Feb 2025 11:49:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020405-granddad-husband-65ee@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <127f992b-1c53-49e1-8939-65b1d086fac5@t-8ch.de>
 <2025020430-polyester-unwind-5f9e@gregkh>
 <21fb6681-c214-4841-9cc6-45da3f965066@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21fb6681-c214-4841-9cc6-45da3f965066@t-8ch.de>

On Tue, Feb 04, 2025 at 11:44:41AM +0100, Thomas Weißschuh wrote:
> On 2025-02-04 11:20:43+0100, Greg Kroah-Hartman wrote:
> > On Tue, Feb 04, 2025 at 11:08:11AM +0100, Thomas Weißschuh wrote:
> > > On 2025-02-03 15:25:17+0100, Greg Kroah-Hartman wrote:
> > > > +static void faux_remove(struct device *dev)
> > > > +{
> > > > +	struct faux_object *faux_obj = to_faux_object(dev);
> > > > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> > > > +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> > > > +
> > > > +	if (faux_ops && faux_ops->remove)
> > > > +		faux_ops->remove(faux_dev);
> > > > +}
> > > > +
> > > > +static const struct bus_type faux_bus_type = {
> > > > +	.name		= "faux_bus",
> > > 
> > > Is the _bus suffix intentional?
> > 
> > It was intentional.
> > 
> > > Other busses don't have it.
> > 
> > True.  Naming is hard.  I guess /sys/bus/faux/ makes sense, I will go
> > rename it.
> > 
> > But for the "root" device, does /sys/devices/faux_bus/ make sense, or
> > should it be /sys/devices/faux/ as well?  I'm now leaning toward the
> > latter...
> 
> I'm leaning slightly towards the former.
> But my naming skills are beyond limited.
> 
> > > > +	.match		= faux_match,
> > > > +	.probe		= faux_probe,
> > > > +	.remove		= faux_remove,
> > > > +};
> > > > +
> > > > +static void faux_device_release(struct device *dev)
> > > > +{
> > > > +	struct faux_object *faux_obj = to_faux_object(dev);
> > > > +	struct device_driver *drv = &faux_obj->driver;
> > > > +
> > > > +	/*
> > > > +	 * Now that the device is going away, it has been unbound from the
> > > > +	 * driver we created for it, so it is safe to unregister the driver from
> > > > +	 * the system.
> > > > +	 */
> > > > +	driver_unregister(drv);
> > > > +
> > > > +	kfree(faux_obj);
> > > > +}
> > > > +
> > > > +/**
> > > > + * __faux_device_create - create and register a faux device and driver
> > > > + * @name: name of the device and driver we are adding
> > > > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > > > + * @owner: module owner of the device/driver
> > > > + *
> > > > + * Create a new faux device and driver, both with the same name, and register
> > > > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > > > + * called with the new device that is created for the caller to do something
> > > > + * with.
> > > > + */
> > > > +struct faux_device *__faux_device_create(const char *name,
> > > > +					       struct faux_driver_ops *faux_ops,
> > > 
> > > const
> > > 
> > > > +					       struct module *owner)
> > > 
> > > What about attributes?
> > 
> > What in-kernel user of this wants an attribute for such a device?
> 
> It was mostly a guess.
> However drivers/video/fbdev/gbefb.c seems to be an example.

As that driver is allocateing io memory and the like, it really looks
like a "real" platform driver/device to me.  Do you think it should not
be one?

Also, that driver should be converted to use an attribute group instead
of manually adding those sysfs files, if you wanted to touch it in the
future :)

thanks,

greg k-h
