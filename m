Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECE928C5B5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352373; cv=none; b=rA/j+79jX8py2qvDV+R2aDZPr8LQWlsF6WeN9Y5HV8duUbJS0GDKBmmw1EbDZ1ppcplp6+b9EkDrBYy8YqBG0tUraniSIshonYvSYWP1Lar7p5PjAn+huK9QVnQXHJvaS92P7N81G4OalCtG1jmxpmflY5esJvycGH2tjxHwAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352373; c=relaxed/simple;
	bh=uHeSXjDfXn7lYF+oBRLTKymZl/nezk6X31UcWI8RzH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvzF4AK6I21C9piPkU/ut2t1CVCWgJ3AeTwGawCrGc0Dq3sk+3BBOESaePWce7lC3pH8OAN/EB6hmNzZ4ZVsOg3xriC4fYdN9Q4exNx1bv0IXw5BB4iaK4gbWE2Y1rsb23fjAD8Ls921W1z+kPynk692YTZS4/eR2bsQkKl6FUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WuRCjc8p; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WuRCjc8p"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a64e126d9so943077a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750352371; x=1750957171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WU789LESDPx6spX9Gu45wOPXnZU17iFeIzBAgdevUwE=;
        b=WuRCjc8pMdEYngpNswpPQqhsuS6kM8FMq3ebpEwDHa237HEvvi1NS+7h5j0MZvQOHu
         S2fpciIGvFZOvvE/P7Sn8A35DMJZs2mKeVP39v9tirM+tD4mbxmLdMp0eFZbLZtyPbwi
         30jYYuQvTm4yxWBG6aQYPCbJtaxl031ZpzcqO+XxW8nx0dp4ZN83viBS9YRoi3wz9F5A
         7f7w3HFMvCUYrnbklIE81o33gjCQL2XYEqFbv6dAAViBwewVIKcyPnE684fjPfxIrQ/s
         gu2s1Dx6iHUtTEWfm8xkuK7BwVauw1HCsODApo40ZNPXZAf7RdUpHDkObSS+z1ncKT40
         xBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352371; x=1750957171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU789LESDPx6spX9Gu45wOPXnZU17iFeIzBAgdevUwE=;
        b=wLRUFqJ11fGKpSCuKhrt0H3gRTFRS6TFg1vvHLzqIELY+zS5G0TTTeM2jXhalHI1L5
         7du5TT7X+i8GfVaSHBy6SA42KQIjLMiDSKkEqGg875L2V+V4c22lB8FSA8S5n7Ids/BY
         xjQj0DrJQoSNmBSLQDN/KuRjEcVjp/z3122Kdok+K5Lp1zfHO33YRGQhWEYhjuJYK3p7
         y8AHtmmR4SegxvnjziZxi46LnKnvznmEvRqrjfEI6UboT8H/f55hcRG0L75SS/q5jIDy
         L6CR0eFXKNAdFgOnyav5/jQWzbZe6uaYKNmD9u8O8ctxXhqGD+bP8UpmC5EHyBu9wMFf
         DiKg==
X-Forwarded-Encrypted: i=1; AJvYcCXWUnE/7X6FCD75mloLu+dyGRyqAK3PIPwSvKlbDFhxNi67ehf2ly83Tzl1UU3r+6yMbLikAUIxYKFjFVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaNS1+RXqOVAVWFX3QlqXtSuWJM8KJB+Y3RFSZnFgvJiLR3Yd
	xmvNRAtzLRbJxsOTKwA307lNfIwEavVgZEgUy4BHZsENhk4GS8ih7uqQijkDOSbhtsc=
X-Gm-Gg: ASbGncvU8u4yk7aXfVbOI7Jmzyhm4J7a0eV34FlDcpQ0T2rceKHlMFHS3zkDEGXHkt5
	QNOef4Eva1siVLpbSS8RVlnYD13wTnOg1yQUhNuzn6PlcCSV0a9K9sbjBgU8YyM9Jxh9eI5OZQ5
	zLDJQpgp9larUWfSO7LIXlhtm1bAPpP7aBkhM2iL5BNs4AHEyrFwtSNnHQ1S2bQnOrx9Sl7/Y5G
	ORHTqk5tmpbZ7A0H1s9JhNQE98i4f92tD2njhSa+4hksTjzkiRQ9WUTyH79aNHBYIU/8VAUV9WN
	jnIO1UhKIb2ezDsWwG/uV4Zk381TX5e2LKHb
X-Google-Smtp-Source: AGHT+IFIVSAeEPqWaR7ouc36Dp5BIP5quliMTNtM08oDDkQu9GEu/sRTek8upP25DBEtFCz1lvvpVw==
X-Received: by 2002:a05:6830:6c8a:b0:73a:8a8a:5151 with SMTP id 46e09a7af769-73a8a8a5334mr1331051a34.17.1750352370711;
        Thu, 19 Jun 2025 09:59:30 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284ff5f4sm2339324a34.43.2025.06.19.09.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 09:59:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSIbo-000000003GJ-3nRB;
	Thu, 19 Jun 2025 13:59:28 -0300
Date: Thu, 19 Jun 2025 13:59:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250619165928.GA10257@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>

On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
> 
> Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :

> > Ugh. This ignores the gfp flags that are passed into map because you
> > have to force atomic due to the spinlock that shouldn't be there :(
> > This means it does not set GFP_KERNEL_ACCOUNT when required. It would
> > be better to continue to use the passed in GFP flags but override them
> > to atomic mode.
> 
> I will add a gfp_t parameter and use it like that:
> page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);

This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
works..

> > > +static int vsi_iommu_attach_device(struct iommu_domain *domain,
> > > +				   struct device *dev)
> > > +{
> > > +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> > > +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> > > +	unsigned long flags;
> > > +	int ret;
> > > +
> > > +	if (WARN_ON(!iommu))
> > > +		return -ENODEV;
> > > +
> > > +	/* iommu already attached */
> > > +	if (iommu->domain == domain)
> > > +		return 0;
> > > +
> > > +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
> > > +	if (ret)
> > > +		return ret;
> > Hurm, this is actually quite bad, now that it is clear the HW is in an
> > identity mode it is actually a security problem for VFIO to switch the
> > translation to identity during attach_device. I'd really prefer new
> > drivers don't make this mistake.
> > 
> > It seems the main thing motivating this is the fact a linked list has
> > only a single iommu->node so you can't attach the iommu to both the
> > new/old domain and atomically update the page table base.
> > 
> > Is it possible for the HW to do a blocking behavior? That would be an
> > easy fix.. You should always be able to force this by allocating a
> > shared top page table level during probe time and making it entirely
> > empty while staying always in the paging mode. Maybe there is a less
> > expensive way.
> > 
> > Otherwise you probably have work more like the other drivers and
> > allocate a struct for each attachment so you can have the iommu
> > attached two domains during the switch over and never drop to an
> > identity mode.
> 
> I will remove the switch to identity domain and it will works fine.

You'll loose invalidations..

Maybe the easiest thing is to squish vsi_iommu_enable() and reorganize
it so that the spinlock is held across the register programming and
then you can atomically under the lock change the registers and change
the linked list. The register write cannot fail so this is fine.

This should probably also flush the iotlb inside the lock.

> > Which will cause the core code to automatically run through to
> > vsi_iommu_disable() prior to calling vsi_iommu_release_device(), which
> > will avoid UAF problems.
> > 
> > Also, should the probe functions be doing some kind of validation that
> > there is only one struct device attached?
> 
> which kind of validation ?

That only one device probed to the iommu?

Jason
