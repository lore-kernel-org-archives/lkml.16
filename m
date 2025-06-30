Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AE1E7C10
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266510; cv=none; b=ATuM2+38/xy3Q8Fbwn3ctZ9ggqoBtZxTfy9Ui6Ys96IbgM6FddKxIaE6+RYAZ/UKi4AnWnwFTQwS4x5jHIZul43SfFo4hSa4a7mQUCpq/CRGvWke1orbLKlych6509k84kMKE047Iaa+yFZWr+D8V2Czl9/h2An3UVSn9GoENbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266510; c=relaxed/simple;
	bh=W3/qUmYR6QyOvmumbF5zNgCLQg69m81T3y9dtD4rHzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3QJHcExFtL0Fz6Z1HklP5Bh6B1T23UnKZXs5M7zRj2Us/aJyWAE615OcOeoak6Ko0r9ZujB4CddVrV8g2ttLpkkyPrBfYG/xOMnQSSeEzI6t73XQKLlN2IoueZaViJrpi/PQEQArHM6v44nnRzuQAGT11dFZjXoXwXB1fIs4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PAN2Pxpp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PAN2Pxpp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0d11bb2a7so595285266b.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751266507; x=1751871307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=PAN2PxppL7vITxOtcii9RB9Ilu8WJHoZkU2lPBh2Nizz4hxeaOf/Wl5mFCiACXOBvJ
         6P/DOiCGc6l0dOjkXCLvYdadjLb8YblS466iKQaKFScLCMP23Csoy42STsuHsXzNuCQe
         NeChu08ItU66iDbEE++lEMUDmVdvvpcksSrJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266507; x=1751871307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pku19sNVP6VuOr/+3IUAfIt54nYSogJc7sn5HCCxY5g=;
        b=xNo7EFbymJeKjALnxqDjQ0MFdRP2f/y2LjDAOLXE/ysSGnixlKPMlyVvtSF+4PLcwT
         YYnukNo+KHRlbDvebEZn55Y490IvRSqxY1sOF0xDQDC9CTbpPqZnKv+HQo5DTW/9xm6S
         xhURnl3zBe1+e/ChEpYQfstsTA4gTwbfPHVcaQ4XLKlRdBap04h0GxuEjETOz/72XVqA
         oWIdt0Rti8FelneLZbifhFuhfS0zM1fu7gjEwFaOVAaYOfBaaDq6td0Lo2w8leJjsBAh
         /xSutWXhwtu91HxwhyN6Vju+w3cclSL1DO4ZitZv3xC6fA9dV3dukmoQlIzpuduE0PJY
         d5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiBKkcxe6KH/DoQKkSNZEUDVgP2umXNMYrXjsAjsk/ZGY+kXCijVHgb5Du4YJ+HnZ8OrrIzUgum2B9jmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyteqM6aaG/AeELLtK9AebPQTk/wpwjdHSVfY/JlEoktn0npEJM
	d3OCtMdZiwxLooY4Urm+bFSk7U4Eqg+TccesPdiMo1VHi+yo0+Ui49ny9tMqs2k6CqX5Floj+jt
	xpldoWg==
X-Gm-Gg: ASbGncukBbOb6W5nl140Mvll0nLiwocIIftM6eAz/7LoUQQLoLhRI7tseYviIPmZEfC
	hHnG8tHGsW2pK51IB7T2OQdocpOYhtEUq6pTg0I7gWX3Lq9JVLclw1NPB0lZq714wqSrSz5IyB8
	qNzXDjKrtvU6LbpaF9+CPTWXRgqEbOgJDlaQ90GQVLixj0zCAWp+QmrVfJ+7Yo6eKNrisGp45Bm
	CYr6oIfUhL47CHcYmaDNWBiozEHPtdEoqTpI2IY/2zTRrkev124JPUC2JkJoo4kHzngQ9BBc85m
	LlgTWYm9e1W8lzKfZTraLKcpdU/lPWTLDCABs1Y4IY1y+6rwPEbet0aF0nfCdDsiT1l8LBeSLOW
	yAVzsHv1iORlw6/JdV0YSw2ea
X-Google-Smtp-Source: AGHT+IG1EBJjDSZA1j0LVTIxAPAKcpUtDwdHN4heEEvSu/EQEWyq7JDqTVbVfjg/dpP/TWct2F/tGw==
X-Received: by 2002:a17:907:9721:b0:ae0:de30:8569 with SMTP id a640c23a62f3a-ae34fd1227emr1104983666b.1.1751266506673;
        Sun, 29 Jun 2025 23:55:06 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b06esm623110566b.17.2025.06.29.23.55.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 23:55:06 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4316706f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/Rp794JjkPFWj17t4trCRvUUr1Qqvi2OuUr6diKxtgQOp4HXvHwz9BBADBJ/sPlvtvMDkf/GRyznAsAs=@vger.kernel.org
X-Received: by 2002:a05:6512:3e2a:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-5550ba2bc7emr3296124e87.47.1751266115614; Sun, 29 Jun 2025
 23:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627101939.3649295-1-xu.yang_2@nxp.com> <20250627101939.3649295-2-xu.yang_2@nxp.com>
 <1c4f505f-d684-4643-bf77-89d97e01a9f2@rowland.harvard.edu> <20250629233924.GC20732@pendragon.ideasonboard.com>
In-Reply-To: <20250629233924.GC20732@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 08:48:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
X-Gm-Features: Ac12FXygHhnlFKiXR-4gqAGeNFFl6ex4EPtMW2SIZttm2I0yNPjkXicKbD_z69Y
Message-ID: <CANiDSCswzMouJrRn2A3EAbGzHTf88q_qQ=DC_KX7dbf_LJzqBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Christoph Hellwig <hch@lst.de>
Cc: Alan Stern <stern@rowland.harvard.edu>, Xu Yang <xu.yang_2@nxp.com>, 
	ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 01:39, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jun 27, 2025 at 10:23:36AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:19:37PM +0800, Xu Yang wrote:
> > > This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> > > functions to support alloc and free buffer in a dma-noncoherent way.
> > >
> > > To explicit manage the memory ownership for the kernel and device,
> > > this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> > > and call it at proper time.  The management requires the user save
> > > sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/core/hcd.c | 30 ++++++++++++++++
> > >  drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/usb.h    |  9 +++++
> > >  3 files changed, 119 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > > index c22de97432a0..5fa00d32afb8 100644
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> > >  }
> > >  EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
> > >
> > > +static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
> > > +                                        struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> >
> > Are the following operations really necessary if the direction is OUT?
> > There are no bidirectional URBs, and an OUT transfer never modifies the
> > contents of the transfer buffer so the buffer contents will be the same
> > after the URB completes as they were when the URB was submitted.
>
> The arch part of dma_sync_sgtable_for_cpu(DMA_TO_DEVICE) is a no-op on
> all architectures but microblaze, mips, parisc and powerpc (at least in
> some configurations of those architectures).
>
> The IOMMU DMA mapping backend calls into the arch-specific code, and
> also handles swiotlb, which is a no-op for DMA_TO_DEVICE. There's also
> some IOMMU-related arch-specific handling for sparc.
>
> I think dma_sync_sgtable_for_cpu() should be called for the
> DMA_TO_DEVICE direction, to ensure proper operation in those uncommon
> but real cases where platforms need to perform some operation. It has a
> non-zero cost on other platforms, as the CPU will need to go through a
> few function calls to end up in no-ops and then go back up the call
> stack.
>
> invalidate_kernel_vmap_range() may not be needed. I don't recall why it
> was added. The call was introduced in
>
> commit 20e1dbf2bbe2431072571000ed31dfef09359c08
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Sat Mar 13 00:55:20 2021 +0100
>
>     media: uvcvideo: Use dma_alloc_noncontiguous API
>
> Ricardo, do we need to invalidate the vmap range in the DMA_TO_DEVICE
> case ?

That change came from Christoph
https://lore.kernel.org/linux-media/20210128150955.GA30563@lst.de/

"""

Given that we vmap the addresses this also needs
flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
VIVT architectures.

"""

>
> > > +   invalidate_kernel_vmap_range(urb->transfer_buffer,
> > > +                                urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
>
> In the DMA_FROM_DEVICE case, shouldn't the vmap range should be
> invalidated after calling dma_sync_sgtable_for_cpu() ? Otherwise I think
> speculative reads coming between invalidation and dma sync could result
> in data corruption.
>
> > > +}
> >
> > This entire routine should be inserted at the appropriate place in
> > usb_hcd_unmap_urb_for_dma() instead of being standalone.
> >
> > > +static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
> > > +                                           struct urb *urb)
> > > +{
> > > +   enum dma_data_direction dir;
> > > +
> > > +   if (!urb->sgt)
> > > +           return;
> > > +
> > > +   dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> > > +   flush_kernel_vmap_range(urb->transfer_buffer,
> > > +                           urb->transfer_buffer_length);
> > > +   dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
> > > +}
> >
> > Likewise, this code belongs inside usb_hcd_map_urb_for_dma().
> >
> > Also, the material that this routine replaces in the uvc and stk1160
> > drivers do not call flush_kernel_vmap_range().  Why did you add that
> > here?  Was this omission a bug in those drivers?
> >
> > Alan Stern
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
