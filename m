Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1E2E2EF1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034222; cv=none; b=bS+zfm5eVVqcoo6i3Ek4bgmzkKec71KqQMTQ1otMk456MHajTMrYpKzs6Cvs9Kr/RvWc2SZsO36vkn9Eb92gbbVCdYnO3EbaBuC3XZg2d3OZwLjVzTomvyIdX7g4992CMNVddMOC96QeMVw/pa8F7FasFH/mGl+//pT+LOrxNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034222; c=relaxed/simple;
	bh=QXCsL7vS7mFvhzNXf8DjS7hrvdMO+odeJz0t39ie72o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlI4rBd0YDcACXF0zxaY9uihhq0LJZH2vCx7p2UQ+kA8CqMBufytq2eg9oeIQRHu+lPJMD7VSNqJodPJYbFFKjjYVo2NiPhdqrUzbk+KrZIWBsx/yZhjSWx3ity3Vs/TWy0o6acEc+Hia1z8cc1EtFjrK8DF6Mio73AZp8rl+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=adPe40Td; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="adPe40Td"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6facc3b9559so31060416d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751034220; x=1751639020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=adPe40Td5LzEDQsf9wp+elHaMnh38hiBs8g4L+qg3Js2dxU/jv4kyg1i87sytO5AG/
         KIgysClKYU6sCfe4akhWzbV0eHDts4OqoBQY8oH+lDPq3KZpIIvHbx0kf8zBLKurAWIQ
         peDE/DophJo9kr1PDHk0QJMNC6BwQuCSwocNwxxX2MVas4DvfoqAkFwyKF6vLP9UODZs
         ln4zjTGeOsUuCxP3HF7fw2tYmTAuXOid+N7VaQUyvUVG1CCgNSo8enrA3lcdBmLwUCCO
         4sIy8sMb5/IIqLanC3/D+PGl88lIKFAJwgrVMkP5l+y9kqbam/EZ49rK/9hlzHsW7aA5
         I7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034220; x=1751639020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9NXmX4vbwGCbqn6D1k17tKEXOD0obRo+KVbdSlDBXM=;
        b=xJxzNYLzvHeXnAaGbzJXNABTK2p9akRlq8en5hV/HSQl0dH8+ubCNHFT0gO7QCqflI
         HiIayPwfbiaKodG4q6Inb5Pq4c02nXeYyqTBOrL6YobVobWOJl28Slx/6ntVHw/7IOQN
         LCtJsiB16oxRFX/4fQCT7v4171qh5D+nfYS3JFnwx2XMcbsLsMFb+EgrP4jEFLFCw2Cv
         +zGgkmmFplvrIIqgESVqrRy3wI232Ar8QpXKx8VrBTMkfg47ZzJ3V6m5QlPd4sWMgG1Z
         HLRxw8z04SEat6UbJOlUJx9r94MhQhqvBnkHWGdjLMheBw72fd/qTwx4S5dwpBM6li0q
         Lvxg==
X-Forwarded-Encrypted: i=1; AJvYcCX7qQgBXeZ/yKF93GAlAXnGWl16S6DF0u+kmwtgRacaCvfWQiknZWALj9ssvskiKkjzuvjqkcYHRl/eeh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRr3XL/kAyfwy/maNxr17urseDavGBvLfdAjf4YLbF1H87/Wu
	HwTGkFLK+Z+h4u3EJa8/GbYqf5Ck2pADH/Z/YCyFSppcd25s2HEZmeI2muFwvDuDbw==
X-Gm-Gg: ASbGncvYWWo3EOPq8peLVbT87w1hZw2fhdIX3PhLy+WqaztEFuRq7mQTBX1Efw74zCn
	WKl0CozqMIXKQ7eOecPuIIi56FFJkWVdEZnMp3qHfElF6nOHpI4BrXu3bN/4eqMuNXca1e/71ha
	5XaWdKesCTXsyTCMKuD6OiO5A6458M8q6PXmih8WjFi1t7Gf3VOECUzkOJAmbXiJ8j12TzCju2z
	t0O8Lv9dsgw3RVUz1cXg0MLQ5LVhZn+luca7y44AEO2ZOHlOVdjsqW12iyRJCWVFvUx/ojR7KiH
	UqLwVCH3XKTuhr7vu07eX1RYZOH9BIluByeFykPI/DnJ+t/hq13cdRQ9pYhIY1i/sEmFYexBt/n
	+MC7E
X-Google-Smtp-Source: AGHT+IGuzlQ4coveIb3aJO1JXLxRiAQiyFnfLoJRnxBPJ+E7GV+Z/ZfFSQcDG+29Z/ZESK2AT9OPdg==
X-Received: by 2002:a05:6214:2468:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6ffed7a55fdmr51444156d6.6.1751034219846;
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313926asm137703185a.22.2025.06.27.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:23:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
 <20250627101939.3649295-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-2-xu.yang_2@nxp.com>

On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/core/hcd.c | 30 ++++++++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    |  9 +++++
>  3 files changed, 119 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..5fa00d32afb8 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
>  
> +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> +					     struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;

Are the following operations really necessary if the direction is OUT?  
There are no bidirectional URBs, and an OUT transfer never modifies the 
contents of the transfer buffer so the buffer contents will be the same 
after the URB completes as they were when the URB was submitted.

> +	invalidate_kernel_vmap_range(urb->transfer_buffer,
> +				     urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +}

This entire routine should be inserted at the appropriate place in 
usb_hcd_unmap_urb_for_dma() instead of being standalone.

> +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> +						struct urb *urb)
> +{
> +	enum dma_data_direction dir;
> +
> +	if (!urb->sgt)
> +		return;
> +
> +	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +	flush_kernel_vmap_range(urb->transfer_buffer,
> +				urb->transfer_buffer_length);
> +	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> +}

Likewise, this code belongs inside usb_hcd_map_urb_for_dma().

Also, the material that this routine replaces in the uvc and stk1160 
drivers do not call flush_kernel_vmap_range().  Why did you add that 
here?  Was this omission a bug in those drivers?

Alan Stern
