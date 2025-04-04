Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260481C8619
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763047; cv=none; b=KwqGZQm3FsdSj/xCI3F1p308mK0c7L6Nn1Gl44wnkFw3izvFIvRG2EfX2SY25erT38TQbNk9FBKttXAmYjUMh0EEmC7HvhiRHzFDarkvIPKVPXbi2O4ksp+pC5a4pV1Epu4ZWUIs2v/uuPf1R4sodzSGLT9w8V3rm9p7u10Cx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763047; c=relaxed/simple;
	bh=pRPmkjfy0V1pA4q3T0gjiJCaQdIGsFfNZf2jrIAWVws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa+Ahq/aXoRj4jcRdy1SBEk9anPIK3Fvml6IO3D6H3nKMdTmd29zDkG81aU9tm3PZNoZoX7Z3oTZkklK6DDcsjS80avXP9T8GdpMjc8c3ZIM0tSwXRQotdZCiiFkULzBRIK1ccCplGyhlAKRwP9NUUhqPKd2F1T/xdtH0Vf4tkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cXXubIhr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cXXubIhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743763045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtS55UR2slCo3GWER/92W87Y1PzaJ0wRgzWgDO9B8uE=;
	b=cXXubIhrS1zDPsNpgLdAvoHIP9AD00azHL20A+zY5AQiHxaQ37bW5wSodlsHeX/W/eFPn5
	L/z6opz5gUboWOxgTd6ECj6xJP+pkCbqXyleUScYtEGPzXOaEM+M5rz4nFjgIWTVB/RHNU
	lKvwynuCGDnHjn+fZ7gEDhM8NqkSNB0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-VHjeC09ONt-Cs3xohFCDoA-1; Fri, 04 Apr 2025 06:37:21 -0400
X-MC-Unique: VHjeC09ONt-Cs3xohFCDoA-1
X-Mimecast-MFC-AGG-ID: VHjeC09ONt-Cs3xohFCDoA_1743763041
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39126c3469fso854941f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743763041; x=1744367841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtS55UR2slCo3GWER/92W87Y1PzaJ0wRgzWgDO9B8uE=;
        b=EDOI5sS0wrqkn89Y/1A3BE4EFe3+EBdSXuNwaskQOCrE8ugQ+4iRbMsNmTMQX7ZzrQ
         TuNW/24TX2Gm8XG0n8tLLVA8whYvkyegpqYnNm5pAtO8qiK2ZHnrFygMkvc0QahnCFSd
         djpHJeVado5edX7osqZL/f/Jsa5/PWofD8YBq9VQTv4X41Pe4x8apZ0QNuzxYthDx9E/
         yjZu7mpc08bR1KfzV1XevIJJ709ut1IvSspy96ayCW1RrlZ17KJDeNQONiCOqpfPuZaq
         XI9hmLwN7ua3GgluFa4ZabVhlPZzeGP0Y6qsOGhM3EdTilsGXxmAmoweQRu2yodTdrXY
         Fi7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvxa1KLKJbeLARXN2Qt307cRaVEDjnA38YiCDhLCtSSnJAAaH6epr2ZJOenssy2jDe1BPRTtHyYdK0hD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhK5FYRQPLGeijxV5M8EuBFCvOx149qbi0yDmBIwuZ3ZZjnLGI
	XqtTIh424vUV5RgTnGy32I3LYlkQZcQQH8P8I0DYcNA+v98VE45si3mOYGOCvo5eX+EGlie4nA3
	Oh4tuTC1eUTdnBnv3CyRAhcooDuLjZeheA6LgPQwVEX3TjETAUy7Ob44rCjdawg==
X-Gm-Gg: ASbGncuT4yAGZphPQyrXVbCJN6t+VZ5haNc69Pa7J3oYDqLHmx3Y7m6YZj7ODbgkhtQ
	kCnI3pzfzqNUNRJgEveCvpwUKkYEKFtMhnxXqiApHyKQtECKgrbylFeGq+Mq6LMxCyhOm7cRQRK
	BB/e/gt1jYGUf4bMTYNrIq8tet7F2JQkuPJMZgO+XA98GpttkcBMlURiDMOPUQqziSQpv17YhD5
	SO3TH0N9WQ4G3ASc8atRUtpC1iN84Lf9W9P/bPfrx6491dzFkYWopBcd3CiuUepJ9RaleMh4AKq
	jvYBjuD+lA==
X-Received: by 2002:a5d:6dac:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39cba975b4dmr2222788f8f.43.1743763040585;
        Fri, 04 Apr 2025 03:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHigdXSz3pzqGCZc3nnPbo3rleH3pJMjPfAwyi9dUWc+Sx3RziWNe7GCDc5oTpu3XAafNw0vw==
X-Received: by 2002:a5d:6dac:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-39cba975b4dmr2222765f8f.43.1743763040207;
        Fri, 04 Apr 2025 03:37:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d64dsm4091097f8f.70.2025.04.04.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:37:19 -0700 (PDT)
Date: Fri, 4 Apr 2025 06:37:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250404062409-mutt-send-email-mst@kernel.org>
References: <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>

On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
> On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
> > On 4 April 2025 09:32:39 BST, "Michael S. Tsirkin" <mst@redhat.com>
> > wrote:
> > > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> > > > On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
> > > > > wrote:
> > > > > > What's annoying is that this should work out of the box
> > > > > > *already* with
> > > > > > virtio-mmio and a `restricted-dma-pool` — for systems which
> > > > > > aren't
> > > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > > > > 
> > > > > 
> > > > > That specifically would be just a driver bugfix then?
> > > > 
> > > > I actually think it works out of the box and there isn't even a
> > > > bug to
> > > > fix. Haven't tested yet.
> > > > 
> > > > The sad part is that the system does it all automatically *if* it
> > > > has
> > > > CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> > > > notices that the dma_ops it's using are the swiotlb ops using the
> > > > provided buffer.
> > > > 
> > > > Which is *kind* of nice... except that when on a guest OS which
> > > > *isn't*
> > > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore
> > > > the
> > > > `restricted-dma-pool` node and try DMA to system memory anyway,
> > > > which
> > > > will fail.
> > > 
> > > I mean, it's easy to misconfigure Linux, this is why we love it ;)
> > > Why
> > > is this such a concern?
> > 
> > Because it's incompatible. In the DT world, perhaps this new *non-
> > optional* feature/restriction should have come with a new
> > "compatible" string such as "virtio-mmio-restricted-dma".
> > 
> > Adding it without backwards compatibility wasn't ideal.
> > 
> > > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
> > > > feature, so
> > > > that the device side can refuse, if the guest *isn't* agreeing to
> > > > use
> > > > the bounce buffer in the situations where it must do so.
> > > 
> > > 
> > > OTOH then setting this feature and if you make the device force it,
> > > you are breaking guests restricted-dma-pool which worked
> > > previously, no?
> > 
> > Yes. So a platform offering virtio-mmio with restricted DMA, if the
> > driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
> > accept that negotiation anyway, and *hope* that the driver/OS are
> > going to use the buffer anyway.
> > 
> > I just didn't want to make that same mistake again when formalising
> > and documenting this, and especially when attempting to extend it to
> > PCI.
> 
> Of course, the beauty of the restricted-dma-pool as supported by DT is
> that it's a *system* memory buffer, which is actually OK as long as
> it's reserved address space and not just part of normal system memory
> that an unsuspecting guest might use for general purposes. So the
> trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
> to that space.
> 
> It doesn't *have* to be on-device. That just seemed like the more
> natural way to do it for PCI.
> 
> I suppose we *could* allow for the virtio-pci transport to do it the
> same way as virtio-mmio though. The VIRTIO_PCI_CAP_SWIOTLB capability¹
> could reference a range of system memory space, just like the
> `restricted-dma-pool` property does.
> 
> It's a weird abstraction especially for a physical PCI device to do
> that because the system memory space is outside its ownership. But in a
> physical device it could be writable, and you could consider it the
> responsibility of the system firmware to configure it appropriately, in
> accordance with the IOMMU and other DMA restrictions of the platform.
> 
> That does solve it for the CoCo case without addressing the P2P staging
> case that Christoph mentions, though.
> 
> 
> ¹ I will rename it, Christoph, if it survives at all. Probably
> VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of course
> it depends on the semantics we conclude it should have.

OK. So basically, all this does, is a promise by driver to only
DMA into a range of memory?
This part, I get. I wouldn't put it in a capability, just in config
space then.

What I don't get, is what does the *device* want, exactly?

Here's a vague idea to explain the question:

some embedded devices can have addressing restrictions, such
as the number of bits of an address.
In another example, the legacy balloon device only supports addresses
up to 48 bit.
These can still be useful if driver does not use the inaccessible
addresses.



So far so good? Does this look like a generalization of your idea?


Now, a question: DMA API under linux at least, can actually work
around device limitations using a bounce buffer. It does, however,
need to know what to work around.
So, maybe the device needs to expose a range?
But what is the range in your case?
 

Maybe the new registers list the range of addresses device can access,
and driver promises to be within that range by negotiating the
feature bit?


-- 
MST

