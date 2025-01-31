Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C896738DF9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342855; cv=none; b=OJC3YLWARAgwIu/tw5/gNVjVO5XviWb7ndQEZ8h2dSU7/mG0exJ682RD0L57UevoQwkTHe0z0bfW7TOCtAJX6b3r49ECR6+fsUiqbFmAM23YeeNYpqea+FGFEJo48Hkc5qNyPSRGAvq1y2H3VS7KS96QUvrd3oFCCvbh93KV6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342855; c=relaxed/simple;
	bh=33CYvlXyLQ2UR1KgBYThMz6vWB5tTnXp7QyRqipXyZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWwVCOOxHKUTfsP+X/1ObEReKAo2lrlOjaYa2CU6LWcJWbnT3IQ8XwwOpihonXEixIAlcRsDK979SyZl07nNxNzCX1avLYnl422rAfEEaikUb76aowjRj2de2HXzWXkym4udYwDMYJULQuOFiwvw/cQnQ8OEoAzFp2+x6EY5mj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=CeTRMtVs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CeTRMtVs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385de9f789cso1718474f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738342852; x=1738947652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNin4moK4eUBxK3vPAgTMhDUk/P6pM+fAX5RqvxKF3I=;
        b=CeTRMtVs8Nb9ul4crK2BC10t3pdRpFfzS8+TkNZ6IGOHGNt6PGnLXUWV/rPQrASk2R
         m2nrV5tzNfsv1VV/luEgpVDRRm/WUnQNSjIk0B5wibs/hitRYqGkw7+r8tcDfvbHDJ4m
         DByNjifVEhntcRqTSruHSHOqyzwVmQH2F7hwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342852; x=1738947652;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNin4moK4eUBxK3vPAgTMhDUk/P6pM+fAX5RqvxKF3I=;
        b=d/QsaWF/QP2eXXDV6fIr2BqOd/58wiadB3T4iHgg6jB+iO8sPpwb0UTBKkRJZz2Fiy
         di1H+SFOPZZAVrB26M+AEwcbt9v4D5q32RMDXctRddmwZpSTPxD1rfTtAk2gHOy2FCmm
         Q5aS/GPCl9PpT6Yv+szA6pEMWe6EkugcRv1jObHlau5qiltayosuFqm3G2ghI03Yuwy8
         eyxsp+Y/QwOGHSx1P85Jetwi3DBXm9KbLNVLUJHyyn8BAGffOafWI/jMbknxUM1f7hsC
         0DkdJfJifDmmhpmP33i/zDgdyVWiDnQ7OK+rfMw3pf6R5myUDo40ao3XbH6FnVS3XyoA
         DRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb+Wh2o3gTYeSgERbY6UXEoyA7SIwj0uIHOaFjGJRESee9IcQSaAtwd8KSPgL+Lbdsts/WiA4vjOcc62k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL3u4NYs6SYyQ6ZLuRyJAXsCcKeqMYUOBuRY3PM5NVXfdQF9XX
	W1vFTlMvS5PTdfD/G6YJvWrsCt8mAnIJa7u5/nZ6W5Nl/NuBFxIgG+Op3fHqJGroUgxptcwFSP9
	d
X-Gm-Gg: ASbGncvbdqc2rnrt2FRaglwv+mOXWNF28xBnApG2SDyTVaaHNz0GPhJXnmyPkRCS2DP
	hfyVIQtUKe+2lhfHPJfU+y7Bf3zdTDxIX874+srhvCrcnAjexMPGq3FqN1XD0cOJFQFOT25BBh3
	iT7jaANZfNh/zyfu284WMWaAmC+Y+xRs+EZfNQtQ3AYlWDt8tyjV/kS8DfMQOWjMSL1o2kjTfBj
	w4E+C/HNVLxtOwo6kTCXrI81KFTXypteEciAVIYxSVPDfX4Ng/OgPt8we2/fLrmW+5ZmUZkFK74
	nsUbl/SHC9zXDOi/0tOJMugv4UU=
X-Google-Smtp-Source: AGHT+IG+wK8v3ltoU+dMOZ5Egg+X1fduaSB/k0+6guPHhIiHiZusmikjMEVA/Y4fTi33o54vzPLBkg==
X-Received: by 2002:a05:6000:400b:b0:386:42a6:21f2 with SMTP id ffacd0b85a97d-38c5192f4afmr10830620f8f.10.1738342851857;
        Fri, 31 Jan 2025 09:00:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0eca02sm5194639f8f.12.2025.01.31.09.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:00:51 -0800 (PST)
Date: Fri, 31 Jan 2025 18:00:49 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive()
 using folio_walk instead of rmap walk
Message-ID: <Z50BwZSh1rT4LDJS@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
 <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
 <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
 <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 04:59:16PM +0100, David Hildenbrand wrote:
> > > > > > Note that the PTE is
> > > > > > always writable, and we can always create a writable-device-exclusive
> > > > > > entry.
> > > > > > 
> > > > > > With this change, device-exclusive is fully compatible with THPs /
> > > > > > large folios. We still require PMD-sized THPs to get PTE-mapped, and
> > > > > > supporting PMD-mapped THP (without the PTE-remapping) is a different
> > > > > > endeavour that might not be worth it at this point.
> > > > 
> > > > I'm not sure we actually want hugepages for device exclusive, since it has
> > > > an impact on what's allowed and what not. If we only ever do 4k entries
> > > > then userspace can assume that as long atomics are separated by a 4k page
> > > > there's no issue when both the gpu and cpu hammer on them. If we try to
> > > > keep thp entries then suddenly a workload that worked before will result
> > > > in endless ping-pong between gpu and cpu because the separate atomic
> > > > counters (or whatever) now all sit in the same 2m page.
> > > 
> > > Agreed. And the conversion + mapping into the device gets trickier.
> > > 
> > > > 
> > > > So going with thp might result in userspace having to spread out atomics
> > > > even more, which is just wasting memory and not saving any tlb entries
> > > > since often you don't need that many.
> > > > 
> > > > tldr; I think not supporting thp entries for device exclusive is a
> > > > feature, not a bug.
> > > 
> > > So, you agree with my "different endeavour that might not be worth it"
> > > statement?
> > 
> > Yes.
> > 
> > Well I think we should go further and clearly document that we
> > intentionally return split pages. Because it's part of the uapi contract
> > with users of all this.
> 
> Yes, see my reply to patch #3/

Ack.

> > And if someone needs pmd entries for performance or whatever, we need two
> > things:
> > 
> > a) userspace must mmap that memory as hugepage memory, to clearly signal
> > the promise that atomics are split up on hugepage sizes and not just page
> > size
> > 
> > b) we need to extend make_device_exclusive and drivers to handle the
> > hugetlb folio case
> > 
> > I think thp is simply not going to work here, it's impossible (without
> > potentially causing fault storms) to figure out what userspace might want.
> 
> Right, I added a link to this discussion in the patch.

Thanks, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
