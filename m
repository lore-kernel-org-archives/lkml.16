Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D42221725
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746513913; cv=none; b=KRZm5UxVtCA1FfwmtxB4K7xs8zpr+XQIV9XbhA+Sbw+22dA4G/5f1Tvpyqjm0eCkB6c8OrIGhcUsCeCQNhZMaaEINRR6EK9hDiZBYWKdtxi2fGulBYQC7pn+KMUwo1hqNXURiW8FDFxRDdrUn4yuCeMDRCPcJFQsuzpRDJYwTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746513913; c=relaxed/simple;
	bh=h5rXKj1nXHsCqzdzy6AYHkfyrpuYGZSD/7bDYQj+e1U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qs0hIIiU2Jv5UCTqw1RhbasaQ+YDi88xtNMsIvKlCoSpjq/fuWUdDFvL/Ju2RX3cuC6dNLyKkK3DGRmUXbgRG9rf6uMihOwdlTGz0A/QXk28BsuHm427cMuDXAhuTtvg6j5/+YiHsgAm3qCmkpP9fthrFTWFPs0/ATf1+fijsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4iT62VN4; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4iT62VN4"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4034118aeb7so949892b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 23:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746513911; x=1747118711; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pOy7LO18ZOVs0lu6y78gTLGQOe6Je3TlNtuMcY0wQFI=;
        b=4iT62VN4lQoYtfBrZ3PBky7mx1XUpQXgOrxp3NwzEbLIAottbHs4O40uoFjk6MYf2L
         z2PJ4aHXgZ1bFfRw6wuvs6RTPQmpa+bOtxGThnb5ubT9Y80tnO26v3HnBl6/9x6IqkSg
         qiscqBCGh12qHtnf9Fwlu7m2jET1nrmEsfvBKpj/YMmwIA1XPUix4l4BW84NO6Recska
         J4TfNqTR7BA3TK2lvs13h2SiQvHH+KpEqsYezfrZLUSLMHx2Uq74OMcxz1TComvdUnRF
         HbFPZiDwJvZnBlF32OpM6HHaBw6Y2RgtjNr23ZPwhetQ/+Ba34AN+FH9EGHQJkm0GYsw
         DYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746513911; x=1747118711;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOy7LO18ZOVs0lu6y78gTLGQOe6Je3TlNtuMcY0wQFI=;
        b=HGz5e0WOzhWYicG10srFv4jC+nfGVBsam8N1Yg8DdyC8njEp4Zu/SEUqM2k30l3cCH
         /7HfzODJ0U4TrFF5vUDGpCKzqpCF3HHvIzmwpvmeekRoWsY52yDTbD4Esg498thX34ko
         zXmkg0Unloq5ITup8gohcIoHDll6gwUHX0BlJjIprDdxKDZk4yOYI3uzyA8cKz5qQBzY
         WqO0Q48lGOsuXY8uELqc44fYpU8nicmhNvw1boT3chqP+WJxJWxTn8rUNrqlL+jDoLhZ
         ghWvC7umJmW8y4bmsKx2yjI06M1mNRZYZsoXDT4EJttKpzCxSpe4Hbr1jJnQFUjYCaWt
         PA5g==
X-Forwarded-Encrypted: i=1; AJvYcCVaPi6xJ93AuDJ6ObSXXMYn7ds23r0eQZW6hRFAawE9RZriLi34AMNncrT0nNLMJtiUklB1ZCazBMuWwg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2hlRSMvoHorifBOlOYtt0zl1CV9eIA2Q0/7H6fXm3G3W7n+z
	Zp0KPOgEDw7GEp5a6BPtZt9FJjGhK3G4SYnFZlR28Wx8nGg0YN7qDnvxKTurkw==
X-Gm-Gg: ASbGncvaYpCWkzrEDhcsOnQZucPMHBf9Zsw9g5QEWVlL914q5KiJQ9BYqYjH8KfRgqo
	3EZo5DkeMyuM9+S3FyGIDJ0ttYkLZqVu6d93tKzw2XO56yBBhZPSwnUhOgTrUoPHrPUi2QttjXI
	/tPr2eCARubYr4uZMciBoe2+basbr8x7SfV35VL3J76sdwc2GqnclaTGlyR/OTSsuXi45dhuZ55
	8p8Rpy7iuAZH7+itHVkvt2JHR/YFcQSS/ijaa2++N8aRIN95VoxXaW4PujvqOlDHWrA3aMVWTVp
	zJ5NEVWhp8R1VQ9F/mZQ9Bcj+bu49QTr7+IIPfdNtr0OEDbgPnwy4+/KrpGqhzfiX3Potys5/8p
	aCdaHsFRf2vMOpf/WbSpRtEw5
X-Google-Smtp-Source: AGHT+IHI3FvBIxrRJdUZJwJ+nd8eUirpcwZEVNZHwxBf+/mwHrhWJ1GNsR+1w55ZqfJ9e1Y3jae2fA==
X-Received: by 2002:a05:6808:1a1b:b0:3fe:aedb:19ea with SMTP id 5614622812f47-4035a5cb6acmr5761585b6e.25.1746513910524;
        Mon, 05 May 2025 23:45:10 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae6f2dsm2354235b6e.29.2025.05.05.23.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 23:45:09 -0700 (PDT)
Date: Mon, 5 May 2025 23:44:55 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Johannes Weiner <hannes@cmpxchg.org>, 
    Muchun Song <songmuchun@bytedance.com>
cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
    muchun.song@linux.dev, akpm@linux-foundation.org, david@fromorbit.com, 
    zhengqi.arch@bytedance.com, yosry.ahmed@linux.dev, nphamcs@gmail.com, 
    chengming.zhou@linux.dev, linux-kernel@vger.kernel.org, 
    cgroups@vger.kernel.org, linux-mm@kvack.org, 
    hamzamahfooz@linux.microsoft.com, apais@linux.microsoft.com, 
    Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH RFC 07/28] mm: thp: use folio_batch to handle THP splitting
 in deferred_split_scan()
In-Reply-To: <20250430143714.GA2020@cmpxchg.org>
Message-ID: <235f2616-99dd-abfa-f6d1-c178d8ffb363@google.com>
References: <20250415024532.26632-1-songmuchun@bytedance.com> <20250415024532.26632-8-songmuchun@bytedance.com> <20250430143714.GA2020@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, Johannes Weiner wrote:
> On Tue, Apr 15, 2025 at 10:45:11AM +0800, Muchun Song wrote:
> > The maintenance of the folio->_deferred_list is intricate because it's
> > reused in a local list.
> > 
> > Here are some peculiarities:
> > 
> >    1) When a folio is removed from its split queue and added to a local
> >       on-stack list in deferred_split_scan(), the ->split_queue_len isn't
> >       updated, leading to an inconsistency between it and the actual
> >       number of folios in the split queue.
> > 
> >    2) When the folio is split via split_folio() later, it's removed from
> >       the local list while holding the split queue lock. At this time,
> >       this lock protects the local list, not the split queue.
> > 
> >    3) To handle the race condition with a third-party freeing or migrating
> >       the preceding folio, we must ensure there's always one safe (with
> >       raised refcount) folio before by delaying its folio_put(). More
> >       details can be found in commit e66f3185fa04. It's rather tricky.
> > 
> > We can use the folio_batch infrastructure to handle this clearly. In this
> > case, ->split_queue_len will be consistent with the real number of folios
> > in the split queue. If list_empty(&folio->_deferred_list) returns false,
> > it's clear the folio must be in its split queue (not in a local list
> > anymore).
> > 
> > In the future, we aim to reparent LRU folios during memcg offline to
> > eliminate dying memory cgroups. This patch prepares for using
> > folio_split_queue_lock_irqsave() as folio memcg may change then.
> > 
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> 
> This is a very nice simplification. And getting rid of the stack list
> and its subtle implication on all the various current and future
> list_empty(&folio->_deferred_list) checks should be much more robust.
> 
> However, I think there is one snag related to this:
>...
> There IS a list_empty() check in the splitting code that we actually
> relied on, for cleaning up the partially_mapped state and counter:
> 
> 		    !list_empty(&folio->_deferred_list)) {
> 			ds_queue->split_queue_len--;
> 			if (folio_test_partially_mapped(folio)) {
> 				folio_clear_partially_mapped(folio);
> 				mod_mthp_stat(folio_order(folio),
> 					      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> 			}
> 			/*
> 			 * Reinitialize page_deferred_list after removing the
> 			 * page from the split_queue, otherwise a subsequent
> 			 * split will see list corruption when checking the
> 			 * page_deferred_list.
> 			 */
> 			list_del_init(&folio->_deferred_list);
> 
> With the folios isolated up front, it looks like you need to handle
> this from the shrinker.

Good catch.  I loaded up patches 01-07/28 on top of 6.15-rc5 yesterday,
and after a good run of 12 hours on this laptop, indeed I can see
vmstat nr_anon_partially_mapped 78299, whereas it usually ends up at 0.

> 
> Otherwise this looks correct to me. But this code is subtle, I would
> feel much better if Hugh (CC-ed) could take a look as well.

However... I was intending to run it for 12 hours on the workstation,
but after 11 hours and 35 minutes, that crashed with list_del corruption,
kernel BUG at lib/list_debug.c:65! from deferred_split_scan()'s
list_del_init().

I've not yet put together the explanation: I am deeply suspicious of
the change to when list_empty() becomes true (the block Hannes shows
above is not the only such: (__)folio_unqueue_deferred_split() and
migrate_pages_batch() consult it too), but each time I think I have
the explanation, it's ruled out by folio_try_get()'s reference.

And aside from the crash (I don't suppose 6.15-rc5 is responsible,
or that patches 08-28/28 would fix it), I'm not so sure that this
patch is really an improvement (folio reference held for longer, and
list lock taken more often when split fails: maybe not important, but
I'm also not so keen on adding in fbatch myself).  I didn't spend very
long looking through the patches, but maybe this 07/28 is not essential?

Let me try again to work out what's wrong tomorrow,
Hugh
