Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57302E611E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542474; cv=none; b=sbxKZzX1OBQtpTgVUQ9UxAVATJeDOWivadNNA1hJDjNH4FQojp4/LR/9uzUI8grVthuyEw2OdvMxlDjCIejJbx1tev+n25xzfSkWG0vqtliaOxrg7rvL3/FpDIwyjrT7JF0L4JGVAmzbL3SVMzx/JRDysKfG3Qi1FYbeqj3d5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542474; c=relaxed/simple;
	bh=c2tsJjFJ9vSavOpZnhYvTr4JJmozuk1MtWh1Imcs78Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InZ89Hzt6erEBFU+RPGbS4hUDBwoGofYiUzxfkMqnbbIytib1TM141XpO1OEem/CaCr+Fw0I1TAAt130ax330jpyCnvyu8MFgOBkFkBlInP/YMCctFn7E5Ycsng3F9odBitxZOCoCF03ZRhS4DjccDJZ1zxRwKHfINYZnsQ/xFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YaV6lcYh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YaV6lcYh"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so4494960e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751542471; x=1752147271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VKu/zfJ+vFov6qPGzjqcOdspoBv6skBDRoDtXZ5kxPY=;
        b=YaV6lcYhUzCkJRaPKWK0TTYcLVbfS6ZSwfGYZPuQ9y0Sv+gdhdThruauY2kRo0weuk
         F/+BAGpuDfPTmh1Ht3O7XJaeEaIRTQYHoxulR1iw+/wFSCbBo58t7SNob9oaWsJOISoD
         w7MtcnJdkHftHuPRap46cvJQOxI3cCMMfCj8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542471; x=1752147271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKu/zfJ+vFov6qPGzjqcOdspoBv6skBDRoDtXZ5kxPY=;
        b=aigpTAioG9Y495NDQ0OtkgKm9IYK3d0QGT00mXfTuLfSlGiVxQwceL9rsFslApNSOQ
         tFErnCNYHPrtQK1S2KlJau4uiZ1OwiIUpFMvHVMD43i4V5llV3YbC4r8JwU000AL1/7t
         5LtnnVSMOeTFYUXP65qdwGnWI0V2LacbD6pKSlA8AFDgf+ehukzZ3/fC7FnY0iJKe3Lc
         kWZo9WoRVTMSIL75Yl3D65PCadmZBHeYBkIdPKkDIZeo8+hpW4ECSgoXphW3JRacjJxM
         prpNdRPVXn8bWdIS6DHk6UKKpmzkm8BnIxCeiKpkAPjkIh/8xrvbyG9y7tQzhsN/SEuD
         EMFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcK17evX0np3PVUhzYjqdMa6Pitma8mqYMtujUONqGD/PcjcMvCyUDXFqD1rP2uvURtyc1JQSrE3JPRoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/siVjt1NJ/3c98eVrrpCIDks8KYMwhVjQyr530bh2k4eUc4f0
	zBRbgRASrxxWXqf40P28poRqH56Hvx1VD2oA7rmIg0Eq8vEqj8A3bf3MXlm6Jq29FcDnt0gkg4Z
	gp1cVIg==
X-Gm-Gg: ASbGncs3fRvh9XBqIIfHMh7eVfKmG2Xd3YJnY9hpugtTuzlG1WFdfYcVn6ssSG50mW9
	eTvQ8HMppxle6ObU4Z+hlZA90DBvm7/agDkpfT8QbIIxcMIrasoc+/rJ1bXTSzi3j7xiPbibZpM
	aB3FAro+jqm33iw47Ofs0zmXzj7ZV4JEWoP3zoxc0Bh/8jwQFbNN1zpoEBg8EoN2nH37OU2p/r+
	gAf9Y740R5Fri7fvG59ag+bZgKxOBQ7TTKjoPlBKkLejxvHPm3YnfG7ZaB5MnP+aPECPXWsUbz1
	w+IfyXiNCE2L4kIdAPm2IiOpVEDGKnHTFu1p9uEXsUNDVtq6S4UAFq409uf5zOlTl9Vhwr07GXK
	C9G6xjIl1DGGWRMGDPJs810bG
X-Google-Smtp-Source: AGHT+IEmXG55IppCnTwQenXzdlf+bsjZAOGcPQ7xYgzfckW549AwpoMlMW3Qwl+sm5q5dFSZ1j02LA==
X-Received: by 2002:a05:6512:3e04:b0:553:cede:6a9 with SMTP id 2adb3069b0e04-5562ef960b9mr934657e87.55.1751542470841;
        Thu, 03 Jul 2025 04:34:30 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2da80dsm2395258e87.220.2025.07.03.04.34.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:34:29 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so4494873e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD2hRfvIvmZyg0wG3KMXQHoExM4UHV3LhKHD7GCoNTFxOKq7kK7pLa3vrxj48ltYTnLzYZODS4ohYofko=@vger.kernel.org
X-Received: by 2002:a05:6512:3b89:b0:553:252f:adf8 with SMTP id
 2adb3069b0e04-5562ee21626mr930140e87.9.1751542468121; Thu, 03 Jul 2025
 04:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703103811.4048542-1-xu.yang_2@nxp.com> <20250703103811.4048542-3-xu.yang_2@nxp.com>
In-Reply-To: <20250703103811.4048542-3-xu.yang_2@nxp.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Jul 2025 13:34:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvYwSb9mrc63=0ioJdSkEik4H19r2c+j7yv7V-43RBxFA@mail.gmail.com>
X-Gm-Features: Ac12FXyVqorehuUK0wzBq5BWngmbjwNbNsjrYe5IAIc3GAyeQui3lCJ45PdgYOQ
Message-ID: <CANiDSCvYwSb9mrc63=0ioJdSkEik4H19r2c+j7yv7V-43RBxFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 13:02, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v4:
>  - remove uvc_stream_to_dmadev()
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 61 +++++++------------------------
>  1 file changed, 14 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a75af314e46b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1275,20 +1275,6 @@ static inline enum dma_data_direction uvc_stream_dir(
>                 return DMA_TO_DEVICE;
>  }
>
> -static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> -{
> -       return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> -}
> -
> -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> -{
> -       /* Sync DMA. */
> -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                   uvc_urb->sgt,
> -                                   uvc_stream_dir(uvc_urb->stream));
> -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> -}
> -
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1310,7 +1296,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&uvc_urb->stream->intf->dev,
>                         "Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1722,6 @@ static void uvc_video_complete(struct urb *urb)
>         /* Re-initialise the URB async work. */
>         uvc_urb->async_operations = 0;
>
> -       /* Sync DMA and invalidate vmap range. */
> -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                uvc_urb->sgt, uvc_stream_dir(stream));
> -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> -                                    uvc_urb->stream->urb_size);
> -
>         /*
>          * Process the URB headers, and optionally queue expensive memcpy tasks
>          * to be deferred to a work queue.
> @@ -1750,7 +1730,7 @@ static void uvc_video_complete(struct urb *urb)
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         dev_err(&stream->intf->dev,
>                                 "Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1745,15 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> +       struct usb_device *udev = stream->dev->udev;
>         struct uvc_urb *uvc_urb;
>
>         for_each_uvc_urb(uvc_urb, stream) {
>                 if (!uvc_urb->buffer)
>                         continue;
>
> -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -
> +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +                                    uvc_stream_dir(stream), uvc_urb->sgt);
>                 uvc_urb->buffer = NULL;
>                 uvc_urb->sgt = NULL;
>         }
> @@ -1786,26 +1764,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
>                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> -
> -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> -                                              uvc_stream_dir(stream),
> -                                              gfp_flags, 0);
> -       if (!uvc_urb->sgt)
> -               return false;
> -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> -
> -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> -                                                uvc_urb->sgt);
> -       if (!uvc_urb->buffer) {
> -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> -                                      uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -               uvc_urb->sgt = NULL;
> -               return false;
> -       }
> +       struct usb_device *udev = stream->dev->udev;
>
> -       return true;
> +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> +                                               gfp_flags, &uvc_urb->dma,
> +                                               uvc_stream_dir(stream),
> +                                               &uvc_urb->sgt);
> +       return !!uvc_urb->buffer;
>  }
>
>  /*
> @@ -1953,6 +1918,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->complete = uvc_video_complete;
>                 urb->number_of_packets = npackets;
>                 urb->transfer_buffer_length = size;
> +               urb->sgt = uvc_urb->sgt;
>
>                 for (i = 0; i < npackets; ++i) {
>                         urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1975,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>                                   size, uvc_video_complete, uvc_urb);
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> +               urb->sgt = uvc_urb->sgt;
>
>                 uvc_urb->urb = urb;
>         }
> @@ -2120,7 +2087,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>
>         /* Submit the URBs. */
>         for_each_uvc_urb(uvc_urb, stream) {
> -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
>                         dev_err(&stream->intf->dev,
>                                 "Failed to submit URB %u (%d).\n",
> --
> 2.34.1
>
>


-- 
Ricardo Ribalda
