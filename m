Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D11EC00C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343606; cv=none; b=kT6C2u1r82bWNakB+YQ5hIaDAYuLTrqrVN4q7NFSAuIV6BXfnB9QMyGdZs52rQagjoMwLW1nbr3KOWf+9PrW5xRgepB58BDPkRgxm8oBQR2AK/ppC0guuUp1v3Tas/DmpwHETHbacNbxAgYNm/rTOmigV9Yc3nrbmlF3V1pPOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343606; c=relaxed/simple;
	bh=kLf0abSimPPPXgJaRipCAWd4pqKQQetiB6om3ldBx2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq++orlipBn/Q4GRHD75sGvL77Opk9xOpHUFrGk5B4LGbbBS/WLK+EO1tfWFUjP68ik4Wh1h0H+51pVxcIDx77myPeyzmkNOOtqumfPTTgJfkH/fnr2pwtHF9biW1NWp1P1z7yjjQRYu5JW+TijEad0Rc9f6iO2ECWcTj6QtFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=bmXEB8xh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="bmXEB8xh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a8b35e168so1425888f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738343602; x=1738948402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jSWMajugHE39GppqlmQIz8pPmyPm52DOpdfP99qKyo=;
        b=bmXEB8xhI1VNWVtXPETt3vboqjARzTXcVVq1WAaOG1HHT7p5XcPUhKD8fkD1rw0VF7
         MIFiU+F1WE2tzCghaLC2CL+/OV8LfG/WJob/NOFaOqlQy7KmhuVs3vs/DRqTJPv/HEGb
         E3Zf4+68B3AJ0WwsCQQOfl2dG3Zy5n1NtqwpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343602; x=1738948402;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6jSWMajugHE39GppqlmQIz8pPmyPm52DOpdfP99qKyo=;
        b=fI5DsnjfCwO2K0YCYyjpdG7fASYmH8iEiQBvaM8wUMhGiZrWLn1FUTBEz/dlREe7Y8
         I078hQeLo+C5ktFSj1bVzA6qKPs3uoqcWAxtSssNFq8rJtKpcWJ8faNpFHtbT2WiUNJu
         pCxkANm66Lo9OWsS9+XMCVCsXqjgaG8uA7TCo0NmQ9+o8IY5XI2uJ90fS24KvwB8vQOE
         Ww7lvbFZ/9qG52ba9jW7cvwF2q2/JebcflMnjWFS+/dtEpJReM2lXNzSveiNB49WntUi
         bP2FceobqV2n4GZaYZaK0H0Y6f5FlpwWEXmdf8rFjIlJMpOonZ+EDdG7fpRwQtRoznsI
         Z32g==
X-Gm-Message-State: AOJu0Yy++Bn5GIUlJhkOSbgOunBQXqer+aLpLGtELglfRZAT95xxdu/Y
	woTQVXBnS8IM4o/jgd8e+Dwpa9MSETS2fAh9nzu3EjBIZjCqzjZ/AeJnUOduxmVD2LXf6cTSVYN
	y
X-Gm-Gg: ASbGncuWKgQIeOsyRM5kSwJCUEM2lzVowFn4nnKXFGo2jgjuL/DfwiRoYAGDsjxnIUd
	fhlJKu2GjHFOYl2EnKDWR0ROJjEAvVUdTcriH81wqV6Ppr7qP+05xyVkpsFOva3wYCuC85haUiC
	bBH8PEVvnzJkkdsUx18d8nJiPs5OrigU/lGEFD7ZDpUPjDoieSDhI6bIuhAo8dIcq4i53XF8h40
	816TdWyKpIzjAUs9Tg9bKOpnJDbRQW+lYm9BKlUzBHir77yBOfwCzSSCxaUYhEVPJaVcxXHJbzm
	Z6iO5n2s73mkpUBz4Je5dyBCWDo=
X-Google-Smtp-Source: AGHT+IGBiDEPfJPSLRmnOOkpJfCiAcSXF7PRNDxRISEjglfPUZ3JlbXVG6tP7dp5Gn/UOWRu2XqpDg==
X-Received: by 2002:a05:6000:1563:b0:38a:5d7d:4bd6 with SMTP id ffacd0b85a97d-38c5a9bee80mr7346375f8f.25.1738343602545;
        Fri, 31 Jan 2025 09:13:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57ccsm5178729f8f.79.2025.01.31.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:13:22 -0800 (PST)
Date: Fri, 31 Jan 2025 18:13:19 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Message-ID: <Z50Er1Oy7VPLVY9U@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-13-david@redhat.com>
 <Z5tWYpwpUfgEmeKj@phenom.ffwll.local>
 <887df26d-b8bb-48df-af2f-21b220ef22e6@redhat.com>
 <Z5t8dkujVv7xZiuV@phenom.ffwll.local>
 <d70db67d-8989-4ce4-bc21-52a89449db4b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70db67d-8989-4ce4-bc21-52a89449db4b@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 04:43:08PM +0100, David Hildenbrand wrote:
> > > Assume you have a THP (or any mTHP today). You can easily trigger the
> > > scenario that folio_mapcount() != 0 with active device-exclusive entries,
> > > and you start doing rmap walks and stumble over these device-exclusive
> > > entries and *not* handle them properly. Note that more and more systems are
> > > configured to just give you THP unless you explicitly opted-out using
> > > MADV_NOHUGEPAGE early.
> > > 
> > > Note that b756a3b5e7ea added that hunk that still walks these
> > > device-exclusive entries in rmap code, but didn't actually update the rmap
> > > walkers:
> > > 
> > > @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> > > 
> > >                  /* Handle un-addressable ZONE_DEVICE memory */
> > >                  entry = pte_to_swp_entry(*pvmw->pte);
> > > -               if (!is_device_private_entry(entry))
> > > +               if (!is_device_private_entry(entry) &&
> > > +                   !is_device_exclusive_entry(entry))
> > >                          return false;
> > > 
> > >                  pfn = swp_offset(entry);
> > > 
> > > That was the right thing to do, because they resemble PROT_NONE entries and
> > > not migration entries or anything else that doesn't hold a folio reference).
> > 
> > Yeah I got that part. What I meant is that doubling down on this needs a
> > full audit and cannot rely on "we already have device private entries
> > going through these paths for much longer", which was the impression I
> > got. I guess it worked, thanks for doing that below :-)
> 
> I know I know, I shouldn't have touched it ... :)
> 
> So yeah, I'll spend some extra work on sorting out the other cases.

Thanks :-)

> > And at least from my very rough understanding of mm, at least around all
> > this gpu stuff, tracking device exclusive mappings like real cpu mappings
> > makes sense, they do indeed act like PROT_NONE with some magic to restore
> > access on fault.
> > 
> > I do wonder a bit though what else is all not properly tracked because
> > they should be like prot_none except arent. I guess we'll find those as we
> > hit them :-/
> 
> Likely a lot of stuff. But more in a "entry gets ignored -- functionality
> not implemented, move along" way, because all page table walkers have to
> care about !pte_present() already; it's just RMAP code that so far never
> required it.

I think it'd be good to include a tersion summary of this in the commit
messages - I'd expect this is code other gpu folks will need to crawl
through in the future again, and I had no idea where I should even start
looking to figure this out.

> 
> [...]
> 
> > 
> > > If thp constantly reassembles a pmd entry because hey all the
> > > > memory is contig and userspace allocated a chunk of memory to place
> > > > atomics that alternate between cpu and gpu nicely separated by 4k pages,
> > > > then we'll thrash around invalidating ptes to no end. So might be more
> > > > fallout here.
> > > 
> > > khugepaged will back off once it sees an exclusive entry, so collapsing
> > > could only happen once everything is non-exclusive. See
> > > __collapse_huge_page_isolate() as an example.
> > 
> > Ah ok. I think might be good to add that to the commit message, so that
> > people who don't understand mm deeply (like me) aren't worried when they
> > stumble over this change in the future again when digging around.
> 
> Will do, thanks for raising that concern!
> 
> > 
> > > It's really only page_vma_mapped_walk() callers that are affected by this
> > > change, not any other page table walkers.
> > 
> > I guess my mm understanding is just not up to that, but I couldn't figure
> > out why just looking at page_vma_mapped_walk() only is good enough?
> 
> See above: these never had to handle !page_present() before -- in contrast
> to the other page table walkers.
>
> So nothing bad happens when these page table walkers traverse these PTEs,
> it's just that the functionality will usually be implemented.
> 
> Take MADV_PAGEOUT as an example: madvise_cold_or_pageout_pte_range() will
> simply skip "!pte_present()", because it wouldn't know what to do in that
> case.
> 
> Of course, there could be page table walkers that check all cases and bail
> out if they find something unexpected: do_swap_page() cannot make forward
> progress and will inject a VM_FAULT_SIGBUS if it doesn't recognize the
> entry. But these are rather rare.

Yeah this all makes sense to me now. Thanks a lot for your explanation,
I'll try to pay it back by trying to review the next version of the series
a bit.

> We could enlighten selected page table walkers to handle device-exclusive
> where it really makes sense later.

I think rmap for eviction/migration is really the big one that obviously
should be fixed. All the other cases I could think of I think just end up
in handle_mm_fault() to sort out the situation and then retry.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
