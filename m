Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC320459B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517682; cv=none; b=HvljOJ/c0TR0R9O2i+Kz5acDC8jaJe0QqU+HkDoD03BCpgZePD5x8nzFGoZtfwSsFHGJj0pwSWg+vHYkPCedAqRhFGaq/e/6vGbdgWeWjufb9+Mbg49sHqPOggCuJCMyF+c9lnQio5+NRx9X7cgxCumuMqmC8KAuKxSEyF6zWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517682; c=relaxed/simple;
	bh=IqeR4+j070w8clCsixhEuqi570LmTfs1Y4J3Lw6IgJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd2xKDGITlyst8KEvHA3myZcVYsw+fVKU10px1DwdtcoPrFeCHb0bKnmftul9TIZUaIxy/DQW8nG8l2lu0ObgatqkWIjWlTSQwL4YhGsh0wKcLNR/AjxqaPZVeUzxqJIUdR7uZE7V1a5UktjrYmSK5aSbUhQKfsWaqso8k6li7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ELMMGA8q; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ELMMGA8q"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4769aef457bso60521971cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743517680; x=1744122480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tBsGxdJPH/E8qU+Rqu4TXW0stjGoPerhX8EEobjMDSs=;
        b=ELMMGA8qZzm5vwxFzb2+nSUG/Dri4BZJt56lL03E00KOZ6rEsRJFtiHUKuQ+3GMztZ
         oqFAoZYQuFIRNgDWWoR02G5U9cyWEnYO8obNHz2+RH3zRTYcF1sr8H/oF0appHvPVV5V
         eAXAb0/jQC93sQGAZPBOQoG6kUm7YrsNBbVtTpNG548ovqs85d7iOzyMwBWqmBwGklvU
         ZAW8p9aEgR3075eBRQACHEGruYQr6wtJBwTAN04H48ywIaCo5CkE97N1v+7r9PFOepVh
         l8oBUesjtfRIlCQWPy/mcDsfi0kTF3P9vJFKLOZK8inUfxuRO0shiZY8ynbm2wqs9D1c
         XYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517680; x=1744122480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBsGxdJPH/E8qU+Rqu4TXW0stjGoPerhX8EEobjMDSs=;
        b=udvlpvJMMfeE7VYM79Zyv5I+GntyUXhn8vcC/K3g6tyJuVMQi1TTWv8jAgRl34nUg7
         s+MVS1DX6IiH3OYd07NwqXTz5yZ/7/kPGn/bCb9C8cebKb+RUWtOPfmWuRIlJjy/Y69o
         1/hWT80vk5Um8rT++mfrQxWKa80L8muVuIvuTMNdwVeg34gS2nk2DHBxh1jTWxocs//x
         bF+iTZCM5zQl1uvOG3W6ZHFnmWpVINiWD86CVBE7K/VX5G7U6e3p6duGgjby4AJ0V0GG
         bBAUan7Tx3enN++hNV6uZ6EPDQsLx4IX1MXRUyWiEecW8rp9BfbhqrY4UWNRx5uyP88z
         iL6g==
X-Forwarded-Encrypted: i=1; AJvYcCVdSIluyjVVx3VlbzQpD6jpzPqvuM1ZuLociFC7PKb2bcLOZUyO3qlwxVNv0n/V2MXCXRrformT9E3kLpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsirUTt53NjIhF/ZGgzwcdix25NIjuv+eOgBRW+l1lOhb+W4MF
	B2dDSDmaG9lv3jE9nLscxAhvxjBDHT5MtHRT4zpG7Z3E5T0cMlSr6aMYQ4jBaw==
X-Gm-Gg: ASbGncu/7db1GR1et0vnaqcTSdgi5EGhNo9ob6QK3ENA4TQdq/0eNiulgifwg0n3DnT
	PD6gJvQAnRUYg50WgcFeoXvQoK7P2lvrdm4yw0SK0ZmTqMFbqm8qPTr//oLSYkmb22EDl9aOJM6
	BIUGy73KpwrqTgJttvx8mXqEBhl4fVKSARMTxoIFyKxASIA7Q00lBfYIwWKZja3TrVDHZQ9tUZc
	He9vuAxa+Cb1deSFk7o0uB6leMTRonrghdn9n0wbgQq51SWxqirZEWPO1H1UwrAneJ4KXptdaUa
	1aqImgc9V32wzYOEZP+WMqoY1zWIUKkqCLHJK6rJl2/v5h65NaI6g5ViuYyf6Ow=
X-Google-Smtp-Source: AGHT+IFEKmOpPUSraS63vAvOPCVai+Xm/1BBClBbiL0zWd5LKZcI80Wj5NNyxFqzsAbFWw7hs2psnw==
X-Received: by 2002:ad4:5caa:0:b0:6e5:a0fc:f663 with SMTP id 6a1803df08f44-6eed5e2f0a1mr151164496d6.0.1743517680004;
        Tue, 01 Apr 2025 07:28:00 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771c2bsm62030206d6.84.2025.04.01.07.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:27:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:27:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	sumit.garg@kernel.org, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/4] usb: host: enable USB offload during system sleep
Message-ID: <cc96ceae-304e-4113-86f8-06b6037ffd4b@rowland.harvard.edu>
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401062951.3180871-5-guanyulin@google.com>

On Tue, Apr 01, 2025 at 06:22:42AM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> In order to maintain full functionality of an offloaded USB devices,
> several changes are made within the suspend flow of such devices:
> - skip usb_suspend_device() so that the port/hub are still active for
>   USB transfers via offloaded path.
> - not suspending the endpoints which are used by USB interfaces marked
>   with needs_remote_wakeup. Namely, skip usb_suspend_interface() and
>   usb_hcd_flush_endpoint() on associated USB interfaces. This reserves a
>   pending interrupt urb during system suspend for handling the interrupt
>   transfer, which is necessary since remote wakeup doesn't apply in the
>   offloaded USB devices when controller is still active.
> - not flushing the endpoints of actively offloaded USB devices. Given
>   that the USB devices is used by another entity, unilaterally flush the
>   endpoint might lead to unexpected behavior on another entity.
> - not suspending the xhci controller. This is done by skipping the
>   suspend/resume callbacks in the xhci platform driver.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---

> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1420,11 +1420,20 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
>  			udev->state == USB_STATE_SUSPENDED)
>  		goto done;
>  
> +	if (msg.event == PM_EVENT_SUSPEND && usb_offload_check(udev)) {
> +		dev_dbg(&udev->dev, "device offload active, skip suspend.\n");
> +		udev->offload_at_suspend = 1;
> +	}
> +
>  	/* Suspend all the interfaces and then udev itself */
>  	if (udev->actconfig) {
>  		n = udev->actconfig->desc.bNumInterfaces;
>  		for (i = n - 1; i >= 0; --i) {
>  			intf = udev->actconfig->interface[i];
> +			if (udev->offload_at_suspend && intf->needs_remote_wakeup) {

Why is intf->needs_remote_wakeup part of this test?  There should be a 
comment explaining this.

> +				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
> +				continue;
> +			}
>  			status = usb_suspend_interface(udev, intf, msg);
>  
>  			/* Ignore errors during system sleep transitions */

> @@ -1524,17 +1536,26 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
>  	udev->can_submit = 1;
>  
>  	/* Resume the device */
> -	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume)
> -		status = usb_resume_device(udev, msg);
> +	if (udev->state == USB_STATE_SUSPENDED || udev->reset_resume) {
> +		if (!udev->offload_at_suspend)
> +			status = usb_resume_device(udev, msg);
> +		else
> +			dev_dbg(&udev->dev, "device offload active, skip resume.\n");
> +	}
>  
>  	/* Resume the interfaces */
>  	if (status == 0 && udev->actconfig) {
>  		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
>  			intf = udev->actconfig->interface[i];
> +			if (udev->offload_at_suspend) {
> +				dev_dbg(&intf->dev, "active interface on offloaded devices\n");
> +				continue;

If intf->needs_remote_wakeup wasn't set above then the interface was 
suspended.  But here you're not going to resume it.  That can't be 
right.

> +			}
>  			usb_resume_interface(udev, intf, msg,
>  					udev->reset_resume);
>  		}
>  	}
> +	udev->offload_at_suspend = 0;
>  	usb_mark_last_busy(udev);
>  
>   done:

Alan Stern
