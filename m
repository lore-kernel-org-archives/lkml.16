Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678192DCF7F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472720; cv=none; b=htKPHVjpu9ePGCWM9CwEqY0vOTrAFRcHDCKY+SEJ4pSDnKURyIkKm/dWy3N59HzGK4PKEzDPIMeNqIIyv2rDYvNWj047SAY82i77oob84HnqGv6xEODsTbeLLjDSyt2QpXb6Vk4a6WkHRZfkSgE3ojnCb+g8GDRFJTx8hajjEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472720; c=relaxed/simple;
	bh=ku/1O1AIFsAJJ6qmmvnq+B5DRjf3j0x7VN0LkoGzkUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvkReZj9f64354BRmLeddQi9iPhL7zio+hYgthu6nWiRNcdWtehgnVcPEXJnXv8B/x0nMrux90G8ucYbWyJZPufbGKexITKBzNGV0boEYnx1gIuozd8wXpeqfVvYn5uiq+zKWKsVCW339/BAoKMWnKCDU83/2/jkyZfbzt6ZiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezpBL3ub; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezpBL3ub"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-611b246727cso2324634eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751472717; x=1752077517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xLl0djX76uDh2KqOF+EzMvL6PoM9gvUJ0/VwerVvcuU=;
        b=ezpBL3ub40irIXQqvS2QZITGipRrqRa53fQq61zGxdt5X6TEtgcyGdC9y0eregS1oU
         QqFhUcDugTZ3uJmI8AfVVgYm1CzddOw1/7XTZBT7jjEUC039+8hKTk54ZWeCRlHJrmLs
         Kz24P0v2oDhjr5LcRBbnfgg+BKeHFTvS9qN4F7TKeMJWtXO48V2dgXGWQpb84fWuYXVU
         qK4PQocAmmNFn6q5gVTN+obC+/BbGPawqg+X7S6fJo2mMmZtNsXIT8iyAh2YcpNHyj7f
         VjTI4JjiWl5xDd44CP4sRV4jOfKq//TCG+cjZkYieoco8LA0DPYKg+84zLmAr3E0H3ah
         HTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472717; x=1752077517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLl0djX76uDh2KqOF+EzMvL6PoM9gvUJ0/VwerVvcuU=;
        b=DxYJjLiDFHd5VP8z7KJu7H5iNGSPGwpz70jHXHAJOAYhw39gWquglGRVyWBKUo+WQ2
         W+wybZpx4hf0snkAi9f6vxd7WWbRlHV1ptjp25o8DbAkQEIMdCayI8TV6MdPInDGtQGL
         3IW4waWcw0OjyGW3VT/bOj77mEse7YapKVOD7KOhEFhdMnqR+4Heqyi7aewDM7Qoze0K
         q2kfxWvvCIlLaMBAv6QaGNPRgqCQlpUs1NLPwQkqJIzlUkbjjyZR/Co2XZW5f056B/gI
         fPOQciwRA7JMZTfPJJafQKKD9ziJA6L8+Zgfc2A39lfQGfsU4RxqxlIDAcych2bdHmzi
         p6gA==
X-Forwarded-Encrypted: i=1; AJvYcCWXwhvpmlNMGFih5547NOVNMaxxS7DlxiVM+q1sOxjOKN6vm0dREGrXBIpr/uCt92pD1q4D31ErQYrKGqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYUF/EWhBKf+15jqGfbRBXkmVq+MVdx8Z7TgcQ384AvoCj21L
	hTS9J8EU7lB+FcJNLdq1wIBSxkMkCztIft/XyiaB3R/vhUH/YjDUDQOyy/EkiseuQKk=
X-Gm-Gg: ASbGnct8fbMOAy27VaIIBYG9YDbkFtQYk9fLFYe7b7mOie5S/z9FB40bGI79X40Tq88
	jkgRE0/tKz9QBkWmCJSKCxnmazhp6rYhdSPOb5WJLLEHTgC4QpNfnU5UJl4gzNPi3RNmlWhYQD4
	BuBKZY9I6y5I5Ve8nqtKxAgLvvj+bMLGAE4zKATIwFfh/j4R4lIM/nj39eACMI1mKG/BeLyfY81
	STRNhUJax+cZHVE5D72HLN5EpJ0i2GeYnOPpc4+cmJjMJBc1BwuwaWzLsodZ+QNAXIluk/1E4ao
	FoYYZUuaUQWuxhrl5Anc2m6DfYuGJBcmk5Z3afVrIqRsXOs4HqU1fRMsCfWIAOHlq20X3w==
X-Google-Smtp-Source: AGHT+IEUcyyYplg3dAlsN64/ClYT7sGu4SJixmVO5+dP9Ynt+31d1VKg5vFlMLwsobsP4aHj0c1LwQ==
X-Received: by 2002:a05:6870:e8c9:b0:2ea:8f12:5762 with SMTP id 586e51a60fabf-2f5a8d27ce5mr2546491fac.7.1751472717371;
        Wed, 02 Jul 2025 09:11:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:7056:ddb5:3445:864f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef7024sm3926135fac.13.2025.07.02.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:11:56 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:11:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, david@redhat.com, jgg@ziepe.ca,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH 3/4] vfio/type1: introduce a new member has_rsvd for
 struct vfio_dma
Message-ID: <24446bf8-3255-4622-a53c-33690c07fb17@suswa.mountain>
References: <c209cfd6-05b1-4491-91ce-c672414d718c@suswa.mountain>
 <20250702034720.53574-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702034720.53574-1-lizhe.67@bytedance.com>

On Wed, Jul 02, 2025 at 11:47:20AM +0800, lizhe.67@bytedance.com wrote:
> On Tue, 1 Jul 2025 18:13:48 +0300, dan.carpenter@linaro.org wrote:
> 
> > New smatch warnings:
> > drivers/vfio/vfio_iommu_type1.c:788 vfio_pin_pages_remote() error: uninitialized symbol 'rsvd'.
> > 
> > Old smatch warnings:
> > drivers/vfio/vfio_iommu_type1.c:2376 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list
> > 
> > vim +/rsvd +788 drivers/vfio/vfio_iommu_type1.c
> > 
> > 8f0d5bb95f763c Kirti Wankhede  2016-11-17  684  static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> > 0635559233434a Alex Williamson 2025-02-18  685  				  unsigned long npage, unsigned long *pfn_base,
> > 4b6c33b3229678 Daniel Jordan   2021-02-19  686  				  unsigned long limit, struct vfio_batch *batch)
> > 73fa0d10d077d9 Alex Williamson 2012-07-31  687  {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  688  	unsigned long pfn;
> > 4d83de6da265cd Daniel Jordan   2021-02-19  689  	struct mm_struct *mm = current->mm;
> > 6c38c055cc4c0a Alex Williamson 2016-12-30  690  	long ret, pinned = 0, lock_acct = 0;
> > 89c29def6b0101 Alex Williamson 2018-06-02  691  	bool rsvd;
> > a54eb55045ae9b Kirti Wankhede  2016-11-17  692  	dma_addr_t iova = vaddr - dma->vaddr + dma->iova;
> > 166fd7d94afdac Alex Williamson 2013-06-21  693  
> > 6c38c055cc4c0a Alex Williamson 2016-12-30  694  	/* This code path is only user initiated */
> > 4d83de6da265cd Daniel Jordan   2021-02-19  695  	if (!mm)
> > 166fd7d94afdac Alex Williamson 2013-06-21  696  		return -ENODEV;
> > 73fa0d10d077d9 Alex Williamson 2012-07-31  697  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  698  	if (batch->size) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  699  		/* Leftover pages in batch from an earlier call. */
> > 4d83de6da265cd Daniel Jordan   2021-02-19  700  		*pfn_base = page_to_pfn(batch->pages[batch->offset]);
> > 4d83de6da265cd Daniel Jordan   2021-02-19  701  		pfn = *pfn_base;
> > 89c29def6b0101 Alex Williamson 2018-06-02  702  		rsvd = is_invalid_reserved_pfn(*pfn_base);
> 
> When batch->size is not zero, we initialize rsvd here.
> 
> > 4d83de6da265cd Daniel Jordan   2021-02-19  703  	} else {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  704  		*pfn_base = 0;
> 
> When the value of batch->size is zero, we set the value of *pfn_base
> to zero and do not initialize rsvd for the time being.
> 
> > 5c6c2b21ecc9ad Alex Williamson 2013-06-21  705  	}
> > 5c6c2b21ecc9ad Alex Williamson 2013-06-21  706  
> > eb996eec783c1e Alex Williamson 2025-02-18  707  	if (unlikely(disable_hugepages))
> > eb996eec783c1e Alex Williamson 2025-02-18  708  		npage = 1;
> > eb996eec783c1e Alex Williamson 2025-02-18  709  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  710  	while (npage) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  711  		if (!batch->size) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  712  			/* Empty batch, so refill it. */
> > eb996eec783c1e Alex Williamson 2025-02-18  713  			ret = vaddr_get_pfns(mm, vaddr, npage, dma->prot,
> > eb996eec783c1e Alex Williamson 2025-02-18  714  					     &pfn, batch);
> > be16c1fd99f41a Daniel Jordan   2021-02-19  715  			if (ret < 0)
> > 4d83de6da265cd Daniel Jordan   2021-02-19  716  				goto unpin_out;
> > 166fd7d94afdac Alex Williamson 2013-06-21  717  
> > 4d83de6da265cd Daniel Jordan   2021-02-19  718  			if (!*pfn_base) {
> > 4d83de6da265cd Daniel Jordan   2021-02-19  719  				*pfn_base = pfn;
> > 4d83de6da265cd Daniel Jordan   2021-02-19  720  				rsvd = is_invalid_reserved_pfn(*pfn_base);
> 
> Therefore, for the first loop, when batch->size is zero, *pfn_base must
> be zero, which will then lead to the initialization of rsvd.
> 

Yeah.  :/

I don't know why this warning was printed honestly.  Smatch is supposed
to figure that kind of thing out correctly.  It isn't printed on my
system.  I've tried deleting the cross function DB (which shouldn't
matter) and I'm using the published version of Smatch but I can't get it
to print.  Ah well.  My bad.  Thanks for taking a look.

regards,
dan carpenter

