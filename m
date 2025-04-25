Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF92F2459EA;
	Fri, 25 Apr 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579674; cv=none; b=ThLZQuzs42op7gdIVpoClHML0HsfWAGn/cTcJ0FkZhrbC/UFQIzEnMFIVvqV8nNL2Gpszw71q244inN2UZTQ5qE/HeCRp/lh+raOg1cfWCZNftxYBW6o3FlXV9VWo7dbB3Lnrrd8TZWFbBA4uYHwkFJSkIvUhyGYmWuoMreZyvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579674; c=relaxed/simple;
	bh=ueyE2dnUfPc5g/7JcffjHYg+yQgtoC1HgH+tI+asSzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHA1MVsAyRGwKf6fZ0ms/2fOztTHt0J3fr5JgQ+2Bj/sZzocAPqeF5irk1sk82e7VQSrrBZAtOVwKmGpYV2bnULdeQxfCZUIjiMDbzVRT6Ara8mHzGOlt9SWPBIlnD6RPdPjCDglEOVa+hvlfpO2sEiJAUirIeIGiqDyFgv8df8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g/VJHrwa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g/VJHrwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D673BC4CEEB;
	Fri, 25 Apr 2025 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745579673;
	bh=ueyE2dnUfPc5g/7JcffjHYg+yQgtoC1HgH+tI+asSzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/VJHrwaUjJbCbVku5/G0MRRbcAAgbfu800B8k53wkZ1Mxl1tQRicZcXlYghaGdZt
	 UMGfr+9tT8HjeM80u9h0W+47Hw3SyJQD49Hpjq1ypl7Y4LQMATJ5fnUAuP60cQ+9dp
	 T4DzMeqq9sWHOR717jt8RAZEEpC76FMMXznGwexw=
Date: Fri, 25 Apr 2025 13:14:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	sumit.garg@kernel.org, gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com,
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk,
	broonie@kernel.org, quic_wcheng@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] xhci: sideband: add api to trace sideband usage
Message-ID: <2025042518-shoplift-garnish-3a69@gregkh>
References: <20250416144917.16822-1-guanyulin@google.com>
 <20250416144917.16822-4-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416144917.16822-4-guanyulin@google.com>

On Wed, Apr 16, 2025 at 02:43:03PM +0000, Guan-Yu Lin wrote:
> The existing sideband driver only registers sidebands without tracking
> their active usage. To address this, sideband will now record its active
> usage when it creates/removes interrupters. In addition, a new api is
> introduced to provide a means for other dirvers to fetch sideband
> activity information on a USB host controller.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/host/xhci-sideband.c  | 43 +++++++++++++++++++++++++++++++
>  include/linux/usb/xhci-sideband.h |  9 +++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
> index d49f9886dd84..67f31b0ec726 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -266,6 +266,31 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
>  }
>  EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
>  
> +#if IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND)
> +/**
> + * xhci_sideband_check - check the existence of active sidebands
> + * @hcd: the host controller driver associated with the target host controller
> + *
> + * Allow other drivers, such as usb controller driver, to check if there are
> + * any sideband activity on the host controller. This information could be used
> + * for power management or other forms of resource management.
> + *
> + * Returns true on any active sideband existence, false otherwise.
> + */
> +bool xhci_sideband_check(struct usb_hcd *hcd)
> +{
> +	struct usb_device *udev = hcd->self.root_hub;
> +	bool active;
> +
> +	device_lock(&udev->dev);
> +	active = usb_offload_check(udev);
> +	device_unlock(&udev->dev);
> +
> +	return active;

What happens if the value changes right after reading it?  What are you
going to do with the value?

> +}
> +EXPORT_SYMBOL_GPL(xhci_sideband_check);
> +#endif /* IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND_SUSPEND) */
> +
>  /**
>   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
>   * @sb: sideband instance for this usb device
> @@ -286,6 +311,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>  				 bool ip_autoclear, u32 imod_interval, int intr_num)
>  {
>  	int ret = 0;
> +	struct usb_device *udev;
>  
>  	if (!sb || !sb->xhci)
>  		return -ENODEV;
> @@ -304,6 +330,11 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
>  		goto out;
>  	}
>  
> +	udev = sb->vdev->udev;
> +	device_lock(&udev->dev);
> +	ret = usb_offload_get(udev);
> +	device_unlock(&udev->dev);

A "raw" call to device_lock/unlock feels rough, and harsh, why doesn't
the function do that itself?

thanks,

greg k-h
