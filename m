Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CE205AB6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111596; cv=none; b=sG+oyh2MsKxyghkS5Rh8pDy3EsYVYGPaDJMWDDfjYd6cNVz+G1uOL6SvrO58R4ATAJ3qxTgrdexkqDteKecKqFH8oJi0NSQ3pMsbuDTpA1NP7baXnKKf1xoMbCBL9x1+a/R14qSIa6EoU5vTCdWFgejPlihvj0T6yPbmrG88wwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111596; c=relaxed/simple;
	bh=26kZrZoV8Ji9Lqy1VOqU4UKqW2YBkKONHQeTZOiQqos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfuOvCDBW+uZ/PrEpQ8KYaNaKGWbfI8FFOjvPRkTVLOxugrUJQhMDtQR9TwYaxF1yD5hXI4kYJw9JOO8tYFoBSpoDH9YqDUYAfOQuWHOkCxelBUIHoBBCrsraTSaESAZhJZo6QiIx/FhOIgnlN9+6iw/u3VVWFgTU+D1e5ENyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBMOyz6f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBMOyz6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750111592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dFHYfgXcZKBPfdb0AbYsNeZbCn3z17biLchrL/Mt8bQ=;
	b=PBMOyz6fbvAh1FrjyZ7e1ICTFXtyiXJOhCM2iZe+vyYGrV+9gHn23ph7xXdrc2nCOsK4Py
	rztjbHMLme0DEcynoFPqoCKVsgr+37wDq2DrjQxPWqL16iJQblrgfk2BVzXmuU3u91t/dv
	qn0la8892b5SGkXdL9jctFwCg5ImDco=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-TvyX7VEvO1uoTfoFi2IK_g-1; Mon, 16 Jun 2025 18:06:30 -0400
X-MC-Unique: TvyX7VEvO1uoTfoFi2IK_g-1
X-Mimecast-MFC-AGG-ID: TvyX7VEvO1uoTfoFi2IK_g_1750111590
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so882635085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750111590; x=1750716390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFHYfgXcZKBPfdb0AbYsNeZbCn3z17biLchrL/Mt8bQ=;
        b=vLzBFAXXjmYtoc6A+5diAHcwVZ/qEIixFkYXCuOIutcOj/Kf8V7Rhew4D7giMBO+hZ
         qZo0oYU8HSqwDrXkDY5IFhTnSeI3+UgtW2k05qXrfpFifv3SLrAOEN8vCfkU/YwdABjY
         3TFZnhD1sYsbecaHxJXKlEO4gn5ppmKli2GvK0/xY/zZQSX+wFLNCXdvA1lAiGTDgZ/J
         95MsYafYLtv+POak+LLXCgbk28vEQgDoYbp9Mce0kd82gZGjdYoAP4TGptuCbG3/C/u3
         aSRDFPDldQUA0mNvB8/VDvYO5RgI7+CoHLnil24bhRfTJ/pi+GVOMeb4OdAxGDE+HsDT
         CozQ==
X-Gm-Message-State: AOJu0YzxE6lBReFjjlRtS/jU0BcBTf2wgZU6AJve10WJdCtqog2NyqRe
	lkZMDoldrdvjiBd6TDtA7ck+2kxJELt8X2gxqfBOvfOfoIhSi2WFbKi04QWug79ObkS5iqQSu7+
	WymxzksbuGpVin277HAyaQJNRelOG5MSZ1xroqYSk2FV4L5+ciMoRyON3ylC29ew1zQ==
X-Gm-Gg: ASbGncsrHlnVjc4HdilIIWiGfPTz3ykEWvBf9MNvkezDf90MKpbF2oEyC/E+/TXJaOb
	Sl6qE50M0Fh7pp5cjnYARiJIhHFIgM6d7TAOtEA2etxZPy3tmM0taERTdMg5t9Oy0H26GaY6qPt
	ChwUBPuCK83zddufg4lsX/UjUiy1BclTv8sJ1gWwUiH6jbLqW49MLc99bZElAGRUzL1Mn7t0756
	C2yvyS/OcimIEWUCvsBZ4KteAsZMmDR4dRHxcTSBjAbf7iQ/93VZ+k4ZxTdsfnm4d3fft5dFMLp
	hStj4lzJKmQ5lQ==
X-Received: by 2002:a05:620a:2a0f:b0:7d0:9f1e:40dc with SMTP id af79cd13be357-7d3c6d0caf4mr1880930385a.56.1750111589980;
        Mon, 16 Jun 2025 15:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb2JRUDP2T8baEWYp/vOc4digV3ytuAMVFRb0HHQswTS/EU4/mjLVkZD74bYg3SYHshW7vyQ==
X-Received: by 2002:a05:620a:2a0f:b0:7d0:9f1e:40dc with SMTP id af79cd13be357-7d3c6d0caf4mr1880926685a.56.1750111589617;
        Mon, 16 Jun 2025 15:06:29 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe347sm576951985a.36.2025.06.16.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:06:28 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:06:23 -0400
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
Message-ID: <aFCVX6ubmyCxyrNF@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-6-peterx@redhat.com>
 <20250613142903.GL1174925@nvidia.com>
 <aExDMO5fZ_VkSPqP@x1.local>
 <20250613160956.GN1174925@nvidia.com>
 <aEx4x_tvXzgrIanl@x1.local>
 <20250613231657.GO1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613231657.GO1174925@nvidia.com>

On Fri, Jun 13, 2025 at 08:16:57PM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 13, 2025 at 03:15:19PM -0400, Peter Xu wrote:
> > > > > > +	if (phys_len >= PMD_SIZE) {
> > > > > > +		ret = mm_get_unmapped_area_aligned(file, addr, len, phys_addr,
> > > > > > +						   flags, PMD_SIZE, 0);
> > > > > > +		if (ret)
> > > > > > +			return ret;
> > > > > > +	}
> > > > > 
> > > > > Hurm, we have contiguous pages now, so PMD_SIZE is not so great, eg on
> > > > > 4k ARM with we can have a 16*2M=32MB contiguity, and 16k ARM uses
> > > > > contiguity to get a 32*16k=1GB option.
> > > > > 
> > > > > Forcing to only align to the PMD or PUD seems suboptimal..
> > > > 
> > > > Right, however the cont-pte / cont-pmd are still not supported in huge
> > > > pfnmaps in general?  It'll definitely be nice if someone could look at that
> > > > from ARM perspective, then provide support of both in one shot.
> > > 
> > > Maybe leave behind a comment about this. I've been poking around if
> > > somone would do the ARM PFNMAP support but can't report any commitment.
> > 
> > I didn't know what's the best part to take a note for the whole pfnmap
> > effort, but I added a note into the commit message on this patch:
> > 
> >         Note 2: Currently continuous pgtable entries (for example, cont-pte) is not
> >         yet supported for huge pfnmaps in general.  It also is not considered in
> >         this patch so far.  Separate work will be needed to enable continuous
> >         pgtable entries on archs that support it.
> > 
> > > 
> > > > > > +fallback:
> > > > > > +	return mm_get_unmapped_area(current->mm, file, addr, len, pgoff, flags);
> > > > > 
> > > > > Why not put this into mm_get_unmapped_area_vmflags() and get rid of
> > > > > thp_get_unmapped_area_vmflags() too?
> > > > > 
> > > > > Is there any reason the caller should have to do a retry?
> > > > 
> > > > We would still need thp_get_unmapped_area_vmflags() because that encodes
> > > > PMD_SIZE for THPs; we need the flexibility of providing any size alignment
> > > > as a generic helper.
> > > 
> > > There is only one caller for thp_get_unmapped_area_vmflags(), just
> > > open code PMD_SIZE there and thin this whole thing out. It reads
> > > better like that anyhow:
> > > 
> > > 	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > > 		   && !addr /* no hint */
> > > 		   && IS_ALIGNED(len, PMD_SIZE)) {
> > > 		/* Ensures that larger anonymous mappings are THP aligned. */
> > > 		addr = mm_get_unmapped_area_aligned(file, 0, len, pgoff,
> > > 						    flags, vm_flags, PMD_SIZE);
> > > 
> > > > That was ok, however that loses some flexibility when the caller wants to
> > > > try with different alignments, exactly like above: currently, it was trying
> > > > to do a first attempt of PUD mapping then fallback to PMD if that fails.
> > > 
> > > Oh, that's a good point, I didn't notice that subtle bit.
> > > 
> > > But then maybe that is showing the API is just wrong and the core code
> > > should be trying to find the best alignment not the caller. Like we
> > > can have those PUD/PMD size ifdefs inside the mm instead of in VFIO?
> > > 
> > > VFIO would just pass the BAR size, implying the best alignment, and
> > > the core implementation will try to get the largest VMA alignment that
> > > snaps to an arch supported page contiguity, testing each of the arches
> > > page size possibilities in turn.
> > > 
> > > That sounds like a much better API than pushing this into drivers??
> > 
> > Yes it would be nice if the core mm can evolve to make supporting such
> > easier.  Though the question is how to pass information over to core mm.
> 
> I was just thinking something simple, change how your new 
> mm_get_unmapped_area_aligned() works so that the caller is expected to
> pass in the size of the biggest folio/pfn page in as
> align.
> 
> The mm_get_unmapped_area_aligned() returns a vm address that
> will result in large mappings.
> 
> pgoff works the same way, the assumption is the biggest folio is at
> pgoff 0 and followed by another biggest folio so the pgoff logic tries
> to make the second folio map fully.
> 
> ie what a hugetlb fd or thp memfd would like.
> 
> Then you still hook the file operations and still figure out what BAR
> and so on to call mm_get_unmapped_area_aligned() with the correct
> aligned parameter.
> 
> mm_get_unmapped_area_aligned() goes through the supported page sizes
> of the arch and selects the best one for the indicated biggest folio
> 
> If we were happy writing this in vfio then it can work just as well in
> the core mm side.

So far, the new vfio_pci_core_get_unmapped_area() almost does VFIO's own
stuff, except that it does retry with different sizes.

Can I understand it as a suggestion to pass in a bitmask into the core mm
API (e.g. keep the name of mm_get_unmapped_area_aligned()), instead of a
constant "align", so that core mm would try to allocate from the largest
size to smaller until it finds some working VA to use?

> 
> > It's similar to many other use cases of get_unmapped_area() users.  For
> > example, see v4l2_m2m_get_unmapped_area() which has similar treatment on at
> > least knowing which part of the file was being mapped:
> > 
> > 	if (offset < DST_QUEUE_OFF_BASE) {
> > 		vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
> > 	} else {
> > 		vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
> > 		pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
> > 	}
> 
> Careful thats only use for nommu :)

My fault, please ignore it.. :)

I'm also surprised it is even available for !MMU.. but I decided to not dig
anymore today on that.

Thanks,

-- 
Peter Xu

