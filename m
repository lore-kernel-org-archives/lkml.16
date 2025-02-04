Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B013C9D4;
	Tue,  4 Feb 2025 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664453; cv=none; b=qoKGLGtYQnlLbLAet1F4mAZZN58I58ixS3b7x5TTDfIkhPUncFbQgoGQTUsPesxkyCRtOv846r2lX/gUouz3oGxOz3e0SGJk9x3bAKIKN6j/jkC4xod7sgqQrMZE2Pl2XpUQ9FxJJynfVYR0fYRrMjCbse6SBXkd4yyrdEvPbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664453; c=relaxed/simple;
	bh=1yiPGmbegji3QalyzllDOR9ellvItD0yt1XHJ6KdoD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4rByyolknNE2g2ehTMUFDNUJF1wlQZRcFFwj+EcmktBHzMR4+uV/BPkHfYGxc+PdVStwnbUGVKoWOVOw7VWSipDYzB4skADO+jMeWR587M1zNj6eQr9V9Z9BRpieK5auK/VpkRjccHBxKzOdLhUwMOrhHnxu4hGW9EbZDFkYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y0qq21rn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y0qq21rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A3DC4CEDF;
	Tue,  4 Feb 2025 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738664452;
	bh=1yiPGmbegji3QalyzllDOR9ellvItD0yt1XHJ6KdoD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y0qq21rnquPUBBmOLU7ovddIAcDuVm4cbdvXWdCDO1BsPUarnc/uFXbizSgHf9VTP
	 audSa7nofutOqhlLDULdkCD7mfdBaZ/9rapVI9slVxqes0MPnZIgHQN9jWNBm4o8IC
	 qOYkV2+AlXR+LKp72m75DKI1/msClUaXdYeE3cvQ=
Date: Tue, 4 Feb 2025 11:20:43 +0100
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
Message-ID: <2025020430-polyester-unwind-5f9e@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <127f992b-1c53-49e1-8939-65b1d086fac5@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <127f992b-1c53-49e1-8939-65b1d086fac5@t-8ch.de>

On Tue, Feb 04, 2025 at 11:08:11AM +0100, Thomas Weißschuh wrote:
> On 2025-02-03 15:25:17+0100, Greg Kroah-Hartman wrote:
> > +static void faux_remove(struct device *dev)
> > +{
> > +	struct faux_object *faux_obj = to_faux_object(dev);
> > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> > +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> > +
> > +	if (faux_ops && faux_ops->remove)
> > +		faux_ops->remove(faux_dev);
> > +}
> > +
> > +static const struct bus_type faux_bus_type = {
> > +	.name		= "faux_bus",
> 
> Is the _bus suffix intentional?

It was intentional.

> Other busses don't have it.

True.  Naming is hard.  I guess /sys/bus/faux/ makes sense, I will go
rename it.

But for the "root" device, does /sys/devices/faux_bus/ make sense, or
should it be /sys/devices/faux/ as well?  I'm now leaning toward the
latter...

> > +	.match		= faux_match,
> > +	.probe		= faux_probe,
> > +	.remove		= faux_remove,
> > +};
> > +
> > +static void faux_device_release(struct device *dev)
> > +{
> > +	struct faux_object *faux_obj = to_faux_object(dev);
> > +	struct device_driver *drv = &faux_obj->driver;
> > +
> > +	/*
> > +	 * Now that the device is going away, it has been unbound from the
> > +	 * driver we created for it, so it is safe to unregister the driver from
> > +	 * the system.
> > +	 */
> > +	driver_unregister(drv);
> > +
> > +	kfree(faux_obj);
> > +}
> > +
> > +/**
> > + * __faux_device_create - create and register a faux device and driver
> > + * @name: name of the device and driver we are adding
> > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > + * @owner: module owner of the device/driver
> > + *
> > + * Create a new faux device and driver, both with the same name, and register
> > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > + * called with the new device that is created for the caller to do something
> > + * with.
> > + */
> > +struct faux_device *__faux_device_create(const char *name,
> > +					       struct faux_driver_ops *faux_ops,
> 
> const
> 
> > +					       struct module *owner)
> 
> What about attributes?

What in-kernel user of this wants an attribute for such a device?

And again, if we find one, we can make a faux_device_create_groups()
call that takes a pointer to an attribute group structure if it's really
needed.


> 
> > +{
> > +	struct device_driver *drv;
> > +	struct device *dev;
> > +	struct faux_object *faux_obj;
> > +	struct faux_device *faux_dev;
> > +	int ret;
> > +
> > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > +	if (!faux_obj)
> > +		return NULL;
> > +
> > +	/* Save off the name of the object into local memory */
> > +	strcpy(faux_obj->name, name);
> > +
> > +	/* Initialize the driver portion and register it with the driver core */
> > +	faux_obj->faux_ops = faux_ops;
> > +	drv = &faux_obj->driver;
> > +
> > +	drv->owner = owner;
> > +	drv->name = faux_obj->name;
> 
> Assuming most names are constant, this would be better with kstrdup_const().
> Which is also used by dev_set_name() under the hood.

I've now removed the additional driver, but note that this is just a
pointer assignment, which is fine to do here as the lifespan of
faux_obj->name outlived the driver structure's lifespan.

thanks for the review, much appreciated!

greg k-h
