Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0665289359
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432297; cv=none; b=TEczF8fTeGMmpFUTMZJ4VBi1SYlfL3wtqH8yNgooOtKqPd5AEumPmcQSwKyrjzfteNRfbqI6lpHlPuzn4Bn39Z51j40Nh90/mx8gKupVj9RWYRY+bFpaPv9qcVToGAWDyeXwE6/YOaWWGSafMKCP7A2W5IK1kFu24N+oS2r0m6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432297; c=relaxed/simple;
	bh=4Lb81w2s/iHKlg0tr1kLg33vsHa3w3DDNgPzLbNjD+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5d2p+exW3L5CHKU7NqZIK0n8KSfSDSDvrydTf/T2jV4Vb7P6VZwHK9c4rXyEXKKTR0BCQGlDKCJrxXkgCMVrF4IPjCSMOjTPi90formZdGQY5WpV8v6/9eOv/l7BX9OalJhevgxBJeY3uhTUqcRqCbS4xpm2OAmgxtJ6THR8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mw0BLyt3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mw0BLyt3"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f6970326so2117006d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745432295; x=1746037095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2K4Lg9UXWodayqGkEaP9bm9sDSNteHJq58dHhFg6dY=;
        b=mw0BLyt31cJrngz/aBlEqUNCOkBB1gSFAicpqFxsnuU55usihLqj9CppOCLuDQTA44
         QGx2p6pdozkZhZRlIGlFVwDs2dtgpe6fKnSF94krJoWMELaEUPODqoGDeQkQzFCw7fMV
         18e8lwSuBtKVpxOxM6QBw77NM9mD/y5Y2FmSeg4RArtyuojpdQcARSL6ApYsWQ+PskiA
         VYLc9AXF9mmC8s11Eb3OYyph7ohBk6xnHFnCP4/3jXhK/bh74E+StCO4Lj+LW7u56WRs
         9XeG6U9hTlaw3CySXpgHG9sCEMP7zHmh4QNZbhH5sLPkW3k0S9B3Insiwp1+IWlISncI
         SbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745432295; x=1746037095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2K4Lg9UXWodayqGkEaP9bm9sDSNteHJq58dHhFg6dY=;
        b=JR124TKWzeC1fKlPerSciI3r1tqFHZ8NPmI09HDEOH+mHiOl9gfs9SeTmdZDB+TdkC
         QagO8iXH/gZ0uiiRyo8NspVmL81SOuZSGeWbY9upIFDoYXxlnMRYH2mxQ4bEEHLzWalY
         YeQSkd5g0aJvw8PFl6WP7gxw/qrBvuclCVsDAdo/nWXyIzXZdUVGZxVAaJ/W4bMBxp8Y
         cRTzC9Aq1fsezaGc1ix9VZQup9UbYakg6uOCe1Pzd+4ECo9xWMxGEmyxvdmeBn8iNf/M
         9jmCyNK/mQtiq3m15cjiNbmybMLfzkE02DRMmYm57Og49Hq3jwBc9kp2cDrHPBMjztkq
         k1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXNwEvV15dKlLVsprUqGqtoHMynKn8+sNtopBSzj41M3HmeLIWUtOKJ1QNdgt+XjOW1s0hcKCPVWlpSbJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OQj9V1MRoLSELWsIvzMF1mA1enkk6BaKa0nqSws0cJ4AH4jB
	VblSOKT42UQtrxiLZoCnZMKtnKWX3/nNqFQDXVQ2LD3BUXi5ZQm2KF5aUWXARZg=
X-Gm-Gg: ASbGncuIbvEYaSEW1cJkd9kjQfxsSm/7EPcxb5BJJOehthEcTNltx6zs4t+NogZcTFq
	an80i5mmBbalhU70ZOpQ3FAzwRysjnsheWVk66WhZYFRNJI4OFoJ3EXDsZ0oFiGV021aoTi8bi+
	O99k1k7ku8Oo/Lygjd9cxTTK33COhPdd0zBTWK7BtVK/4UKlgrnWVyeYwxIvfVwbgfZLjRQzizP
	ZvdnLfXCkVP+cxVOlsvB0csdha51g6FPyxwaBrLHvOoE4izh7aQbx8wKJb05qlTQzm8+waD8fad
	p9wQF+DYnzb84cHSmFm2XmUNZ9t6S81NIhKElVc1hWhmTCVSarkGZJSTp5waKkn9e74LGVifCg/
	wjC6bvtVm/O244/xbRVo=
X-Google-Smtp-Source: AGHT+IG4/MsY26Rj4xYm6pWmvlAPuVFdcPLdJFOh3iEBlJVLpm+B1c5dpvU4P4SztDpvWCyGwRESRw==
X-Received: by 2002:a05:6214:21c4:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6f4bed4600emr4321856d6.2.1745432294768;
        Wed, 23 Apr 2025 11:18:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1433sm73395536d6.19.2025.04.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:18:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7efl-00000007M0V-3VVh;
	Wed, 23 Apr 2025 15:18:13 -0300
Date: Wed, 23 Apr 2025 15:18:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: William McVicker <willmcvicker@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <20250423181813.GU1213339@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
 <aAgQUMbsf0ADRRNc@google.com>
 <20250422234153.GD1213339@ziepe.ca>
 <aAkj5P1I-e9lylIU@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkj5P1I-e9lylIU@google.com>

On Wed, Apr 23, 2025 at 10:31:16AM -0700, William McVicker wrote:
> On 04/22/2025, Jason Gunthorpe wrote:
> > On Tue, Apr 22, 2025 at 02:55:28PM -0700, William McVicker wrote:
> > 
> > > On this note, I was looking through `of_dma_configure_id()` and am also
> > > wondering if we may hit other race conditions if the device is still being
> > > probed and the dma properties (like the coherent dma mask) haven't been fully
> > > populated? Just checking if the driver is bound, doesn't seem like enough to
> > > start configuring the DMA when async probing can happen.
> > 
> > I think the reasoning at work here is that the plugin path for a
> > struct device should synchronously setup the iommu.
> > 
> > There is enough locking there that the iommu code won't allow the
> > device plugin to continue until the iommu is fully setup under the
> > global lock.
> > 
> > The trick of using dev->driver is only a way to tell if this function
> > is being called from the driver plugin path just before starting the
> > driver, or from the iommu code just before configuring the iommu.
> > 
> > Given that explanation can you see issues with of_dma_configure_id() ?
> > 
> > Jason
> 
> I think the only concern is when a driver calls dma_set_mask_and_coherent() in
> it's probe function. If we can handle that case in an asynchrounous manner,
> then I think we are good.

You should never get to a driver probe function while iommu setup is
still concurrently running. That would be a major bug and break alot
of stuff.

Jason
