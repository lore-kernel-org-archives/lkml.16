Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6426982C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960161; cv=none; b=PE2BxFlAx2JYR8i5ndvGP3/ByNFpfdjFFV1L2+BTWO5sVnmpKWOkxiM6yA7u05oy3iEviJESQGnzcPuCv0A5kXUr4+4oPiHjf2EhVjLBGLcKtr1DGtSdWyySgqSRD6UnLOJbG+3GWIUS4iWeGl3pitIhIFtKKFqusgU3YhXPRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960161; c=relaxed/simple;
	bh=7mNKgw7B4gWkWk/1cFhoOBWm42l3r4EBHfns+bKE79Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhJbvx6YcvEkHLbpoXsyAKFxbrGbD1haxodnf3pY7PR2ffbyBJbGCTpQ8qMtHG/j8W0Xsg/9T8eGcoq5MZc5ouI1g8mNIGaO/SHQD9iAyF1fy2FDB/nfXbLEriNPSqfW0YveO5vr+LqlA0nWOxTmLu0bIjfBGAd5z8ACOBZYAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVhP0LyU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVhP0LyU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so232585ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745960159; x=1746564959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=hVhP0LyUibP6cW3zXWRv/u6XdVRHP6JsX/RF0qX8E+1TjZg7i/my2TfNL4JfFyR5W8
         Ll1NZAC2aSDclzNK7E0faPBF1pVTaLla5HPNPUbnfHHVAmCIpskR9UzL31DnFMOi8I+8
         Hro/jCy2oo3sZIIefpzvTF3wfMY+dAo6ejcQBkdKBxHcmTNjBYWTPRmTj3xuP2daPe9O
         p05Jdg2PcQYhRazrk0DzXm2pUq7SbV3EOks1tdO1BJnKWHa0GQ7XloMpEvXIsODKySff
         szatQaN/F74IsP0AEfjVXxkbMly2Bw6z4nBkISXoSGQHIBVLkliv6JYYdeyKmftoVgU3
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960159; x=1746564959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=IoHE8ovA/mB2TCsVEeht1PjNdZjywQ1q4ntFCkD/9jXzWZ/SvVZB+0s15qNyBV8dzB
         KEN98zZVtGjo4wMT7Z+dpzGSr1IrZSl6FEElkqoc8fHwRVnSs/2trecemAWV05zUjv/p
         8d520jXbwvBadSGMp1F8fGz5sl6zU8DXsBOYRlIt0G0YiX8tOfQNHtvRpXGad4kJ1sP1
         Xg6w3qOt765SIB51kKsv2MXnfvRSTI2mimk6B3ETpCulU6n1Ef8JiEnZNQ7tQRx7z+oC
         KC9VfjM1k2MD4vVpCz+0/u/Pg4GOW1T/StFgdNe1hHxRC0J71tjpPMWPCjbwzCWqwQEn
         k8sw==
X-Forwarded-Encrypted: i=1; AJvYcCVXfBrAkigneo4bjrfyxl47O0oaw3E9unHxFlnbCjvwj+rLmtloQ9UUxr4r75bCgCNwthLyijgJPbnclnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nY+x2a3bNRnC1B1LDRTmEgDjHqjPPTwcrVZsn4L05Nh+z54J
	UTE83/F607Dq+UMS35WTxVty3hU14s6KUJ1L24/Os8+K4nNIySmlfQzNTg0BSw==
X-Gm-Gg: ASbGncvnaZPgzFG1u4qhl/Zbb2jcUfzjGQ5y6F1uiYAx5TaRebmJeCJK+KsNbVbFQPX
	kbqG/g80t7v3FlqWgxG1EoabNjhZDVb5Z62xHs8PjpqZr7zEUTXT8c2viF+wir49dK0uWSlUxGW
	OITYQcsR2jxHgEC+sAzniLASxKv6hhjfRPtIMGfvuo/8maoQ7rgF2WQcgeKpzj+CUekUrWkAk74
	e+/IuPytGCGRzgAYJhm5fF2d9xTemNAyGaHS0uli4WyPzkVglhKT/xyQt1+RHREwLQTiBmLfk4s
	EvYqdO5KyXvlyBMkZUenvOhl5WoSvc6j9rJeUuhOdhnQcNuDmByCIoIU7yc3ZjUVH57oRN8u
X-Google-Smtp-Source: AGHT+IEDLG3SJps6W1WWtS+Z1B6wTQS34GYl+OTkQIvhX6qglLU7EkbEpqx51RkV1YpDBN8wRt1Y4A==
X-Received: by 2002:a17:902:ecc5:b0:21d:dba1:dd72 with SMTP id d9443c01a7336-22df545d1d5mr63705ad.15.1745960158589;
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52168b9sm107756155ad.226.2025.04.29.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:55:47 +0000
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
Message-ID: <aBE800DsAOOZ4ybv@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBE47aySzDp2lsAz@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > +	struct iommufd_mmap *immap;
> > > > +	int rc;
> > > > +
> > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > +		return -EINVAL;
> > > > +	if (base & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +	if (!size || size & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +
> > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > +	if (!immap)
> > > > +		return -ENOMEM;
> > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > +
> > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > 
> > > I believe this should be sizeof(*immap) ?
> > 
> > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> 
> mtree_load() returns a "struct iommufd_map *" pointer.

I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
"size" parameter, which is being passed as sizeof(imap) in this patch.
IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
sufficient for the given "size". 

Now in this case, "size" would be the no. of pfns which are mmap-able.
By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
for a 64-bit machine. Whereas we really, just want to reserve a range
for size >> PAGE_SHIFT pfns.

> 
> Nicolin

Thanks,
Praan
