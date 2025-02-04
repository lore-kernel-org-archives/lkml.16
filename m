Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C95CDF1;
	Tue,  4 Feb 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665886; cv=none; b=N2imcNEDu2rXrub0Wc13an7XROuyd42gLLTsKH/ejwN8I6rPD5uC9nibg0+ZOLpUwou5bLtdfqMG1xzmw7gpvnPtq0mMiLzuK2+P3OX6Htt/+r3NntGwcZ207UN8F8fR3WdNzrWv0uIIBp1ChzzYjByuOn7lENDuqQSCSBJT7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665886; c=relaxed/simple;
	bh=0i+/QpodIh9z8Ty+0nLpk/UyqlVHoGX8Wr8NdBoMgjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMfQonteWyppzGA/XlLB//Gw2wXs5gMKU1UjdcUcoOuUQln0FbmzWFNSt6GVsDlNxbfO6Q/06VYTaC8zxDrt03t0S7Hr0PKvVIVD0VOPeB6sWQcBAgNY9ETWjTmsBiytbdszxSzvvlD/KAb5DD6wg1rWl3mJqBSFAkE32X7TqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=S5xUWRQX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="S5xUWRQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738665881;
	bh=0i+/QpodIh9z8Ty+0nLpk/UyqlVHoGX8Wr8NdBoMgjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5xUWRQXN71lENpIrHVtnAvrNCS4VqMu5RWX9xffByEjCxIoI7SHHHb9ayZYwcQPL
	 bVBt1+DINDqOhR1miaQs9sWEMGI6OJ6eqJA5BIWz6Fv8tgudBBYDYL+LPtkjImZCay
	 sIA6/QDGC+e3quoDTIqMliqQf5/eszvcaW8NDPrA=
Date: Tue, 4 Feb 2025 11:44:41 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/3] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <21fb6681-c214-4841-9cc6-45da3f965066@t-8ch.de>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-backer-vendetta-7094@gregkh>
 <127f992b-1c53-49e1-8939-65b1d086fac5@t-8ch.de>
 <2025020430-polyester-unwind-5f9e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025020430-polyester-unwind-5f9e@gregkh>

On 2025-02-04 11:20:43+0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 04, 2025 at 11:08:11AM +0100, Thomas Weißschuh wrote:
> > On 2025-02-03 15:25:17+0100, Greg Kroah-Hartman wrote:
> > > +static void faux_remove(struct device *dev)
> > > +{
> > > +	struct faux_object *faux_obj = to_faux_object(dev);
> > > +	struct faux_device *faux_dev = &faux_obj->faux_dev;
> > > +	const struct faux_driver_ops *faux_ops = faux_obj->faux_ops;
> > > +
> > > +	if (faux_ops && faux_ops->remove)
> > > +		faux_ops->remove(faux_dev);
> > > +}
> > > +
> > > +static const struct bus_type faux_bus_type = {
> > > +	.name		= "faux_bus",
> > 
> > Is the _bus suffix intentional?
> 
> It was intentional.
> 
> > Other busses don't have it.
> 
> True.  Naming is hard.  I guess /sys/bus/faux/ makes sense, I will go
> rename it.
> 
> But for the "root" device, does /sys/devices/faux_bus/ make sense, or
> should it be /sys/devices/faux/ as well?  I'm now leaning toward the
> latter...

I'm leaning slightly towards the former.
But my naming skills are beyond limited.

> > > +	.match		= faux_match,
> > > +	.probe		= faux_probe,
> > > +	.remove		= faux_remove,
> > > +};
> > > +
> > > +static void faux_device_release(struct device *dev)
> > > +{
> > > +	struct faux_object *faux_obj = to_faux_object(dev);
> > > +	struct device_driver *drv = &faux_obj->driver;
> > > +
> > > +	/*
> > > +	 * Now that the device is going away, it has been unbound from the
> > > +	 * driver we created for it, so it is safe to unregister the driver from
> > > +	 * the system.
> > > +	 */
> > > +	driver_unregister(drv);
> > > +
> > > +	kfree(faux_obj);
> > > +}
> > > +
> > > +/**
> > > + * __faux_device_create - create and register a faux device and driver
> > > + * @name: name of the device and driver we are adding
> > > + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> > > + * @owner: module owner of the device/driver
> > > + *
> > > + * Create a new faux device and driver, both with the same name, and register
> > > + * them in the driver core properly.  The probe() callback of @faux_ops will be
> > > + * called with the new device that is created for the caller to do something
> > > + * with.
> > > + */
> > > +struct faux_device *__faux_device_create(const char *name,
> > > +					       struct faux_driver_ops *faux_ops,
> > 
> > const
> > 
> > > +					       struct module *owner)
> > 
> > What about attributes?
> 
> What in-kernel user of this wants an attribute for such a device?

It was mostly a guess.
However drivers/video/fbdev/gbefb.c seems to be an example.

> And again, if we find one, we can make a faux_device_create_groups()
> call that takes a pointer to an attribute group structure if it's really
> needed.

Fair enough.

> > > +{
> > > +	struct device_driver *drv;
> > > +	struct device *dev;
> > > +	struct faux_object *faux_obj;
> > > +	struct faux_device *faux_dev;
> > > +	int ret;
> > > +
> > > +	faux_obj = kzalloc(sizeof(*faux_obj) + strlen(name) + 1, GFP_KERNEL);
> > > +	if (!faux_obj)
> > > +		return NULL;
> > > +
> > > +	/* Save off the name of the object into local memory */
> > > +	strcpy(faux_obj->name, name);
> > > +
> > > +	/* Initialize the driver portion and register it with the driver core */
> > > +	faux_obj->faux_ops = faux_ops;
> > > +	drv = &faux_obj->driver;
> > > +
> > > +	drv->owner = owner;
> > > +	drv->name = faux_obj->name;
> > 
> > Assuming most names are constant, this would be better with kstrdup_const().
> > Which is also used by dev_set_name() under the hood.
> 
> I've now removed the additional driver, but note that this is just a
> pointer assignment, which is fine to do here as the lifespan of
> faux_obj->name outlived the driver structure's lifespan.

It outlives it because there is extra space allocated for it in faux_obj.
With kstrdup_const() that space would not be needed.
In the end it shouldn't really matter one way or another.


Thomas
