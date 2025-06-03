Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0F1189F20
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965588; cv=none; b=bSslzDM/+EQh/bjhUDVrUS08Gq++37FhBiYClkIJiLoveogWz/cn6qtZ46CKihQlC+HBU0nDgflc3ZvmI00EAx2n/WbRN7wkbtY7GS4llYOPey9MwGHSyyQufmHRHl4iT0u6aZf66g3IiGqLb4knF/Qo5FJEubCAABp+pIYKvIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965588; c=relaxed/simple;
	bh=28imS9WQuIR5fmahpTCsN0tSyHXVGBr61qp5bqPRNjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbQYwav3ZuHVfTDKWoZBKgT5fPlbYMEJ/Q4Q2UFAqRh3lQ9f80hlVl4+DUf5bKfs0BTd2ssjkuNYwwA8RWZ3zJyMz3cZRSxOO2t4MgmDleIQj2WfHzPWrJkJeqr1Mc8kdNPScBCNa9Fjc/wfmW+xSKY5cEPTWAoZSwaAoxqx1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyGLaS6F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyGLaS6F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748965585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khdrIjasOkGlZbUzyxfVc/Ywtr8IPhLGqgsvDogkQOI=;
	b=WyGLaS6Frj7+PgJt7m7EEuvKFOM0P0F2e/RTDi5DvlerCq68xy1MSakRXovW3pShaeoUda
	0Tas4OtpWv6TDx8z6hnjol3374fB3bG1i/T6Xz5s+SZ0FL8xGzyXRW91hRDY+TpEhTk8QI
	K4ei+s0J8ygU058/sGUSRWUCyz/HGCo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-PyWBuu2GPUyHFQEEbYHZkg-1; Tue, 03 Jun 2025 11:46:24 -0400
X-MC-Unique: PyWBuu2GPUyHFQEEbYHZkg-1
X-Mimecast-MFC-AGG-ID: PyWBuu2GPUyHFQEEbYHZkg_1748965584
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09ed509aaso848453185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965584; x=1749570384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khdrIjasOkGlZbUzyxfVc/Ywtr8IPhLGqgsvDogkQOI=;
        b=euhN/vjDezvfgTD+4ngEH9C2HeaYXYMMWY4/JZRByIy8gU8Q/nElFkSjBtaLYC2l6r
         HsuFKhaLkgvezYuMV1+Y1I9VbK3dk/6Yx53lg10VnmhenvIOJAxXkEdsdfwB09ZHM/GP
         iKnJZot0sD+fAekZA4NT7Q+gWxHd4WZ/TdhhUF1xJy5p8jldGD9E4Hc5sF085IYOmjoR
         i/cTk1lLcxKy5hyPa+LarOdXQHYLKuGBrH5HcpkMrr7/nU9Q/oGodicDeB+sajMN+sV+
         Mo3Go4gasJZaAw1E20yGmdK3ck42Nxt/3RlU8X3Yz643JSp36Pn5uBK/nLDpamjWSVzT
         BGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUY5JlKuYOMceZBZG7KQZTR2iF5+tKh5+UTq6kopHZRufmgBqqexhEJf3ZAVWgcZPw8QldBN4QhFrgsFfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcd1em0r0K7/4gYaNoHN7h2wqtHC8WLBx734RsvqcJA3fM5Zc9
	QNLhsBT5dXKBt+1IcjmH5nFmZNhvBNzi5Rnx41VAednyong2bz6THrms+vHTYgZw+SGuwz/VS1h
	erYgKVQBHDYykuPCH7dgQ2H4IYGXobfnCUtcOBUuaJsGdW4Wf3lQbYvkJa6sgaMKDyw==
X-Gm-Gg: ASbGncsUiRDVIPKAvJdzVJnt+Q8ymtNX/ndOpKPXvImz2nw7FuV0SmYxj8NIxfYF1CI
	C9dD1RPAvaztKsVCyMQ4AsdHkvkEqdJnVZ3ZLkpTUtn9o0ouJKQefUw1d8EVupQopL8CF7dIsx0
	X8MS8STYuO1IVxE8dqBGrUo65HBmtNGK9hOnZGQkkfPO3D4R/9AOS1481sbMX2ynHbejUNQlKJv
	GxbVek6Jkz2LpzzDuOa2eYOg4I+sj9D7VJPpxQfEnC/pbHQo5OgUTer+m+N6d7iqiaaruEpS893
	JtY=
X-Received: by 2002:a05:620a:4691:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7d0a20335b9mr2962027585a.48.1748965583636;
        Tue, 03 Jun 2025 08:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF//ktSyVFl+v/tijgOb91sHHNrbN9UrFKtZgKyfrDek47YV5a+Gf7srmFcO/iimgfqc/i8wA==
X-Received: by 2002:a05:620a:4691:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7d0a20335b9mr2962023485a.48.1748965583048;
        Tue, 03 Jun 2025 08:46:23 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f9089sm863352085a.34.2025.06.03.08.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:46:22 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:46:19 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aD8Yy0xfJdvLKp4X@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
 <aD8NUSUV5zA4yNY3@x1.local>
 <fd10b2b3-064c-4ee2-ad7d-e30a0e194533@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd10b2b3-064c-4ee2-ad7d-e30a0e194533@redhat.com>

On Tue, Jun 03, 2025 at 05:08:55PM +0200, David Hildenbrand wrote:
> On 03.06.25 16:57, Peter Xu wrote:
> > On Tue, Jun 03, 2025 at 03:50:54PM +0200, Oscar Salvador wrote:
> > > On Mon, Jun 02, 2025 at 05:30:19PM -0400, Peter Xu wrote:
> > > > Right, and thanks for the git digging as usual.  I would agree hugetlb is
> > > > more challenge than many other modules on git archaeology. :)
> > > > 
> > > > Even if I mentioned the invalidate_lock, I don't think I thought deeper
> > > > than that. I just wished whenever possible we still move hugetlb code
> > > > closer to generic code, so if that's the goal we may still want to one day
> > > > have a closer look at whether hugetlb can also use invalidate_lock.  Maybe
> > > > it isn't worthwhile at last: invalidate_lock is currently a rwsem, which
> > > > normally at least allows concurrent fault, but that's currently what isn't
> > > > allowed in hugetlb anyway..
> > > > 
> > > > If we start to remove finer grained locks that work will be even harder,
> > > > and removing folio lock in this case in fault path also brings hugetlbfs
> > > > even further from other file systems.  That might be slightly against what
> > > > we used to wish to do, which is to make it closer to others.  Meanwhile I'm
> > > > also not yet sure the benefit of not taking folio lock all across, e.g. I
> > > > don't expect perf would change at all even if lock is avoided.  We may want
> > > > to think about that too when doing so.
> > > 
> > > Ok, I have to confess I was not looking things from this perspective,
> > > but when doing so, yes, you are right, we should strive to find
> > > replacements wherever we can for not using hugetlb-specific code.
> > > 
> > > I do not know about this case though, not sure what other options do we
> > > have when trying to shut concurrent faults while doing other operation.
> > > But it is something we should definitely look at.
> > > 
> > > Wrt. to the lock.
> > > There were two locks, old_folio (taken in hugetlb_fault) and
> > > pagecache_folio one.
> > 
> > There're actually three places this patch touched, the 3rd one is
> > hugetlb_no_page(), in which case I also think we should lock it, not only
> > because file folios normally does it (see do_fault(), for example), but
> > also that's exactly what James mentioned I believe on possible race of
> > !uptodate hugetlb folio being injected by UFFDIO_CONTINUE, along the lines:
> > 
> > 		folio = alloc_hugetlb_folio(vma, vmf->address, false);
> >                  ...
> > 		folio_zero_user(folio, vmf->real_address);
> > 		__folio_mark_uptodate(folio);
> > 
> > > The thing was not about worry as how much perf we leave on the table
> > > because of these locks, as I am pretty sure is next to 0, but my drive
> > > was to understand what are protection and why, because as the discussion
> > > showed, none of us really had a good idea about it and it turns out that this
> > > goes back more than ~20 years ago.
> > > 
> > > Another topic for the lock (old_folio, so the one we copy from),
> > > when we compare it to generic code, we do not take the lock there.
> > > Looking at do_wp_page(), we do __get__ a reference on the folio we copy
> > > from, but not the lock, so AFAIU, the lock seems only to please
> > 
> > Yes this is a good point; for CoW path alone maybe we don't need to lock
> > old_folio.
> > 
> > > folio_move_anon_rmap() from hugetlb_wp.
> > > 
> > > Taking a look at do_wp_page()->wp_can_reuse_anon_folio() which also
> > > calls folio_move_anon_rmap() in case we can re-use the folio, it only
> > > takes the lock before the call to folio_move_anon_rmap(), and then
> > > unlocks it.
> > 
> > IMHO, do_wp_page() took the folio lock not for folio_move_anon_rmap(), but
> > for checking swapcache/ksm stuff which needs to be serialized with folio
> > lock.
> > 
> > So I'm not 100% confident on the folio_move_anon_rmap(), but I _think_ it
> > deserves a data_race() and IIUC it only work not because of the folio lock,
> > but because of how anon_vma is managed as a tree as of now, so that as long
> > as WRITE_ONCE() even a race is benign (because the rmap walker will either
> > see a complete old anon_vma that includes the parent process's anon_vma, or
> > the child's).  What really protects the anon_vma should really be anon_vma
> > lock.. That can definitely be a separate topic.  I'm not sure whether you'd
> > like to dig this part out, but if you do I'd also be more than happy to
> > know whether my understanding needs correction here.. :)
> > 
> > In general, I still agree with you that if hugetlb CoW path can look closer
> > to do_wp_page then it's great.
> 
> 
> As stated elsewhere, the mapcount check + folio_move_anon_rmap need the
> folio lock.

Could you elaborate what would go wrong if we do folio_move_anon_rmap()
without folio lock here?  Just to make sure we're on the same page: we
already have pgtable lock held, and we decided to reuse an anonymous
hugetlb page.

Thanks,

-- 
Peter Xu

