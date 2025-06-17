Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD1188006
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750178872; cv=none; b=OrfTkJhAlNWkLHSwZDosRlTGIAHUwwDvejvuanGSVxZ4j4q3biU0F0wgCodCHb0PntN7gqiF0/y5CA1hkw7NUPs3YbbEp8HCbOvd+IHJ093jaaX72ogpr9fWv3kbsA82j51xfvp5i0rJ/KjDnKSh4V9rjDKx1oPm7ZLXEBfq+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750178872; c=relaxed/simple;
	bh=Ng2+55cycp9Mq67N0F50gt8NmngHjK/xJ38hqLOcTTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EN2TiFBg08wKYQolRwPQEhC8shZoCvT0TzR6qPfynSrZ+6tGg/aP3Yo5tqSgjgu4N06ts+1xc55u7dgQMkqgkEYGlgahcFilUsfBcseuBff/Ylw9Z2nwgkmi8AwiTj91bbK6LIJW7kAzFeagsWsbH6ZYDcCK4Es7u1gIVyfdar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vlv6hpJH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vlv6hpJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750178868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9udXpXMKLqnXjPpw+ssHtlTIRsjM/WGu/+kStlwAoqo=;
	b=Vlv6hpJHqpbGtIdHILoe/WcXugX4yrLY5UihrMBEM/8/AJtFpeCuHCYeVbRMkr/mXrSL5w
	SLg2vGScViwzk+sgVU1Q3cuoZEKy77zoY59sSxTOMFAronIn7PrGIrNlcrDU3rwFn99sx8
	XrPRX4xNA/cQdLZahS/0psRIfuamviU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-fPxFmIooMNmEYQs1MXiYYg-1; Tue, 17 Jun 2025 12:47:47 -0400
X-MC-Unique: fPxFmIooMNmEYQs1MXiYYg-1
X-Mimecast-MFC-AGG-ID: fPxFmIooMNmEYQs1MXiYYg_1750178866
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-312df02acf5so5263792a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750178866; x=1750783666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9udXpXMKLqnXjPpw+ssHtlTIRsjM/WGu/+kStlwAoqo=;
        b=ZW0P9G9q5LJ6iQFJVFq7MBvKtP6gfvbJN/LL0jzhsWWedpZqOV5oyXPbAEh+b/T52N
         cZ0xZHWzhKrGDTILLK1SBDz91k0I7uuZUaz3B4+fvP6Xuy/9vYRWeBAHxt4pDMIBYl2O
         s4cL2n4ZmKRjQUfu//FydByR0Yod6lMtrb515DMPB0WOW+Gr4Ro+kuFSpmYTkyKPxtsT
         fGAfIxUPidjlp1GfibOrhPv1ANjUMZBbrOlcdmm9S/RQJAd4giOXt0BRogkv0zaqXyge
         hR6YGUiwDHWVCI3HxVRF/SrshdEZTUMJLGIhjUdRmIQjPJlLCdBkDxVRBqeh2Jtgfqzx
         RuFA==
X-Forwarded-Encrypted: i=1; AJvYcCUYE3eAS7zqGxd/X3sheo/i3mLRkV5hwNAVclAWpsFn3n78K+qZ2//Bovj/3VYV5LfJ7JJ75MYe+IEHw8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIBZ+BhPkJWYFY2Zcs+q2z/41S6cqMCitVVHCzR+2JaY5O9KB
	mGHE566AyZUjLWZkn3Gd9LyEhqjAOr5NLiTrunuz74XqDx4GzdwsdDZlyzLz0dsRbKpd92xz/7U
	VnmOLCbDWqH98INBdhM5Yz32hqwn2aVvEKQsmD+mY7tvhwJ2IB9u+KUQvHuhQOQd6Iw==
X-Gm-Gg: ASbGncv5HEbixbZQZqyuLi5+DBVVJZj1IZfyCsX15SxBR1BCTO2eW3zGqg2Xdv93Z08
	JfhqtH4rqhckxjNeqv4nQvXrnJb7H5grlSU/HpdUWFMVZaIKz0TTD6d94fAj/a8S7QxCm15RMzM
	k0aadNDHqZCJUTy7ZtYoM0mlPHNoZFVwRhYwD9ykwJdGc44/pmT/3hge+gSfSdPqfX+VP63YgI2
	wxM+t4U7SpglN5dmYTsIFqGtRdKsYwBRkWEaETKUIJFbDgHFdtr/uXYInPwE2S09LVmv0sZVlbu
	Rv8g8u9uANo9iw==
X-Received: by 2002:a17:90b:2808:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31427e9f04cmr4387980a91.11.1750178866280;
        Tue, 17 Jun 2025 09:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ5RZvlcb8QDXdYGv2rCtK+dVH8l+O3RgQMnCOn4WGgTIeBHCIqlbbuc04Tn+tkV7OjqZJXw==
X-Received: by 2002:a17:90b:2808:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31427e9f04cmr4387954a91.11.1750178865920;
        Tue, 17 Jun 2025 09:47:45 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decb947sm82211815ad.225.2025.06.17.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:47:45 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:47:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFGcJ-mjhZ1yT7Je@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617154157.GY1174925@nvidia.com>

On Tue, Jun 17, 2025 at 12:41:57PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 11:39:07AM -0400, Peter Xu wrote:
> >  
> > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> >  static unsigned long vfio_device_get_unmapped_area(struct file *file,
> >                                                    unsigned long addr,
> >                                                    unsigned long len,
> > @@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
> >         return device->ops->get_unmapped_area(device, file, addr, len,
> >                                               pgoff, flags);
> >  }
> > +#endif
> >  
> >  const struct file_operations vfio_device_fops = {
> >         .owner          = THIS_MODULE,
> > @@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
> >         .unlocked_ioctl = vfio_device_fops_unl_ioctl,
> >         .compat_ioctl   = compat_ptr_ioctl,
> >         .mmap           = vfio_device_fops_mmap,
> > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> >         .get_unmapped_area = vfio_device_get_unmapped_area,
> > +#endif
> >  };
> 
> IMHO this also seems like something the core code should be dealing
> with and not putting weird ifdefs in drivers.

It may depend on whether we want to still do the fallbacks to
mm_get_unmapped_area().  I get your point in the other email but not yet
get a chance to reply.  I'll try that out to see how it looks and reply
there.

-- 
Peter Xu

