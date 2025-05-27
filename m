Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276FD156CA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373298; cv=none; b=DUAMul2Vk1kOspDbNLOwLpLaTn5OqcXQDkvM7wsgCevlddw8wxPzIw6+DcsPobmt1PeA9WtWg73WoupIxaAqeP/5rhPbY8LiZYp1rcaMHegBUBz3qIYXV88Q8UdcxHTuUoQDEbQR2/KW/Lq/e+MQinNqPm7e+LSX6to68Rbb5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373298; c=relaxed/simple;
	bh=vvXw0E7KhYiCUrAKJzQstQee/UQMK4ldfgHCUC6DWPc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofU5I8Anrn3ZOvBtN/H31NTrT6UxoNSylJS+tp1+oxIJYSsw3j7M/f4+V2/46ZUe0igJXfcwp2ijHcWecpcunoDLSWiYqudTBB16huSvrgQXhbfnTySuQjGsjGK1pQgI60gapS3EEpcg/XIfXl+WkLeqiDpTn7HTkEk7z59u0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bex4zGhn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bex4zGhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748373295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+A61WYnWj5Uj0Eyu8/R7/WVTiW1jNq3R30BLWtPJ5MI=;
	b=Bex4zGhnacPfl/D4Kvqr27cNet/miwARwu30DeWaQxyYCQSAAEW3QPvRtPpDdCxY9sbdhC
	jrQEqtcwST1F3GXAbis/txPj1MrkcudHUeDwlfMvRv8/PI+ldaWz5r9GZ84P5aEMD8Buw2
	CN7O3/jvBOheSZXyQ4kvgXbmkdTu444=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-mu-0TJjWOHaYXF_oJsx-og-1; Tue, 27 May 2025 15:14:54 -0400
X-MC-Unique: mu-0TJjWOHaYXF_oJsx-og-1
X-Mimecast-MFC-AGG-ID: mu-0TJjWOHaYXF_oJsx-og_1748373294
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3da7648c031so4361865ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748373294; x=1748978094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+A61WYnWj5Uj0Eyu8/R7/WVTiW1jNq3R30BLWtPJ5MI=;
        b=G5Bk6HzzW+o/bKITS0IW82RSjxHN3KRRPjm8sr9EYxYcxUZwSD9lLLuCs5imNrwXP7
         8+4m3o7kTT6RD20VfKBpjOqKEDMrsMQyu9vU6aKEKGBZ9rThMSSg88wTKIMpgVnZh7go
         GsWhPTDop0iFiklv+t+sh+uMDJ6RwC2KCjcOBsPYiyydsWGAmiD0in/EdLynpkOQFXok
         00O0HcALsmOul6yJsFuVkbDFGhHEWM3uNZi+ojRJwGUX2K3hToo9vu5+y/VVMM4dAT4T
         dxUreiVvjDXKU1BKcWNZSDEcWBuFEtQvPsVOgGra3JraiQ5MR0iDRqs0LMQ9ai6kR9tm
         Y/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWD4DEYHK1KuQCorf5Q/ZtDxWvN1UHu1VsQ6bzo34o5ebtU8mRCcbIPj1PliFqcSlJGcLoJ/rCX7Vh7dng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmA/VfK69d9rDm2QcdvgEP2lkjye41GmodPuANKeT5376E7Dee
	84/FuYLsOA2lOspSLpHhI8+nDSriycBVlKjWxss9MHSYTouEk/beDXJb48R4SHne4M76IYOKu9r
	2ob7qI7KeDjNEhjtsnbeTaxvPVXJAZxW2j3yVBYTmW498HzmxhodHD6VYBfKY0zR4ag==
X-Gm-Gg: ASbGnctwB26clZZ4JpslBtbPgdLu0hdgM0Xrtyvft3rJm8e/oBJ6I4LDGxfbjvdtCuj
	wQqpymWn5RHRHCQN3t9WfbXhU5NjfPKq3a5D5e39YnxHFIHcS8zw52yrvxaL1sxD2u2Q2Ztmv7I
	GFw0AZTTozfveZOGncTuTVOpTNWXVynzSJqUVUf7MSC4z0+smq+XST7egAwvu7VWJeDN/qJciZ9
	5YPtfyTeT4LKBC15I4oSy9Vd4vs+wpyg+B4iA7Y2Jr6GmNJvjttWYvib6d7g08VamIoGJIYshJ9
	zRJeGe6U0LwGXF4=
X-Received: by 2002:a05:6602:6c01:b0:86a:24c0:8829 with SMTP id ca18e2360f4ac-86cbb6c098dmr427828839f.0.1748373293779;
        Tue, 27 May 2025 12:14:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU8GmOksxajcZcAXCgxVMvMRhbIvCl6cNfPryCupK0n+LI5zGmRgcGkxfHgird94ZbXntg4g==
X-Received: by 2002:a05:6602:6c01:b0:86a:24c0:8829 with SMTP id ca18e2360f4ac-86cbb6c098dmr427827439f.0.1748373293260;
        Tue, 27 May 2025 12:14:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a50664b8bsm349552439f.2.2025.05.27.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:14:52 -0700 (PDT)
Date: Tue, 27 May 2025 13:14:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev, peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for
 large folio
Message-ID: <20250527131450.7e961373.alex.williamson@redhat.com>
In-Reply-To: <20250526033737.7657-1-lizhe.67@bytedance.com>
References: <20250523085415.6f316c84.alex.williamson@redhat.com>
	<20250526033737.7657-1-lizhe.67@bytedance.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 May 2025 11:37:37 +0800
lizhe.67@bytedance.com wrote:

> On Fri, 23 May 2025 08:54:15 -0600, alex.williamson@redhat.com wrote: 
> 
> > > > +static long vpfn_pages(struct vfio_dma *dma,
> > > > +		       dma_addr_t iova_start, long nr_pages)
> > > > +{
> > > > +	dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
> > > > +	struct vfio_pfn *vpfn;
> > > > +	long count = 0;
> > > > +
> > > > +	do {
> > > > +		vpfn = vfio_find_vpfn_range(dma, iova_start, iova_end);  
> > > 
> > > I am somehow confused here. Function vfio_find_vpfn_range()is designed
> > > to find, through the rbtree, the node that is closest to the root node
> > > and satisfies the condition within the range [iova_start, iova_end),
> > > rather than the node closest to iova_start? Or perhaps I have
> > > misunderstood something?  
> > 
> > Sorry, that's an oversight on my part.  We might forego the _range
> > version and just do an inline walk of the tree counting the number of
> > already accounted pfns within the range.  Thanks,
> > 
> > Alex
> >   
> > > > +		if (likely(!vpfn))
> > > > +			break;
> > > > +
> > > > +		count++;
> > > > +		iova_start = vpfn->iova + PAGE_SIZE;
> > > > +	} while (iova_start < iova_end);
> > > > +
> > > > +	return count;
> > > > +}  
> 
> The utilization of the function vpfn_pages() is undoubtedly a
> good idea. It can swiftly determine the num of vpfn pages
> within a specified range, which will evidently expedite the
> process of vfio_pin_pages_remote(). Given that the function
> vfio_find_vpfn_range() returns the "top" node in the rb tree
> that satisfies the condition within the range
> [iova_start, iova_end), might we consider implementing the
> functionality of vpfn_pages() using the following approach?
> 
> +static long _vpfn_pages(struct vfio_pfn *vpfn,
> +               dma_addr_t iova_start, dma_addr_t iova_end)
> +{
> +       struct vfio_pfn *left;
> +       struct vfio_pfn *right;
> +
> +       if (!vpfn)
> +               return 0;
> +
> +       left = vpfn->node.rb_left ?
> +               rb_entry(vpfn->node.rb_left, struct vfio_pfn, node) : NULL;
> +       right = vpfn->node.rb_right ?
> +               rb_entry(vpfn->node.rb_right, struct vfio_pfn, node) : NULL;
> +
> +       if ((vpfn->iova >= iova_start) && (vpfn->iova < iova_end))
> +               return 1 + _vpfn_pages(left, iova_start, iova_end) +
> +                               _vpfn_pages(right, iova_start, iova_end);
> +
> +       if (vpfn->iova >= iova_end)
> +               return _vpfn_pages(left, iova_start, iova_end);
> +
> +       return _vpfn_pages(right, iova_start, iova_end);
> +}

Recursion doesn't seem like a good fit here, the depth is practically
unbounded.  Why not just use the new range function to find the highest
point in the tree that intersects, then search each direction in
separate loops (rb_next/rb_prev), counting additional entries within
the range?  Thanks,

Alex

> +
> +static long vpfn_pages(struct vfio_dma *dma,
> +               dma_addr_t iova_start, long nr_pages)
> +{
> +       dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
> +       struct vfio_pfn *top = vfio_find_vpfn_range(dma, iova_start, iova_end);
> +
> +       return _vpfn_pages(top, iova_start, iova_end);
> +}
> 
> Thanks,
> Zhe
> 

