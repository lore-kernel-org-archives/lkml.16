Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383D2356D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605657; cv=none; b=JfNyLH+xzA5f9WU5MUUp8suL98J1s0TsSKxa7BPM0JGcdZ20vNJ9pywg1SkJ+dWHDSE1GIJn1k3N5VQCSFTZmtEJrPvY1g+aRCGuyc5srwDPMO0SSnw/hnzAFK3ltQUTuCqhckwJXfJ/jJPJPwMtaShfVo4Smqzusz6asSO/6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605657; c=relaxed/simple;
	bh=GQBUmlJtouPTHL2D0z387jKeA8ysEZB0JB27Rzluxvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGcM7CPhdLY4vfkkan+ULjCm8C54zuY1Bs7A5RyghgTVbglw7FDCEGmRwR0UBd2/VHSOR8qEWJ/W/Gw/C3vOaOQw/UsEZgxWuC5UPrHotgZP2PC4EXN2D3eVyNErxW1t4wtlDXFa9//eXyl0zJ16UztbZ4n1pzah3WqvgBd4ohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvRPvI3O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvRPvI3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743605651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT3T8r9bivYjQcCb2PJ3vqTiUiLOTviDPtnxa540ZNU=;
	b=CvRPvI3OsA059gbDvQQIjskxcPYLTrK8n2S8sh6Ke2FP0PSnYYlVmZyfnn4wciFrB1rHxX
	IrUGT9RLt7fbSBEVLu6Lr+/Tdn5d8wRfAXiVqAtTRMfcbpC417B/pZ/kkT0U7GadXOMb10
	Ne4UEUHZM9D1wQXjVmeEE/itkpnN1rY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-p4O_Vs8TM-qKs0VTtpNAkA-1; Wed, 02 Apr 2025 10:54:10 -0400
X-MC-Unique: p4O_Vs8TM-qKs0VTtpNAkA-1
X-Mimecast-MFC-AGG-ID: p4O_Vs8TM-qKs0VTtpNAkA_1743605649
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso4494453f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605649; x=1744210449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT3T8r9bivYjQcCb2PJ3vqTiUiLOTviDPtnxa540ZNU=;
        b=O6bzzEkz5ST4wfIdIs3mvT6YmJFT4GtCx1QPLyRgmltqebprTBTpW63BpRpxRyE0Ml
         +j9FsEtf26i4a9k3Rdo284qU3Kefe0x5ljewhwgHFgp1NigKEx3ow/BXLNNBRY8Gj6rb
         h+vnqd8lhcbPXX3UknjV6hN9Lkc0H/EeoKqk/8gacVwCoTDfUAN9MsKyTLTui63Ihiam
         +hsfuO4hxupugz2oEmZ65Zes8yZ0SlDc2rNY2DxIbc1wNj+ALg6RY2iptSk7iQMA5lx+
         Uiuc6Q+w2/hoBUj/pHXwYiRYE+np9zcz2sSQv40fFOzBZfcAvwjIjOlfEf6iKU3jWBOe
         +lAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEPhKviyWDfIRRimtsjynlJ0K9uqmxgHM/CP7YN1zDpYpANbcvLce+mb2Y0Xn1RH5Cu80yQ2T5E7szOZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJVxdq9mSuSrh22ViOjN8ueA8fjYc47OY2qcvcRg3Aeifg1nDD
	b4F0eboHDhHeQ+lyx6eiBTBUCruHgY2Mfup1FIU61spBc6Ha1GKkNdKv3tajoHSfQeXKDJLzgsf
	sRUcfoMTZfk5G/i3GGsBkh/X0gjgYkLKKiOL6eIvcWvgjfbm6S2EXGD7FoCBrdw==
X-Gm-Gg: ASbGncuvkvisRGdEExx74yGepGaJkXCoIf61iG7vtr/vLNtZr8CtGB4NK9avQXueEDy
	gjP0Iwwhas132H/fgd6vJr7uDVECDNU7gikgt+QJXu/pYfXzaB41CvqlmeuLf/e9RUkkZs5aFWJ
	bcu3qodmXJiMZFPM6ErykDVZPUb9Q9Z+rJk4G5+peVwdmgH9PTPf09aSRKbPElKLe30VvSE2xPs
	QoN9z/S2cFfc9a7HzXhywduvJ7MgFRTo5q2jXTuMluUz23xYhytwtxHdGQg+E5CUFvo/Uf+UrTY
	l1ZsrANczQ==
X-Received: by 2002:a5d:5f90:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39c29737faamr2656204f8f.12.1743605649338;
        Wed, 02 Apr 2025 07:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3aSe1fBS4Qdu5ZBsQ2H6BJae2MKkwKU+4XOXjshIZExrVJISjZyrr4js2K+lUUR/iW6y00g==
X-Received: by 2002:a5d:5f90:0:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39c29737faamr2656183f8f.12.1743605648968;
        Wed, 02 Apr 2025 07:54:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1626sm23036825e9.16.2025.04.02.07.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:54:08 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:54:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250402105137-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402112410.2086892-2-dwmw2@infradead.org>

On Wed, Apr 02, 2025 at 12:04:45PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
> allow devices to be restricted to a given SWIOTLB pool instead of allowing
> DMA to arbitrary system memory:
> https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/
> 
> This facility was not specific to virtio-mmio, but does apply to it. No
> attempt was made to ensure backward-compatibility for virtio-mmio devices.
> 
> Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> agree on the use of the SWIOTLB, if present. This enables the device to
> refuse to operate further if the driver does not support the SWIOTLB
> requirement expressed in the device-tree.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  content.tex | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..63d075f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Currently these device-independent feature bits are defined:
>  
>  \begin{description}
> +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> +  transport provides a memory region which is to be used for bounce
> +  buffering, rather than permitting direct memory access to system memory.
>    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
>    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
>    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> @@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    the driver. When clear, this overrides any platform-specific description of
>    whether device access is limited or translated in any way, e.g.
>    whether an IOMMU may be present.
> +  If a the device transport provides a software IOTLB bounce buffer,
> +  addresses within its range are not subject to the requirements of
> +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.

I don't get this part. the system designers currently have a choice
whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
with PCI, for example, BAR on the same device is naturally not
behind an iommu.


>    \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
>    support for the packed virtqueue layout as described in
>    \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
> @@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
>  addresses to the device.
>  
> +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> +then pass only addresses within the Software IOTLB bounce buffer to the
> +device.
> +
>  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
>  
>  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> @@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
>  accepted.
>  
> +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>  buffers in the same order in which they have been available.
>  
> -- 
> 2.49.0
> 

