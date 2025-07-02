Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948D2DE6EC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487789; cv=none; b=Jq9sOhJhJcpLQsm49Gu0tkVC01Uv3rHjbTc41XGjnxSIpcWrxiZ34JpSXqFYQH3CBwHcZKEaM8n9/2VWph8Li30+bRG3dHM47Nzm2YGY0nwTyWFrV5KhaIl1XXLnnejxs0H7W+mYFvp4gTx4mr801bePIbuhFCiDosmDgTnGreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487789; c=relaxed/simple;
	bh=rn8V9ONAJdJfGnD3WgI+sD1eqD2wgyD7LB8OM67Fw5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6jfw1zGCZPWr/5SyOLT41XUwc0PsjNHPcpmjZey0m/xXc8FSezYvh0MTpBlq2WOirkdQHcvsjuC+5IsBXAtC8nNNitT+b33bMEVw1hY6RuerCSlFGnt3lI6lQhkMCsgopyrQBaYPbt5xhDAdeEEfWT78E/47IohFJ5VOl/rHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxLTemWu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxLTemWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751487785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDhDBbwWPZp0OEwG0lfYKuusgWMoWpv67eEswYn9d5c=;
	b=WxLTemWuRxtqWnEuO8a9SmpJBFlCG2Gkxsn7zaXTTX+ahGyqxUQuhRsuGOtGZyxofAbmFM
	7pFhmTkNfbV3KLLvEKomp0GmWMXMEy9XG5DwkNe8e229llIQuuvHLFPhjBx7ILAq1a8/3F
	IhadDR7axPU+Fy+g/UMtC7Wn1pYxEZg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-oo7uTxmyPI2Yd5LMR_0TUQ-1; Wed, 02 Jul 2025 16:23:04 -0400
X-MC-Unique: oo7uTxmyPI2Yd5LMR_0TUQ-1
X-Mimecast-MFC-AGG-ID: oo7uTxmyPI2Yd5LMR_0TUQ_1751487784
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-700c2d3f3d6so50099546d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487784; x=1752092584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDhDBbwWPZp0OEwG0lfYKuusgWMoWpv67eEswYn9d5c=;
        b=epITPa2iD6a9PDzqQwtB9yD0BXlSGwHp7s+tdQ+qQRW94CdyEguNwWt93SCzhp900E
         rZJ8KywgJ72ScFDfxAacQcHQTUyhbn9j5jvZFI3Nn7kM7eOe/r6STFutjoo99kcYpdjt
         fYfvWgk00lpa2VhfdC6AERW1dFki8ufYcbQwpUtTytt0srVNHDxGELCTu7QI4FcDtFSo
         q79b0sZCXcsmtfzyAiaF1c+i6svr9iU79c53YzP8Zc6iyNhiglee6YrY93ry7Gem76K2
         igiyHNxZekQ5velL0FJcsppcaL1IW1LEaTCBhvJ4LADbgJamkEIsKVgxkta2KQsI2X8e
         mPGw==
X-Forwarded-Encrypted: i=1; AJvYcCU+sF3xmBQK0ILFZgsINeCzWnUyz5ZV1QfWfdyythxZ+zyRNKlYxObCn/DKZpUwLttb2Pd3QbGVUItC34Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPPKUbmv3+ZarOtBzwJduhiEYdfNkcJORKmUBKcvCgyJW5naMV
	m0S4u5S7/HCLeD3Db/nChgBxrH681ciWTvXX1kcMfegIFEWr5EjCUKvUmRHXfEJgJNnYyaOXIxl
	BNYFah44xnE8FozcelfXUoVIjkq+jfONwhK9W4pbpkOKKb1oyMqiQ0hbNvvl+wnHTAQ==
X-Gm-Gg: ASbGncvKLo6YWq4w8X0bk+L+OutIxBHhhSiqWRBVZWYLq10pSc4/FL0icbNoFGdY8/s
	4i4kB40JW030BThiD/I5+MOe6ejSBVhaJLkbQj+AU15zm7EydO4fFXGp7m2exzsYHgk1n4RxFqB
	+VLnW0LAKsf53pOmPQZHMwoO0Jputb3I/5uSuh4/ty2d3chK+j6OLZYrtCaj/hrTzuvRCD+lMkg
	E8D+BWw2te6dgp8CIvX9E/XaH5SC013vonj+ws7iQ4zFJISeS/Fx715CTO6WVFxaoTtDLuYntB2
	S9cpackhTfuZnQ==
X-Received: by 2002:a05:6214:2267:b0:6fb:5bb5:ccfb with SMTP id 6a1803df08f44-702b1b46f61mr62661716d6.34.1751487783774;
        Wed, 02 Jul 2025 13:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiKgeOx6dktDtgZgY72jURqNUMruopshT6W8nF+D7goln1uMqTumFSIXYnDlauRA2FyD48nA==
X-Received: by 2002:a05:6214:2267:b0:6fb:5bb5:ccfb with SMTP id 6a1803df08f44-702b1b46f61mr62661226d6.34.1751487783174;
        Wed, 02 Jul 2025 13:23:03 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771ce2basm106472736d6.44.2025.07.02.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:23:02 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
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
Message-ID: <aGWVIjmmsmskA4bp@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <aGV3fyZ0eGAt7Wag@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGV3fyZ0eGAt7Wag@kernel.org>

On Wed, Jul 02, 2025 at 09:16:31PM +0300, Mike Rapoport wrote:
> On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Jun 30, 2025 at 3:16 AM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > It seems like we're assuming a _lot_ of mm understanding in the underlying
> > > driver here.
> > >
> > > I'm not sure it's really normal to be handing around page table state and
> > > folios etc. to a driver like this, this is really... worrying to me.
> > >
> > > This feels like you're trying to put mm functionality outside of mm?
> > 
> > To second that, two things stick out for me here:
> > 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> > levels. uffd_copy is almost the entire copy operation for VM_SHARED
> > VMAs while uffd_get_folio is a small part of the continue operation.
> > 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> > last patch is quite a complex function which itself calls some IMO
> > pretty internal functions like mfill_atomic_install_pte(). Expecting
> > modules to implement such functionality seems like a stretch to me but
> > maybe this is for some specialized modules which are written by mm
> > experts only?
> 
> Largely shmem_mfill_atomic_pte() differs from anonymous memory version
> (mfill_atomic_pte_copy()) by the way the allocated folio is accounted and
> whether it's added to the page cache. So instead of uffd_copy(...) we might
> add
> 
> 	int (*folio_alloc)(struct vm_area_struct *vma, unsigned long dst_addr);
> 	void (*folio_release)(struct vm_area_struct *vma, struct folio *folio);

Thanks for digging into this, Mike.  It's just that IMHO it may not be
enough..

I actually tried to think about a more complicated API, but more I thought
of that, more it looked like an overkill.  I can list something here to
show why I chose the simplest solution with uffd_copy() as of now.

Firstly, see shmem_inode_acct_blocks() at the entrance: that's shmem
accounting we need to do before allocations, and with/without allocations.
That accounting can't be put into folio_alloc() yet even if we'll have one,
because we could have the folio allocated when reaching here (that is, when
*foliop != NULL).  That was a very delicated decision of us to do shmem
accounting separately in 2016:

https://lore.kernel.org/all/20161216144821.5183-37-aarcange@redhat.com/

Then, there's also the complexity on how the page cache should be managed
for any mem type.  For shmem, folio was only injected right before the
pgtable installations.  We can't inject it when folio_alloc() because then
others can fault-in without data populated. It means we at least need one
more API to do page cache injections for the folio just got allocated from
folio_alloc().

We also may want to have different treatment on how the folio flags are
setup.  It may not always happen in folio_alloc().  E.g. for shmem right
now we do this right before the page cache injections:

	VM_BUG_ON(folio_test_locked(folio));
	VM_BUG_ON(folio_test_swapbacked(folio));
	__folio_set_locked(folio);
	__folio_set_swapbacked(folio);
	__folio_mark_uptodate(folio);

We may not want to do exactly the same for all the rest mem types.  E.g. we
likely don't want to set swapbacked for guest-memfd folios.  We may need
one more API to do it.

Then if to think about failure path, when we have the question above on
shmem acct issue, we may want to have yet another post_failure hook doing
shmem_inode_unacct_blocks() properly for shmem.. maybe we don't need that
for guest-memfd, but we still need that for shmem to properly unacct when
folio allocation succeeded, but copy_from_user failed somehow.

Then the question is, do we really need all these fuss almost for nothing?

Note that if we want, IIUC we can still change this in the future. The
initial isolation like this series would still be good to land earlier; we
don't even plan to support MISSING for guest-memfd in the near future, but
only MINOR mode for now.  We don't necessarily need to work out MISSING
immediately to move on useful features landing Linux.  Even if we'll have
it for guest-memfd, it shouldn't be a challenge to maintain both.  This is
just not a contract we need to sign forever yet.

Hope above clarifies a bit on why I chose the simplest solution as of
now. I also don't like this API, as I mentioned in the cover letter. It's
really a trade-off I made at least for now the best I can come up with.

Said that, if any of us has better solution, please shoot.  I'm always open
to better alternatives.

Thanks,

-- 
Peter Xu

