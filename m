Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020E2FEE16
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265773; cv=none; b=Dzrr+wpAFa7LSXFo0phZ8pAGVyfVoHHu9UeeaRJPSJeW53zztqCbc6Y92/OzFspk0/WjTGjcPzjqB6DlNmKwlEiz1sqTzmGcjEF5cRjkdpv3DEyhsauC7dmLR73KsHsEVF7mun/imaCi5hG74x5Fk5nnSeAxSf2cjGytjcpEZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265773; c=relaxed/simple;
	bh=ZQ7TZDVrBgNtqQuxb0S8bzpBJPAqpK2vYsj6v9u8ekI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODhUHLaCXJg3SmZgfXQSwvftWt4hCALAXsR7MI5YaCODAstsf4vZ/ZDlHDo7g8YDn34LiJ3nIQijfhmOCA1BKVLP7M1ka/wZGhE6DZY5+LxShNOV/oPbUK/Oc9Vs01DiMMeqyMWw02Yb+bk4+Ri/NTy05ryHq7di5KAd4FHeqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRXyDHsp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRXyDHsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750265770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fIqJPx+hVdZ6VMZuVeGfPGA+dF/0vqGtCkRLpRZfMd8=;
	b=YRXyDHspu0uBHC82+AdeXfVpbE8n6vyGePQvcQVCt8uoJ57PZZaTRhhFuiy9k0TUcEuCBw
	IpOHGlYMqBRmt+Id9zbWO0edAt301yCiliBTnRW5WNkcxMjG9pIZOcCc7ZEqnHpASvfxIr
	Cr/MRbVinePE8QjryZv+V5wDPBLwVCo=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-6re81vMYP2ObR0LqL8vRAg-1; Wed, 18 Jun 2025 12:56:08 -0400
X-MC-Unique: 6re81vMYP2ObR0LqL8vRAg-1
X-Mimecast-MFC-AGG-ID: 6re81vMYP2ObR0LqL8vRAg_1750265768
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748764d84feso9791453b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265768; x=1750870568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIqJPx+hVdZ6VMZuVeGfPGA+dF/0vqGtCkRLpRZfMd8=;
        b=JFg75P6c03PhUAlf4Wm6Aj5oTskXGNdFLK49ojzOkc+67swzNoQYkzcZ5y/viAVj0J
         mYYDpsYNDHGpZgL8rXDJPK+HSuMnKmAA07BrWZ4Q5LlD+1mrKqPGT83kvxpYJaYurXMb
         YNg0q1XEmVCRZwuCUSDaLl17ypk5I2YpLeZ/3Q7b0RmAHDn8LechItzfXIj2hUV6NSGl
         ZB9Xt+UmQNXNCWzRyNZehNejOhM+p5DLkWS8fHwJukJuuOQD1H8YtnPaM5r7Yayi7RCi
         ftl8/vrWr3LHjxa1TFQIwhVt3i6fG0skYTPS39obSM5Wqh/GDDTvvWDpOCUT9/NOQJo8
         D/iw==
X-Forwarded-Encrypted: i=1; AJvYcCUPqzcj1WB8oXrIjX4ATND9YqDk4nDZ0sqJE0czVx8nY3HVKYrc0d+mJaNhjzWaAuAXRJD6Ia8MKk2zYMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHA8V5+FATr9FlWRd/4aEdZ7m1oo2xvvOM3IZNySDdBIIn5F9y
	wOvKPnwYQMySFcef05afZ1ir5+Luuz65mw00zQbCwoZFqY1pUdUx5/zAg3fv8vBzIYx2rilXp36
	z14WSol19PndrZiNJOaLhBsy5TRfywjTwfxCFwgg9OqOU1VZcv/P0g51ANoaltvC/2w==
X-Gm-Gg: ASbGncsz/It6d7nphP4iuVOxDTKuyb+xEtLLUqKCWmRWvyaXCPc0xMPJ0XgfHgfHTBc
	HKzQv/O3hBldSHyuU4If4trHg7+9UHgYwxxF1L426/PDd3cZdft7oT5NkNOzvWzx80OVmv646bp
	0ZnZ0ru/D6IDovyHMzON1OzhL/K1KEgGAo37B02iIijh5mnIlpXqAFFUl+N3I4YQB7bw/v/LxkS
	i7FVHpy6P5EvrlzESnuUJHzzst/e3AI1qdWfPHl6zE6IqJx/dLWYneyi6eVVW/Bzb3sMBYXvFxB
	i9a2w5oMqbS6Dg==
X-Received: by 2002:a05:6a00:ac9:b0:748:2d1d:f7b7 with SMTP id d2e1a72fcca58-7489cffa98cmr25566536b3a.21.1750265767701;
        Wed, 18 Jun 2025 09:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIZUhEBIr4xiQwMA9O2tUbBgljMCpveJ7muzyq6G0/d5NeOKpjfbruv0BtTaIQsdL6oXmf/A==
X-Received: by 2002:a05:6a00:ac9:b0:748:2d1d:f7b7 with SMTP id d2e1a72fcca58-7489cffa98cmr25566487b3a.21.1750265767230;
        Wed, 18 Jun 2025 09:56:07 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffec9c6sm11280298b3a.9.2025.06.18.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:56:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:56:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFLvodROFN9QwvPp@x1.local>
References: <20250613142903.GL1174925@nvidia.com>
 <aExDMO5fZ_VkSPqP@x1.local>
 <20250613160956.GN1174925@nvidia.com>
 <aEx4x_tvXzgrIanl@x1.local>
 <20250613231657.GO1174925@nvidia.com>
 <aFCVX6ubmyCxyrNF@x1.local>
 <20250616230011.GS1174925@nvidia.com>
 <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFH76GjnWfeHI5fA@x1.local>

On Tue, Jun 17, 2025 at 07:36:08PM -0400, Peter Xu wrote:
> On Tue, Jun 17, 2025 at 08:18:07PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jun 17, 2025 at 04:56:13PM -0400, Peter Xu wrote:
> > > On Mon, Jun 16, 2025 at 08:00:11PM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Jun 16, 2025 at 06:06:23PM -0400, Peter Xu wrote:
> > > > 
> > > > > Can I understand it as a suggestion to pass in a bitmask into the core mm
> > > > > API (e.g. keep the name of mm_get_unmapped_area_aligned()), instead of a
> > > > > constant "align", so that core mm would try to allocate from the largest
> > > > > size to smaller until it finds some working VA to use?
> > > > 
> > > > I don't think you need a bitmask.
> > > > 
> > > > Split the concerns, the caller knows what is inside it's FD. It only
> > > > needs to provide the highest pgoff aligned folio/pfn within the FD.
> > > 
> > > Ultimately I even dropped this hint.  I found that it's not really
> > > get_unmapped_area()'s job to detect over-sized pgoffs.  It's mmap()'s job.
> > > So I decided to avoid this parameter as of now.
> > 
> > Well, the point of the pgoff is only what you said earlier, to adjust
> > the starting alignment so the pgoff aligned high order folios/pfns
> > line up properly.
> 
> I meant "highest pgoff" that I dropped.
> 
> We definitely need the pgoff to make it work.  So here I dropped "highest
> pgoff" passed from the caller because I decided to leave such check to the
> mmap() hook later.
> 
> > 
> > > > The mm knows what leaf page tables options exist. It should try to
> > > > align to the closest leaf page table size that is <= the FD's max
> > > > aligned folio.
> > > 
> > > So again IMHO this is also not per-FD information, but needs to be passed
> > > over from the driver for each call.
> > 
> > It is per-FD in the sense that each FD is unique and each range of
> > pgoff could have a unique maximum.
> >  
> > > Likely the "order" parameter appeared in other discussions to imply a
> > > maximum supported size from the driver side (or, for a folio, but that is
> > > definitely another user after this series can land).
> > 
> > Yes, it is the only information the driver can actually provide and
> > comes directly from what it will install in the VMA.
> > 
> > > So far I didn't yet add the "order", because currently VFIO definitely
> > > supports all max orders the system supports.  Maybe we can add the order
> > > when there's a real need, but maybe it won't happen in the near
> > > future?
> > 
> > The purpose of the order is to prevent over alignment and waste of
> > VMA. Your technique to use the length to limit alignment instead is
> > good enough for VFIO but not very general.
> 
> Yes that's also something I didn't like.  I think I'll just go ahead and
> add the order parameter, then use it in previous patch too.

So I changed my mind, slightly.  I can still have the "order" parameter to
make the API cleaner (even if it'll be a pure overhead.. because all
existing caller will pass in PUD_SIZE as of now), but I think I'll still
stick with the ifdef in patch 4, as I mentioned here:

https://lore.kernel.org/all/aFGMG3763eSv9l8b@x1.local/

The problem is I just noticed yet again that exporting
huge_mapping_get_va_aligned() for all configs doesn't make sense.  At least
it'll need something like this to make !MMU compile for VFIO, while this is
definitely some ugliness I also want to avoid..

===8<===
diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 59fdafb1034b..f40a8fb64eaa 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -548,7 +548,11 @@ static inline unsigned long
 huge_mapping_get_va_aligned(struct file *filp, unsigned long addr,
                unsigned long len, unsigned long pgoff, unsigned long flags)
 {
+#ifdef CONFIG_MMU
        return mm_get_unmapped_area(current->mm, filp, addr, len, pgoff, flags);
+#else
+       return 0;
+#endif
 }

 static inline bool
===8<===

The issue is still mm_get_unmapped_area() is only exported on CONFIG_MMU,
so we need to special case that for huge_mapping_get_va_aligned(), and here
for !THP && !MMU.

Besides the ugliness, it's also about how to choose a default value to
return when mm_get_unmapped_area() isn't available.

I gave it a defalut value (0) as example, but I don't even thnk that 0
makes sense.  It would (if ever triggerable from any caller on !MMU) mean
it will return 0 directly to __get_unmapped_area() and further do_mmap()
(of !MMU code, which will come down from ksys_mmap_pgoff() of nommu.c) will
take that addr=0 to be the addr to mmap.. that sounds wrong.

There's just no way to provide a sane default value for !MMU.

So going one step back: huge_mapping_get_va_aligned() (or whatever name we
prefer) doesn't make sense to be exported always, but only when CONFIG_MMU.
It should follow the same way we treat mm_get_unmapped_area().

Here it also goes back to the question on why !MMU even support mmap():

https://www.kernel.org/doc/Documentation/nommu-mmap.txt

So, for the case of v4l driver (v4l2_m2m_get_unmapped_area that I used to
quote, which only defines in !MMU and I used to misread..), for example,
it's really a minimal mmap() support on ucLinux and that's all about that.
My gut feeling is the noMMU use case more or less abused the current
get_unmapped_area() hook to provide the physical addresses, so as to make
mmap() work even on ucLinux.

It's for sure not a proof that we should have huge_mapping_get_va_aligned()
or mm_get_unmapped_area() availalbe even for !MMU.  That's all about VAs
and that do not exist in !MMU as a concept.

Thanks,

-- 
Peter Xu

