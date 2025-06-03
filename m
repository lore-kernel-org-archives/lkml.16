Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261721361
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975486; cv=none; b=UqegrPJ81/tX9po/3KrEAVT3mV8aGibbrwQnmxo0U4gSkwJbqOYMmIBr2aquSPbJy2+Q7uAqtm5Qv/7Q57F9fB3S65FfPOWioSlS7kJFobvqcMbfzJrDsXbCpU8yBEAqF/ZQYfa77Bo9/1wWruw0wZ/et+PBSqMAqiHdNt1+O3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975486; c=relaxed/simple;
	bh=+qxoeVod3D5zxT4hhqp8sJpzX071e1yrnwu8xmkCLNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jb5y6bmBmpruKjNDzblbSgBS7//544EeHlE2ImNkgcg4WGDx4WwCTIoRlZ81EsEHNP5jojs4sqZkPJruxX3IwX3gmWpMspO+UNkL2LdA4zx3fLvKtYu+eYGsEuB7AanKUW6LSebCqPaVZQdc6TY89ti6ZeQMD/5I7GACUKS9OIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ArsAhQzx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ArsAhQzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748975482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m1y2tlzKb/XIoTPJnqteiTg6x4ZTCSc+I1WD6iWm+kk=;
	b=ArsAhQzx5VlsXQJ7NjIGDup69gDpPW2vzeibcYiizJ+8tsZWVSfuTxfzwhg3ty7hheWMRp
	GvcqQbYvMWl5Q8z/sVz4E4nivxTdIppJghJkcaCbIJj8JobhxHIqJeaKu4WUd90s9nAxdv
	nG8NsqidEAjBnfg3xtNUUtdukbr2aqc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-PW6YebnMPhGqtxgAREuh6g-1; Tue, 03 Jun 2025 14:31:20 -0400
X-MC-Unique: PW6YebnMPhGqtxgAREuh6g-1
X-Mimecast-MFC-AGG-ID: PW6YebnMPhGqtxgAREuh6g_1748975480
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5882b7339so33040561cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748975479; x=1749580279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1y2tlzKb/XIoTPJnqteiTg6x4ZTCSc+I1WD6iWm+kk=;
        b=qgSVaNFXGKqIvYp6zQAPLFepI85+Cue7mH7vJgBSq1k9F8ZFvxwrJEJSTdBUVO82ug
         lh7pLjnT+lT0cLjayRIQ81wXjqbKABZD4Lr02f7WSoMe1fCFgXwwE4fEobDiWzQ0gaYO
         iUvCt1uuI1lUW1SNO/c4tpyqqcMtn0Q966sl8MiqXE54YCjPvPODZHE7MNVoFhma2F3B
         D9+S9okPonGoRo4fRmPavX3n0l/mFzatlUZ1YG9PYg+BaZaCdeZaJ2AQDw2BpFuIxtMZ
         d8U9Oj/p8R+N2Ngc9X61hJ0d3a4avnd2pBvig0VzRP2+y59jiSy8uKL/y5EJ/vCnZs7b
         ed9g==
X-Forwarded-Encrypted: i=1; AJvYcCUyLI8XmH0qcUftxxpbq7n77st28bz+H7PpAyPT2zEyqATkqWGos4JRyHrsf8X/gjjSOzjgh+FRqF3Y6Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wwfFwuWKb209EFurrUuVPIUCqjUtdoMDEY8bG70qCay+wobR
	HiHJSctrQFZ2uq0vXHXotl0vWV0BUqF0NV70vzRbwaLDoBPfg4rYj1ICRgAQvOjJ5tk0ySHN+Uy
	78WxOL+twWprU1tARIkhTlzphSp7pFNh0NG5zLm9/YqQ3zYWaIzqgn1kUE3GaF6Octg==
X-Gm-Gg: ASbGncuaBCaPPX+smNAXRyhzfZWIdS1hF+DZj0jcocOgfpfMZjCx75Zmhpm6E9TGIq6
	5pKHXN2RBRi7hIUivhDQ2lFgqb/HOm+8lV85aNFr46O2Nm4j4+fl01tYjlVEBPlDBrMYJs+QQV4
	SQ6ehSor2EP79P396yZC3SntbXJc6WCv331uu28rpLNA6ZNdBDxkvlx2xHHzO5Zjkvk827NVD19
	dGgaCfh5fmFrewdIsaXb78kYp6/K40DKLyGembKtv/eeMQEZRoN08B+0XjUx7ntlJuzV23my1TQ
	qQqpFo6hPOH2Jg==
X-Received: by 2002:a05:622a:590e:b0:4a3:e3df:f9d4 with SMTP id d75a77b69052e-4a4aed6b1a8mr193643721cf.26.1748975479650;
        Tue, 03 Jun 2025 11:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM20hRlMEpFpUHXs29edcNfUgwlZYFzZVWR++bT/y5MRek1KFlHKwVz1YmhrxFLgjZhAFOOw==
X-Received: by 2002:a05:622a:590e:b0:4a3:e3df:f9d4 with SMTP id d75a77b69052e-4a4aed6b1a8mr193643341cf.26.1748975479196;
        Tue, 03 Jun 2025 11:31:19 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a840a0sm77609561cf.76.2025.06.03.11.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:31:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 14:31:15 -0400
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
Message-ID: <aD8_c9uEMn6NXXAX@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
 <aD8NUSUV5zA4yNY3@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aD8NUSUV5zA4yNY3@x1.local>

On Tue, Jun 03, 2025 at 10:57:21AM -0400, Peter Xu wrote:
> On Tue, Jun 03, 2025 at 03:50:54PM +0200, Oscar Salvador wrote:
> > On Mon, Jun 02, 2025 at 05:30:19PM -0400, Peter Xu wrote:
> > > Right, and thanks for the git digging as usual.  I would agree hugetlb is
> > > more challenge than many other modules on git archaeology. :)
> > > 
> > > Even if I mentioned the invalidate_lock, I don't think I thought deeper
> > > than that. I just wished whenever possible we still move hugetlb code
> > > closer to generic code, so if that's the goal we may still want to one day
> > > have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
> > > it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
> > > normally at least allows concurrent fault, but that's currently what isn't
> > > allowed in hugetlb anyway..
> > > 
> > > If we start to remove finer grained locks that work will be even harder,
> > > and removing folio lock in this case in fault path also brings hugetlbfs
> > > even further from other file systems.  That might be slightly against what
> > > we used to wish to do, which is to make it closer to others.  Meanwhile I'm
> > > also not yet sure the benefit of not taking folio lock all across, e.g. I
> > > don't expect perf would change at all even if lock is avoided.  We may want
> > > to think about that too when doing so.
> > 
> > Ok, I have to confess I was not looking things from this perspective,
> > but when doing so, yes, you are right, we should strive to find
> > replacements wherever we can for not using hugetlb-specific code.
> > 
> > I do not know about this case though, not sure what other options do we
> > have when trying to shut concurrent faults while doing other operation.
> > But it is something we should definitely look at.
> > 
> > Wrt. to the lock.
> > There were two locks, old_folio (taken in hugetlb_fault) and
> > pagecache_folio one.
> 
> There're actually three places this patch touched, the 3rd one is
> hugetlb_no_page(), in which case I also think we should lock it, not only
> because file folios normally does it (see do_fault(), for example), but
> also that's exactly what James mentioned I believe on possible race of
> !uptodate hugetlb folio being injected by UFFDIO_CONTINUE, along the lines:
> 
> 		folio = alloc_hugetlb_folio(vma, vmf->address, false);
>                 ...
> 		folio_zero_user(folio, vmf->real_address);
> 		__folio_mark_uptodate(folio);

I think I was wrong here at least partly..  So what this patch changed is
only the lookup of the no_page path, hence what I said here doesn't apply.
This patch also mentioned in the commit message on why James's concern was
ok - the fault mutex was held.  Yes I agree. Actually even without fault
mutex, the folio is only injected into page cache after mark uptodate.. so
it looks fine even without the mutex.

Though it's still true there're three paths to be discussed, which should
include no_page, and it's still needed to be discussed when any of us like
to remove folio lock even in the lookup path.

For example, I'm not sure whether it's always thread safe to do
folio_test_hwpoison() when without it, even with the fault mutex.

Sorry for the confusion, Oscar.

-- 
Peter Xu

