Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764D326A0CA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963879; cv=none; b=FPPbSlqS8/2jqhYsIqqi1cEF3UfWwwW3bnmpBJ2bulAtl1/NN7kw8SfMQ1LyWxlzXGU6EIgvzalXXjUMhOpoXvYfZ3a80xEppiAf/fogqTrM3urs2/oJK9Snfu6E457cG4vx1d66Y71O47iNLVLeAxniGKNrnPZxxA10C9bURVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963879; c=relaxed/simple;
	bh=JxqDFFtO3S8kK/E3hLQE8+QiBq8AOwa6PH5SwIKxxXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV+IMIQj5ZwYeIe/zbontuiBXee1fBxQpPFZLkJ8xnHFpP+Ay8yzHpsrITOQRw/dVFwXV4u5bbkpQLjFRhIRzdByV5CVnQOkqPy5FbHorgCEwvSYhKxKPrlnJIetU2nsVw5P2jI/fPuZInc4peIIlZ1e4Y7v5d7TxsMhRiY/ygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1a2S72/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1a2S72/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so244055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963876; x=1746568676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=g1a2S72/cymW8kXsuX2UJmpNGyOr7BOSEhUThSr76hs+EfSG4XfDT+hLAlQIFIy56D
         y9WXL+RqV29Yz48FYRPUDCQh8BQ71rX2JAnxk2LzEvWartDfX9+W3m8cMDh3q6zB1DHw
         BtrSsdujbmr8EbQK9UCAjaF01304FkIIVKXU7BxibhSLDvnUCXCfs4AflNYgjOv/uwx+
         0JCxZPacY7IZ8rdj4c7eoKvjxBisGQTy4p9vUgM8O6KZWTGFO2OennRqhed4iuagUPmt
         v/6GcqrdFRsqN9kXEz0sI00V6iQOT8xPTT4dAuUYoa2PFIAX7baVUBLz/V2pesxQm1/J
         cC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963876; x=1746568676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRuE0k+DaKR+dFrI7c28XxIZx1ZsULnIcimVdzgk9ZA=;
        b=ApgblaFORSCmMLOLY4oUx4PXIm6ZNYoEfaMjK9GKpvK4bQ8LLDrmoCfWdPhHsWtanP
         nnULxAUd+s3V1OUHbFDWmwh7lzsBDKfNfZZibTpagAusQAYcUYjwWkmsVQTQRukbttau
         cq/4FB6g2+g75MSu73amAPFAbZSDBYzySHDZtfUreY6cGoej8I/lETEhfmc+6pjCFeyo
         PATYBEi53H4K9H0tzBi/iJrVCIemrrf8F4h5aQM2GqFUEYyBMjLasveoNN4oLx5BGihN
         8ozwlVyMj97nb4rogbrTnbgr2r7i7NENJNtIEFup6AcUrc+d01jCmS/BCuC9daRe1OW/
         4yFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa/tgm5bGr0XM4ko85xrDtMHRlK7Rcs86aj/FFJRcdauC4s7ZK6xSO9UmgnnUdSSVniqdNRTVc5PyhWPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyzVlcHzIv19poRV9qGjHdRaCHSAGN5vNlCZaotqqCBPzVo17e
	JXDKGn/Ftn1I63G+NzvXTODIlRAiSfXWjrLZnJLYGP5yKavhpVzcmF7Q6oAu0A==
X-Gm-Gg: ASbGncvC0yrBmOM3KpWzoh9o6HCWTS18/K0QizlcjM1v8X2JhpjSimNjferxxTDPNPx
	8A/YaQbZBIgxx+5iyqkgFD5WsLEGWuUbb8sdJeAOQskagJ/gr3M0xNhksGzFinBv0GBRnWwi/c4
	qFqKY4p6UyD98Oj3jmj88H+w0lPB0zdLFlXXylsnDpYGSwzPOor8NQUdJR03grzEHY/IrOI4znU
	EoV2XQkAsWgaKf4labWKAvJSiAyYEzYo3ROBTFW4unh1SSfWeLq9Hiynmr72474E2CCGJkrr/Sn
	KolFTmr1VeAh3OKSpFOhnGw8OjyzwRQO0pfkJ7xsmiaZURpRKtip2PpOpNdlVsOSqfwVlCTDHIZ
	stQJe2gE=
X-Google-Smtp-Source: AGHT+IG2GQrBKEV0sAuQTzjtnWFNlTLvqHxPy8UFJFeAPu3X8NPH7IbodXwNU55E95G96pW683QFuA==
X-Received: by 2002:a17:902:d489:b0:220:c905:68a2 with SMTP id d9443c01a7336-22df53e1f95mr331695ad.5.1745963876294;
        Tue, 29 Apr 2025 14:57:56 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5104ec7sm107543895ad.175.2025.04.29.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:57:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:57:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBFLWUvzvwtFXK5z@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
 <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBFIsYg+ITU8RvTT@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 02:46:25PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 09:35:07PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > > > +	struct iommufd_mmap *immap;
> > > > > > > > +	int rc;
> > > > > > > > +
> > > > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (base & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > > > +		return -EINVAL;
> > > > > > > > +
> > > > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > > > +	if (!immap)
> > > > > > > > +		return -ENOMEM;
> > > > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > > > +
> > > > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > > > 
> > > > > > > I believe this should be sizeof(*immap) ?
> > > > > > 
> > > > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > > > 
> > > > > mtree_load() returns a "struct iommufd_map *" pointer.
> > > > 
> > > > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > > > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > > > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > > > sufficient for the given "size". 
> > > > 
> > > > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > > > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > > > for a 64-bit machine. Whereas we really, just want to reserve a range
> > > > for size >> PAGE_SHIFT pfns.
> > > 
> > > But we are not storing pfns but the immap pointer..
> > 
> > Ohh... so we are storing the raw pointer in the mtree.. I got confused
> > with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!
> 
> Yes. We want the pointer at mtree_load(). The pfn range is for
> validation after mtree_load(). And we are likely to stuff more
> bits into the immap structure for other verifications.

Ack. Got it.

> 
> Thanks
> Nicolin

Thanks
Praan
