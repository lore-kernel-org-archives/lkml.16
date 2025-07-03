Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DF2ED148
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553329; cv=none; b=ZpUKEvjIAA45jrvyx8skWNOOFJra9q5I9AyBygqatAPVzOTt7oJOgEx/WLB+SOrqfuFbECjvAB6wep0Q91iSqmow7uOGV59MMaWAdkr7HxIOuN3C3iifYlezJJZc+FY4FxBKbe3YIOUmZ0D4FxTUvgC1L45pLj7tnhJGclcVtqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553329; c=relaxed/simple;
	bh=Y+evtO57jDRO4cx5S0JrB8XOjRXeEqoQzMPAkDgXmEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HX9UVvDD5bH0TmqP2x933qjvYHSt1rAvYGo8ADJLDJJQdwrCwseu+n+gD19d/U9wFOGcqlY/Vj7LJWXqOmG0S7cVFWFUzGvxhLAeN3PL8wau0lT4ipOeOv3fFkNTm65STezmCSow9tkryCpcPIJI0v4aX7/Z4fI0qKHF9IZC4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pclih5rz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pclih5rz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a52d82adcaso75089031cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751553327; x=1752158127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=pclih5rzHDdfqMD/KrXoFwPkIBGUj9xUYM5F8R7j4cC3phkLt2ukipGvuyAHeUpsG8
         c+uaWfNpsCrtWPF2gSuo9waMbS0NVPAjWp6Z1Mv+FtJi/lgfR0kZsWer3nPwgTGxNvUR
         RUl2jc/E6W4lrtQ0JnT6FQyDI7frX2fcvtSJA9Z9AxeBnyeXx7M9LPszNL913yNURMVw
         ZM69rZn4zOxX6cDDtSFlMMAq+1U89HB7UrSs0nQ7qSIQfxsa2au/vcZJva7Gb+7lEugM
         Eg8Uug3rPhe87BQ2BUH8O0lYMn6dsQ/C9Bgh5/r+dQfDg4aww+wxgOgGrwzJMVqD1Kan
         Lhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553327; x=1752158127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgzlPHtDsUP2XFZstpiCKw99h73zAxNOOZoeiHHd4NQ=;
        b=fQFu/w5EaSPdlOcJ77x3Kgw0z36sfQHF+BlQSAqBMGMtE6NPQTqEDADat8NBOOIiXO
         VhmVY0rRJRgJk2COlhJNF5lLpoN8RCM+NgIAjXASNvXLm1GnuB3gD1Z7jzl7BXV/jJ4w
         0y0ohB4p+wcV28KYIgVd5SGbSWfRuZ1NlRezBxNzzifpplRnJ6PkvOlV/Namff4VoeJS
         b4J8QvgmlEIooG6Fy1JujDibx8fcf1qL+svPif74VyObUaqrFKZf5nU/houe8fGDrWnH
         160Cw1uHFGTCQz7GxDehExlImiTe88ydLvcEu5VFWfQYtL75vT/9JhSAjPp5zZSQ9rqm
         lLlA==
X-Forwarded-Encrypted: i=1; AJvYcCVI8wuSHrw+XWM1rUaY5L0SPzFB7IuJkcMb0lpJNy1mQ0/Iirsv6xy2lQORoALVJd7ooc/2TrEPgb7lnPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwztsmM68F1qH4NkuyTy26IN/uwTdXRUMdK4tM5BmWTE/p1y0bT
	UOTH/MldzagE2hBeE85vTwuRKyQ7ArngIst5yYLgMOoMHndOdWPR3VMXMy+/P9BUhw==
X-Gm-Gg: ASbGncsHo/Y07j7DuQOGV3cDqbYOHtTAnBWHJ0f141dXAHPCdfY0q9gnO9UDm0ya1vF
	DnncuYLuEWcBb7jVE8EUmf6jF7012FPEQoS5U1V1WDThUbbmpISJM+UMp6YyUs3yYr+zkvqkArB
	wCjGiATHZ8gYkC/uK7JtJbOEjyfP3l6Gds+CN6F50l0OZ3CwVFniidO8kI6hHgvM37I+fdFXRDP
	J8gfiHzMiiUConUIlh5zLqAxkbn8lssRhkHqMH/pAp4p31ZJ0T2TX7AN8EZ8xhV1m4v8XlrToot
	XVDrkgymmPW8+ff5ixA3Ln1cdQG7NQcrrQaMjMTcemi5cRZCoIjb250BpSZ85xql8cXBRlEXVIO
	vvisQ
X-Google-Smtp-Source: AGHT+IGK8KAo4mpA+JVTB3ZTXwVBkpsgEauagc0TG5bpf3JShjIVuuf8H4Nd2foOv6ZumStKh0znCw==
X-Received: by 2002:a05:622a:5143:b0:4a4:2f42:a668 with SMTP id d75a77b69052e-4a9769765b0mr144026911cf.31.1751553326431;
        Thu, 03 Jul 2025 07:35:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55d92esm109947251cf.49.2025.07.03.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:35:25 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:35:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <30f04c8e-5074-4262-bf5a-da022b89c276@rowland.harvard.edu>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
 <20250703103811.4048542-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703103811.4048542-2-xu.yang_2@nxp.com>

On Thu, Jul 03, 2025 at 06:38:09PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v4:
>  - improve if-else logic
> 
> Changes in v3:
>  - put Return section at the end of description
>  - correct some abbreviations
>  - remove usb_dma_noncoherent_sync_for_cpu() and
>    usb_dma_noncoherent_sync_for_device()
>  - do DMA sync in usb_hcd_map_urb_for_dma() and
>    usb_hcd_unmap_urb_for_dma()
>  - call flush_kernel_vmap_range() for OUT transfers
>    and invalidate_kernel_vmap_range() for IN transfers
> ---
>  drivers/usb/core/hcd.c | 33 ++++++++++++-----
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 116 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..42d9d8db0968 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c

> @@ -1425,8 +1431,10 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  	}
>  
>  	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> -	if (urb->transfer_buffer_length != 0
> -	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
> +		if (!urb->transfer_buffer_length)
> +			return ret;
> +
>  		if (hcd->localmem_pool) {
>  			ret = hcd_alloc_coherent(
>  					urb->dev->bus, mem_flags,
> @@ -1491,7 +1499,16 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
>  				URB_SETUP_MAP_LOCAL)))
>  			usb_hcd_unmap_urb_for_dma(hcd, urb);
> +	} else {
> +		if (!urb->sgt)
> +			return ret;
> +
> +		if (dir == DMA_TO_DEVICE)
> +			flush_kernel_vmap_range(urb->transfer_buffer,
> +						urb->transfer_buffer_length);
> +		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
>  	}

This could be done a little more cleanly.  It's always awkward to read
an "else" clause for a negated test.

Instead, change the "else" to:

	if (urb->transfer_flags & URB_NO_TRANFER_DMA_MAP) {

and move this whole section to the top of the big "if".  Then you can 
change the test that's already there to:

	} else if (urb->transfer_buffer_length != 0) {

Alan Stern
