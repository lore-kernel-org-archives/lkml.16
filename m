Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C473267395
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211880; cv=none; b=pt6OMUGx0h5QQMtYCONmc+X8howZ4E+M2Yiy0i7dhuqh3sYxnSGILE2wkoV/j4v238rhvWl5CB81xlPEdY+Qr07LBdfp4moIaH80l42QoYdGTwQhFKDoJKPW3d2ADEpGm7guDAhWtgOEXSul4abpKI8XLhkfZz1T3kdbNajV3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211880; c=relaxed/simple;
	bh=L05GeTPpsVwGei1PRLQ+qItaPjTFR+kADeT9SbaA8AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WluxmtHUJLjRkYR9wQyvxsQ17iMiOZvqmGQnDPPs3tzF0fK3VgeR1AoSte0gmCNcMGN/eDgVVdruC77ifUDuGl4NVOyup3FgLVay8xg3gFdM+0FXI29g+ivzh7SYGOomywBO/Siam3yEdzsUdP9dZ05fbDUT2CDH/J0OOLq75ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ttQN+AIr; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ttQN+AIr"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f6970326so66872396d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744211877; x=1744816677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSz4oGBczB4s7QzN4sMG6IGoZmYK3gCdR0YSP1AReVY=;
        b=ttQN+AIrpWeQeVj+ZHxZxFOzdBrB/wi7yXNpTiqFNZ25ZDGiTwxFvDg026gSHMsDr9
         4p3xPVj6tcCWn9ySCpqZ80+xtIPphShVotBxsRZtunIqGmnZsoJjLaCGHAn/b7DT8Vpe
         AFd/UKhhRT9xHN87YU8OCL3x4JsHUhwR2QszgXy0GyOozLRRbqmydYYa1KINEqOjiSAD
         cidmjZ6BdlQHJCNgprjEDow/qXV/rU7uPf+CumBAgwoflykP7oMtq0bbe3GzaryqWC0i
         t1JwKzf9qhqxHBnwK770RhA8qq6UWYKEPpFWIVQY2ceTmhNzEgS51V2pZ7ul3abiabae
         0s0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211877; x=1744816677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSz4oGBczB4s7QzN4sMG6IGoZmYK3gCdR0YSP1AReVY=;
        b=hOZxUowa/SA0iQ9i9Zn2nML7c1mqZy5BFctJfLPA8ogALvpTzArbsQSsLAsklatkVK
         zkYhHfvJqJCClJjJqa0jADKr2314B0iByEbUrL0Mk4WH+CcoHceoimg3QczvhXYJtQV1
         B1ciWxa1M02Pu9Kv51qVd8ugKL1LwSyCMPOYwhru99gSWCLXdqhnkwtJJB+at1MX9KwD
         Y+AELLCnYxBDFvhFA1KbalHLJlkwlu0XZEF7vknDp4W9MZkqeJRvwzjyYAUvwa5tQf2i
         FXabpTIty1SUjkretipcXIDGi0L/deIKSlPHR3gAn/IHhHdsdnyF3Az+8DTasLS7+SnR
         UiXw==
X-Forwarded-Encrypted: i=1; AJvYcCUKTUxOWFDFaqHgSrNRA2wFTUoG1ebFAUQSp9GoL0eaxdcSQ1v3Cah2mCd/nTNKdWOMkiTMFpbsxl2kIDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/pimbSd+v02zLxpyL4fhh+ISfAAtM80yLHMWIi1nHpR7dn4c
	6jTLceXOLEmURcutLli8HCfBzmfl0eTxs7/uSpuGtoBXBG0YQ2CpY1n4dxLymw==
X-Gm-Gg: ASbGncs3YIWTyeBWyliM70nCHSzJm70GB8ez9TUVa6v+Z8RPo2rP1i44vfj71CmuIjE
	S7mlND5E0eHvW+ddhQfCMEj0VML1hYDue9Y/ZUapopjVtUJ/P55VGeUkzmMUYIQ64FL0PfRanoF
	zwaXFBEX1uDvsdByZ9q25/826fcSdvPiJTK6htz8fnqY6Avg8KQHsKqiSPudA+2cROIYagx4kOq
	BtQfx2qE5igrFX8gRahZnGkclJ2PRAqqVC/Y4Qoe/aE4XiNctlgX+lQu1TOQ8NKYwx/vlZ7Tdzo
	cvCej5qpurwsoreQiADhnom92aBgXdXlVL1dInjr4Z8Wd/Vhs6rBHYbeTlyV7NmIoJYaSQ==
X-Google-Smtp-Source: AGHT+IHjwyEnZ98boe3bPSpo46Gy/YwX3wb//6rfyBN5Ja9ijCITZ3UxvTOSgqs8SVsosirRXDfodg==
X-Received: by 2002:a05:6214:409:b0:6e8:f464:c9a0 with SMTP id 6a1803df08f44-6f0dbbc0972mr55539716d6.13.1744211876980;
        Wed, 09 Apr 2025 08:17:56 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95fdfbsm8457386d6.1.2025.04.09.08.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:17:56 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:17:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
Message-ID: <adc03a95-baa0-4a2a-9b00-39a644bab426@rowland.harvard.edu>
References: <20250408035833.844821-1-guanyulin@google.com>
 <20250408035833.844821-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408035833.844821-5-guanyulin@google.com>

On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
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
>  drivers/usb/core/driver.c    | 43 +++++++++++++++++++++++++++++++-----
>  drivers/usb/host/xhci-plat.c | 19 ++++++++++++++++
>  drivers/usb/host/xhci-plat.h |  1 +
>  include/linux/usb.h          |  2 ++
>  4 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 316526a05250..59b33e5e9a87 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1420,11 +1420,25 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
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
> +			/*
> +			 * Don't suspend interfaces with remote wakeup while the controller is
> +			 * active. This preserves pending interrupt urbs, allowing interrupt
> +			 * events to be handled during system suspend.
> +			 */

Here and below, please try to limit the line lengths to below 80 
columns, even in comments.

Alan Stern
