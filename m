Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001324418F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444644; cv=none; b=HaJA2OHTA+rm4BNv5oFPhwR1Y0WXN7F0g5Hc108QS2n5e6aB47zjZoD7sKj+FAoXCdmdeboXd0utylNmjK5qYKMbHf86pysmUeVaCTL1ffm25AQh/i15zjO5u3eSxQ5nLprdC1c+6E0TR/L0eQbeaiKeTB0e3YpPfEDbQKwOsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444644; c=relaxed/simple;
	bh=OkmiKIsgi5XBDLuEUxaDQ06HcaY5iOHPXJI+iHHY6fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJzScIhk9CxRw+AAAqXhTFxkreiUUNjN+pfz9jR/2ZxnUkrf+1P0l1VQSkyubcc4kKgUrqB9DNz1vzH1bUqPEEtrhLo4+0Lpw2iSmtI7vzbrJ+Bv6Jw7itApKqcN2CSx/PLlJooPWL6kUZvlauiH+iVGa95ehj68AiEGXvCQVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WG67XJgn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WG67XJgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748444640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fcg1D7pi8/e049vKSQfksEQEilD5PKbpIfwXzkGgo8Q=;
	b=WG67XJgnbKyuT/aVVcc8awq33yCiWu0vMkCBCqNOjZIhu570SgxKw0bCQI2uPID2A0+Ul0
	Y+uCuvm1WrrTTYghKHhdzL/rF9HyRPPUCh1nASh46eCd5vw32LcEwRz2Zr2ASmSmw+Z9fa
	IFBQpK878z0krmRweRh1YuP4nnv6gcI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-cK5NGrZqNTWhi4w52UKEFg-1; Wed, 28 May 2025 11:03:59 -0400
X-MC-Unique: cK5NGrZqNTWhi4w52UKEFg-1
X-Mimecast-MFC-AGG-ID: cK5NGrZqNTWhi4w52UKEFg_1748444638
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4769273691dso78937071cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444638; x=1749049438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fcg1D7pi8/e049vKSQfksEQEilD5PKbpIfwXzkGgo8Q=;
        b=kHQys13T7Jlo60+2c09Ij7NckleeG8XpH5qSoQdO8qBcIp8/jNkSunouxW5nID0Zod
         KB7kibhJT0atKdKq7N8/tLRbqSHEWW9aVwtuPoUczLgxwWJxW7rW0MREPd62FNtli09q
         Jt5BglTMC13VOTQ168coq1goFGAxqnnHvLQlYasuuJdBlCZofZYAKMOx6UqaO1mthRnb
         fILeG+upv9XRxWopBt5arI5UPL7he8nSsnQl/IK1HpUzUZKnMzPQmgrwJmwqPNEZiqLp
         XxxYVhoKZBn25bXlCO+qIbEmQz9F4axtf6pgZXOeIdsF67htd2pnmn/wUW8wL8zVc0b+
         WqPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUpY+XEotoyme5ISqTJ+gVrS5s3QdSwXRfKY/6hSlTKeloXCMNapART/y0VwomLr5v8Q13BjOIxTergNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM2P477FlufL+em/b3ACyUx22BiSzOeYS9uL78hWIH7TgPxTQZ
	+JbeyT0HJgWR+f2jy8ZJI7mVZfi+q5+sBAMyOeN0Pc7QCSyob53aPTWHkdS8/cE0ZVQGRRyeiPH
	A22WRu4LKUtDoHZCgWF4oyUQMBlJJpGyEvN5i0RFvDThJazu2i7F5YMUf3123RyuLHA==
X-Gm-Gg: ASbGncuTPNzcjvhY2wT0o0GjOOKIZ5VQsXXhgu+ErYpwSA/ekMMPwwxjsNM7JbQ8fxM
	NLGnKgnNw9iWg0Udg5pjxS/gAVxIASAymDNPDPZwNqwI+r9JVUIVz49Kq9e7d264Z2CqG4VQSNi
	M2atTGj3SuvoMLrehlTCu6LXMkeJppPW293zCte93bnV1XViAdqRW+gIn+tK6YkRSH6guGim2Eq
	2rKyQUHHK76LID1xyBB1A0YRUHIh/JF6o6sa3UMEXMewh8LISjQTHRltyhOwzLC+3IyU1cclSxt
	F6Y=
X-Received: by 2002:a05:622a:6107:b0:494:b316:3c7e with SMTP id d75a77b69052e-49f46d2a5efmr286510891cf.28.1748444638287;
        Wed, 28 May 2025 08:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnUJayuS+UkHO22TovQrelasWBZh3qt4Z2cFlt3nrXlxBdJnptXMVTRnxlIh9YaGB7i53KdA==
X-Received: by 2002:a05:622a:6107:b0:494:b316:3c7e with SMTP id d75a77b69052e-49f46d2a5efmr286510291cf.28.1748444637865;
        Wed, 28 May 2025 08:03:57 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80f2b8asm6940071cf.73.2025.05.28.08.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:03:57 -0700 (PDT)
Date: Wed, 28 May 2025 11:03:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, muchun.song@linux.dev,
	akpm@linux-foundation.org, mike.kravetz@oracle.com,
	kernel-dev@igalia.com, stable@vger.kernel.org,
	Hugh Dickins <hughd@google.com>, Florent Revest <revest@google.com>,
	Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] mm/hugetlb: fix a deadlock with pagecache_folio and
 hugetlb_fault_mutex_table
Message-ID: <aDcl2YM5wX-MwzbM@x1.local>
References: <20250528023326.3499204-1-gavinguo@igalia.com>
 <aDbXEnqnpDnAx4Mw@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aDbXEnqnpDnAx4Mw@localhost.localdomain>

On Wed, May 28, 2025 at 11:27:46AM +0200, Oscar Salvador wrote:
> On Wed, May 28, 2025 at 10:33:26AM +0800, Gavin Guo wrote:
> > There is ABBA dead locking scenario happening between hugetlb_fault()
> > and hugetlb_wp() on the pagecache folio's lock and hugetlb global mutex,
> > which is reproducible with syzkaller [1]. As below stack traces reveal,
> > process-1 tries to take the hugetlb global mutex (A3), but with the
> > pagecache folio's lock hold. Process-2 took the hugetlb global mutex but
> > tries to take the pagecache folio's lock.
> > 
> > Process-1                               Process-2
> > =========                               =========
> > hugetlb_fault
> >    mutex_lock                  (A1)
> >    filemap_lock_hugetlb_folio  (B1)
> >    hugetlb_wp
> >      alloc_hugetlb_folio       #error
> >        mutex_unlock            (A2)
> >                                         hugetlb_fault
> >                                           mutex_lock                  (A4)
> >                                           filemap_lock_hugetlb_folio  (B4)
> >        unmap_ref_private
> >        mutex_lock              (A3)
> > 
> > Fix it by releasing the pagecache folio's lock at (A2) of process-1 so
> > that pagecache folio's lock is available to process-2 at (B4), to avoid
> > the deadlock. In process-1, a new variable is added to track if the
> > pagecache folio's lock has been released by its child function
> > hugetlb_wp() to avoid double releases on the lock in hugetlb_fault().
> > The similar changes are applied to hugetlb_no_page().
> > 
> > Link: https://drive.google.com/file/d/1DVRnIW-vSayU5J1re9Ct_br3jJQU6Vpb/view?usp=drive_link [1]
> > Fixes: 40549ba8f8e0 ("hugetlb: use new vma_lock for pmd sharing synchronization")
> > Cc: <stable@vger.kernel.org>
> > Cc: Hugh Dickins <hughd@google.com>
> > Cc: Florent Revest <revest@google.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Signed-off-by: Gavin Guo <gavinguo@igalia.com>
> ... 
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 6a3cf7935c14..560b9b35262a 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -6137,7 +6137,8 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
> >   * Keep the pte_same checks anyway to make transition from the mutex easier.
> >   */
> >  static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> > -		       struct vm_fault *vmf)
> > +		       struct vm_fault *vmf,
> > +		       bool *pagecache_folio_locked)
> >  {
> >  	struct vm_area_struct *vma = vmf->vma;
> >  	struct mm_struct *mm = vma->vm_mm;
> > @@ -6234,6 +6235,18 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
> >  			u32 hash;
> >  
> >  			folio_put(old_folio);
> > +			/*
> > +			 * The pagecache_folio has to be unlocked to avoid
> > +			 * deadlock and we won't re-lock it in hugetlb_wp(). The
> > +			 * pagecache_folio could be truncated after being
> > +			 * unlocked. So its state should not be reliable
> > +			 * subsequently.
> > +			 */
> > +			if (pagecache_folio) {
> > +				folio_unlock(pagecache_folio);
> > +				if (pagecache_folio_locked)
> > +					*pagecache_folio_locked = false;
> > +			}
> 
> I am having a problem with this patch as I think it keeps carrying on an
> assumption that it is not true.
> 
> I was discussing this matter yesterday with Peter Xu (CCed now), who has also some
> experience in this field.
> 
> Exactly against what pagecache_folio's lock protects us when
> pagecache_folio != old_folio?
> 
> There are two cases here:
> 
> 1) pagecache_folio = old_folio  (original page in the pagecache)
> 2) pagecache_folio != old_folio (original page has already been mapped
>                                  privately and CoWed, old_folio contains
> 				 the new folio)
> 
> For case 1), we need to hold the lock because we are copying old_folio
> to the new one in hugetlb_wp(). That is clear.

So I'm not 100% sure we need the folio lock even for copy; IIUC a refcount
would be enough?

> 
> But for case 2), unless I am missing something, we do not really need the
> pagecache_folio's lock at all, do we? (only old_folio's one)
> The only reason pagecache_folio gets looked up in the pagecache is to check
> whether the current task has mapped and faulted in the file privately, which
> means that a reservation has been consumed (a new folio was allocated).
> That is what the whole dance about "old_folio != pagecache_folio &&
> HPAGE_RESV_OWNER" in hugetlb_wp() is about.
> 
> And the original mapping cannot really go away either from under us, as
> remove_inode_hugepages() needs to take the mutex in order to evict it,
> which would be the only reason counters like resv_huge_pages (adjusted in
> remove_inode_hugepages()->hugetlb_unreserve_pages()) would
> interfere with alloc_hugetlb_folio() from hugetlb_wp().
> 
> So, again, unless I am missing something there is no need for the
> pagecache_folio lock when pagecache_folio != old_folio, let alone the
> need to hold it throughout hugetlb_wp().
> I think we could just look up the cache, and unlock it right away.
> 
> So, the current situation (previous to this patch) is already misleading
> for case 2).
> 
> And comments like:
> 
>  /*
>   * The pagecache_folio has to be unlocked to avoid
>   * deadlock and we won't re-lock it in hugetlb_wp(). The
>   * pagecache_folio could be truncated after being
>   * unlocked. So its state should not be reliable
>   * subsequently.
>   */
> 
> Keep carrying on the assumption that we need the lock.
> 
> Now, if the above is true, I would much rather see this reworked (I have
> some ideas I discussed with Peter yesterday), than keep it as is.

Yes just to reply in public I also am not aware of why the folio lock is
needed considering hugetlb has the fault mutex.  I'm not sure if we should
rely more on the fault mutex, but that doesn't sound like an immediate
concern.

It may depend on whether my above understand was correct.. and only if so,
maybe we could avoid locking the folio completely.

Thanks,

> 
> Let me also CC David who tends to have a good overview in this.
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

-- 
Peter Xu

