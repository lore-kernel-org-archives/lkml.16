Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9D23A981
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607230; cv=none; b=V5SqY1CEkMAFxYhOZBJGQ9iCibgvNoaZ4uCvpgfCggMjXkiiRyv5PXbDETQA4ndY+CyJCJUHf1ee4blsQ5MNeKQda7wXyDZVSMtrgCHAR2lV99GWCkV0cVWe1+ClQU3BJAS4g8pUq1fNuv3sS8GS2awdHsLU3a56TBdM84js4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607230; c=relaxed/simple;
	bh=+b92sWod3Pyyl1o4aU9Snn+KxIzAz3pTx5hqfoib3Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjrOIpRQV+Ls5V1mkabWbu/2txqJXOP5hoagQFgUHtdvrkS/k7+JA3/mjhYiKo6if75q7zArT7bEV90BJSXY+8qYZeOKeVQh4CCaHk6IOdiUumZVSO12z4FD0438Hy1ECxvEa9lP/hOP40gm/veXcJR3FNGHqzZZcREVpkDduHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I2zHZvns; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I2zHZvns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743607226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCjO/jg476aPhvJWTSZ2R5DfWu0jRUcVuT6vyzuQExs=;
	b=I2zHZvnsKfoXTka696aobOq2wA98A+KORsVzdTBnsnOFWHox0QvobUh3r3IcQ9qQc9QjnP
	SBmHx7M+dVMR7hDmR74g0fJEoZdUgTrl2OA1gggpWC856bUlVvOCElf15Tzzf6yAEhlCKq
	u5B0W45eswtWwxb3FSgrpqV4tCXup4I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-o2SgxHUDMymhCRihmBHUiQ-1; Wed, 02 Apr 2025 11:20:24 -0400
X-MC-Unique: o2SgxHUDMymhCRihmBHUiQ-1
X-Mimecast-MFC-AGG-ID: o2SgxHUDMymhCRihmBHUiQ_1743607223
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c2da64df9so98608f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607223; x=1744212023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCjO/jg476aPhvJWTSZ2R5DfWu0jRUcVuT6vyzuQExs=;
        b=S0nQ14pZmZZtmzL5Fqf2PTYSZbt35Qj5fo5KIZZaxMcPy1gBzKeoO9liUC4OucHrUy
         8i43vlwWshGXcHihaz/0/tb10rIY5zV/w51u7q05EvPLW0J3oss6z/tVsHs79JUBo9A9
         fcyOw7qdN9+IGMURpZUmczwNiq8nAOXAa+pdlED9IFhM5WDY8GHNlCbXAh9FD2sN1jKI
         I94ViPr0gFKjizFLcFVgkSAX4taSLNCvc9sVtmtYDFD40dw68XGcw6CUHaHiEDnR8CnE
         AEw6szPXbt/+e41WS7tBFeWsqADTZOW/7rtuvvZSVAbdcthM4DReTQIszFAbVFfaxzxJ
         BFsA==
X-Forwarded-Encrypted: i=1; AJvYcCU7fRvYvCH3ALSc5Q+OMLFpP3c9vUQtHeaZklcK2tdWTdZCzloXyE3FZUVMVHfY+WHb12LcLwWC1vKku9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTqaO3/75vkbF5qviLzblaZvH9eJUYW9lYodm9C2eypK62bnw
	H7abW/oXoM7Y/PlXiAx5eUXkeTv0Wvi6413Z5b+cUbVR2B1EGTFwnzN4/WkiBQQqlM6I9dCNORi
	lRJxT7W8ftVGxIl0Ta5g+pnJX/MxoA9Pm4VAb1Ahc+AoU0+4jwCGfuZUm3chrWw==
X-Gm-Gg: ASbGncukPwt4ske+xCjV95di8RoCbeEf2xYATR6JQEWCy5kYA8UcTpmfl1M3c/jVvGq
	YLcUg0fGuftbpyk55mi0QIJmxpZ7IJpz2CogD2kAfwc17WUY29/fO9T6sOOhF1+k8MnQEAO3wND
	OH8HNzbSFP8q0yh2lzxxHsqCoZmqIqiRQh6zXTqFGsZLYWnGFaP8YSGVRUZpo04iE5ZcLLfVGUF
	92vcRNnv2Lp+ob4cWlTwlXMlAl6ZJywBI5gzROOaMJEElBruPae4n1p8RupUfCQdiJC8ULRE2nI
	2rhyaG2ZHQ==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr14470275f8f.51.1743607223243;
        Wed, 02 Apr 2025 08:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpHyim0L0aPyGRpaixi2bJsAX4/7cDZgTTVY5gXTNdfdDHVgDUqp1bdyCkhiqSpkJTWrL3WQ==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr14470256f8f.51.1743607222925;
        Wed, 02 Apr 2025 08:20:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a96dsm17010175f8f.44.2025.04.02.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:20:22 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:20:19 -0400
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
Message-ID: <20250402111901-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>

On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > +  If a the device transport provides a software IOTLB bounce buffer,
> > > +  addresses within its range are not subject to the requirements of
> > > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
> > 
> > I don't get this part. the system designers currently have a choice
> > whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
> > with PCI, for example, BAR on the same device is naturally not
> > behind an iommu.
> 
> In the PCI case this *is* a BAR on the same device, and is naturally
> not behind an IOMMU as you say. This is just stating the obvious, for
> clarity.

Then the platform already does this right, and it's better not to
try and override it in the spec.

> For virtio-mmio it also isn't translated by an IOMMU; that was the
> *point* of the `restricted-dma-pool` support.
> 

Clear VIRTIO_F_ACCESS_PLATFORM then?

Generally, it is preferable to keep all features orthogonal if
at all possible.


