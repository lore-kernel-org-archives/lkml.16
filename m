Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00661ACEAC;
	Wed, 28 May 2025 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423814; cv=none; b=b3jAhYheWQgxpCdL56Xvs9bsNFVxqk8qa/86ywBedkwNXoaPncMlilxa2Z3ryA1tP/x+RrwFsCQwxanl/zOcwVRjx7EOFYxAlP5PCpeT6q3iizJEAH6SpGLnbFSNk/DvJSaNguJAtfpKKpeaXMqNtf9LpuegqAZb29neGsWASx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423814; c=relaxed/simple;
	bh=E1VZlDayTeelg1Va8WrCJ2LwubtDxVbGxcQBYhQLuH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqlDrOyTjl8+LcZrjCyDdtsVhGHsXntKPAqrkvGQtQS6h042VQT5HCNogz8e9Nx7bqKvjPFmidC/hehYUKxJyG6LbfNj8Mln/tihhF8Yw4gg3kRdMZOQuRCGpSGgi65GmyOW7X4Oq1zTB5DUw9hWNDGnyOsjyYNzClggnI/VQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AVq7ARmD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AVq7ARmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88697C4CEED;
	Wed, 28 May 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748423813;
	bh=E1VZlDayTeelg1Va8WrCJ2LwubtDxVbGxcQBYhQLuH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVq7ARmDM8BqK4z0G9TBY50sVK2I71L2ScZQ/xaP23Yn+1bmLKuOJYL6MGR0QHqH8
	 YCoYun0bPvXSHEx3pVw2BifFv4XIv3JULTGhQm87rocfMtUlVx0m/vHge8NBkxhseF
	 OkkqIpOsAaToHIisnXY3FlTV1mNfd9G4ZVvXK0tc=
Date: Wed, 28 May 2025 11:14:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	krzysztof.kozlowski@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/4] usb: add apis for offload usage tracking
Message-ID: <2025052808-shown-sitting-1ff9@gregkh>
References: <20250528090849.2095085-1-guanyulin@google.com>
 <20250528090849.2095085-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528090849.2095085-3-guanyulin@google.com>

On Wed, May 28, 2025 at 09:04:07AM +0000, Guan-Yu Lin wrote:
> Introduce offload_usage and corresponding apis to track offload usage
> on each USB device. Offload denotes that there is another co-processor
> accessing the USB device via the same USB host controller. To optimize
> power usage, it's essential to monitor whether the USB device is
> actively used by other co-processor. This information is vital when
> determining if a USB device can be safely suspended during system power
> state transitions.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/core/driver.c | 125 ++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.c    |   1 +
>  drivers/usb/host/Kconfig  |  11 ++++
>  include/linux/usb.h       |  18 ++++++
>  4 files changed, 155 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 460d4dde5994..0690619454fe 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2036,6 +2036,131 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
>  
>  #endif /* CONFIG_PM */
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)

ifdef in .c files are messy and hard to maintain.

Also, why is an xhci-specific option enabling/disabling core USB
functions like this?  Shouldn't it be a generic USB config option name
instead?

> +
> +/**
> + * usb_offload_get - increment the offload_usage of a USB device
> + * @udev: the USB device to increment its offload_usage
> + *
> + * Incrementing the offload_usage of a usb_device indicates that offload is
> + * enabled on this usb_device; that is, another entity is actively handling USB
> + * transfers. This information allows the USB driver to adjust its power
> + * management policy based on offload activity.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_get(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	usb_lock_device(udev);
> +	if (udev->state == USB_STATE_NOTATTACHED) {
> +		ret = -ENODEV;
> +		goto unlock_device;

Shouldn't we using the guard logic here instead?  That would make all of
this look much simpler and easier to maintain over time.

> +	} else if (udev->state == USB_STATE_SUSPENDED ||
> +		   udev->offload_at_suspend) {
> +		ret = -EBUSY;
> +		goto unlock_device;
> +	}
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = usb_autoresume_device(udev);
> +
> +	if (ret < 0)

Why the blank line?

> +		goto unlock_device;
> +
> +	udev->offload_usage++;
> +	usb_autosuspend_device(udev);
> +
> +unlock_device:
> +	usb_unlock_device(udev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(usb_offload_get);
> +
> +/**
> + * usb_offload_put - drop the offload_usage of a USB device
> + * @udev: the USB device to drop its offload_usage
> + *
> + * The inverse operation of usb_offload_get, which drops the offload_usage of
> + * a USB device. This information allows the USB driver to adjust its power
> + * management policy based on offload activity.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_put(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	usb_lock_device(udev);
> +	if (udev->state == USB_STATE_NOTATTACHED) {
> +		ret = -ENODEV;
> +		goto unlock_device;
> +	} else if (udev->state == USB_STATE_SUSPENDED ||
> +		   udev->offload_at_suspend) {
> +		ret = -EBUSY;
> +		goto unlock_device;
> +	}
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = usb_autoresume_device(udev);
> +
> +	if (ret < 0)
> +		goto unlock_device;
> +
> +	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
> +	if (udev->offload_usage)
> +		udev->offload_usage--;
> +	usb_autosuspend_device(udev);
> +
> +unlock_device:
> +	usb_unlock_device(udev);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(usb_offload_put);
> +
> +/**
> + * usb_offload_check - check offload activities on a USB device
> + * @udev: the USB device to check its offload activity.
> + *
> + * Check if there are any offload activity on the USB device right now. This
> + * information could be used for power management or other forms of resource
> + * management.
> + *
> + * The caller must hold @udev's device lock. In addition, the caller should
> + * ensure downstream usb devices are all either suspended or marked as
> + * "offload_at_suspend" to ensure the correctness of the return value.
> + *
> + * Returns true on any offload activity, false otherwise.
> + */
> +bool usb_offload_check(struct usb_device *udev)
> +{
> +	struct usb_device *child;
> +	bool active;
> +	int port1;
> +
> +	usb_hub_for_each_child(udev, port1, child) {
> +		usb_lock_device(child);
> +		active = usb_offload_check(child);
> +		usb_unlock_device(child);
> +		if (active)
> +			return true;
> +	}
> +
> +	return !!udev->offload_usage;

I think you forgot to mark this function as requiring that the lock be
held, right?  Just documenting it isn't going to be simple to notice or
maintain over time...

thanks,

greg k-h
