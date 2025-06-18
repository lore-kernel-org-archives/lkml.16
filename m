Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634B1EDA26
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253035; cv=none; b=TrOzdTEvn42gSLisJize7ZLMHYByG07NfFlm67XqPzczGIJKw2/sM6/0NK7CTzOzW4hJ7t2e+uhRS8xwJhZYiOpvxpYDsR9MKMu5nTFlV45+zmFbc90EiaFo5V5LXuNHKn7syJicUEYn6VVoSZoHfLL3DjuWS+viTnaSxoJMyq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253035; c=relaxed/simple;
	bh=PvNMR4Bh/5U5Yys/GdOvZjrfjw6pCcuAC88NwswDtWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M64fsC1xNH6+6/QmttyQzHrDRT2INBmnRwu6cmTTB6zhOk/Yazs9udKDdIBgNDkfZqSyiSIRwk8Ph5aXB1WNwMzpDZJFEVSOu6c7hVk2WcDhkBWupfwbb8JVZhSmIPzVPLksLXceSKUw8Dkti1Ou7WuWTtmOpjVVmSA5KiXrHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ODoUUCEB; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ODoUUCEB"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d098f7bd77so74215485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750253033; x=1750857833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KqEK20OUV+YC6Bkjm5qN0J00zk2Z0hjMnTZBJHjERP0=;
        b=ODoUUCEBtrq+abCrKoYac2EwlKv6l+i3XXze2+LsSwyUJZjaUi28RG6nWBVYMU6Qba
         FpR30KM18JbEhNiNfABLzeM8P271Z61ov8xWMXyVUwE6U0nnm8LLC7/ZUvHKdd02BpV+
         y26JJW0j1KYtxczgePmuWkuVJFX9JmWOUf3FtF8ADpWCugkGWfHa1sw6f3TO3iZoS4K6
         Ci19eTzQikGc4aJ/JVUPoXJIKNI2Q/hvQcuujCl/L3iEKgMpHpS19/TVa8qq8OpI4Kkq
         lBqMdZ1KtMD0BppRc2J9PNHtxgCW5OBKhlZfQ8lP6R+Ab/wmDMGoDjpwhtvmj2Uzc2D2
         g1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253033; x=1750857833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqEK20OUV+YC6Bkjm5qN0J00zk2Z0hjMnTZBJHjERP0=;
        b=oYYNFv9K4oEHlx25x5wrggALMQFVVYKLRcbiNdqvsrr0rsPpiotX+sN7s23kNxz7TA
         K6SV8a5WjtfK544qgugka8mtD9IkmipK7DO7dN4zjyrOhTCjUfKF9rjBEoNKNLFgpNrJ
         G/UIIst70Eibl8sH/WVk0gVq0/OoYI9l0XhX59dHyAbm01quxzaYEOUPogSb55/KjgLl
         N16MDXGP8JNJ0RbrOjmG8qYFT/suEE4hJGFJhMxVW+A+UZe2Arhyam7hTfh2nO2WTnc1
         7e3aEKe39f2CpSvHz4oDRNR+KxIDa1a1HvrwDnYJUQVihStMErlKyFNGTXj3UDe512aU
         JAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtWT7cZ26tvUWy7uh8u9IR//2e3ntd8BhuDKL8xPy+JMXRnaA0hEaPCmmX1SaNbyhX4DtorrJCYw7Rihw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjOFWzsEWFCEKGfN4v2imwrnio26/DP/IuNeyfwE0KXUs7hCO
	cQai+ZaLfY7XnaqiIWLDHNdwEt/8uDflzulGwaBwUvw+ZQTsUd5TK4PZmfXaRkFtTEhbIqsGxpI
	jIkD0
X-Gm-Gg: ASbGncusy7a3qykrmLmz4a315DSZtgqejO6dAh/TsSo3JRbptRY7Sk0rE1pNL6mRsj9
	KHLdwosQ22ldgngcRGgwLaK3FkCLPEvxjTNZElFNwek92rvP4MLBa0UnCK7GUIrTvUvLW431Q4a
	wOH3AzW9lNRQqxVqh6UTUxa18qqlWs6fkS3YQaGK0vjkUOToX2zsfVVPbd0vuADMhYdI0FebcnV
	iw7/pYOxpLLC6d7BHjohF4zpyEswk969eKsaQzMPmrpTnsQRPlu4cwwM3mlLXYla8q38D1IRnqK
	eOArXBWSWfZXuBunVUj0R4rRQsxMTYVUY/L+bd9rjFRyDHes7u6AThDu8x1O4x1bH00IpjBpRHZ
	AFWIx4nUmSkG9/vPiZ9FkonkcFgLW6V6eFQR+WA==
X-Google-Smtp-Source: AGHT+IF9NkUjCA8uk6HKiAeyvH8TKX/0/ivDtPkHXPD3WCNV0m99YeZSjC4tka6Wctd9mMDXm8kpLA==
X-Received: by 2002:a05:620a:2621:b0:7cf:5cdb:7b68 with SMTP id af79cd13be357-7d3e9219d0bmr390160385a.0.1750253032707;
        Wed, 18 Jun 2025 06:23:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eac910sm769806485a.72.2025.06.18.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:23:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRsla-00000006mvn-29y8;
	Wed, 18 Jun 2025 10:23:50 -0300
Date: Wed, 18 Jun 2025 10:23:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, akpm@linux-foundation.org, alex.williamson@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250618132350.GN1376515@ziepe.ca>
References: <20250618115622.GM1376515@ziepe.ca>
 <20250618121928.36287-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618121928.36287-1-lizhe.67@bytedance.com>

On Wed, Jun 18, 2025 at 08:19:28PM +0800, lizhe.67@bytedance.com wrote:
> On Wed, 18 Jun 2025 08:56:22 -0300, jgg@ziepe.ca wrote:
>  
> > On Wed, Jun 18, 2025 at 01:52:37PM +0200, David Hildenbrand wrote:
> > 
> > > I thought we also wanted to optimize out the
> > > is_invalid_reserved_pfn() check for each subpage of a folio.
> 
> Yes, that is an important aspect of our optimization.
> 
> > VFIO keeps a tracking structure for the ranges, you can record there
> > if a reserved PFN was ever placed into this range and skip the check
> > entirely.
> > 
> > It would be very rare for reserved PFNs and non reserved will to be
> > mixed within the same range, userspace could cause this but nothing
> > should.
> 
> Yes, but it seems we don't have a very straightforward interface to
> obtain the reserved attribute of this large range of pfns.

vfio_unmap_unpin()  has the struct vfio_dma, you'd store the
indication there and pass it down.

It already builds the longest run of physical contiguity here:

		for (len = PAGE_SIZE; iova + len < end; len += PAGE_SIZE) {
			next = iommu_iova_to_phys(domain->domain, iova + len);
			if (next != phys + len)
				break;
		}

And we pass down a physically contiguous range to
unmap_unpin_fast()/unmap_unpin_slow().

The only thing you need to do is to detect reserved in
vfio_unmap_unpin() optimized flag in the dma, and break up the above
loop if it crosses a reserved boundary.

If you have a reserved range then just directly call iommu_unmap and
forget about any page pinning.

Then in the page pinning side you use the range version.

Something very approximately like the below. But again, I would
implore you to just use iommufd that is already much better here.

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 1136d7ac6b597e..097b97c67e3f0d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -738,12 +738,13 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 	long unlocked = 0, locked = 0;
 	long i;
 
+	/* The caller has already ensured the pfn range is not reserved */
+	unpin_user_page_range_dirty_lock(pfn_to_page(pfn), npage,
+					 dma->prot & IOMMU_WRITE);
 	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
 			unlocked++;
 			if (vfio_find_vpfn(dma, iova))
 				locked++;
-		}
 	}
 
 	if (do_accounting)
@@ -1082,6 +1083,7 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 	while (iova < end) {
 		size_t unmapped, len;
 		phys_addr_t phys, next;
+		bool reserved = false;
 
 		phys = iommu_iova_to_phys(domain->domain, iova);
 		if (WARN_ON(!phys)) {
@@ -1089,6 +1091,9 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 			continue;
 		}
 
+		if (dma->has_reserved)
+			reserved = is_invalid_reserved_pfn(phys >> PAGE_SHIFT);
+
 		/*
 		 * To optimize for fewer iommu_unmap() calls, each of which
 		 * may require hardware cache flushing, try to find the
@@ -1098,21 +1103,31 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
 			next = iommu_iova_to_phys(domain->domain, iova + len);
 			if (next != phys + len)
 				break;
+			if (dma->has_reserved &&
+			    reserved != is_invalid_reserved_pfn(next >> PAGE_SHIFT))
+				break;
 		}
 
 		/*
 		 * First, try to use fast unmap/unpin. In case of failure,
 		 * switch to slow unmap/unpin path.
 		 */
-		unmapped = unmap_unpin_fast(domain, dma, &iova, len, phys,
-					    &unlocked, &unmapped_region_list,
-					    &unmapped_region_cnt,
-					    &iotlb_gather);
-		if (!unmapped) {
-			unmapped = unmap_unpin_slow(domain, dma, &iova, len,
-						    phys, &unlocked);
-			if (WARN_ON(!unmapped))
-				break;
+		if (reserved) {
+			unmapped = iommu_unmap(domain->domain, iova, len);
+			*iova += unmapped;
+		} else {
+			unmapped = unmap_unpin_fast(domain, dma, &iova, len,
+						    phys, &unlocked,
+						    &unmapped_region_list,
+						    &unmapped_region_cnt,
+						    &iotlb_gather);
+			if (!unmapped) {
+				unmapped = unmap_unpin_slow(domain, dma, &iova,
+							    len, phys,
+							    &unlocked);
+				if (WARN_ON(!unmapped))
+					break;
+			}
 		}
 	}
 
