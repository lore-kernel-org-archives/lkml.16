Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCAB20C03F;
	Tue,  4 Feb 2025 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669451; cv=none; b=Ded9dibzENmXgEOaXUkKYfygQ1fnnxbnvUx7swrgtGv8tbtm3Ft5QmnacGdDh4N8fqPCGt2LwJ+htp4RbCL92t34Xgf0LNdXFTsCY2O/obX3YJZZ/KROVJ8FaKD4AdB3H9PwZuji2xJSqrxjcYp4q9HZB6Qd9umrS3J9cRB9WGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669451; c=relaxed/simple;
	bh=kTMWF/Xp+90I5H3IjG9C6Iq7d2NrlOUbq/42cU8DPVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPhLndcNuIW96FVmOULe+4FaUM+9IsrNMZcYKLporNWlTSXKRHsG7cOayekHCcamvH7fcYLU2DYMBSW3s4rNsobhFqp7Y4uTo0+swmicVMpc2X1Jm3EkcdCY7eHUBFRcgk14cilPvz9MA+uxJ/rnB+HZEoyIs+pj0zvCMi3TRkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfVRpfMa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfVRpfMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4DDC4CEE4;
	Tue,  4 Feb 2025 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738669449;
	bh=kTMWF/Xp+90I5H3IjG9C6Iq7d2NrlOUbq/42cU8DPVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfVRpfMaCoXYV0e69AnomkGq4QouPB+MK1wbs6KApP4Huh30F5AIvlDo+WHxlmUD2
	 2J616gMhxkgB04j1dFkD+iNYOafngAD2WSnw9B20IVEGNdahVGOF8l+Xt78QWjZN8v
	 KmST6gZvm8BJStEeZVVHxAlGgsm+9TJ+VQkx4Ce4wNNPkFyerfoe9qUj9T1FlaFYBK
	 5SUhoxUZE22qbco5grQFfAnGJMXyqIQn0dwbBCoiSvWFLJYHUSqHeOM0ECnEKNIhfX
	 V2yotMemyK3S+hpNFlMRHbSDPJMyBucg++pgTrz1iuCX3PpczlC1ahUOCxx9UJ8ni/
	 pzLUzLdCGGXSw==
Date: Tue, 4 Feb 2025 12:44:03 +0100
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
Message-ID: <Z6H9g_bvvMf5pPyc@cassiopeiae>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>

On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  v2: - renamed bus and root device to just "faux" thanks to Thomas
>      - removed the one-driver-per-device and now just have one driver
>        entirely thanks to Danilo
>      - kerneldoc fixups and additions and string handling bounds checks
>        hanks to Andy
>      - coding style fix thanks to Jonathan
>      - tested that the destroy path actually works
> 
>  drivers/base/Makefile       |   2 +-
>  drivers/base/base.h         |   1 +
>  drivers/base/faux.c         | 196 ++++++++++++++++++++++++++++++++++++
>  drivers/base/init.c         |   1 +
>  include/linux/device/faux.h |  31 ++++++
>  5 files changed, 230 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/base/faux.c
>  create mode 100644 include/linux/device/faux.h

I really like it, it's as simply as it can be.

Please find one nit below, otherwise

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> 
> +/**
> + * faux_device_destroy - destroy a faux device
> + * @faux_dev: faux device to destroy
> + *
> + * Unregister and free all memory associated with a faux device that was
> + * previously created with a call to faux_device_create().

Can we really claim that this frees all memory? Someone can still have a
reference to the underlying struct device, right?

> + */
> +void faux_device_destroy(struct faux_device *faux_dev)
> +{
> +	struct device *dev = &faux_dev->dev;
> +
> +	if (IS_ERR_OR_NULL(faux_dev))
> +		return;
> +
> +	device_del(dev);
> +
> +	/* The final put_device() will clean up the driver we created for this device. */
> +	put_device(dev);

Same here, how do we know it's the final one? I also think the "clean up the
driver we created for this device" part isn't true any longer.

> +}
> +EXPORT_SYMBOL_GPL(faux_device_destroy);
