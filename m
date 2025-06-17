Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44485295DBA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203381; cv=none; b=hXmgbPrpIgfasOsTyoEAUELeJngDNVwbgyOWNSPrjumJdbohvhPlhFZF/+F91wlQTfn8o5GURq0IXomdsUiztWUbAYwG/Vw/rqkF7l/lcFgths9ZuFMMYg/JqDMwKaF83g3QKknBF8FDXpxcn+4ZUgRUaSNBwlF/4Ug15ZKH1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203381; c=relaxed/simple;
	bh=VBIwT6QOQ4kvU/RSQ+F1tpm5P4QrQgCWJTwuuggqa8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hz0T9aPPnft7VQF6xvInnJn2m84PsjvhTpMgUTZjemAoWjAYOWrtVLu5NGxpS68nht7/BAxTeZUqkajCV3lbubZuUC42udI0+k1aeE2gqJtHGP3t30aD0/7UcC6NfqNJWDfzppDa2rnCNmzWFsU1yPTJZ6t+Q/tu4BJV4TvN1uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ieVFadwr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ieVFadwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750203378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KBSv6o9j7WYY/vKWRFs7+EFKW/WKi+ZVGi0l2xZHTJg=;
	b=ieVFadwr4eKpPHrfUETFg1gaqynaNFYRdNQWeZQPJDi4ilx35c6ZdOF2HQHX6WYaey6ffZ
	kR+r8QZBDB0XWoARnFmNRPxjLTZxITCqsSck5i90oGxpq55mmDEDqWFSzwXWBl6M1e19xp
	tCfgoeQemmfYSuRNdPsQ6O69NUeC83w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-Qs5bNUM6Mli0ScilE7r5Pw-1; Tue, 17 Jun 2025 19:36:11 -0400
X-MC-Unique: Qs5bNUM6Mli0ScilE7r5Pw-1
X-Mimecast-MFC-AGG-ID: Qs5bNUM6Mli0ScilE7r5Pw_1750203371
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb2494ef24so161946106d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203371; x=1750808171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBSv6o9j7WYY/vKWRFs7+EFKW/WKi+ZVGi0l2xZHTJg=;
        b=EcNZbj4Iedzwl/26emq722NIXs6dmneNP/myj6bO3g8WQ/xalzPAHh71bYu+QGuooV
         eZc4VVIEwPtquHkEaERwpBWlnAu9OU2/GpBp95LxSEVkgaBZZe7/zqEU+6y9eItLNLMD
         7vwtLxSUnBW8rxXuIKUJj/hzaUHr/i4ydUfPUNmJG/Qy4nBIE9PRt2Z18ACT/3FOBBBV
         Cr/MQb1gST0rxJxn/koMDkimaIn7+ZiC1dywPgfaeAo1y6iZ4zzaukzcN+gPP+laV8x2
         q+DIHabJL615pu4kkUKymffc/uYz7dqV36de1hZvQ+ub0CcHAqaBzqxxwB+vmI53wu05
         /KxA==
X-Forwarded-Encrypted: i=1; AJvYcCUqIIS/en9JAWRkgaYyzAvqB2m53I2ghkDbRbQYl4FrjXXudZsIwNTrcz3OyjytkY1Kx7oqyhaK4HjlsYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18yi5u+uklL0HcTRfQpUgRLQbzSQlJJW+dLwq3rlTBc4P7icX
	3vkRHNXR5ZIQQgy2HVChG+a7k7pNGE6qK2lOTMI9CDFdhzCX0ZCQra+TTvdopbxLDspkrg2Qa+e
	h9OWHwOQdRZcID5J3ESobTBukiENVRUJzXDzF50pXFbHnCs4gzsX8MguHNn5Vzz0P5w==
X-Gm-Gg: ASbGncuFZWM4WaghB4WmGr/HR9AfXdn61ZNv00eFz2/xx6lXT55T9LMGh51IjcXwZu7
	gBYxpsTpg+Pqw9igcTEgtKDHXwX9jMaaG/DLzEcZoOI+iwaGHvJ4mS09a/ShK092Z2rLJ1WRcqp
	Vy+PqqRwRLv50EnJryy57tHQE2GSh3bzRN6LBQPBSGF7JPgxz4OBFPfTCFM9985NO2+D+vnU3Op
	aZ0/dHPm/7mFEwnzmpVGehBy12t4BV/x+ED9WFtJ3aaxPChmwEFhPqD8weysQ9aOZ3/w8O/XhqP
	sbLdMzuinhnJRQ==
X-Received: by 2002:a05:6214:5018:b0:6fa:fb25:e0f1 with SMTP id 6a1803df08f44-6fb477d99b7mr200740216d6.24.1750203371422;
        Tue, 17 Jun 2025 16:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKrTSuB1EI9cqt5G4JNRshFwKRQv2YtvABo07xYPeeJ2qDKgN205wNAbsTpAWIrLURyfvhgg==
X-Received: by 2002:a05:6214:5018:b0:6fa:fb25:e0f1 with SMTP id 6a1803df08f44-6fb477d99b7mr200739946d6.24.1750203371054;
        Tue, 17 Jun 2025 16:36:11 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb4e432100sm37584916d6.116.2025.06.17.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:36:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 19:36:08 -0400
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
Message-ID: <aFH76GjnWfeHI5fA@x1.local>
References: <20250613134111.469884-6-peterx@redhat.com>
 <20250613142903.GL1174925@nvidia.com>
 <aExDMO5fZ_VkSPqP@x1.local>
 <20250613160956.GN1174925@nvidia.com>
 <aEx4x_tvXzgrIanl@x1.local>
 <20250613231657.GO1174925@nvidia.com>
 <aFCVX6ubmyCxyrNF@x1.local>
 <20250616230011.GS1174925@nvidia.com>
 <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617231807.GD1575786@nvidia.com>

On Tue, Jun 17, 2025 at 08:18:07PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 04:56:13PM -0400, Peter Xu wrote:
> > On Mon, Jun 16, 2025 at 08:00:11PM -0300, Jason Gunthorpe wrote:
> > > On Mon, Jun 16, 2025 at 06:06:23PM -0400, Peter Xu wrote:
> > > 
> > > > Can I understand it as a suggestion to pass in a bitmask into the core mm
> > > > API (e.g. keep the name of mm_get_unmapped_area_aligned()), instead of a
> > > > constant "align", so that core mm would try to allocate from the largest
> > > > size to smaller until it finds some working VA to use?
> > > 
> > > I don't think you need a bitmask.
> > > 
> > > Split the concerns, the caller knows what is inside it's FD. It only
> > > needs to provide the highest pgoff aligned folio/pfn within the FD.
> > 
> > Ultimately I even dropped this hint.  I found that it's not really
> > get_unmapped_area()'s job to detect over-sized pgoffs.  It's mmap()'s job.
> > So I decided to avoid this parameter as of now.
> 
> Well, the point of the pgoff is only what you said earlier, to adjust
> the starting alignment so the pgoff aligned high order folios/pfns
> line up properly.

I meant "highest pgoff" that I dropped.

We definitely need the pgoff to make it work.  So here I dropped "highest
pgoff" passed from the caller because I decided to leave such check to the
mmap() hook later.

> 
> > > The mm knows what leaf page tables options exist. It should try to
> > > align to the closest leaf page table size that is <= the FD's max
> > > aligned folio.
> > 
> > So again IMHO this is also not per-FD information, but needs to be passed
> > over from the driver for each call.
> 
> It is per-FD in the sense that each FD is unique and each range of
> pgoff could have a unique maximum.
>  
> > Likely the "order" parameter appeared in other discussions to imply a
> > maximum supported size from the driver side (or, for a folio, but that is
> > definitely another user after this series can land).
> 
> Yes, it is the only information the driver can actually provide and
> comes directly from what it will install in the VMA.
> 
> > So far I didn't yet add the "order", because currently VFIO definitely
> > supports all max orders the system supports.  Maybe we can add the order
> > when there's a real need, but maybe it won't happen in the near
> > future?
> 
> The purpose of the order is to prevent over alignment and waste of
> VMA. Your technique to use the length to limit alignment instead is
> good enough for VFIO but not very general.

Yes that's also something I didn't like.  I think I'll just go ahead and
add the order parameter, then use it in previous patch too.

I'll wait for some more time though for others' input before a respin.

Thanks,

> 
> The VFIO part looks pretty good, I still don't really understand why
> you'd have CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP though. The inline
> fallback you have for it seems good enough and we don't care if things
> are overaligned for ioremap.
> 
> Jason
> 

-- 
Peter Xu

