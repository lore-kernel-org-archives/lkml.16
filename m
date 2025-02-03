Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DFA202C45;
	Mon,  3 Feb 2025 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581927; cv=none; b=FhDeB/xJyWTECcWvfHHYr+jAwFESLwCC0G5yM648rmS6Yz0tXAA/dKL+RLlNtsZqXJvbxyYAdTMJ+bWG2wvpHZNSm4tzPGqgm+dv3PHOJ6uf/0FSjgPKexVkvr8PXjGLCZyAFFhdUqK8DvRTZw5MoYHAQB4fcF2+V92UoMyNSt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581927; c=relaxed/simple;
	bh=LsfrKUh7BXLFmxeKufgVvH3ZbVAAborWlV49vZoeSkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5K4t/2+WT2t0yz3ZhCB2pkxoGTMPMlnzDD7n2hG3L6+hWW6/j4F9qMd395tOHdsFJfIfGuMd/FzxJ6xU82qd8fYhCTgEow11IW15on7kfghfrZNKltPjxjnx+nbxJayMRwFxQFm0b9/tEgcOxUf8njHUnRnN1CqHjyGJg7nNYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eN+ySemo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eN+ySemo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF83C4CED2;
	Mon,  3 Feb 2025 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738581926;
	bh=LsfrKUh7BXLFmxeKufgVvH3ZbVAAborWlV49vZoeSkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eN+ySemolKJmwB90cIQZSg6gV/Iroz1GruBNXV94nVxxNL3dIvg77FwKDTgCKMxS5
	 cebqzG+troWjRvZmhu8/IdbBwC+FxSvrfS9HTWvk0OMYDXR1Ej2UwsmrN7amOhWZnG
	 VUcq+T6qOLW7uiy1ubMQuYCzLW3CtwkHjyxRDQGw=
Date: Mon, 3 Feb 2025 12:25:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <2025020307-cavalier-knapsack-7f89@gregkh>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Ch8O-0oY70Jhi6@pollux>

On Mon, Feb 03, 2025 at 12:01:04PM +0100, Danilo Krummrich wrote:
> On Mon, Feb 03, 2025 at 10:39:58AM +0100, Greg Kroah-Hartman wrote:
> > From 4c7aa0f9f0f7d25c962b70a11bad48d418b9490a Mon Sep 17 00:00:00 2001
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Date: Fri, 31 Jan 2025 15:01:32 +0100
> > Subject: [PATCH] driver core: add a virtual bus for use when a simple
> >  device/bus is needed
> > 
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "virtual" bus that
> > can be used instead.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I think it turned out pretty nice combining the driver and device creation for
> convenience.
> 
> But I think we may still need the option to create multiple devices for the same
> driver, as mentioned by Sima.

That will work just fine, the api will allow that, just give each device
a unique name and you are good to go.

> @Sima: I wonder if the number of devices could just be an argument?

Then the virtual bus logic will have to create some sort of number/name
system and I don't want to do that.  It's a "first caller gets the name"
type thing here.  You can easily in a driver do this:

	my_dev_1 = virtual_device_create(&my_virt_ops, "my_dev_1");
	my_dev_2 = virtual_device_create(&my_virt_ops, "my_dev_2");
	my_dev_3 = virtual_device_create(&my_virt_ops, "my_dev_3");
	...

You share the same callbacks, and that's all you really care about.  If
you want to hang sysfs files off of these things, I can make them take a
device_groups pointer as well, but let's keep it simple first.

> > +/*
> > + * Internal rapper structure so we can hold the memory
> 
> I guess having an internal "rapper" does make the interface even cooler! :-)

Hah, I totally missed that.  Language is fun...

> > +static void virtual_device_release(struct device *dev)
> > +{
> > +	struct virtual_object *virt_obj = to_virtual_object(dev);
> > +	struct device_driver *drv = &virt_obj->driver;
> > +
> > +	/*
> > +	 * Now that the device is going away, it has been unbound from the
> > +	 * driver we created for it, so it is safe to unregister the driver from
> > +	 * the system.
> > +	 */
> > +	driver_unregister(drv);
> 
> This is probably becoming non-trivial if we allow multiple devices to be created
> for the driver.

Nope, see above, the driver is created dynamically per device created,
but that has NOTHING to do with the caller of this api, this is all
internal housekeeping.

You will note that the caller knows nothing about a driver or anything
like that, all it does is provide some callbacks.

> > +/**
> > + * __virtual_device_create - create and register a virtual device and driver
> > + * @virt_ops: struct virtual_driver_ops that the new device will call back into
> > + * @name: name of the device and driver we are adding
> > + * @owner: module owner of the device/driver
> > + *
> > + * Create a new virtual device and driver, both with the same name, and register
> > + * them in the driver core properly.  The probe() callback of @virt_ops will be
> > + * called with the new device that is created for the caller to do something
> > + * with.
> > + */
> > +struct virtual_device *__virtual_device_create(struct virtual_driver_ops *virt_ops,
> > +					       const char *name, struct module *owner)
> > +{
> > +	struct device_driver *drv;
> > +	struct device *dev;
> > +	struct virtual_object *virt_obj;
> > +	struct virtual_device *virt_dev;
> > +	int ret;
> > +
> > +	pr_info("%s: %s\n", __func__, name);
> > +
> > +	virt_obj = kzalloc(sizeof(*virt_obj) + strlen(name) + 1, GFP_KERNEL);
> > +	if (!virt_obj)
> > +		return NULL;
> > +
> > +	/* Save off the name of the object into local memory */
> > +	strcpy(virt_obj->name, name);
> > +
> > +	/* Initialize the driver portion and register it with the driver core */
> > +	virt_obj->virt_ops = virt_ops;
> 
> I wonder if it would make sense to allow NULL for virt_ops and use default ops
> in this case.

What would be a "default"?  If you don't care/want to do anything with
probe/remove, then yes, we can allow it to be set to NULL.

Actually looking at some of the places this can be replaced with, that
does make sense, I'll go make that change.

> This could be useful for the Rust side of things, since then we could probably
> avoid having a virtual bus abstraction and instead would only need an
> abstraction of __virtual_device_create() itself.

Ok.

> However, this is probalby only convenient for when we have a single device /
> driver, but not multiple devices for a single driver.

Again, see above, and stop worrying about the traditional "driver" model
here, I took that away from you :)

> The more I think about it, the less I think it's a good idea, since it'd
> probably trick people into coming up with questionable constructs...

No, I think it will work, let me do some replacements later today after
I get some other work done, I think it does make sense, don't doubt
yourself :)

thanks,

greg k-h
