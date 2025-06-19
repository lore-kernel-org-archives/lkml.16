Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649FA21C9E3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323952; cv=none; b=CFwYWJ6ypEpuy4RNx+7hW+haCvYhvcxoA5u0637/sN2wjQyrt2/JnJazFq2GmCEpGYYKwKSkMsSsrN8aDM94OYwFjTy8VFVaR0LdFnJFYDzxpnYcxgDwrNNIfrQQuscvQMfpxbKGs8mmVSg5Pm56p/HnesuEAtkl3zV7kL8eK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323952; c=relaxed/simple;
	bh=R2MdderHD37B5kZdDB7xmVx02o4SKXcm4hSPWmQvgGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcsPwrQ3QVgeiFHR/bI2EgJtVM86h7El8atRPRuo/9tGyarf30Ov9Dfg9gCGhUKDNiTtySsHbyGDepEuCKE4p+omWyOCaPG57bSF+jVN3LsxDHZqHq1Qs+y6YKU57ocxWM6lQ9lkO30a9nxNXfs6FECLbcQDv281ZLMiNQl3Esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jVG4T8M6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jVG4T8M6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-313f68bc519so338677a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750323950; x=1750928750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfEj13GmETbHleU7k23uUEwgHyxddQ3h/WE7nkRP6/w=;
        b=jVG4T8M6kF62+TC330U10vnsL46veveohz3p8s7D81TyxojPuYvFcjtaKsEkK6lFHc
         aAZo7+Ijju1Nd5BOsQYh7h+ArvBCPHfP14Vt5ExNn+ybkKF1FpOnz2//0CqBPnNHMrvE
         6q3ZSSfymtmEt/ChJR6i+Aoct4DUHaZYs5/r1quTwJIh6UUD4KRLcBnWcwpFx2OMZ+/n
         NV7tAs9fl8z7AChz9DrW2OvDNAtVCojArQ9DtvpgGSotGpJJld++sAtdpqedlj8+Pc0V
         vCnZgfr99gXQqI/jJddljOdNnEqIgw8nAhiAKpKIWEW4U5RDISAPqM4Lwk3oN6LVOaIs
         EUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323950; x=1750928750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfEj13GmETbHleU7k23uUEwgHyxddQ3h/WE7nkRP6/w=;
        b=EhksidECSfa6+IiW2uykpYF7WKO/hmt/hfCLY54lYnJ+4dAnIdMXZPPN/SMIKD5c1r
         gjLK0QOnPHVdn4nKaKvyZoC/BB3mvyepHnBcsQBT3tXBR5US8wAYdbBrGup5AvwH51Og
         R+v+2gRV95uw99GRq/tVOrPETamZoW5RlFyeRC36DV1ZyxdQU1IyNatP7fgTSTbH0N7I
         F0efKh0hBg5BlSz0a86Pg3RE4fxnejwJ28a7VdSaHK5PJA3QvCaFduUtCEwNztmiDRZQ
         N0zrsvx0LWPpID2MyoLZrt8x60hsad8oAtMUgmDJJ7XWx3A6WNyF3dHANq+PN++ZTju/
         bgXA==
X-Forwarded-Encrypted: i=1; AJvYcCUoUJphdItgOLzT1tZ/GsJJ5l7hHnZPUPM0Zic0M/7ULH/Hal+Qvh3XCfzDrhsLyaJ1QtFDUUkOtu04GsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtNHRdIWtNVrN3K9OepFSoI8YXbiV2E2VdhWjfb4Xz+lPCfZDE
	sUcxqeTvb94DNDcnCCTyKV3Gwy31oKTHe6NQWlpghbd8N9cedqHcaQH7bWQ7fmZmO5Y=
X-Gm-Gg: ASbGncvmFwqyJOHwvTyRi8ny5J5RhblZup/KOVR9Pra3i2+A3gmmAaRTDwfw/OhRfHl
	Lw4TUzFQm34Mfal+/6qlkBqUW3/9FTWXZt7Njnc/9IThF1ZOoY/CnGSE5pMrqwGn/8r/4xU6pWq
	gTy98sScuMKGAt55cy3HADg7l/835U+0kFGxzgQeST0JpPWacGOn77hpQojl5nmdtfmiY42ZHyQ
	kXBI0Himpmk+ch6OI5SzEL0D8Z847ulZKA+WOTcEKxWQjL00swAtA6M9MDQji7v8+aLnlHzC4BV
	WJIfRgtvlOMivHjci/QiXUCHvH4KdIMHzvejdSogBHBPJQRnX/HWVA3jxJVLK0B1dzrRD22Oppr
	Uqi8wn0caG+FtIebN82lygnjS
X-Google-Smtp-Source: AGHT+IGgCZ8jvC5dY+tN8FHUTD6GFnoyLq4Y6HViY2JoldX5ANX6ETUtF80xyLqeVCd4I3vsa8LojQ==
X-Received: by 2002:a17:90b:3fcd:b0:311:be51:bde8 with SMTP id 98e67ed59e1d1-313f1cb52cfmr30251738a91.20.1750323949551;
        Thu, 19 Jun 2025 02:05:49 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a12c32esm1647633a91.0.2025.06.19.02.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 02:05:49 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca,
	david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Date: Thu, 19 Jun 2025 17:05:42 +0800
Message-ID: <20250619090542.29974-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250618132350.GN1376515@ziepe.ca>
References: <20250618132350.GN1376515@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 10:23:50 -0300, jgg@ziepe.ca wrote:
 
> On Wed, Jun 18, 2025 at 08:19:28PM +0800, lizhe.67@bytedance.com wrote:
> > On Wed, 18 Jun 2025 08:56:22 -0300, jgg@ziepe.ca wrote:
> >  
> > > On Wed, Jun 18, 2025 at 01:52:37PM +0200, David Hildenbrand wrote:
> > > 
> > > > I thought we also wanted to optimize out the
> > > > is_invalid_reserved_pfn() check for each subpage of a folio.
> > 
> > Yes, that is an important aspect of our optimization.
> > 
> > > VFIO keeps a tracking structure for the ranges, you can record there
> > > if a reserved PFN was ever placed into this range and skip the check
> > > entirely.
> > > 
> > > It would be very rare for reserved PFNs and non reserved will to be
> > > mixed within the same range, userspace could cause this but nothing
> > > should.
> > 
> > Yes, but it seems we don't have a very straightforward interface to
> > obtain the reserved attribute of this large range of pfns.
> 
> vfio_unmap_unpin()  has the struct vfio_dma, you'd store the
> indication there and pass it down.
> 
> It already builds the longest run of physical contiguity here:
> 
> 		for (len = PAGE_SIZE; iova + len < end; len += PAGE_SIZE) {
> 			next = iommu_iova_to_phys(domain->domain, iova + len);
> 			if (next != phys + len)
> 				break;
> 		}
> 
> And we pass down a physically contiguous range to
> unmap_unpin_fast()/unmap_unpin_slow().
> 
> The only thing you need to do is to detect reserved in
> vfio_unmap_unpin() optimized flag in the dma, and break up the above
> loop if it crosses a reserved boundary.
> 
> If you have a reserved range then just directly call iommu_unmap and
> forget about any page pinning.
> 
> Then in the page pinning side you use the range version.
> 
> Something very approximately like the below. But again, I would
> implore you to just use iommufd that is already much better here.

Thank you for your suggestion. We are also working on this, but
it is not something that can be completed in a short time. In
the near term, we are still expected to use the type1 method.

> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 1136d7ac6b597e..097b97c67e3f0d 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -738,12 +738,13 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>  	long unlocked = 0, locked = 0;
>  	long i;
>  
> +	/* The caller has already ensured the pfn range is not reserved */
> +	unpin_user_page_range_dirty_lock(pfn_to_page(pfn), npage,
> +					 dma->prot & IOMMU_WRITE);
>  	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
> -		if (put_pfn(pfn++, dma->prot)) {
>  			unlocked++;
>  			if (vfio_find_vpfn(dma, iova))
>  				locked++;
> -		}
>  	}
>  
>  	if (do_accounting)
> @@ -1082,6 +1083,7 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
>  	while (iova < end) {
>  		size_t unmapped, len;
>  		phys_addr_t phys, next;
> +		bool reserved = false;
>  
>  		phys = iommu_iova_to_phys(domain->domain, iova);
>  		if (WARN_ON(!phys)) {
> @@ -1089,6 +1091,9 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
>  			continue;
>  		}
>  
> +		if (dma->has_reserved)
> +			reserved = is_invalid_reserved_pfn(phys >> PAGE_SHIFT);
> +
>  		/*
>  		 * To optimize for fewer iommu_unmap() calls, each of which
>  		 * may require hardware cache flushing, try to find the
> @@ -1098,21 +1103,31 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
>  			next = iommu_iova_to_phys(domain->domain, iova + len);
>  			if (next != phys + len)
>  				break;
> +			if (dma->has_reserved &&
> +			    reserved != is_invalid_reserved_pfn(next >> PAGE_SHIFT))
> +				break;
>  		}
>  
>  		/*
>  		 * First, try to use fast unmap/unpin. In case of failure,
>  		 * switch to slow unmap/unpin path.
>  		 */
> -		unmapped = unmap_unpin_fast(domain, dma, &iova, len, phys,
> -					    &unlocked, &unmapped_region_list,
> -					    &unmapped_region_cnt,
> -					    &iotlb_gather);
> -		if (!unmapped) {
> -			unmapped = unmap_unpin_slow(domain, dma, &iova, len,
> -						    phys, &unlocked);
> -			if (WARN_ON(!unmapped))
> -				break;
> +		if (reserved) {
> +			unmapped = iommu_unmap(domain->domain, iova, len);
> +			*iova += unmapped;
> +		} else {
> +			unmapped = unmap_unpin_fast(domain, dma, &iova, len,
> +						    phys, &unlocked,
> +						    &unmapped_region_list,
> +						    &unmapped_region_cnt,
> +						    &iotlb_gather);
> +			if (!unmapped) {
> +				unmapped = unmap_unpin_slow(domain, dma, &iova,
> +							    len, phys,
> +							    &unlocked);
> +				if (WARN_ON(!unmapped))
> +					break;
> +			}
>  		}
>  	}

As I understand it, there seem to be some issues with this
implementation. How can we obtain the value of dma->has_reserved
(acquiring it within vfio_pin_pages_remote() might be a good option)
and ensure that this value remains unchanged from the time of
assignment until we perform the unpin operation? I've searched
through the code and it appears that there are instances where
SetPageReserved() is called outside of the initialization phase.
Please correct me if I am wrong.

Thanks,
Zhe
