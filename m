Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C722FAF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557549; cv=none; b=GGrMftAg1gwNCTiquV8quL0dq9SAz3c2bjGoGy4b6KCn6Too9zsrMe6BvVLJWDOj1ViTesiCMpO5+V/xqpXA0Yrkifo8x5vIo7iVZNb9bZxw9UB4yIiTkYOz5NzFrL7w13TT7WiAmjz0ZqEZXduef9zpwilPcgIb703v4yQR4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557549; c=relaxed/simple;
	bh=KU0QYAGXgurnBKVPwxjAt4oT+ykMnoFpqiSv3nbK+OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlE/4pmOkyVPW6nv5Gxrp83VYUZaFUOipFuDS1jF7XWjXi3S/yTJXEDkKoQrJlKFUPCrQ1oKx2DsdpWBpW7bXttjyQxV0BJPn2v2fpvNPo5ThtmigyLcxANJtKBL3E2F4JkFNeu3M3R7L74LK0NcsWdTXqkQkjaOCzzIeWvuPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEN2MbUU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEN2MbUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751557546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6Sc+kgLRaDiLYQQDmtR1W9Lqr6weySIabLVOH0fL5E=;
	b=bEN2MbUUK9QqmTMPBwGX9v1reJNzNnxOyIsWFWPSiwZEwnmO/O2aUo9pdcuh8kSXpvTV7O
	FpzAjs5JywNyEF7L5Jk/DBpdewkYdiSfGWTx+MTxXM9ggBjMxrXzrOftWmQYg9PlGz2W5n
	8fcB2IsAcIxEDEIRsNVHH2arJit0jOY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-gtOZQxzjP--uxeLoBT7-sQ-1; Thu, 03 Jul 2025 11:45:45 -0400
X-MC-Unique: gtOZQxzjP--uxeLoBT7-sQ-1
X-Mimecast-MFC-AGG-ID: gtOZQxzjP--uxeLoBT7-sQ_1751557545
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd75e60875so555346d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751557545; x=1752162345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Sc+kgLRaDiLYQQDmtR1W9Lqr6weySIabLVOH0fL5E=;
        b=OnLXXVLMNtwHdip6j5MJwQwXLS+ocU43M9zvBHtoowWWq3QqjlHFN19VqU9WYHwjIW
         zMoC3f2LIJsTcnrJWGiuc7xEoJZfvdMbOkEeKgi3ZSFrmB6pxN5yLbfFkcXRhn80J45l
         BEAYmJA+xi1S90cSRULh4pyBWoU1mf92rJlWzlzeyCY+yext4Sov3xOJGlbn7Y9IUu8p
         HuizYLOE7lIB0cDVksxMmF8GislMlbzaKVJB788lg46X0PQeAm1oT2XbxMnsx5Kolp0w
         r/X0PpTFE2SsPVr1+xxpFqKpFs4eG+hzw88e0Tqr94HFra5zUZbHNx6jYvi/bJmG/YK2
         C4UA==
X-Forwarded-Encrypted: i=1; AJvYcCVq2ReaUUQ275tIjwSAwCl/GrQygMCcgCp6FL4pDNKUBQBCuxRTOL9s6YWFEMe5PInmOVsHxuDtgXzgmV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPDPKRuQpN+q/rJwVSQsA8hm+g/Ro400E5gEvCzGWDl49yhzh6
	w50AEEgzt5plpOtiswHHkDkyu39XW2pJdd1AqLXgNNonhEsSXDctDuNCZYNNE0UHHz4Ig1FChdZ
	DlOLFFAS+V+zt8To/zctUuL3vi/vRQN9PR0504ZxUkEC/D/vqdbKgQGoqRJ89DKauSw==
X-Gm-Gg: ASbGnctcN5T5RoPTDt1XvCTe91afZp5gYOdJSPJoF5WiJ6LpZp8nbtmOhKcG/Gnw+6N
	+DSdaXXFfbTwNzZJ3SeWpYhMmuQh9kZOt6x4KG0VCA8jvTGlutZ5ILa737JEWektOFj+eiWwWE4
	PA4UGus4oucn7pzor6g3/zZUtvPeZOhk0l8Y6AmWOhKeIARMrcxIGPAdyPBji58azlSEbgWjF5Q
	Uwns4fVdrYSqpHU48Bend2hM0eXAV27V+6ctV7K6Jj8Yhx9SBAUDuTi+hpVOubawN8tqxBzNIFM
	in3WQqIgShfybQ==
X-Received: by 2002:a05:6214:5b88:b0:6fb:4b73:79f7 with SMTP id 6a1803df08f44-702bc93c856mr48673536d6.41.1751557544958;
        Thu, 03 Jul 2025 08:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF+V3vlvKxUQjIOt6zt4tATIzVgRHBlxWM3d2VwDYaJ6PN1wFyr7wghPPWgr+evT04s4xOZw==
X-Received: by 2002:a05:6214:5b88:b0:6fb:4b73:79f7 with SMTP id 6a1803df08f44-702bc93c856mr48672976d6.41.1751557544307;
        Thu, 03 Jul 2025 08:45:44 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb4bd6sm8875885a.28.2025.07.03.08.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:45:43 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:45:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGalpN8m73zQOW7j@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <aGV3fyZ0eGAt7Wag@kernel.org>
 <aGWVIjmmsmskA4bp@x1.local>
 <CAJuCfpH1mtKiphP8ipZeD4CNG9Mr4QERJTQAQm_gtZow5G7AAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpH1mtKiphP8ipZeD4CNG9Mr4QERJTQAQm_gtZow5G7AAQ@mail.gmail.com>

On Thu, Jul 03, 2025 at 08:01:12AM -0700, Suren Baghdasaryan wrote:
> On Wed, Jul 2, 2025 at 1:23 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 09:16:31PM +0300, Mike Rapoport wrote:
> > > On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> > > > On Mon, Jun 30, 2025 at 3:16 AM Lorenzo Stoakes
> > > > <lorenzo.stoakes@oracle.com> wrote:
> > > > >
> > > > > It seems like we're assuming a _lot_ of mm understanding in the underlying
> > > > > driver here.
> > > > >
> > > > > I'm not sure it's really normal to be handing around page table state and
> > > > > folios etc. to a driver like this, this is really... worrying to me.
> > > > >
> > > > > This feels like you're trying to put mm functionality outside of mm?
> > > >
> > > > To second that, two things stick out for me here:
> > > > 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> > > > levels. uffd_copy is almost the entire copy operation for VM_SHARED
> > > > VMAs while uffd_get_folio is a small part of the continue operation.
> > > > 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> > > > last patch is quite a complex function which itself calls some IMO
> > > > pretty internal functions like mfill_atomic_install_pte(). Expecting
> > > > modules to implement such functionality seems like a stretch to me but
> > > > maybe this is for some specialized modules which are written by mm
> > > > experts only?
> > >
> > > Largely shmem_mfill_atomic_pte() differs from anonymous memory version
> > > (mfill_atomic_pte_copy()) by the way the allocated folio is accounted and
> > > whether it's added to the page cache. So instead of uffd_copy(...) we might
> > > add
> > >
> > >       int (*folio_alloc)(struct vm_area_struct *vma, unsigned long dst_addr);
> > >       void (*folio_release)(struct vm_area_struct *vma, struct folio *folio);
> >
> > Thanks for digging into this, Mike.  It's just that IMHO it may not be
> > enough..
> >
> > I actually tried to think about a more complicated API, but more I thought
> > of that, more it looked like an overkill.  I can list something here to
> > show why I chose the simplest solution with uffd_copy() as of now.
> 
> TBH below does not sound like an overkill to me for keeping mm parts
> to itself without over-exposing them to modules.
> 
> >
> > Firstly, see shmem_inode_acct_blocks() at the entrance: that's shmem
> > accounting we need to do before allocations, and with/without allocations.
> 
> Ok, this results in an additional folio_prealloc() hook.
> 
> > That accounting can't be put into folio_alloc() yet even if we'll have one,
> > because we could have the folio allocated when reaching here (that is, when
> > *foliop != NULL).  That was a very delicated decision of us to do shmem
> > accounting separately in 2016:
> >
> > https://lore.kernel.org/all/20161216144821.5183-37-aarcange@redhat.com/
> >
> > Then, there's also the complexity on how the page cache should be managed
> > for any mem type.  For shmem, folio was only injected right before the
> > pgtable installations.  We can't inject it when folio_alloc() because then
> > others can fault-in without data populated. It means we at least need one
> > more API to do page cache injections for the folio just got allocated from
> > folio_alloc().
> 
> folio_add_to_cache() hook?
> 
> >
> > We also may want to have different treatment on how the folio flags are
> > setup.  It may not always happen in folio_alloc().  E.g. for shmem right
> > now we do this right before the page cache injections:
> >
> >         VM_BUG_ON(folio_test_locked(folio));
> >         VM_BUG_ON(folio_test_swapbacked(folio));
> >         __folio_set_locked(folio);
> >         __folio_set_swapbacked(folio);
> >         __folio_mark_uptodate(folio);
> >
> > We may not want to do exactly the same for all the rest mem types.  E.g. we
> > likely don't want to set swapbacked for guest-memfd folios.  We may need
> > one more API to do it.
> 
> Can we do that inside folio_add_to_cache() hook before doing the injection?

The folio can be freed outside this function by userfaultfd callers, so I
wonder if it'll crash the kernel if mm sees a folio locked while being freed.

> 
> >
> > Then if to think about failure path, when we have the question above on
> > shmem acct issue, we may want to have yet another post_failure hook doing
> > shmem_inode_unacct_blocks() properly for shmem.. maybe we don't need that
> > for guest-memfd, but we still need that for shmem to properly unacct when
> > folio allocation succeeded, but copy_from_user failed somehow.
> 
> Failure handling hook.
> 
> >
> > Then the question is, do we really need all these fuss almost for nothing?
> 
> If that helps to keep modules simpler and mm details contained inside
> the core kernel I think it is worth doing. I imagine if the shmem was
> a module then implementing the current API would require exporting
> functions like mfill_atomic_install_pte(). That seems like
> over-exposure to me. And if we can avoid all the locking and
> refcounting that Liam mentioned that would definitely be worth it
> IMHO.
> 
> >
> > Note that if we want, IIUC we can still change this in the future. The
> > initial isolation like this series would still be good to land earlier; we
> > don't even plan to support MISSING for guest-memfd in the near future, but
> > only MINOR mode for now.  We don't necessarily need to work out MISSING
> > immediately to move on useful features landing Linux.  Even if we'll have
> > it for guest-memfd, it shouldn't be a challenge to maintain both.  This is
> > just not a contract we need to sign forever yet.

[1]

> >
> > Hope above clarifies a bit on why I chose the simplest solution as of
> > now. I also don't like this API, as I mentioned in the cover letter. It's
> > really a trade-off I made at least for now the best I can come up with.
> >
> > Said that, if any of us has better solution, please shoot.  I'm always open
> > to better alternatives.
> 
> I didn't explore this code as deep as you have done and therefore
> might not see all the pitfalls but looks like you already considered
> an alternative which does sound better to me. What are the drawbacks
> that I might be missing?

It'll be a complex API from another angle, that we'll need 5-6 APIs just to
implement uffd missing mode.

Meanwhile it'll also already start to introduce those function jumps into
shmem even if one would be enough to decouple it.

As I mentioned above, I'm also not against doing it, but IMHO that does not
need to be done right now [1], as currently it looks to me guest-memfd may
not really need missing mode traps as of now, and I am actually not sure
whether it will.  We may not want to introduce 5-6 APIs with no further
user.  We can also always discuss a proper API when the demand arrives.

If uffd_copy is so concerning to people, there's also another alternative
which is to make vm_uffd_ops only support traps except MISSING.  uffd_copy
is only about missing traps. Then we can drop uffd_copy API, but the API
itself is then broken on its own.

I still feel like we're over-worried on this.  For OOT drivers I never
cared breaking anything.  For in-tree ones, this discussion can really
happen when there's a need to.  And at that time we can also have a look at
the impl using uffd_copy(), maybe it'll not be that bad either.  It seems
to me we don't necessarily need to figure this out right now.  IMHO we can
do it two-steps in worst case.

Thanks,

-- 
Peter Xu

