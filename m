Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3D204866
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530980; cv=none; b=V3ik9/LfrEiHcz8jwESOqoRkxe/LRODmJZJKoHYpV9PNPqAytLCK1ArsgbP+miU0+mFXUJaBE068lx0cT1IWox2KXdjwFKSsuh1a6I/ddQ9MdRHzbAqN/oh5OCQBCsIlRZTzTpux0GYs3wxbYpgqXKqLcLj+lPQLTgiOfITPbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530980; c=relaxed/simple;
	bh=TTC1zB76YN+CveMePfWYPOQo5XC+cQkIkEFO825685U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QemjOaGZpAilSNhl0Auy/jcMiRBlw9qF2xNBIpnEvu2X7O/BEaNA0H3IzachUBgvc10yOQm8xC97dW3c+VRVPXuKeCJvh8z95Sp7CLRJOc77SLtoRmo8y/I3A41f33LeGuZRvJUAb2wOnjerFy0aJfBlq9U3o5HwHpCs5WRKloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A91Zp0wG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A91Zp0wG"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30384072398so7934995a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530978; x=1744135778; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3d1znKqMC7VOlS2a3pEGw5g/7whO3ATqwDLPzCjVS4=;
        b=A91Zp0wGP1QC4l1/mvLpaxxoXzIkufWM/Ne8MvIjqg/5hXFvXmIx0UexytBM0vM52U
         fSh5UK+Bn8UtT/MkIZ7sO+sHc7NbleBZ4o+wEuSCZJARM7RKiunCmSO8DdBJvkJApm/r
         cECPN/aBC9lmxP8DTCrD2IcneeUMESmvRI3JKqKE+rU7C5YKy97EBsNdmfIwEZHKB+CT
         jjj5uZTuDBjAU0nPN7qqmenXpGS1Qpqv9M8OmdO5yh4C4rxwclMtW/GaTRRsF5bICrvV
         fgpWwTVEr19B/qtSG/iJaDtc6cHC7pwAQbmLG5eDOA52X9SO/FjL7mNOwGfVAMU0C5dH
         FWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530978; x=1744135778;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3d1znKqMC7VOlS2a3pEGw5g/7whO3ATqwDLPzCjVS4=;
        b=FX7FAPPvYhMYUWXfGFejk6tII1xlG4eEYzwFgCa89iUXFg6+AUGnvOamZJXMsxYRAx
         5BZ6yCgVn4zU+90NSsCGGdKZuPr65U1bCeK3zGxrpMIwxOzPpxSOvhpKL3M4tGeKdyXR
         mFMvcSgN7urOk0pq8ZZcL2NW8zHzC1C8xJmBZVqMfLCTB8A2vS79IWS6fdrlzt/KmRjI
         T8ifpbKELX5PORKgwImGQ/StoqTRF636e19C4Q1RhJN9z0jb4ptRvzqhpzczYKG/rNPT
         zf54yjXnTydPZ5TSaWZDSvhBbh7hdgmPK66Zex195MzOa0VKeVqL/XrJlsFtB9bwm1BD
         T1IA==
X-Forwarded-Encrypted: i=1; AJvYcCUemXrw/I3XeffumJvL8aWcbZVCzajPEqVU4URrSN5W0UvQZcO3xcSSgQQtUaQ+rnK8KNJIhxuj8aCvdL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQtOOEW7Rk8Md/7VGldNU+h5ZD8svFz5HWCBllBuqjWL8rX2h
	1KcVsvEy5b7XQUJ7z549aCN8hLHpFCqh8IFcsCHNiY0ZQ+cpDR3dfQoOL+s0
X-Gm-Gg: ASbGncsR0/ZmU6XV82FxB47qwFK7tIVjsk8fFwe4zc87hUu3ajcHBKCCuigmdzeiMwT
	xMZjjwBytb1vFFvputagudctsaNa+g26YykgTVwfnQVw6G6oriDt+a0S572lD4UFMj+/OivyV/h
	b1XtSzI595pj21zErSGCW03REWX/5FggKu44YM3xJQRY0ndIYPZkuCDWTjVDQO7b34cPpUklur7
	Iq6yyFsxuB51j3TFnT53hPxjkplFZuZsOWvD+hqU5nRWrVKKYC6LMz1+hBbpShC3ByU6gEzsszo
	Hw+rXXkvteWAgWhAUfaqWt96QRm61k9MpuZj8jCjd7jhC/DJ/ckJaEQg36sKHOYx9k9seQ9sgF1
	3
X-Google-Smtp-Source: AGHT+IFoWcXlJ2Y2kt5E6hphyINvqSYZoaxpblol2GK31vLmIEJl4Bw3fjiMfbEvKXqLDdPFLWSWYA==
X-Received: by 2002:a17:90b:384d:b0:2ff:7b28:a519 with SMTP id 98e67ed59e1d1-30532158ee8mr19492718a91.30.1743530978404;
        Tue, 01 Apr 2025 11:09:38 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d55fbasm9696288a91.15.2025.04.01.11.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 11:09:37 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:09:35 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, muchun.song@linux.dev,
	Miaohe Lin <linmiaohe@huawei.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/compaction: Fix bug in hugetlb handling pathway
Message-ID: <Z-wr3-eKLv0_ChZ-@fedora>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
 <4B989B13-EB96-4EA3-B3E4-18763941ABF3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B989B13-EB96-4EA3-B3E4-18763941ABF3@nvidia.com>

On Tue, Apr 01, 2025 at 11:20:48AM -0400, Zi Yan wrote:
> On 31 Mar 2025, at 22:10, Vishal Moola (Oracle) wrote:
> 
> > The compaction code doesn't take references on pages until we're certain
> > we should attempt to handle it.
> >
> > In the hugetlb case, isolate_or_dissolve_huge_page() may return -EBUSY
> > without taking a reference to the folio associated with our pfn. If our
> > folio's refcount drops to 0, compound_nr() becomes unpredictable, making
> > low_pfn and nr_scanned unreliable.
> > The user-visible effect is minimal - this should rarely happen (if ever).
> >
> > Fix this by storing the folio statistics earlier on the stack (just like
> > the THP and Buddy cases).
> >
> > Also revert commit 66fe1cf7f581 ("mm: compaction: use helper compound_nr
> > in isolate_migratepages_block")
> > to make backporting easier.
> >
> > Fixes: 369fa227c219 ("mm: make alloc_contig_range handle free hugetlb pages")
> > Cc: Miaohe Lin <linmiaohe@huawei.com>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  mm/compaction.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> 
> <snip>
> 
> > @@ -1011,8 +1011,8 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
> >  				 /* Do not report -EBUSY down the chain */
> >  				if (ret == -EBUSY)
> >  					ret = 0;
> > -				low_pfn += compound_nr(page) - 1;
> > -				nr_scanned += compound_nr(page) - 1;
> > +				low_pfn += (1UL << order) - 1;
> > +				nr_scanned += (1UL << order) - 1;
> >  				goto isolate_fail;
> >  			}
> >
> 
> Right after this, there is “low_pfn += folio_nr_pages(folio) - 1” for
> isolated hugetlb. I wonder if that can use order as well. Maybe not,
> since the order is obtained without taking a reference, but folio_nr_pages()
> is called with a reference. They might be different.

I thought about that as well. There's a very unlikely case where they
could be different: We had a hugetlb page, free'd it, then allocated it
to another hugetlb page. At this point (the success path) we would want
the rest of the compaction counters all the sync up to whichever folio
we ended up isolating anyways.

> Anyway, Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

> 
> Best Regards,
> Yan, Zi
