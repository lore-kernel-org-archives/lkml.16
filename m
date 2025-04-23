Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214E28BA93
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429341; cv=none; b=kBeacDOMYIPisHhCRuvpMANgyTY9vEsHn0evTmrK82DfBRCK/frLlhH8aaviLo9oBa22U2WjhWFXn6G3dNfrNfUMZplmfJyWSSyfekUnkjUMFdGt7PeANmEsAU5KDzkghvtJAA3GFzULaA7g+/DtUYmAuKpCAjX4Y2bk8HiVn0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429341; c=relaxed/simple;
	bh=mRc8M0gxR/bW04Xju3faBLjTBvHDMb62s/e3kfp1ILA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwbWrEYi01m3kX8OkiLwXD5h1Bl0tOMG320YjhZ1VQUC8G/GQ7MIWYelNmUkW6dNb5TpMdQJ1eWbYFit5Vu49IDxIXQYzmdHvf/TeX7kS+9plp9bpQ0C8QWtwiI+U2xahQd74pKrCSZCooWPeT+nBke0PfOlZpkAsSHI1n+QC2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=eVuwq0RO; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eVuwq0RO"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47663aeff1bso1065921cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745429338; x=1746034138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IO21pmrwIRca1fPgD174SCTD3P5B2ca9Ykqyd/DD35Q=;
        b=eVuwq0ROZifuNzkRrXIXgbkbi4hO8TSorC1cVxQ1W8OJWpaf636zG1H79y/OsoNiEv
         QJoHdOMGmdOg3qWXE6oHeMbIm7NKTfE3i9KQN7Fh9+P1J/7HKW0XNl6v6OYA9tbrbphh
         9I+2ZXWcvuiOHhgiMd/sD39MAb+UODVgxMr2qWzwIlCIGN3Nk+M97jNtSjELBr4MXOVW
         +jwYX/4xi8FewzktEuOaSqhFxeoB5SOsVD8U1CDOCff3ofu0NT61y4q5M1pmsq6xHNmL
         EwbV/ud7hFmATuIADKNLOAC+tlRqNf5RiVptJYelfbQHfkpq/CUpCWnNZ4bOE476qgWk
         onKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429338; x=1746034138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO21pmrwIRca1fPgD174SCTD3P5B2ca9Ykqyd/DD35Q=;
        b=WCm1ppT3cryvYuBBsun4BH17TyUxKZzkBDGyiuThq44kqz3CIYTvmNzswaqxKb0+vw
         uHG16GXyuwiGaL+FIB7g67fAFxsQINwgcXBCqH8NvRkhe8UVLRdrquoQSEGZjKKLpZka
         vUmeQss78iRFEhiOLy6++aFtF8tlKm9FyMrF387xlL8jxlAayaJDptyw7gX+GefX18sg
         1g/M08G38CuwGEF5QtRw0IKvSW7MTjzcE2dms0j5ew51NsllJyk77X1a2gETVv0iivN4
         YSKCRSHN6UQvFdM1Pskbqu5KDneiBfVJyTYyDHWdOGai+rOD2ohoAUM9lv0Qr8QkXUA/
         1RxA==
X-Forwarded-Encrypted: i=1; AJvYcCUnJ+OLVYmRKXt+aN7oDaGLefeZkOjk+DCn7JJUhwjuZY+eEWGBEhs1fhxaG5Ust5dHjiFWF9dNUuE7a9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgnnK/Gfa6QffY/GdRf2TjjYscUfdOnUK+7UJWQ1YR7pQKmoF
	98Be+04XlneOyaytYH9L7GkEIxuq/7RRT8i1HXpMlRqQUdSDWruXs0aFGCPDR+M=
X-Gm-Gg: ASbGncvOUN6CPMzNSC058Nu0mxKg5ITVK1UOEWxUaXA+vHAZRMLO6S+8gzL6PcAbR7I
	duy9qF82qeo3Svz6pNbXoyIFWTp2ByCwHa1BfIbUC3W/cP1rq39nA4Xnt8PGUQscIOVhw91vbhL
	0KRzwwK/dsKYYwcR3W+S0c37DC0dAIeZRyqCQK1jGuqPqCnjIKM1Qi6B+UHQFnDmgSthbiPvQ78
	XNT9sJXEYKi9tcHsKHeZWuLreq/q2/Ig2oPKZ3LRMh9a0ikJWVJZfX+7pI6TGgOabiTVzh90xS0
	cefZd+17XrHU9MsgkNVBPq8Y6NRWttmtygdU4/W/utXmGIRMEtiy7FPjvgH2G/BRpzhbLm2qRHX
	sS+ehsJBaSBxI7ODsoU8=
X-Google-Smtp-Source: AGHT+IFhccZU7hwIpoqF9kdgyBZNm8CDnNWVmBsNPQQ6+B1QKTjLAh4Uz8aWpAuaS2cilFrr6VCiig==
X-Received: by 2002:a05:622a:18a6:b0:477:5c21:2e1f with SMTP id d75a77b69052e-47e77a9e41emr774971cf.34.1745429337818;
        Wed, 23 Apr 2025 10:28:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c3b5c3sm71026671cf.21.2025.04.23.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:28:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7du4-00000007LYP-3LLk;
	Wed, 23 Apr 2025 14:28:56 -0300
Date: Wed, 23 Apr 2025 14:28:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v9 11/24] mm/hmm: provide generic DMA managing logic
Message-ID: <20250423172856.GM1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <3abc42885831f841dd5dfe78d7c4e56c620670ea.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3abc42885831f841dd5dfe78d7c4e56c620670ea.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:13:02AM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> HMM callers use PFN list to populate range while calling
> to hmm_range_fault(), the conversion from PFN to DMA address
> is done by the callers with help of another DMA list. However,
> it is wasteful on any modern platform and by doing the right
> logic, that DMA list can be avoided.
> 
> Provide generic logic to manage these lists and gave an interface
> to map/unmap PFNs to DMA addresses, without requiring from the callers
> to be an experts in DMA core API.
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>

I don't think Jens tested the RDMA and hmm parts :)

> +	/*
> +	 * The HMM API violates our normal DMA buffer ownership rules and can't
> +	 * transfer buffer ownership.  The dma_addressing_limited() check is a
> +	 * best approximation to ensure no swiotlb buffering happens.
> +	 */

This is a bit unclear, HMM inherently can't do cache flushing or
swiotlb bounce buffering because its entire purpose is to DMA directly
and coherently to a mm_struct's page tables. There are no sensible
points we could put the required flushing that wouldn't break the
entire model.

FWIW I view that fact that we now fail back to userspace in these
cases instead of quietly malfunction to be a big improvement.

> +bool hmm_dma_unmap_pfn(struct device *dev, struct hmm_dma_map *map, size_t idx)
> +{
> +	struct dma_iova_state *state = &map->state;
> +	dma_addr_t *dma_addrs = map->dma_list;
> +	unsigned long *pfns = map->pfn_list;
> +	unsigned long attrs = 0;
> +
> +#define HMM_PFN_VALID_DMA (HMM_PFN_VALID | HMM_PFN_DMA_MAPPED)
> +	if ((pfns[idx] & HMM_PFN_VALID_DMA) != HMM_PFN_VALID_DMA)
> +		return false;
> +#undef HMM_PFN_VALID_DMA

If a v10 comes I'd put this in a const function level variable:

          const unsigned int HMM_PFN_VALID_DMA = HMM_PFN_VALID | HMM_PFN_DMA_MAPPED;

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
