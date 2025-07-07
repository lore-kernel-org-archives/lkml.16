Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCA28A400;
	Mon,  7 Jul 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875221; cv=none; b=qvh1Yu9W8w/CA2ZYPRtMiUVBhOV0Zbim4FCoVpYxdOy2op2YjZM/smY3zT9naDSErVue8oJfzGrjp4Xp/0Edv0ZbJbYEvJiW0kPUus0IBINNwVQW5eeXjEP8X3WDbuhZGzxXW0cq/E+AIgBDULFyg2lbU4oyNGW8ZRpFHTm+2PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875221; c=relaxed/simple;
	bh=xEO1y9EPdTgRa5Npp1iaF7AikBTNGgoSSotsfdond1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qnez4OOREQVTXKHC31Vz7DVjt2Ycm97O6UFtFUQg6va0AmDl44Bwy608L8Ef+ZG+sQIjht/cBCTFZC26etwdu6rJQhdW6vEPo7ES6nO/DgrYy7Q2Pioai3SL1ddWUPA9StqyNmCs8ctvNI4ns47qZjyTdohb6vz8pSEIMG7RtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ztDuQq2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ztDuQq2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC02C4CEE3;
	Mon,  7 Jul 2025 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751875221;
	bh=xEO1y9EPdTgRa5Npp1iaF7AikBTNGgoSSotsfdond1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ztDuQq2XEFNoHhvXqDIKk31q2xDwii8QqeelNHy7lgW0KH+hx60ESdDa4fklofHDL
	 gpk1UTe48U5zOFTFCJ7Y9JutTqvnD4V2DjrPmq9Kow5GzeLQ5kLwOHuGaEgqqFyqh2
	 eK0VwDHuua/aTPPPa+AeUPXXrVfaTvKQmOlJ/eh8=
Date: Mon, 7 Jul 2025 10:00:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Barcella <daniele.barcella@pm.me>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: modalias: Added a manufacturer string to usb
 modalias sysfs output
Message-ID: <2025070720-sediment-donor-fea1@gregkh>
References: <20250706142720.8596-1-daniele.barcella@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706142720.8596-1-daniele.barcella@pm.me>

On Sun, Jul 06, 2025 at 02:27:26PM +0000, Daniele Barcella wrote:
> The patch improves the usb modalias sysfs output by including the manufacturer string ath the end in the format 'mnf%s' after filtering the string, like how it is done for the dmi id device.
> 
> For example usb:v0483p5740d0100dcEFdsc02dp01ic02isc02ip00in00mnfFlipperDevicesInc.
> 
> This change allows hwdb rules to target devices with the same vid+pid but different manufacturer.
> For example, the STMicroelectronics Virtual COM Port (0483:5740) is widely used in both prototyping and production devices that don't have a unique vendor ID.

Nit, please use 72 columns for your changelog.

> 
> For further context, refer to the related discussion on systemd's GitHub: https://github.com/systemd/systemd/pull/24869.

As random links can disappear at any time, and the text in a kernel
changelog will endure for forever, please put all relevant information
in the changelog itself, don't require people to go look elesewhere and
hope it is still relevant.

> 
> Signed-off-by: Daniele Barcella <daniele.barcella@pm.me>
> ---
>  drivers/usb/core/sysfs.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index 23f3cb1989f4..dc191fa94372 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -1154,20 +1154,39 @@ static ssize_t interface_show(struct device *dev, struct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(interface);
>  
> +static void ascii_filter(char *d, const char *s)
> +{
> +	/* Filter out characters we don't want to see in the modalias string */
> +	for (; *s; s++)
> +		if (*s > ' ' && *s < 127 && *s != ':')
> +			*(d++) = *s;
> +
> +	*d = 0;
> +}

We don't have a common kernel function for this?


> +
>  static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	struct usb_interface *intf;
>  	struct usb_device *udev;
>  	struct usb_host_interface *alt;
> +	char *manufacturer;
> +	int emit;
>  
>  	intf = to_usb_interface(dev);
>  	udev = interface_to_usbdev(intf);
>  	alt = READ_ONCE(intf->cur_altsetting);
>  
> -	return sysfs_emit(buf,
> +	if (udev->manufacturer) {
> +		manufacturer = kmalloc(strlen(udev->manufacturer) + 1, GFP_KERNEL);
> +		ascii_filter(manufacturer, udev->manufacturer);
> +	} else {
> +		manufacturer = kstrdup("", GFP_KERNEL);
> +	}
> +
> +	emit = sysfs_emit(buf,
>  			"usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02X"
> -			"ic%02Xisc%02Xip%02Xin%02X\n",
> +			"ic%02Xisc%02Xip%02Xin%02Xmnf%s\n",
>  			le16_to_cpu(udev->descriptor.idVendor),
>  			le16_to_cpu(udev->descriptor.idProduct),
>  			le16_to_cpu(udev->descriptor.bcdDevice),
> @@ -1177,7 +1196,11 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
>  			alt->desc.bInterfaceClass,
>  			alt->desc.bInterfaceSubClass,
>  			alt->desc.bInterfaceProtocol,
> -			alt->desc.bInterfaceNumber);
> +			alt->desc.bInterfaceNumber,
> +			manufacturer
> +		);
> +	kfree(manufacturer);
> +	return emit;

I really do not like this change, sorry.  Vendors are supposed to go and
get their own product id if they are a vendor-specific device, they
should NOT be attempting to trigger off of USB device strings as those
are not guaranteed to relate to anything at all.

This adds a new user/kernel api, just to work around a userspace tool
that can be easily modified to handle this one specific broken device
that is lying about its vendor/product id.  Please go fix this in
userspace with a simple script that udev can run to determine what the
device string contains, and don't require the kernel to do this work
instead.

thanks,

greg k-h
