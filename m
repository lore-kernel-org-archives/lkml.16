Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2F22AE48
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451220; cv=none; b=inhbT9TTaZ4SRnMtawixMNssjo2C/7PqjfxVyD3aVTRS2ukVY4T7z0jTtnC1Pwh+7BhOYEVarYEvidGbko4fIRvVZAzAtaaAWDmVK1Fxc5GYQz4e5MpiuGfOxZofBuCZE7EdUzZLXkNoicDAC3n6w1LHUeGKsM7Xmsyf9a7ZVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451220; c=relaxed/simple;
	bh=El3tntKet6XFP5tu5jRccRiIHcbcsNXplDjGS1RgqqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m80Fuvyd9yGAq+qtd0ZK4UN8HFx35xz3Okz72/dMhyVFi3tBnpYdDxbWIFAsdRJFJlrAKapNz6/vjFs8fAR1/isVHieCbScWENEQJg1HrrTXnOr8EjlNvQE+K+RxUZ0zpIDPHJPDCBSSHwTJKUUQCIjNH9kwxrEbEw6P6LS8zQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oxpQR22A; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oxpQR22A"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-477282401b3so4518311cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745451216; x=1746056016; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7oRP2YqJwVB6GeEu4BqvXzZqclhisHpp0fN6LY14JQ=;
        b=oxpQR22AuCBUupk33WzKrsqOuEfDjGF5EniClxzPYJi+H/2OHhj3xqGjwCfB3IjXj1
         IS44abUFubw81ik89SK+dFDMZisPitToRy3EjPnxuoq9OkV+yz2s0Dd26VYZBM4RiMKf
         LNZPMNSpZe8jxWLp38ZCMDDKtCWhhAEaNccFys3J39EgF9Oa5YZ6+Oi0PJ9u2qeAGeb+
         x42QOq7flqmXeNRLssg9BL3MbzD8TDfAQ3F1ZEg2N3dERLvQfW0Wo9v5YoPExvUsoEdC
         IJPMcscXB538yc3/hVCCR4MgBTNPsBOr+AloLAvkeppeSsp27pJkz8n/J7Twj4P35Hbl
         gDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745451216; x=1746056016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7oRP2YqJwVB6GeEu4BqvXzZqclhisHpp0fN6LY14JQ=;
        b=hS2aM3WdGwdUd0remFhVthxzGv6Y1Ut7YQN+XEuJXBIy2OgBh+J5RxmkyBfbiZ4/wA
         XaoLos8yFzLMiCk0/0K6rI88/nXlrArLHv7GzjYp5f8DhtqE6M/S7OsEXc37qOV2pJrU
         iApZdxOEe/CVHnKL/ZvTqmEFONZcw1Ro7Nd4peW95dIuumuBQVU1OCPxKHHNiDkipaY7
         5wgqzqaMYGJGwtQ7amv9FMglPawIBGPlSvV02Uwkaq8419WcVcf6nbvZlKeCLbZ3yYPl
         jmLuw8Bdq9HGjlcjrtX+KKaN4OLl1UrwexJMD4sXGCVpxrXIuZLYssZ6jTvxdWbXZyHf
         hF7g==
X-Forwarded-Encrypted: i=1; AJvYcCX5MLtjF6sGgFHrpPvnppdvxQlQyBrQcu4omwt7dkXX7gy6GFDZNd04imNfXBdG7I5LA30IbGUf4RISc2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUDbs+m0r47mPWRWdpIyl/+tJWHJauRUIO1X2IOC75zvyiR5k
	Etr02LaK4EXQZ1va8bu+dSSWju6eMlGjIxe9BNmjzTfj95o1XnT04j5Cv0x95KA=
X-Gm-Gg: ASbGnctiC9pf8m5RJCnixOjeveDVIwN3N3dxR4yCA2L9B7dOMdKga+e117j+DPZKCG7
	ulxEA7rRPXm6JJ38r2bpW6+q4RB43F/yi5951C5GwvJ8GxXTbP7Ah4xEY/2YDlr5ttuZeqn/5MG
	tuk7b28vkm6JQDkGUA1HZmrTuRFoDQFb1k1PZkwTnArubmLa6IcIvTrDOuPuLv6JDPy43fxMruZ
	dDYnwkKgdSJPG6YlMHoE2IXZTOmgOnGkc2AYNLaNrz9YeG8p0EPhWQ7rQvE4oy5gd6lSg2sTbiW
	4tGO0jJEIRs4FSPQLB84kE1L3UVBFsV0gSejJ4sVDJXUSn6cUk8es2TTYMG4sSUo+ESvQShX3IC
	8lqEdpxDDyrGPTo7iSuY=
X-Google-Smtp-Source: AGHT+IHp4LWhqR/rJc6pqFU95w2BqdqjYtJ4SAe1Mvc/v+Ufccgyj7hWc7Mm96oBr3hzP4lBlnfnCQ==
X-Received: by 2002:a05:622a:388:b0:476:b783:c94d with SMTP id d75a77b69052e-47eb4fbb928mr6490361cf.35.1745451216599;
        Wed, 23 Apr 2025 16:33:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1ba154asm2538601cf.67.2025.04.23.16.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:33:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7jax-00000007PKl-19Zx;
	Wed, 23 Apr 2025 20:33:35 -0300
Date: Wed, 23 Apr 2025 20:33:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v9 10/24] mm/hmm: let users to tag specific PFN with DMA
 mapped bit
Message-ID: <20250423233335.GW1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <0a7c1e06269eee12ff8912fe0da4b7692081fcde.1745394536.git.leon@kernel.org>
 <7185c055-fc9e-4510-a9bf-6245673f2f92@redhat.com>
 <20250423181706.GT1213339@ziepe.ca>
 <36891b0e-d5fa-4cf8-a181-599a20af1da3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36891b0e-d5fa-4cf8-a181-599a20af1da3@redhat.com>

On Wed, Apr 23, 2025 at 09:37:24PM +0300, Mika Penttilä wrote:
> 
> On 4/23/25 21:17, Jason Gunthorpe wrote:
> > On Wed, Apr 23, 2025 at 08:54:05PM +0300, Mika Penttilä wrote:
> >>> @@ -36,6 +38,13 @@ enum hmm_pfn_flags {
> >>>  	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
> >>>  	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
> >>>  	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> >>> +
> >>> +	/*
> >>> +	 * Sticky flags, carried from input to output,
> >>> +	 * don't forget to update HMM_PFN_INOUT_FLAGS
> >>> +	 */
> >>> +	HMM_PFN_DMA_MAPPED = 1UL << (BITS_PER_LONG - 7),
> >>> +
> >> How is this playing together with the mapped order usage?
> > Order shift starts at bit 8, DMA_MAPPED is at bit 7
> 
> hmm bits are the high bits, and order is 5 bits starting from
> (BITS_PER_LONG - 8)

I see, so yes order occupies 5 bits [-4,-5,-6,-7,-8] and the
DMA_MAPPED overlaps, it should be 9 not 7 because of the backwardness.

Probably testing didn't hit this because the usual 2M order of 9 only
sets bits -4 and -8 .. The way the order works it doesn't clear the
0 bits, which I wonder if is a little bug..

Jason
