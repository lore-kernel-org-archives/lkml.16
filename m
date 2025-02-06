Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1012D232360;
	Thu,  6 Feb 2025 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858792; cv=none; b=chtvOqKxpaA9afA5wwgao5mx2GKCrS3yJKk8f8ZxCcbbozbTUs0tocTNxO3/Hbk7UyOWAsmgi1J07AnPBgjncuahMGGE6UW3ihcjXvyosWWG0WvReeLm6QYrUaIvpe8ZrqTrK/WbKOBf7KMwBZDPItUgdIctmgkh0CC4oebephk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858792; c=relaxed/simple;
	bh=9Tuj/qQPgOS89JdE2AcvbLcqLOTT3lWxn6XNGzkVYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPhLiqIhBZQZITOyzmv1bRmWV2imsvXYGndCCNvZyMBPBMVbzWk4pg8IrLBUb4vau0yKSBbYShWS9jr58WktgTrs4JwnriuilT7AF2+7R1WQVahBycoW4ys0puJOA5d1EVxo3BPqi5OKzI5VOORjExdD1EIuqASHB2AtAoHVTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=blntiDpe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="blntiDpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C174FC4CEDF;
	Thu,  6 Feb 2025 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738858791;
	bh=9Tuj/qQPgOS89JdE2AcvbLcqLOTT3lWxn6XNGzkVYzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blntiDpeIdL6vHWdpk5SJRRlX/lQ8xNjPx3efQVHG9nVLdpLE6TOotXK4PNBa9DXS
	 uBIf0GxeEoGpZNORg/Qt+KmuEiA9NQA04p6V+dwXyl9qezu9c73ishRsH0wYVolVjm
	 hvnWkEVNQdWL4RuYxLUEfx403EoYwhFryHzTMXC4=
Date: Thu, 6 Feb 2025 17:19:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <2025020638-refresh-pager-cdc0@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <f575978b-7103-48b9-8125-a38fb6425f5c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f575978b-7103-48b9-8125-a38fb6425f5c@quicinc.com>

On Thu, Feb 06, 2025 at 11:34:27PM +0800, Zijun Hu wrote:
> On 2/4/2025 7:09 PM, Greg Kroah-Hartman wrote:
> > +#define MAX_NAME_SIZE	256	/* Max size of a faux_device name */
> > +
> > +/*
> > + * Internal wrapper structure so we can hold the memory
> > + * for the driver and the name string of the faux device.
> > + */
> > +struct faux_object {
> > +	struct faux_device faux_dev;
> > +	const struct faux_driver_ops *faux_ops;
> > +	char name[];
> 
> Remove name since it is not used actually ?

Hm, we do copy it:
	/* Save off the name of the object into local memory */
	memcpy(faux_obj->name, name, name_size);

Ah, but then we do a dev_set_name() so we don't care anymore!  When the
code was a two-step process we did care.  Nice catch, let me go change
that and test it to be sure.

> > +};+ */
> > +void faux_device_destroy(struct faux_device *faux_dev)
> > +{
> > +	struct device *dev = &faux_dev->dev;
> > +
> > +	if (IS_ERR_OR_NULL(faux_dev))
> > +		return;
> > +
> 
> struct device *dev;
> 
> //faux_device_create() does not return ERR_PTR().
> if (!faux_dev)
> 	return;
> 
> // avoid NULL pointer dereference in case of above error
> dev = &faux_dev->dev;

Nope, that wouldn't have been a dereference error, you can set a pointer
to point to NULL just fine as long as you don't try to dereference it to
something else.  Isn't C fun!  :)

> > +	device_del(dev);
> > +
> > +	/* The final put_device() will clean up the driver we created for this device. */
> > +	put_device(dev);
> 
> use device_unregister() instead of above 2 statements?

Could be, both are the same.

> > +}
> > +EXPORT_SYMBOL_GPL(faux_device_destroy);
> > +
> > +int __init faux_bus_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = device_register(&faux_bus_root);
> > +	if (ret) {
> > +		put_device(&faux_bus_root);
> 
> put_device() for static device may trigger below warning:
> 
> drivers/base/core.c:device_release():
> WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is
> broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
> 			dev_name(dev));

Yes, but that will never trigger when you run the code as the final put
device never happens.  So you will not ever see that.

And yes, I HATE static struct devices in the kernel a lot, but in the
driver core we use them for a few things like this, so either I fix all
of them, or just live with the few that we have.

thanks for the review!

greg k-h
