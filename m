Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F114207669;
	Tue,  4 Feb 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669963; cv=none; b=AdCEr5/uh2ZuDeRmscR3c3NvwzuuQ1i7qgVn7Gm/LPW3OxL6xLczHl5v4Sdq+X736u6xIhoiWw3a91Rapgm7etCsYfVYSwGA2kZ6/PPdfW7K2SlzsVXXxbVyUklkmPnVVSYY26cVJwdbp9Nz47353K8Gp4/Bw/0aPegRkcX5Yw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669963; c=relaxed/simple;
	bh=JWhj4wCRd0IuStyLtYDYHq7/gtP9rspFCDxGzuE8DpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M06TDBeR2ZOUDIQ35Ubxh4phDlB7+8AZE50aL9vlnX3IZFW3QVVF9ztKKFqTvrYxVOZxSMOiO06kkfh6bkqQxDZdhg4+qSS/S1PIgC4gzp5lQSZG+tYaIadydtnvPKEPfckAcHE4SaUlhdaLtjwuvDIttwN3vhoa/1sH8K2L3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MphVSKi0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MphVSKi0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188BDC4CEE2;
	Tue,  4 Feb 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738669962;
	bh=JWhj4wCRd0IuStyLtYDYHq7/gtP9rspFCDxGzuE8DpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MphVSKi0/NLnJsdcVZmKOSWvIpsXKpmKsGSlzcYeqAXyZmoKMdqJjANPo37SXDVrx
	 xIYF6L87U6KKQEtwUH+k4mIdEpAp4CbZISVCFpRSaw8X8Hqh4j+q0TQnGQX0QCH7Tz
	 UYEokyvZS4bPwetQPNWD/yZniDW5Kkzga0P5iblY=
Date: Tue, 4 Feb 2025 12:52:34 +0100
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
Message-ID: <2025020435-earwig-zesty-87ea@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
 <Z6H9g_bvvMf5pPyc@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6H9g_bvvMf5pPyc@cassiopeiae>

On Tue, Feb 04, 2025 at 12:44:03PM +0100, Danilo Krummrich wrote:
> On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> > Many drivers abuse the platform driver/bus system as it provides a
> > simple way to create and bind a device to a driver-specific set of
> > probe/release functions.  Instead of doing that, and wasting all of the
> > memory associated with a platform device, here is a "faux" bus that
> > can be used instead.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  v2: - renamed bus and root device to just "faux" thanks to Thomas
> >      - removed the one-driver-per-device and now just have one driver
> >        entirely thanks to Danilo
> >      - kerneldoc fixups and additions and string handling bounds checks
> >        hanks to Andy
> >      - coding style fix thanks to Jonathan
> >      - tested that the destroy path actually works
> > 
> >  drivers/base/Makefile       |   2 +-
> >  drivers/base/base.h         |   1 +
> >  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
> >  drivers/base/init.c         |   1 +
> >  include/linux/device/faux.h |  31 ++++++
> >  5 files changed, 230 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/base/faux.c
> >  create mode 100644 include/linux/device/faux.h
> 
> I really like it, it's as simply as it can be.
> 
> Please find one nit below, otherwise
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> 
> > 
> > +/**
> > + * faux_device_destroy - destroy a faux device
> > + * @faux_dev: faux device to destroy
> > + *
> > + * Unregister and free all memory associated with a faux device that was
> > + * previously created with a call to faux_device_create().
> 
> Can we really claim that this frees all memory? Someone can still have a
> reference to the underlying struct device, right?

That "someone" is the person that had the original device pointer passed
to it, so if that person then calls faux_device_destroy(), yes, that
should all be properly cleaned up.

But even if it isn't, the device is destroyed and gone from sysfs, and
whenever that final final put_device() is called, the memory will then
be freed by the driver core itself.

So all should be ok unless I'm missing something in some codepath here.

> > + */
> > +void faux_device_destroy(struct faux_device *faux_dev)
> > +{
> > +	struct device *dev = &faux_dev->dev;
> > +
> > +	if (IS_ERR_OR_NULL(faux_dev))
> > +		return;
> > +
> > +	device_del(dev);
> > +
> > +	/* The final put_device() will clean up the driver we created for this device. */
> > +	put_device(dev);
> 
> Same here, how do we know it's the final one? I also think the "clean up the
> driver we created for this device" part isn't true any longer.

Oops, missed that comment, will go fix that.

And same response as above, it should all be cleaned up as best as we
can by now, any other external references is up to them be dropped by
that owner.

thanks for the review,

greg k-h
