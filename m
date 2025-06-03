Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3D231A55
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748962652; cv=none; b=bhNDb8c18YkEFzSWflKEQTochg4FPppa5HPE29AXQqThBxSrJzdXx3J+JNHmYXUa5GC9Bgo9pZS1ESQkJPukxoqwYqHOSMCx1eQsRTG1Ypwlvmhicn5uTdpzKXKSxK8rmSSRTD6+LuT1UJ4WyhM3gRXBojX2Algi31aPwf52jsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748962652; c=relaxed/simple;
	bh=WfhD7wA0OTtUDVDHJoZwSsi+aLlCNzIqeIjS1mW6jBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaiEBmPrtK7NF7mxUeFtD5tFrjuCI7qCffYBc0XsBrvanh6keK17mfAxedHv+S0qhQKh9fLPa3L9K2maUUM6Zo4BPaVvVCk1pR/QVGO48SAAgxtpg8Jr2QGcuDMkz0TcRH4vvHidN/eH5k2gi/BfPeUkx1DHeAG1Ko2739Oasrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CULr3sv/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CULr3sv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748962647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38jxSnrZ1rT9Vzr1A3Y5RdV1Xmwgo0b8GnqMkSx7ESk=;
	b=CULr3sv/sn6dz0Eo7tIzxOXvQrZekDlVAWCkfDutpSU0OkUuFg1+DMzWaRRdjay0oX5ZEF
	+o30yIMDyDETIXj/K0qRNr1nK0sAZYnQ41qWkvx/p/ovh61JzjR81xT97LkjTzVWGmx8nf
	uCJ1ED+jmNSBa0BdcgZGxm7d0ycsk88=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-02ZNEr0oNBKp8pi4hs5nKw-1; Tue, 03 Jun 2025 10:57:26 -0400
X-MC-Unique: 02ZNEr0oNBKp8pi4hs5nKw-1
X-Mimecast-MFC-AGG-ID: 02ZNEr0oNBKp8pi4hs5nKw_1748962646
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e703so1034901985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962646; x=1749567446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38jxSnrZ1rT9Vzr1A3Y5RdV1Xmwgo0b8GnqMkSx7ESk=;
        b=svHMyj50gUtVafeLY6PDeFxS+1jxSuFrHYypccRWmlw+JNSoCryge7+Y/BNy0MgnGZ
         QMkgBPKtDeTiFnIdnWYsJwL9pCKaZ2331E4TJgyjT2aokY39Ue+XU4DR6XVJx1bvzgbL
         vpOBvwsn854x4TYVhexTFbQd6QgeelbquNzAt3MeAmB62PpX7/WpaLkgwDlqtREFaaib
         w48PvetE8fkdedfHy3nEGOZkGHLXZM4FpofvJW1bY5YKI4EqIQ0rVIsD9PVVJldhjx/a
         upEuhf9XjEA5ftwlL9uqBUXu4XxTYvTYMRIn67Yj79vvmH6PTHS9VpHv6NLYg8QVyV97
         FpOg==
X-Forwarded-Encrypted: i=1; AJvYcCXcXIdg9pn00kMuOYOABBOSZ0F1WEofHJg1eMw7XAwBUq2Mbc8oFP+9WhqMXEv7SgX2pRAqXOU+dorrBuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdR7goDr+8s6ORU/Fd1liHjoO5l8LzZnJIG/q+Y7asLDW3m/+1
	u5T1oQ0eue2w5S5eEHNvXnlAAB/nnWNlz5vtH+Mg2x/gYee5n7f4V4mRnA5JVFmID/Cjt0YyLSm
	XBwXxgMdbosp9COcQTbLY2nCFdpKlv2T5QYH9oyLdSgqVsXmXZ6uDP7NcAJcMLfb1jA==
X-Gm-Gg: ASbGnctgZNyj6lAMPpqR2uP4TvyJPOEm47Kz02YaM8ZPEaNH9mmqgjtnFVyOH4PEraS
	dXAEU0bvAg/3I/GcA0njKCN7OfUS+HkRASuYKpK00nPZr091NK/sYARouvnJDg16ikHdzC2AWhN
	Jn/c7qdw0bwnI6NMtuWiZNLEjE1DXaS3bwtF7unMChB+nQtar05tfk47i0pqniZ8r87AnIj93gy
	VgL48+NMhpyqbYmPmnTsI+psyHMucvpgMBUTll7AAHgnmnUcAABX6RwsefPddM/8z+v842I5gGQ
	BlQ=
X-Received: by 2002:a05:620a:2996:b0:7ce:c3e8:22c8 with SMTP id af79cd13be357-7d0a49e7b97mr2498399185a.9.1748962645699;
        Tue, 03 Jun 2025 07:57:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBBYl9lOAbqGH1VFzS8HqjKuQfYdtx2049mNoz9KEyS88AC3JVP/OEQm0GbBx7G42r1YdOuw==
X-Received: by 2002:a05:620a:2996:b0:7ce:c3e8:22c8 with SMTP id af79cd13be357-7d0a49e7b97mr2498394185a.9.1748962645118;
        Tue, 03 Jun 2025 07:57:25 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a591cc5df8sm26866051cf.60.2025.06.03.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:57:24 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:21 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aD8NUSUV5zA4yNY3@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aD79vg-jQQU69raX@localhost.localdomain>

On Tue, Jun 03, 2025 at 03:50:54PM +0200, Oscar Salvador wrote:
> On Mon, Jun 02, 2025 at 05:30:19PM -0400, Peter Xu wrote:
> > Right, and thanks for the git digging as usual.  I would agree hugetlb is
> > more challenge than many other modules on git archaeology. :)
> > 
> > Even if I mentioned the invalidate_lock, I don't think I thought deeper
> > than that. I just wished whenever possible we still move hugetlb code
> > closer to generic code, so if that's the goal we may still want to one day
> > have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
> > it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
> > normally at least allows concurrent fault, but that's currently what isn't
> > allowed in hugetlb anyway..
> > 
> > If we start to remove finer grained locks that work will be even harder,
> > and removing folio lock in this case in fault path also brings hugetlbfs
> > even further from other file systems.  That might be slightly against what
> > we used to wish to do, which is to make it closer to others.  Meanwhile I'm
> > also not yet sure the benefit of not taking folio lock all across, e.g. I
> > don't expect perf would change at all even if lock is avoided.  We may want
> > to think about that too when doing so.
> 
> Ok, I have to confess I was not looking things from this perspective,
> but when doing so, yes, you are right, we should strive to find
> replacements wherever we can for not using hugetlb-specific code.
> 
> I do not know about this case though, not sure what other options do we
> have when trying to shut concurrent faults while doing other operation.
> But it is something we should definitely look at.
> 
> Wrt. to the lock.
> There were two locks, old_folio (taken in hugetlb_fault) and
> pagecache_folio one.

There're actually three places this patch touched, the 3rd one is
hugetlb_no_page(), in which case I also think we should lock it, not only
because file folios normally does it (see do_fault(), for example), but
also that's exactly what James mentioned I believe on possible race of
!uptodate hugetlb folio being injected by UFFDIO_CONTINUE, along the lines:

		folio = alloc_hugetlb_folio(vma, vmf->address, false);
                ...
		folio_zero_user(folio, vmf->real_address);
		__folio_mark_uptodate(folio);

> The thing was not about worry as how much perf we leave on the table
> because of these locks, as I am pretty sure is next to 0, but my drive
> was to understand what are protection and why, because as the discussion
> showed, none of us really had a good idea about it and it turns out that this
> goes back more than ~20 years ago.
> 
> Another topic for the lock (old_folio, so the one we copy from),
> when we compare it to generic code, we do not take the lock there.
> Looking at do_wp_page(), we do __get__ a reference on the folio we copy
> from, but not the lock, so AFAIU, the lock seems only to please

Yes this is a good point; for CoW path alone maybe we don't need to lock
old_folio.

> folio_move_anon_rmap() from hugetlb_wp.
> 
> Taking a look at do_wp_page()->wp_can_reuse_anon_folio() which also
> calls folio_move_anon_rmap() in case we can re-use the folio, it only
> takes the lock before the call to folio_move_anon_rmap(), and then
> unlocks it.

IMHO, do_wp_page() took the folio lock not for folio_move_anon_rmap(), but
for checking swapcache/ksm stuff which needs to be serialized with folio
lock.

So I'm not 100% confident on the folio_move_anon_rmap(), but I _think_ it
deserves a data_race() and IIUC it only work not because of the folio lock,
but because of how anon_vma is managed as a tree as of now, so that as long
as WRITE_ONCE() even a race is benign (because the rmap walker will either
see a complete old anon_vma that includes the parent process's anon_vma, or
the child's).  What really protects the anon_vma should really be anon_vma
lock.. That can definitely be a separate topic.  I'm not sure whether you'd
like to dig this part out, but if you do I'd also be more than happy to
know whether my understanding needs correction here.. :)

In general, I still agree with you that if hugetlb CoW path can look closer
to do_wp_page then it's great.

> 
> Which, I think, hugetlb should also do.
> 
>  do_wp_page
>   wp_can_reuse_anon_folio ?
>    : yes: folio_lock ; folio_move_anon_rmap ; folio_unlock
>      bail out
>    : no: get a reference on the folio and call wp_page_copy
> 
> So, this should be the lead that hugetlb follows.
> As I said, it is not about the performance, and I agree that relying on
> finer granularity locks is the way to go, but we need to understand
> where and why, and with the current code from upstream, that is not
> clear at all.
> 
> That is why I wanted to reduce the scope of old_folio to what is
> actually needed, which is the snippet:
> 
>   if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
>            if (!PageAnonExclusive(&old_folio->page)) {
>                     folio_move_anon_rmap(old_folio, vma);
>                     SetPageAnonExclusive(&old_folio->page);
>            }
>            if (likely(!unshare))
>                     set_huge_ptep_maybe_writable(vma, vmf->address,
>                                                  vmf->pte);
>   
>            delayacct_wpcopy_end();
>            return 0;
>   }
> 
> I think it is important to 1) reduce it to wrap what actually needs to
> be within the lock and 2) document why, so no one has to put the gloves
> and start digging in the history again.
> 
> > Thanks!  I hope that'll also help whatever patch to land sooner, after it
> > can be verified to fix the issue.
> 
> So, my plan is:
> 
> 1) Fix pagecache folio issue in one patch (test for anon, still need to
>    check but it should work)
> 2) implement the 'filemap_get_hugetlb_folio' thing to get a reference and not
>    lock it
> 3) reduce scope of old_folio
> 
> I want to make it clear that while I still want to add filemap_get_hugetlb_folio
> and stop using the lock version, the reason is not to give more power to the mutex,
> but to bring it closer to what do_wp_page does.
> 
> What do you think about it?

So in this case as long as (2) won't change the lock folio for no_page then
I agree.

Thanks,

-- 
Peter Xu

