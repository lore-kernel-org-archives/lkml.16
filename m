Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A27183CC3;
	Fri, 25 Apr 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579570; cv=none; b=jk6xDk5iSaFnm1WH6WlTyBEPSC1OElhJ13kk0m+Kx6y5u1WbwEmUn4+ZNgzsH/2tK7r58SfhmIsSAkpnFg57I8DMFaxf7NJQ1AB7cVv4hP0EwQ8GUN4p/aL52+nVcyOwj3I16utYpw0YkepGTnM2+ZBRTdHWnMYj30pm29K4f/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579570; c=relaxed/simple;
	bh=4Bfzl2YcVdfeGv48WnPC2v+UXms9ZjDFzemeC95vqgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiOV4oVDNmOLv0UxA/cuOIu3gIp4KfLbpuMGAoTknuHiyEGi8RmzyUdI8AXspdyw/7jgVcqOWiKKgMA4rbnknAhEFCKIy3F0I75tcKROzsVxU8np8/VSC9i3YvD8nX9Ucil9qo25fmzmpkQaH4eTPeZEkhMYVejs/GNaOK8/yk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A5OuAj0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A5OuAj0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DDDC4CEE4;
	Fri, 25 Apr 2025 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745579569;
	bh=4Bfzl2YcVdfeGv48WnPC2v+UXms9ZjDFzemeC95vqgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5OuAj0YK95bMuf3OiQxLhDFYP98jueKPArVv3mqQ5i7/lYNWO+a2OkBd9NsRypsC
	 PIdNUENCJzsuD3Z1o2/yGNI6A3+1R6EjTSJ+YWqPqH+iEZzjZlZB6pnaNPRdC6+V4e
	 KfJpbX62NwWSdcQ4Ne/BR3RlNfwMks0840lLj2io=
Date: Fri, 25 Apr 2025 13:12:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	sumit.garg@kernel.org, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/4] usb: add apis for offload usage tracking
Message-ID: <2025042540-implode-yelp-b8e5@gregkh>
References: <20250416144917.16822-1-guanyulin@google.com>
 <20250416144917.16822-3-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416144917.16822-3-guanyulin@google.com>

On Wed, Apr 16, 2025 at 02:43:02PM +0000, Guan-Yu Lin wrote:
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
>  drivers/usb/core/driver.c | 109 ++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.c    |   1 +
>  drivers/usb/host/Kconfig  |  11 ++++
>  include/linux/usb.h       |  17 ++++++
>  4 files changed, 138 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 460d4dde5994..76372690add0 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2036,6 +2036,115 @@ int usb_disable_usb2_hardware_lpm(struct usb_device *udev)
>  
>  #endif /* CONFIG_PM */
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
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
> + * The caller must hold @udev's device lock.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_get(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	if (udev->state == USB_STATE_NOTATTACHED ||
> +			udev->state == USB_STATE_SUSPENDED)
> +		return -EAGAIN;
> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = usb_autoresume_device(udev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	udev->offload_usage++;
> +	usb_autosuspend_device(udev);
> +
> +	return 0;
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
> + * The caller must hold @udev's device lock.
> + *
> + * Return: 0 on success. A negative error code otherwise.
> + */
> +int usb_offload_put(struct usb_device *udev)
> +{
> +	int ret;
> +
> +	if (udev->state == USB_STATE_NOTATTACHED ||
> +			udev->state == USB_STATE_SUSPENDED)
> +		return -EAGAIN;

What's to prevent the state of the device from changing right after you
check for this?

And why -EAGAIN, you don't mention that in the comment for the function.

Also, to pile on, sorry, the coding style needs to be fixed up here :)

> +
> +	/*
> +	 * offload_usage could only be modified when the device is active, since
> +	 * it will alter the suspend flow of the device.
> +	 */
> +	ret = usb_autoresume_device(udev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Drop the count when it wasn't 0, ignore the operation otherwise. */
> +	if (udev->offload_usage)
> +		udev->offload_usage--;
> +	usb_autosuspend_device(udev);
> +
> +	return 0;
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
> + * The caller must hold @udev's device lock.
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

No locking is needed for this loop at all?  What happens if a device is
added or removed while it is looping?

> +		device_lock(&child->dev);
> +		active = usb_offload_check(child);
> +		device_unlock(&child->dev);
> +		if (active)
> +			return true;
> +	}
> +
> +	return !!udev->offload_usage;

But the state can change right afterwards, so no one can do anything
with this value, right?  What is is used for?

thanks,

greg k-h
