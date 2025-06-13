Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2689444
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828432; cv=none; b=iFMdOPioET0q2VlDprJpcgM3EcEeUuqvKsiMayXMX11GBcpHG9FEfCrx2nRD2Xgi5LGbu3y0jlCeT+ULUvrCwBHbivdCrmfoSL8XM+rlZ68vTu/i6/GlaIA5/nxVx6A1Ix1CdfDeNMry7Sj78hGvbjsrmNOllrj63fTk586vnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828432; c=relaxed/simple;
	bh=dTLeBokCk+Qu5G4dlYAvuaZ2u1EV60MG1tXSrQgsAWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iescPkYesshbb9RJ7A8RJKyVzVr3gr7JO2DihzeMKlyxSaZG+8DQsJPmL54AN7wo2lBrvqYCEkNj5oouSGE9cjOeJ7N92p7XCetOiW3Ijyn4HmYjx4ayhBCFrUaAl9+iPiXYACdbFa5DWmtGzJ2k+AVDAugpsnGO5qC4QUDNARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0vX3vYQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0vX3vYQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749828429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ffGF128HVtw6a+HHD8uShTa3yQQnx4ItFakvkjkmL6Q=;
	b=g0vX3vYQ5PgJ03QQwM45dLLmXJb7BY0MWbIU28u0LhPfLYTMo8Tp/DSMmXSxwdSyuPuGRw
	SrhzTF5HIGSjZRW81sKTVs4i81yq0cnVTToe84XTUAM4gM1y2/5ep7qjb2eyJUVNRwmsx6
	ed50W5knfUKI0zSQ6texP+qLsqOkvHk=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-YkAygli8PFinD-_FkymMBg-1; Fri, 13 Jun 2025 11:27:08 -0400
X-MC-Unique: YkAygli8PFinD-_FkymMBg-1
X-Mimecast-MFC-AGG-ID: YkAygli8PFinD-_FkymMBg_1749828428
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cfccca327so493138739f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828428; x=1750433228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffGF128HVtw6a+HHD8uShTa3yQQnx4ItFakvkjkmL6Q=;
        b=FUJkEWWwBVUI0+sAPLaevO3nW6FtgUQap1UBiNC1rYHb7U7AZf7oWOjzgGS7g6mym/
         Nu+vVw3FFcLi0YFGgymgmCQbSC1m/Pidp8pcaJEpmVkmfMxat/hjJ9fVd/P0iN9fQhGS
         PulWCRM52VT50kgzmjUuzucIUhDVnPKzCrDQrJutiWohimeIQP+rqw6Xfam/HtCaxkq3
         +DhRkK3YospLYGgrsVw2dI7qsg/Bmb5v0G97jlAbO740uuW5Z0RYGiLrZWx7nzxhvIPr
         TrhmhC8bAlFORokjdetpBTLvAMKfKUzU67fRTGXa/JiVdwb5DyVtRXkSdPscVNAM1tNo
         TDzg==
X-Gm-Message-State: AOJu0Yx76q9K+J6gn8TzC0Mbi14xxbUrXbqhA9WLYxEgnit+M5d2XPyy
	A1UI3VdmlgrFIaFqVfYsZ1XYT0a9LJzHND1guMcVtYtdtElgwK1r9G+088xWfy0NoWL8t+KR3Zl
	Lh3fyVvahjZGYJx5s3zZBopw50g98yIHsVvDFHxtbhBKONF1hBzbpUaJ82WVYaiIJM/13UweDOA
	==
X-Gm-Gg: ASbGncvnEQWEroDgflaxIPSLbh+wiuqfrDpSuZfSGE1tylZR2hec5V8yEs1fJV5I5ls
	L5iGjKqjJOlWUBn0jbfUsRMrq2bjSehT84I0RKq/MqKZ77D0MzyrGTIBwaE8rFOc/urNIlBxPD7
	WwK/oCy47zxc5nUUr0YNW8OU6oDQxUYKfafE8uhDfR2FOSX63BLJbY0lIWcvcZYG2pL3BxrGPLR
	vM5Y+wFZ+LGSztJtoUJ+csBrRCDDgWVytcpZSw5J40r4go+Ozy1uugOCOLmUDcE5QFVkR6tEWbF
	G7cf7lZWMTJgig==
X-Received: by 2002:a05:6602:b85:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-875d3d047e8mr419246239f.11.1749828415813;
        Fri, 13 Jun 2025 08:26:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8djcjjfItHRHrDNgzteRBKJ058qY0Qze27Tb0GmaT85bQCB0E8VSqwOBOZ5ggANoXHojH2Q==
X-Received: by 2002:a05:6214:2343:b0:6fb:3537:fcfe with SMTP id 6a1803df08f44-6fb3e602ce6mr52125976d6.22.1749828404861;
        Fri, 13 Jun 2025 08:26:44 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c55ff4sm22627546d6.92.2025.06.13.08.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:26:44 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:26:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aExDMO5fZ_VkSPqP@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-6-peterx@redhat.com>
 <20250613142903.GL1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613142903.GL1174925@nvidia.com>

On Fri, Jun 13, 2025 at 11:29:03AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 13, 2025 at 09:41:11AM -0400, Peter Xu wrote:
> 
> > +	/* Choose the alignment */
> > +	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && phys_len >= PUD_SIZE) {
> > +		ret = mm_get_unmapped_area_aligned(file, addr, len, phys_addr,
> > +						   flags, PUD_SIZE, 0);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (phys_len >= PMD_SIZE) {
> > +		ret = mm_get_unmapped_area_aligned(file, addr, len, phys_addr,
> > +						   flags, PMD_SIZE, 0);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> Hurm, we have contiguous pages now, so PMD_SIZE is not so great, eg on
> 4k ARM with we can have a 16*2M=32MB contiguity, and 16k ARM uses
> contiguity to get a 32*16k=1GB option.
> 
> Forcing to only align to the PMD or PUD seems suboptimal..

Right, however the cont-pte / cont-pmd are still not supported in huge
pfnmaps in general?  It'll definitely be nice if someone could look at that
from ARM perspective, then provide support of both in one shot.

> 
> > +fallback:
> > +	return mm_get_unmapped_area(current->mm, file, addr, len, pgoff, flags);
> 
> Why not put this into mm_get_unmapped_area_vmflags() and get rid of
> thp_get_unmapped_area_vmflags() too?
> 
> Is there any reason the caller should have to do a retry?

We would still need thp_get_unmapped_area_vmflags() because that encodes
PMD_SIZE for THPs; we need the flexibility of providing any size alignment
as a generic helper.

But I get your point.  For example, mm_get_unmapped_area_aligned() can
still fallback to mm_get_unmapped_area_vmflags() automatically.

That was ok, however that loses some flexibility when the caller wants to
try with different alignments, exactly like above: currently, it was trying
to do a first attempt of PUD mapping then fallback to PMD if that fails.

Indeed I don't know whether such fallback would help in our unit tests. But
logically speaking we'll need to look into every arch's va allocator to
know when it might fail with bigger allocations, and if PUD fails it's
still sensible one wants to retry with PMD if available.  From that POV, we
don't want to immediately fallback to 4K if 1G fails.

Thanks,

-- 
Peter Xu

