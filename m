Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109243D3B8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977924; cv=none; b=qoW8spjfEhHdhN6VOZGxiEut0/sku/9u5oSLxrkqHRRHjH3tgXCcNsBXGic7PLb4JcjhYmB0GvSiJvrf5OraG9r9b5ljkc+Au1AS8FPkmJ+t5m5D8MVmHLnccstxmT+Ywx0OsJlscTs+GgFgUKyzs7F1GWJbRfG+ojO6R8YkGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977924; c=relaxed/simple;
	bh=twjzYjx0dAz/tPMyOmP6RBKUwvfpToBtrImDhb6Y+jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK+JHoOmZTITWOvLjXMx17Xom9tk6vTbCz/nZvLQH+AqdDTPEkR/sQ1bIX1cvSHyKovrX5IXxYoCNxw6UrlereNNExot9QmWLYSWm6UywuwuYGNmZ1XEtcUsa+0j1thGXiqdHJZC/wZDcePiRCrVGngw3GYCP/TbCbBg1mEhwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuPSq8hT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuPSq8hT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748977922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RyZVbCmKQfENb52bbtkkOv+s+xa+wwCpogRbedT1S8=;
	b=VuPSq8hTJlli7BoA21zDyaUnRUBY31ziOAczAH7k7Vt+Sad9ieMcHK7E9NRpfMfPawe8By
	HC9ghp5zlnPlc4olttoLdefCJFEixMieHdF/1l/cDrfQOFeVhpXkdXvKmnp1X78MOEjqN3
	xhXWzpM7kRJHThO/iowi6CrJIWazqA0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-afu9Qh7PPm-Wgk6z2alywA-1; Tue, 03 Jun 2025 15:12:00 -0400
X-MC-Unique: afu9Qh7PPm-Wgk6z2alywA-1
X-Mimecast-MFC-AGG-ID: afu9Qh7PPm-Wgk6z2alywA_1748977920
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so777145285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 12:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977920; x=1749582720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RyZVbCmKQfENb52bbtkkOv+s+xa+wwCpogRbedT1S8=;
        b=SG377u0VwrOFi9LG9WA8JFEUSphgGDjM75P2/a0ijYadGEZSb1rONxuKayfBAwirQz
         mlvEqZ1QFSS+uPyTMg+W85FimYvFD+DDrQL0uB6KJsfNJQnTa4QEA6mATNbUVWkNoldD
         Mvs/3Wtoi+6BOUspbXGKKNt6e1nVsGy3JILopr5LVDAnrMYg+KG6MCrsEXARAm6NXEEb
         FLLymYVfR4tW9dI5Z32UsqBEaOMAjB59dhxVoGn1yF9UEm960ucPRSXRFlFNyrMJcWBi
         v2SVJXfJ7g23STFlS4/xIuv/6vPmbLpZ7kM/zDTE/KBfvLeK7f8oCR4ydKGgfmoLmxDj
         4iwA==
X-Forwarded-Encrypted: i=1; AJvYcCXVKvEyJHYNI47bla0XhjZo0FL8Z+xPhZo+z1dLaGbM9N6IwRS4rfjzNorzxMmFmG1Ab3EAcPQ8Znqdekc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Tct3qDOfP3MKK9UEjwlkgu3IgdF6hmpvLlOLOgnNVt8LGoVe
	cO0C59jmjwdscV90G7MOGiwVPkuf4IhrvGstKNYuZ/rJESJR68SAMDNLA48+EP3BlRc1YRczgSc
	Qyld4k3WT6+UX21jCnoMTIBB7aPxnG3Z7q3KicPTDK+gVmulCbOy1HeZg+L74YwyqNTUyQq4RXQ
	==
X-Gm-Gg: ASbGncuZsEk2kebPSWFk8ostUWQYl+4kMfnDPMQTtsFgDTsOBBPVOJoCf+idtjFqhgB
	61ZGP8bqo1OgzyTWUNoh/T1vH+lxMZ+w6vuGk+EIqmw6yMXunRLTfMBXBGVfC7nnV1h/LeMLkAe
	TytxvXGOwfoI4siZSL3kRxYnAEL2Kq/pRXK6SL+R9f/jpSK3h3/efv9SHs0uRX3smm0GBrO6dnH
	06RU4lmYhwzxvrZMJlSZjq9c/dHlRGumfAIbc5SIFp1iiscfwLyCtPHybq89E6Bfes02mcKSzGs
	suM=
X-Received: by 2002:a05:620a:178c:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d21996b108mr32011185a.14.1748977920040;
        Tue, 03 Jun 2025 12:12:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN42dB5vCCNHLZ+vL60sDUi7aO+SvVRrEj8LwA0i4xWVnBVhNuWCI7jP2coEJg5mchI77zeg==
X-Received: by 2002:a05:620a:178c:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7d21996b108mr32008685a.14.1748977919645;
        Tue, 03 Jun 2025 12:11:59 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195c95sm885297885a.87.2025.06.03.12.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 12:11:58 -0700 (PDT)
Date: Tue, 3 Jun 2025 15:11:55 -0400
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
Message-ID: <aD9I-y6lDHM92zUm@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
 <aD8NUSUV5zA4yNY3@x1.local>
 <fd10b2b3-064c-4ee2-ad7d-e30a0e194533@redhat.com>
 <aD8Yy0xfJdvLKp4X@x1.local>
 <1602a87b-b1bc-4b53-abe7-dce8adddbe46@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1602a87b-b1bc-4b53-abe7-dce8adddbe46@redhat.com>

On Tue, Jun 03, 2025 at 07:19:13PM +0200, David Hildenbrand wrote:
> > > As stated elsewhere, the mapcount check + folio_move_anon_rmap need the
> > > folio lock.
> > 
> > Could you elaborate what would go wrong if we do folio_move_anon_rmap()
> > without folio lock here?  Just to make sure we're on the same page: we
> > already have pgtable lock held, and we decided to reuse an anonymous
> > hugetlb page.
> 
> For now we have
> 
> VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
> 
> right at the beginning of folio_move_anon_rmap().
> 
> That dates back to
> 
> commit c44b674323f4a2480dbeb65d4b487fa5f06f49e0
> Author: Rik van Riel <riel@redhat.com>
> Date:   Fri Mar 5 13:42:09 2010 -0800
> 
>     rmap: move exclusively owned pages to own anon_vma in do_wp_page()
>     When the parent process breaks the COW on a page, both the original which
>     is mapped at child and the new page which is mapped parent end up in that
>     same anon_vma.  Generally this won't be a problem, but for some workloads
>     it could preserve the O(N) rmap scanning complexity.
>     A simple fix is to ensure that, when a page which is mapped child gets
>     reused in do_wp_page, because we already are the exclusive owner, the page
>     gets moved to our own exclusive child's anon_vma.
> 
> 
> My recollection is that the folio lock protects folio->mapping. So relevant rmap walks

Yes, I had similar impression but only for file, as the comment discussed
in rmap_walk_file().  For anonymous, it was always not clear to me, as at
least rmap walk anon doesn't seem to need folio lock in some special paths
like damon/page_idle/folio_referenced.

[1]

> that hold the folio lock can assume that folio->mapping and
> thereby folio_anon_vma() cannot change.
> 
> folio_lock_anon_vma_read() documents something regarding the folio lock protecting the
> anon_vma.

Right, I remember that change, though I was expecting the comment was
referring to the assert(locked) above.  Unfortunately we didn't have more
clue on the folio lock, even though the change itself makes perfect sense
regardless, to double check anon_vma from changing (after UFFDIO_MOVE).

> 
> I can only speculate that locking the folio is cheaper than locking the relevant anon_vma, and
> that rmap code depends on that.

I see this as two separate things to protect: folio->mapping, and the
anon_vma tree inside of it.

For now it looks like we're "almost" using folio lock to protect
folio->mapping for anon, however we could still read folio->mapping without
folio lock, per discussed above [1].  Below commit should be another sign
of that, where Alex mentioned the WRITE_ONCE needed for page_idle.

IOW, even with folio lock held, something can be reading folio->mapping,
and further walking the anon_vma..

I had a long-standing feeling that it works out only because anon_vma
updates can only happen within parent/child processes, so they're
internally holding the same anon_vma lock (anon_vma_trylock_read, taking
the root lock).  Hence even if a race happened it'll still take the same
lock.

I think it means as long as we decided to reuse an anon page (hugetlb or
not, as long as holding the pgtable lock), updating folio->mapping
with/without the lock should keep working.. But maybe I missed something.
And it may not be extremely important either so far; taking the lock
doesn't seem to be bad anyway.  It's only some confusion I never figured
out myself.

Thanks,

> 
> 
> I'll note that in the introducing commit we didn't use the WRITE_ONCE, though. That was added in
> 
> commit 16f5e707d6f6f7644ff07e583b8f18c3dcc5499f
> Author: Alex Shi <alexs@kernel.org>
> Date:   Tue Dec 15 12:33:42 2020 -0800
> 
>     mm/rmap: stop store reordering issue on page->mapping
> 
> But I don't think that the folio lock was a replacement to that WRITE_ONCE.

-- 
Peter Xu

