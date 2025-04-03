Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365418E050
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665705; cv=none; b=Xk7jAiVP9X+88P/IEtEytkmjo17L8ISU8FzaKHqAn1078nuAHwr4EobJ6lHD6HyJ/jQT/2N5KnPiQBZvAUMEodELrrCcMtpmG3gLNyMCPshaS9FBFICYjsdKWr8cIHuHqRPOziKv3oHlUt9V+bCF6mvGFCgR2SbJfhParg5YqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665705; c=relaxed/simple;
	bh=d63kIu9qyG+o/mctmfnCbBSEiAKZDg77+zc89xIvcps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xef8C48+48gUzypW5xKq835THDRw+8/Zg/cU6F6t1g/pK6RSfTZ9mN6/un1EJO4r46jzE9zJhge8nyeY0rl2MySvhojYiNxNT1okk/WJESwawhxy2ZOomL89/EolDx6b7uqIQbACC5Xk15vtooxIUtsbFvw+GLh/vk1rHG/iRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R1DdBZY2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R1DdBZY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743665702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tH1gG9VG04OUG8mFcJOacCTP14bJ6cWs2J5rylrfcUo=;
	b=R1DdBZY2FI8oBcfZSrQ4qhgS31u6eyx/a8+7yXuVwo63J73m+lZdas0kcUOqnup6KfZx/1
	Mr/XPgom1nuPvc3DYQOL7UpVI7yGRoztGwfYDEu2Sde7p2Esr7pr604Hn9LyTijOwrVAPL
	1Bh6TLKB+QoKGN+iEGo1cFkyqs7SLxY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-gUoyqyHcP7K_93IqKgjIlw-1; Thu, 03 Apr 2025 03:35:01 -0400
X-MC-Unique: gUoyqyHcP7K_93IqKgjIlw-1
X-Mimecast-MFC-AGG-ID: gUoyqyHcP7K_93IqKgjIlw_1743665700
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39135d31ca4so304612f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665700; x=1744270500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tH1gG9VG04OUG8mFcJOacCTP14bJ6cWs2J5rylrfcUo=;
        b=YNKrdfzpzJbV7ncYbbPx7J+R3MMulky720npaExw6pKUsH3Ld7A+CHAk9zMnMFo2Mj
         5796ED4oDp9RUqdq6/m1ckKKbufzf7a9ldPyNSwNzG/ZInsfdPBzJ/s0M11sn192FoXR
         TR0V82K3HBZTsZJTmwH6a/9BNsYbSscx0h0DjJCKCXzkb/S70JMSJCZuZ8NIwqu5XSil
         IDmlKqOJETd9sGHobaWSkdvAKY1SzdNPvKJedtFuYnRnvpi7xXqaEEezCKJjYGGjKv0O
         HhOWU/L6Cq8IAn+Gr4YRRQbZF0pu26Xifh6/zp9w8ms20/8emQyFpWwQn/nVSicedQL5
         cc9g==
X-Forwarded-Encrypted: i=1; AJvYcCVLPqbLhnS0WetCUqxdlWUZHm1Bu3TyXwKDPW/oMlT8dgCgP0lYNpD94HrIZgmoDxvCAhzWGxcIPzUUTaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/owa9OFYZrhhOziRs/48zSUZ2mJHauc6h4RLbu0v2ayPAqUzc
	bIKuG04BsR2QhEL92oQ5YMEGmCoZH3T0fM9KSktWVFS07rn08skMCPMRWfrMp6klRUMqqIQrnwZ
	w+Uvvv8Zib8yfuA9PoiTuC46FHVIK33eocdsS43AcL/YNOC6EXDiHevbR5Hozmw==
X-Gm-Gg: ASbGncsWCNyhg117BD04HMw4NqAIIJDmWF0o6BsUSz43dFGsS7N/DY8MerwH1XP0QUH
	+r1GGiVYS7JJJWJCwBOLak9yKwIlR8YPvwE7Rf0L3ulPWdO4dZ7bK7drkZes3DWvpSsz+Hnyahb
	LpcaFr4T6XZt1bg2NU0T6uKA3ajH4QfsnkqCUc9d0FLQacuY7eJANVuqgrdeTu0TQFjgX4pmAVk
	KV0MYaLcrTAlSTosuuaO+ALuGwX4fIkR0VBk3CL75New6xmycwy7s9RBfsKUZHAmlJvoAu+vp6c
	RjFdzNsgdQ==
X-Received: by 2002:a5d:6489:0:b0:39a:c9c0:a37d with SMTP id ffacd0b85a97d-39c2e62f098mr2241443f8f.21.1743665699994;
        Thu, 03 Apr 2025 00:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZIst0XjT/xRVTxo82OPOTNWOFyrC0Ro2il8L8kS+KFxjoLyxc/nBmTOck70Pr3aB191585g==
X-Received: by 2002:a5d:6489:0:b0:39a:c9c0:a37d with SMTP id ffacd0b85a97d-39c2e62f098mr2241418f8f.21.1743665699650;
        Thu, 03 Apr 2025 00:34:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ad6sm1028036f8f.56.2025.04.03.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:34:58 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:34:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403033230-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>

On Thu, Apr 03, 2025 at 03:13:30PM +0800, Zhu Lingshan wrote:
> On 4/2/2025 7:04 PM, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >
> > Device-tree bindings for `restricted-dma-pool` were defined in 2021, which
> > allow devices to be restricted to a given SWIOTLB pool instead of allowing
> > DMA to arbitrary system memory:
> > https://lore.kernel.org/all/20210624155526.2775863-1-tientzu@chromium.org/
> >
> > This facility was not specific to virtio-mmio, but does apply to it. No
> > attempt was made to ensure backward-compatibility for virtio-mmio devices.
> >
> > Define a VIRTIO_F_SWIOTLB feature which allows the device and driver to
> > agree on the use of the SWIOTLB, if present. This enables the device to
> > refuse to operate further if the driver does not support the SWIOTLB
> > requirement expressed in the device-tree.
> >
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  content.tex | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/content.tex b/content.tex
> > index c17ffa6..63d075f 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  Currently these device-independent feature bits are defined:
> >  
> >  \begin{description}
> > +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> > +  transport provides a memory region which is to be used for bounce
> > +  buffering, rather than permitting direct memory access to system memory.
> Hello David
> 
> IMHO, if we need a bounce buffer, why not place it on the host memory?
> Because if the  bounce buffer resides in the device memory, it requires CPU traverse the pci bus,
> that can be 10 times slower than accessing host memory.
> This performance overhead can be worse when transmitting small packets,
> and stress the CPU cores, even lead to IO starvation when CPU over-commit.
> The device side memory is a host thing to the guest anyway.
> 
> Thanks
> Zhu Lingshan


Indeed I personally do not exactly get why implement a virtual system
without an IOMMU when virtio-iommu is available.

I have a feeling it's about lack of windows drivers for virtio-iommu
at this point.


> >    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
> >    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
> >    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> > @@ -807,6 +810,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >    the driver. When clear, this overrides any platform-specific description of
> >    whether device access is limited or translated in any way, e.g.
> >    whether an IOMMU may be present.
> > +  If a the device transport provides a software IOTLB bounce buffer,
> > +  addresses within its range are not subject to the requirements of
> > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
> >    \item[VIRTIO_F_RING_PACKED(34)] This feature indicates
> >    support for the packed virtqueue layout as described in
> >    \ref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Packed Virtqueues}.
> > @@ -885,6 +891,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
> >  addresses to the device.
> >  
> > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> > +then pass only addresses within the Software IOTLB bounce buffer to the
> > +device.
> > +
> >  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
> >  
> >  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> > @@ -921,6 +931,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
> >  accepted.
> >  
> > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> > +
> >  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
> >  buffers in the same order in which they have been available.
> >  

