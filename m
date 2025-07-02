Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970EC2E718B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466727; cv=none; b=auzjEjMuqjyXlWm0kLVt91gLHiU8VSyptBORu/bXpp8Q+FWx75HnZWe+k6nsewFpSDGroqMEb0ds9AHwaJTNIyF+UOcqvM8uOw9agxqKRmTGXR5AN3eS+Y3OigZdGkjnuO+d+gJo6Wg+HcbJ6+5/Fh2wjMqef+ZDqREQFd7eJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466727; c=relaxed/simple;
	bh=kNyuH7WLAtOiZ59gEXSG0VtJ7ygKLG7MtztYM37F/Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6dF3HAcTMVRI5kycIIeLcpz2b0M+CxK6tSz8u0MoHNBp8HKpCZVDAdh9BgT46gYLcFF5yJ/d6LVdBqpAvb6CqUAi9YzeabTaf0236rfb7WcMpZVKNiOEb6enKg5XbvI7FmOB9etguomi+/6tCX4/i7zt3EYJhdgUE5EJ6WLmtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=k522Uubj; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="k522Uubj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so74239916d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751466724; x=1752071524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=k522Uubj8tc0tdptpXACapeAWwseeeUoSl5NGt8iP0ON2xIiwIja3V9LjVAOaiyCOx
         nhw8qHVx/V3kzOekGdgRJSaPeTkpWa79dOUR0FbpNy0WiD4LHP4dn102LfokEAGXfn9N
         VImBrJtFFtqygHGpK8y2QbL05uYVI0vCAfqugfrEQgs0TWPtBic5/whHVGJYmF49kzEv
         dFbjTGCrUzieguUcYI/CG8xEcPqzCLkQWdJU2Sj8tbPZy5sbUZVIVOG4HIwNnzicWjyP
         GDOIH1TathY8Ypy+vBgcYW4L9NVfgZVGg+PC9mKA6gT1iUCsw/QS01N4Y+x6/QX+Zcja
         LYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466724; x=1752071524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OM0zfei5f0inErN/uNSMXzIQ9/mBfPLCdVqE3t8DrBI=;
        b=JNUS0y29pAcmIKNEwIscMsnaBX0KuRXBHdW3ih4aWe+Z8YheOtEyIUpEYkIsLLHsn6
         vxthiVSdh1Au6NRFV392FPJ8PrZj8SrzeiN5NakzDhcKBXSrKnLFr1ER1FUj+W5Hl9H2
         adTShgqCAPeRFPM8QNT1XpH37FAS8XK3G0M28Hgl1RIaMpAHmjYWAZXRAdOyY5o31KPU
         Y2CKtSi9KDUuRXuVGfcwF/tuUVOMnXfpinU577Q07JhjQ33TOxunJ475Bl0JNEfUW2J8
         kf23TEFlQLMaK4OqkUNVkVDxVjLBhDrwl3CY2Tc1lR+B9NZhPqZkQiYOrMRRjE22cxnV
         /cTA==
X-Forwarded-Encrypted: i=1; AJvYcCVSD3VPEpAAelMWGPL1uefIlRk36BXrJ6LiDc+oJk9KhFCZNkogbFyuswm/i5aTM4/wQDjxi30xjCjKnSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BeYmqZtMCjs6zTz/9WCwyRAW7P6c/eBJAROvx4+H0HJloUqJ
	0KDVnqA1nJmW5VD7U5loXsgcy2s/BB6xIZp2ioeb4DYimad3LUxc2EJCewBbBTip2R9SSDb+Zoc
	9FtU=
X-Gm-Gg: ASbGncv/5VrtgDRYcgIdvx7xlN6x2lC2jIC5d8POCB2f+IeAfxvjte/VFSWSRHJ6rJJ
	lTJUID1wv6QZ5YYhnufPk1VhwVmf/kaobcNuzYzpOoU+Y7ZgGMiZ80XP2CG3gXx7eKzspNjW460
	s24mXUxdXKmQC9tGhqFCEwGexGVZGKY6qsmJJnpZpwyQKtwnKNUNFjqlb5zRchm8eMNskAzY0tg
	oOpVcPztNwM84qHiJWwjUKRZyDqRfuICYY8nBQYbUrnb8KCvMw098th+Y4q4aeeTVInDT4fJX/J
	EJ8pCZEFmIdtxYKTrSLLYgDZFiUvCyeH60Bvr2jqXc3sFVmUPy+B/zqGBAAl6EISggCLmb9dDVQ
	oU/+Z
X-Google-Smtp-Source: AGHT+IGUPShe/+yBmwn3/UQ4X2UjDVvrgr8iJo66Gp3M0ocSLCxEcEabV1oGRD+eHhzqQPhNVXK6Ew==
X-Received: by 2002:a05:6214:1c08:b0:6fd:75e1:16c4 with SMTP id 6a1803df08f44-702b1bb187emr42595926d6.20.1751466724441;
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm101024496d6.65.2025.07.02.07.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:32:04 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:32:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <198ddef7-8623-400f-8e2e-ffd6c4bfd2cf@rowland.harvard.edu>
References: <20250702110222.3926355-1-xu.yang_2@nxp.com>
 <20250702110222.3926355-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702110222.3926355-2-xu.yang_2@nxp.com>

On Wed, Jul 02, 2025 at 07:02:20PM +0800, Xu Yang wrote:
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
>  drivers/usb/core/hcd.c | 19 ++++++++++
>  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h    | 11 ++++++
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c22de97432a0..e0fa6d6d273b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1366,6 +1366,14 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
>  				urb->transfer_buffer_length,
>  				dir);
>  
> +	if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) &&
> +	    urb->sgt) {

Shouldn't this be "else if"?  There aren't any circumstances where a 
driver might want to do two DMA mappings for the same buffer, are there?

> +		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
> +		if (dir == DMA_FROM_DEVICE)
> +			invalidate_kernel_vmap_range(urb->transfer_buffer,
> +						     urb->transfer_buffer_length);
> +	}
> +

Alan Stern
