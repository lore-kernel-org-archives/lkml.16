Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF42E2EF4
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190523; cv=none; b=defwIhpFSDEBDemvvIiwyVGO0xVr5NAzQIdsOPFGqKUmh38Y4A/qL1o2NExs6IRoMGXQrUaOqAYXFv7/6jcq3twhAd6LfR8W6hkQzMZ9VLftLyQIlvT/ADLxqQ25jJDbMrSk4M7Kw4v2WyxPQRYKxFoFfHlKAlc08MBch2y8weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190523; c=relaxed/simple;
	bh=XMvjS9h95kOV8JujLb2GDDrONYa4hpVobP4wUiW7o7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNVXbHIWmiwJSZeyneb7Ohlete3LqH6JDSr2wLi6wysA8BykGwT1O+NgKMCLBEyhqhxlen/0KgSSgV427ytwL/2G6tHUTnhx2F8s//vMhf9KiM+tDy2pruL0zDmCHIdDCOOCC4TuWMzShC1n150v9Nky4O/wgQUFywPdqxEXaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/rhBhJb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/rhBhJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O+NoG2Xo5HkG5dYXEBVx8rtfO3qQh/xgk518Z7oyOlQ=;
	b=X/rhBhJbsd8a0qt3OVm4vEyhpoEpud7JSWr1ukksyefRO/hBcmuEMACGgR3bk4iIs+5gY4
	hhsPypCwvJvn7cdQ+FlfKz+BVrkX99Py6YkvgMSyB7fOBZaoUygIV8zkCUbw6pxbVxtmr5
	e0U02JDLQcOuCOerGTKBi0rbsHSvd08=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-TdbFFU3SPnKuX-zwOmThIQ-1; Tue, 17 Jun 2025 16:01:59 -0400
X-MC-Unique: TdbFFU3SPnKuX-zwOmThIQ-1
X-Mimecast-MFC-AGG-ID: TdbFFU3SPnKuX-zwOmThIQ_1750190518
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450de98b28eso132265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190517; x=1750795317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+NoG2Xo5HkG5dYXEBVx8rtfO3qQh/xgk518Z7oyOlQ=;
        b=V74jn+eREurZJaeKidfaGOE5Cj75ZnNTz4nFFbV9Nw2on0pdzWP/yGQiVZh6a1JePP
         XcHOOO43FuFR0n9mr4P0+pZguS+CiLXMvl0PTeaI2v9RZB8wWLdSSyzRi9UCa0ZAFiS4
         YbxVerjiAQr1JM+TSs4VVJbiO83YsQXv6HvfzYM2pl5DGM2sWoYecMtjtbJatewexnxf
         wwm0jdecuuyNlREvWUAKVDRUZ7u5oxAfFv7AKhT1qujQyD+gVsAxyem2Cr7t21RVNwH2
         kwtec8uSgi/zx6Ug+hQvIswVcv0KyA+Sl91GsfnQu/NP9e7MLv2WP8Ky7VjHRK5B+AYK
         hqLw==
X-Forwarded-Encrypted: i=1; AJvYcCXqKBKII1awbvEjxMYR11cz1DRv9LZigNHycxHyIWvfukeQLYqP3nWTGiiHQeIvlptkkY5gTMPsn/PWIPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXfk/SK1IU7J/HwTJRCGJcvKuwy34JnN1NYluNEfxZpgPc7i+
	ZqKvmeSE/OYSt/boUfgUYA+7CdB4SF4nWBlTJCSc8BIOLz4cPlBsiojMEyj5Jrk7W1crLWChint
	jvyy3psrlsEeHyEWWUVQls1JcXe991+2LcZAdooBwI3Yc8nis3bfeoQzmztT7h1orYw==
X-Gm-Gg: ASbGncvGuGfsdpS00WctJJdpO4CvzWYpjOe4+cqdjM/pQmWVrrGl+qKvs1qv7UcYPDm
	h0IQ5ECPa4nudk9o92y7xqNxTdndy7mRndWJ34Q5SVaWY1AmrW5RGW3eNuzYkhKSi7+wUioSRAy
	VQr6sdBp+wUpQ1bhdpC4Pqv8Hnzaip0OetHXTrUGcKeXrW3Gn3z+o8aUrnI1vng47SZ4M99FXpm
	ivQMXhA6rJN1Yn7/KuYGi73UqlhduTzVQHZM4I0qleXB08r9aKPaH6dJBLMgwWy5906uO+zbTyf
	7t2rhIuolwJNJD0x
X-Received: by 2002:a05:600c:574b:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4533b2723fbmr106294555e9.10.1750190517523;
        Tue, 17 Jun 2025 13:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNEtk99gWXSpZ+RahNNIJ+KZNHzBGaVUSD+dSFjshNFQhawiqf1xX90P7+NZhpbwqFDbMbUg==
X-Received: by 2002:a05:600c:574b:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4533b2723fbmr106294125e9.10.1750190517096;
        Tue, 17 Jun 2025 13:01:57 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:4300:f7cc:3f8:48e8:2142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4cc7bsm14653724f8f.86.2025.06.17.13.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:01:56 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:01:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250617160103-mutt-send-email-mst@kernel.org>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
 <20250616132031.GB1354058@ziepe.ca>
 <20250617154331-mutt-send-email-mst@kernel.org>
 <20250617195720.GI1376515@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617195720.GI1376515@ziepe.ca>

On Tue, Jun 17, 2025 at 04:57:20PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 03:44:20PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 16, 2025 at 10:20:31AM -0300, Jason Gunthorpe wrote:
> > > On Sun, Jun 15, 2025 at 02:47:15PM -0400, Demi Marie Obenour wrote:
> > > 
> > > > Is a paravirtualized IOMMU with interrupt remapping something that makes
> > > > sense?
> > > 
> > > IMHO linking interrupt remapping to the iommu is a poor design,
> > > interrupt routing belongs in the irq subsystem, not in the iommu.
> > > 
> > > The fact AMD and Intel both coupled their interrupt routing to their
> > > iommu hardware is just a weird design decision. ARM didn't do this,
> > > for instance.
> > 
> > why does it matter in which device it resides?
> 
> It would cleanup the boot process if the IRQ components were available
> at the same time as the IRQ drivers instead of much later when the
> iommu gets plugged in.
> 
> > Way I see it, there is little reason to remap interrupts without
> > also using an iommu, so why not a single device.  what did I miss?
> 
> Remapping interrupts can be understood to be virtualizing the MSI
> addr/data pair space so that the CPU controls where the interrupt goes
> though its internal tables not the device through the addr/data.
> 
> On x86 you also need to use remapping to exceed the max CPU count that
> can be encoded in the MSI, no iommu required to need this.

More of an x86 quirk though, isn't it?

> There is also some stuff related to IMS that could get improved here.
> 
> You don't need an iommu to enjoy those benefits.
> 
> Jason

