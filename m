Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150717A2EE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743964098; cv=none; b=gnhJJN0+2ybfh6iGxHF9XLjIYqK6SYzljitkPfJ1YJqZYu5aAsnnqRjvGWLJBU1Sl2DHgAV0Ln52qyfloBHr1MbS9F+LY8XhZAO/reEgAfh5am6bz+gu2XezaHpc+HtXloUFewMDZHfTSVneqZZD8dmYfVh/+AZr2V6A18xzcU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743964098; c=relaxed/simple;
	bh=QO4YgeSl0i5WYqse9b0k2XDA2qWOnb5rpKGHL35a7NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cdbd2AIoorvGLUZRmXEA5CNz+62v39G09TDgXZp8nyG7nE1apc+Bok1rOUVPtd+tDNMvFItF0Ezy5v+ipGB02SjmcY68zmvi4oPDQNCTKcnbdb4JkSTI5kd1BdE0SOzp4e0emJvcj4gWz3tmivBbEr+WFZfyNZ3HC3S12DSBt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Io2/pkMG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Io2/pkMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743964095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUpzOoybZCjV/WY+gmOrQcMd2Tvg8+iKrIdRhgWrjew=;
	b=Io2/pkMGoJ4prYpo96KOo+pPNU678gYsFiGMKzdRdvGsgsMgqBvmc/bY+Sl/NHXt6xvBEY
	i/ef0K8i8DxrwXEPi4hDtaMp/rNxYMitDDBsbHZyGs3RVH+mqdNym2qgv/TvodpLXJwZRa
	H+eX286jS4y2uzZ+RlRdVJKg+AUt4Qc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-KTB6388WMS6ZwkLLlLkfCg-1; Sun, 06 Apr 2025 14:28:14 -0400
X-MC-Unique: KTB6388WMS6ZwkLLlLkfCg-1
X-Mimecast-MFC-AGG-ID: KTB6388WMS6ZwkLLlLkfCg_1743964093
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so27851215e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 11:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743964093; x=1744568893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUpzOoybZCjV/WY+gmOrQcMd2Tvg8+iKrIdRhgWrjew=;
        b=elbfzjHn07wKlgj2C8ZwmrNTSQJgSVZwchbF8schoIhD5fkfWlz367/uTt8elfcWaU
         nsTPs3e6V6LCXRiweLI5K5b6RXXbTE7l8dLS5X99qM8TmR66XHGmR/JpkEa423nKvYrB
         9Y1Rb3fNW/SJyiPVyTc/IvvFP06iAEUawXYG3ylbPiAfDFjtFzqJJx4Q0Nk0PKfjArdS
         YOheE04q/LNm2k+pEj/UDdocqmhxa1jU1t7NmyZOzg7ytoMQgWln7pfnqq95ypJXjvfO
         UUkDCq1sr6Z+VP25tJdSMhnm5PRTLSbma8StyfzFZKVzhzhsqC/QFo4SwnWaCoKhmC6o
         896A==
X-Forwarded-Encrypted: i=1; AJvYcCXvrN/BvLAkkHU50RmI7g+dJ/M/1fLcW5GUd9SVkVaZ0kbD9pKBCQldy95bLPnmmQuHt7YT7Nsoea2KE3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRcygycPhNmO17SIy4z7Hq8JWHNMjEK/O8C21/q/UQuRoS9kP
	Q0u7SeoIOh1ayN8ujriHWIQuzcH8zrgZG8RKEgwCEFYspvBahQqfmLDWLZEY7R55TsjcWRJGDgt
	y3dJA5glU6ufoMXwREVe1yPT+qvjHz1F6O20QKlf4T1Ikiivwqghvtoq5Qj/tAA==
X-Gm-Gg: ASbGnctr1Nr+aWVz+Y/gaTaLMnvsITmrXRWnCugrSKoRk2cqO9Rh43Vmh+gny4f4RaW
	zDBj4WUzIcWN8aHjxcE+iE1oilrscmL5kE0u6PalkLGQaIt6Z55MHb9/ArQHyrECDAo6Ut+Ye+a
	UeS/xxOXnNj68+P9HIMoPRXqmB7EyndeecQl8/xv8XxRQqetJdfkVOldEoZpg+Uiq5lO1iK+72L
	SEZBgXVjlq0rIz6NJA0Af2NW5IXNaKF3J7RKsh5xohWQ3ezK+J5P6vTDX+Pt/gzPlDbSph4h0kk
	cDmfUewiaA==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr38603395e9.20.1743964093108;
        Sun, 06 Apr 2025 11:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFFNEz0BaTWmqRTlho9bh/h+LO78mwXJbiMmvuhqlDLyW02fPdmXPDwKzB0L/AQ+PSp6rbHQ==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr38603325e9.20.1743964092759;
        Sun, 06 Apr 2025 11:28:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096b9csm10093725f8f.13.2025.04.06.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:28:11 -0700 (PDT)
Date: Sun, 6 Apr 2025 14:28:08 -0400
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
Message-ID: <20250406114130-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>

On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> On Fri, 2025-04-04 at 06:37 -0400, Michael S. Tsirkin wrote:
> > On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
> > > On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
> > > > On 4 April 2025 09:32:39 BST, "Michael S. Tsirkin" <mst@redhat.com>
> > > > wrote:
> > > > > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> > > > > > On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > > > > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
> > > > > > > wrote:
> > > > > > > > What's annoying is that this should work out of the box
> > > > > > > > *already* with
> > > > > > > > virtio-mmio and a `restricted-dma-pool` — for systems which
> > > > > > > > aren't
> > > > > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > > > > > > 
> > > > > > > 
> > > > > > > That specifically would be just a driver bugfix then?
> > > > > > 
> > > > > > I actually think it works out of the box and there isn't even a
> > > > > > bug to
> > > > > > fix. Haven't tested yet.
> > > > > > 
> > > > > > The sad part is that the system does it all automatically *if* it
> > > > > > has
> > > > > > CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> > > > > > notices that the dma_ops it's using are the swiotlb ops using the
> > > > > > provided buffer.
> > > > > > 
> > > > > > Which is *kind* of nice... except that when on a guest OS which
> > > > > > *isn't*
> > > > > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore
> > > > > > the
> > > > > > `restricted-dma-pool` node and try DMA to system memory anyway,
> > > > > > which
> > > > > > will fail.
> > > > > 
> > > > > I mean, it's easy to misconfigure Linux, this is why we love it ;)
> > > > > Why
> > > > > is this such a concern?
> > > > 
> > > > Because it's incompatible. In the DT world, perhaps this new *non-
> > > > optional* feature/restriction should have come with a new
> > > > "compatible" string such as "virtio-mmio-restricted-dma".
> > > > 
> > > > Adding it without backwards compatibility wasn't ideal.
> > > > 
> > > > > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
> > > > > > feature, so
> > > > > > that the device side can refuse, if the guest *isn't* agreeing to
> > > > > > use
> > > > > > the bounce buffer in the situations where it must do so.
> > > > > 
> > > > > 
> > > > > OTOH then setting this feature and if you make the device force it,
> > > > > you are breaking guests restricted-dma-pool which worked
> > > > > previously, no?
> > > > 
> > > > Yes. So a platform offering virtio-mmio with restricted DMA, if the
> > > > driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
> > > > accept that negotiation anyway, and *hope* that the driver/OS are
> > > > going to use the buffer anyway.
> > > > 
> > > > I just didn't want to make that same mistake again when formalising
> > > > and documenting this, and especially when attempting to extend it to
> > > > PCI.
> > > 
> > > Of course, the beauty of the restricted-dma-pool as supported by DT is
> > > that it's a *system* memory buffer, which is actually OK as long as
> > > it's reserved address space and not just part of normal system memory
> > > that an unsuspecting guest might use for general purposes. So the
> > > trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
> > > to that space.
> > > 
> > > It doesn't *have* to be on-device. That just seemed like the more
> > > natural way to do it for PCI.
> > > 
> > > I suppose we *could* allow for the virtio-pci transport to do it the
> > > same way as virtio-mmio though. The VIRTIO_PCI_CAP_SWIOTLB capability¹
> > > could reference a range of system memory space, just like the
> > > `restricted-dma-pool` property does.
> > > 
> > > It's a weird abstraction especially for a physical PCI device to do
> > > that because the system memory space is outside its ownership. But in a
> > > physical device it could be writable, and you could consider it the
> > > responsibility of the system firmware to configure it appropriately, in
> > > accordance with the IOMMU and other DMA restrictions of the platform.
> > > 
> > > That does solve it for the CoCo case without addressing the P2P staging
> > > case that Christoph mentions, though.
> > > 
> > > 
> > > ¹ I will rename it, Christoph, if it survives at all. Probably
> > > VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of course
> > > it depends on the semantics we conclude it should have.
> > 
> > OK. So basically, all this does, is a promise by driver to only
> > DMA into a range of memory?
> 
> Basically, yes.
> 
> > This part, I get. I wouldn't put it in a capability, just in config
> > space then.
> 
> Sure... but how? There are some things which are defined to be at fixed
> locations in config space, like the vendor/device IDs, COMMAND, STATUS,
> BARs, etc..
> 
> And for the rest of the optional things which might be in config space
> of a given device... isn't that exactly what capabilities are for?


Sorry I am unclear. Not the pci config space. The virtio config space.
After admin_queue_num ?

