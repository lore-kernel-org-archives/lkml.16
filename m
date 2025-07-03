Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADDE2E339E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542342; cv=none; b=d2cOJgiyARtBu2Nyx0+wDFb/jLK5QN4HX/o01AGqFKhfDrl29VSODPdBWCG59LgpNliZhiFUj/Y324Gnrkct9MbESqWwmqX5CvQE28g3N9iyzGYm9v/8XNvkPk9nsC/W9Su4G/yNK7wGjNvGF7AnKxdDqTJN+XWrv7OnUidu7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542342; c=relaxed/simple;
	bh=KJzjzf9bW3qMR/ty207m83vi9+0PfbsKBzq78I8hpFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEP4eES5Ai4Et+2QNPpg3H3/La/y8FersoOzjXRRTPs2NUA/R7xXAN6S2swqMESToaCoBeVqVcMQulSMacNSMbd375O6iAMlfmoDOCj+XXwAtzJK4+FixudgCle6o5JhnNke8RGkbb/Bcb0GSgP+/sNqn2kPH0Em2iDZGIFssmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IbeGeBVG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IbeGeBVG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso9339380e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751542338; x=1752147138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=IbeGeBVGP0zH4ihunM865cFGJQxZW31W0YThGjS9o4k3nUkrmbq5vetntKeT8uCLaI
         BMoim6u6b7MW4OIDhm5xl3qPd0n+0Zc0uyX7c43It4pcHvd3Z6gtYtn6Y5RD6leON9Fy
         BE73wIcJ2WQReO43XII/9SGaUuYIKLRkB8ePM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542338; x=1752147138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77UnFw9JQduiCE+rJYJRimYgiLY5u6VunHggtrV7ibM=;
        b=rj28ptAw1QSlbmpVx6V3yk7klVRkrTmHLdhNbCjlN84Byd/f68+GcJ7MFLqp8aRk5T
         bCmbWsGeV3PBv4syNq9bKAbkIjBHTcoFPREPDyTHzCj5d/832l4dIxPcGqcJObxNipGG
         Vz+10MxQrsWYjBrZhL9dN9GDk4ns7PJaotytKZoRkBnP6yGcASRXktx1mwNaoIh9mqIf
         7uWsa6fpv/8XoK8xcy7q2MLS/Euc2Wj35TczPUhcd2CXZBfQy/Pr/BJ81skKuwAFyrmK
         4ehUGQG0UZA8n0gtie+fNh+w+ppMiIVqvnM6vBJ9SzX5fXiOOQv6WC9TbCeHzVQJsDmu
         jQRg==
X-Forwarded-Encrypted: i=1; AJvYcCW+A4tyrVV6kGJM5OjwaP5GVPEXBt0XRK7WFJ7uuqjJYMOI9AEhOuUt4Sn1buqqe+N2HrT3Vf7ey76aUMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2kngBvNVpfrmalIiTeIvroRNKhOYr8/hsmQkpms+vmoqFdDW
	3YrTHkTU7mJp6dLt8MrnQ3pP6/zf4kt2T0bzWVwMQeaCB8+H0d0DCyxpJtK6mZZVGyWt5H6QofA
	IsjQQmw==
X-Gm-Gg: ASbGncu2VGa7BijWG7TegWN2BTQ4tj9Tu4vxoJDuxMzfMbeB2HoiXpcBrODdCoA3yQ2
	iHsL84vqPZPv7D7iOhWP/20H6r92VGxiZmST+4Or6vMKEw22CoVdyDaKdpXUxh2/nzG13URLjiW
	DICzAwcj9BACQhLOzqlxFFfsnboMdPwGKqeqiIC89xCCms/Ni3tUFoQnxcZcbU+yKbGXLpmByF+
	mQlIXdQmEMjy/DERaQnMELATSqVgD+tfEipOqwKAtxDO6TEpjpY07hwUDvqChdnyUr2mekKl00H
	7lm8Y75r1dGNywvY3Bohl/qx3OdFj7grv1GjeNZfblk8cRGek/pPJK24BrXb3ZBXvqVv5hjSgfn
	UJRdF0feU8oMfmi988MajGFUM
X-Google-Smtp-Source: AGHT+IGY6jV0XFHSOBMvSSayGgylTVqzkotL3Nl2fHihDWqSE0/LK/sQ/KRZyo1qSNwIjJKS2b8OjA==
X-Received: by 2002:a05:6512:3d03:b0:553:37e7:867a with SMTP id 2adb3069b0e04-55628350466mr2461373e87.49.1751542337653;
        Thu, 03 Jul 2025 04:32:17 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24ee12sm2420208e87.86.2025.07.03.04.32.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:32:16 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso9339294e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/qYarFg519TFiglJYYdA7A199t8BXtOD+FllmJ+8e6h77caYAdE1UNzwCpqNw8jO4s4wcTydb22mg5G0=@vger.kernel.org
X-Received: by 2002:a05:6512:108b:b0:554:f9c5:6b41 with SMTP id
 2adb3069b0e04-5562834a7edmr2259331e87.46.1751542335622; Thu, 03 Jul 2025
 04:32:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
 <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com> <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
In-Reply-To: <rvg5yvwij5wsegqclcwv4qnuim3mlohxpdgrd77d7mctxofbj3@r4d56gjavldb>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Jul 2025 13:32:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyU9jtrH9KJyPUY_j3S31gGzwl5u1stIZzn0hYn0Is9alW4iNoy3AaTnF0
Message-ID: <CANiDSCt98rP2RtUfC2EFL+H2U4TMV3BKEhAfpPK1Nm+tU=4j4Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Xu

On Thu, 3 Jul 2025 at 10:51, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Jul 02, 2025 at 02:30:45PM +0200, Ricardo Ribalda wrote:
> > Hi Xu
> >
> > The code looks much cleaner :)
> >
> > It seems that the hcd.c uses the urb transfer_flags to know the
> > direction of the transfer.
> > But the uvc driver is not setting it, you probably want to set it.
>
> The USB HCD will get transfer direction from endpoint capability. So
> we needn't add such info to transfer_flags.

For future me...

usb_submit_urb() set that flag. :)

Thanks!
>
> >
> > On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
> > >
> > > This will use USB noncoherent API to alloc/free urb buffers, then
> > > uvc driver needn't to do dma sync operations by itself.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v3:
> > >  - no changes
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
> > >  1 file changed, 14 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index e3567aeb0007..614cf4781221 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> > >         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> > >  }
> >
> > The uvc_stream_to_dmadev() function is not used anymore, please drop it.
>
> Sure.
>
> Thanks,
> Xu Yang
>
> >
> >
> >
> > >
> > > -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> > > -{
> > > -       /* Sync DMA. */
> > > -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                   uvc_urb->sgt,
> > > -                                   uvc_stream_dir(uvc_urb->stream));
> > > -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> > > -}
> > > -
> > >  /*
> > >   * uvc_video_decode_data_work: Asynchronous memcpy processing
> > >   *
> > > @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
> > >                 uvc_queue_buffer_release(op->buf);
> > >         }
> > >
> > > -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> > > +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> > >         if (ret < 0)
> > >                 dev_err(&uvc_urb->stream->intf->dev,
> > >                         "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
> > >         /* Re-initialise the URB async work. */
> > >         uvc_urb->async_operations = 0;
> > >
> > > -       /* Sync DMA and invalidate vmap range. */
> > > -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> > > -                                uvc_urb->sgt, uvc_stream_dir(stream));
> > > -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> > > -                                    uvc_urb->stream->urb_size);
> > > -
> > >         /*
> > >          * Process the URB headers, and optionally queue expensive memcpy tasks
> > >          * to be deferred to a work queue.
> > > @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
> > >
> > >         /* If no async work is needed, resubmit the URB immediately. */
> > >         if (!uvc_urb->async_operations) {
> > > -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> > > +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> > >                 if (ret < 0)
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to resubmit video URB (%d).\n", ret);
> > > @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
> > >   */
> > >  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > +       struct usb_device *udev = stream->dev->udev;
> > >         struct uvc_urb *uvc_urb;
> > >
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > >                 if (!uvc_urb->buffer)
> > >                         continue;
> > >
> > > -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -
> > > +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> > > +                                    uvc_stream_dir(stream), uvc_urb->sgt);
> > >                 uvc_urb->buffer = NULL;
> > >                 uvc_urb->sgt = NULL;
> > >         }
> > > @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> > >  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> > >                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> > >  {
> > > -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> > > -
> > > -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > > -                                              uvc_stream_dir(stream),
> > > -                                              gfp_flags, 0);
> > > -       if (!uvc_urb->sgt)
> > > -               return false;
> > > -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> > > -
> > > -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> > > -                                                uvc_urb->sgt);
> > > -       if (!uvc_urb->buffer) {
> > > -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> > > -                                      uvc_urb->sgt,
> > > -                                      uvc_stream_dir(stream));
> > > -               uvc_urb->sgt = NULL;
> > > -               return false;
> > > -       }
> > > +       struct usb_device *udev = stream->dev->udev;
> > >
> > > -       return true;
> > > +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> > > +                                               gfp_flags, &uvc_urb->dma,
> > > +                                               uvc_stream_dir(stream),
> > > +                                               &uvc_urb->sgt);
> > > +       return !!uvc_urb->buffer;
> > >  }
> > >
> > >  /*
> > > @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
> > >                 urb->complete = uvc_video_complete;
> > >                 urb->number_of_packets = npackets;
> > >                 urb->transfer_buffer_length = size;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 for (i = 0; i < npackets; ++i) {
> > >                         urb->iso_frame_desc[i].offset = i * psize;
> > > @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
> > >                                   size, uvc_video_complete, uvc_urb);
> > >                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
> > >                 urb->transfer_dma = uvc_urb->dma;
> > > +               urb->sgt = uvc_urb->sgt;
> > >
> > >                 uvc_urb->urb = urb;
> > >         }
> > > @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> > >
> > >         /* Submit the URBs. */
> > >         for_each_uvc_urb(uvc_urb, stream) {
> > > -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> > > +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
> > >                 if (ret < 0) {
> > >                         dev_err(&stream->intf->dev,
> > >                                 "Failed to submit URB %u (%d).\n",
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
