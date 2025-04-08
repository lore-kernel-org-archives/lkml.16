Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E3254AFD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148313; cv=none; b=UYIxWtKRNjdpVxUAg1OR0xBwNP8qViF7T/w8wc0LWum2PmpGoJpzRFc/N/1Ft3uUal1rsY8Nu/dg9/yqGXDiXf65ZvcuZElehtlpLp4peZj3mnH+AGwvXt5l9y0IXelhu4bfgPB1AUXKY+UdfBFhFBr2pY05S0LnEaKqxoh96N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148313; c=relaxed/simple;
	bh=pu/YuOWH/Lc2fBaut8InW6ICN95wTACJ6MxryaqAaMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgvqOievSAR7vXOltG5q6Cjx3qvwcMer0mTsCPkOQDJJxv88XaLBJ8UrYP2C9e6jasxBphdqO83j5CoQYvMr4vok+jH9ia5JP90U9SbZLDlY+tBuNAGPwYqtEd43jFb0aNFgaxSLYnbsNRHnQ++AdsvcsIYd0TbRDS4aBRiuQU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PCW9cN6l; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PCW9cN6l"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c56321b22cso13493185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744148309; x=1744753109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yxv9o50eGddEsUuD/tRbYvSgVoXDvHyaDodMka2QGFQ=;
        b=PCW9cN6l5qxgd5SpZwjgI+WYmHRR6afI3RWZpZflMcw6wrWiDSbSbuHvDszqVh78aW
         Jrh1aVVBWoG3Ph8WmXEkRCfLd2Ll/aqr8j7Qz4WBsGfJ0fVxLwpcv4plgec1PjF/AagL
         HOM1Um0p3pRsEf6h/PMONuU37RlPCQ2fNf0KlIopFTUff4ZNUjPI1MU8z0uP3CQN0Or/
         Ik9cjted8EJ1yex3VdrS8qRpeQv+iXsTxDX0SKqdXgJYyg0Z0NCtWy97xrULRVdM7SSz
         /oJhWTMZo44qVjvrlwQBIM70Jk3rMSlCQSgtcREOFPtML4IklyjZIdrJ4tBkPZn4Dq2o
         SEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148309; x=1744753109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxv9o50eGddEsUuD/tRbYvSgVoXDvHyaDodMka2QGFQ=;
        b=sQ7X3SavaaUuZY8sazF1ulembNJfMeRftpTwqYxN/mUZSx373Don9gg68IbIzm26Mi
         7XLvR9qZeh+bNFWzr+MIJqVYuoZfNjJSuzSo+/gZQsAkGA0ABnYKEa3fcX0K8f3gsXqs
         Eym/9uhZqv/4GIaL46MniKAHYIOqFf3NAIPgrIIQuirl3Lbq7a1iTuV3hyPY1nikasdU
         jZZqWab+Krq+J8us1ynPdFsfKQrSOosGp2dRn714KJVPWWt28DiZENiokEJlCDN5ZAy7
         tjp0ksHmFYwIT0xW9w1WsRM+BCOkqLkl3sG1D9vcIkdhoMv8nhpdS1TrJWME5zXjRb1y
         zhKA==
X-Forwarded-Encrypted: i=1; AJvYcCV6vbZscu9YlyOBJ20HLgppGVO5mW8MrALoIC5wNeu70HLSnbJTh3VXw8kzgen2exqEJyXwvQhIRQrnSh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKsxvl1Wi7H+EcVEXFfI15Q+QrFcmE1oxTNglrTL7XcyUNf+B
	D/SEIITfjc4YtDw7/dIF6wgTjCi5WdNZHahWxdCoO5yj8BqFeVpxV6pnOP55VTE=
X-Gm-Gg: ASbGncvNTMmt5NV167hDUirOsaPgHQO3mMr8ystHeoqfQSTzlhL4rNDOJE+DWUvJLjA
	oPb6VotNJskGR1m/3CiGy4D5dG+xF99NP5lPM+lioof6CW4GjwVP/5WfA+pVRIO/tplGKW7w+ax
	dg7Bf3y6ABaxFc485y/r4VBFO5Qlrb5YXLTlEACe5ujcIJjxPg2hTegfZYlQ6t1vH9ZPmeu7KGq
	JMDJMzWjs6aNRNEPGzPsGh+I/Uq6jJR61IVVMYXl8/E3pWvlJY4jac5WNo23wVNQivq5GMvjqf+
	rsqzMQhDDe0CdukCihsrwcitpryOWmygp6+HngHPzjPdmU4GDtpfc5hywIJtx7HBlEB5DNj51Hx
	WON0BjDwizRqeLtRBtVEOPto=
X-Google-Smtp-Source: AGHT+IHk6WbyFTIcWDV5GB5Os6d2NKq5gE0pldA0lJWoLAcbSrKSUgBHDiW5s9PcXNYkhgATyty6uQ==
X-Received: by 2002:a05:620a:2788:b0:7c5:f48b:3c8 with SMTP id af79cd13be357-7c79cd473c5mr126299485a.14.1744148309611;
        Tue, 08 Apr 2025 14:38:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e94bbfbsm809430185a.46.2025.04.08.14.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 14:38:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u2GeK-00000008mG1-1mIv;
	Tue, 08 Apr 2025 18:38:28 -0300
Date: Tue, 8 Apr 2025 18:38:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] iommu: fix crash in report_iommu_fault()
Message-ID: <20250408213828.GC1727154@ziepe.ca>
References: <20250408213342.285955-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408213342.285955-1-pchelkin@ispras.ru>

On Wed, Apr 09, 2025 at 12:33:41AM +0300, Fedor Pchelkin wrote:
> The following crash is observed while handling an IOMMU fault with a
> recent kernel:
> 
> kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> BUG: unable to handle page fault for address: ffff8c708299f700
> PGD 19ee01067 P4D 19ee01067 PUD 101c10063 PMD 80000001028001e3
> Oops: Oops: 0011 [#1] SMP NOPTI
> CPU: 4 UID: 0 PID: 139 Comm: irq/25-AMD-Vi Not tainted 6.15.0-rc1+ #20 PREEMPT(lazy)
> Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN50WW 09/27/2024
> RIP: 0010:0xffff8c708299f700
> Call Trace:
>  <TASK>
>  ? report_iommu_fault+0x78/0xd3
>  ? amd_iommu_report_page_fault+0x91/0x150
>  ? amd_iommu_int_thread+0x77/0x180
>  ? __pfx_irq_thread_fn+0x10/0x10
>  ? irq_thread_fn+0x23/0x60
>  ? irq_thread+0xf9/0x1e0
>  ? __pfx_irq_thread_dtor+0x10/0x10
>  ? __pfx_irq_thread+0x10/0x10
>  ? kthread+0xfc/0x240
>  ? __pfx_kthread+0x10/0x10
>  ? ret_from_fork+0x34/0x50
>  ? __pfx_kthread+0x10/0x10
>  ? ret_from_fork_asm+0x1a/0x30
>  </TASK>
> 
> report_iommu_fault() checks for an installed handler comparing the
> corresponding field to NULL. It can (and could before) be called for a
> domain with a different cookie type - IOMMU_COOKIE_DMA_IOVA, specifically.
> Cookie is represented as a union so we may end up with a garbage value
> treated there if this happens for a domain with another cookie type.
> 
> Formerly there were two exclusive cookie types in the union.
> IOMMU_DOMAIN_SVA has a dedicated iommu_report_device_fault().
> 
> Call the fault handler only if the passed domain has a required cookie
> type.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 6aa63a4ec947 ("iommu: Sort out domain user data")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This should go to rc

> > iommu-dma itself isn't ever going to use a fault 
> > handler because it expects the DMA API to be used correctly and thus no 
> > faults to occur.
> 
> My first thought about this is that iommu-dma is not interested in
> installing a fault handler ever, okay. But why does it suppose that no
> faults would occur? It is a matter of "chance", firmware bugs, abovesaid
> DMA API abusing, etc... isn't it?

Yes, it should not happen, this driver is clearly buggy.

Jason
