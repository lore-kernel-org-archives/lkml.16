Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBACBA33
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750655815; cv=none; b=f7URlm9UBavFFN5zr5E9oATGdjK56Rc237gMOcBrhg/aBn6t3vlaJBKX3uuyEfzJk7UGepcPP40zQ3kswkWHsRzSw8TyqeXB33UrHEO0wj5X9Xwcio08HSaF5Mjie3qdNpJR9ykPv1JtVO0BXhw1fS3eD+0Hq7OaYEAQvBFftM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750655815; c=relaxed/simple;
	bh=FqygX8Jv/eas2K36xyEr/ohdL8MBtXu89JXsmBFhgQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpD5TEu5xPW37/wx6z4rYin9x/nDY1PujvnumpDUWHd9MQSuTmQbP7hPJVcIPzi2j8foOqiEO3En6ohOi5dNZI7a5i0qkbeUgPsKKJaAkZdFMqroAg5M32g8WvAFbzSjxZ5rcbeDXgWKhUzMjC8zjKrDA9fdW66f70uCkSzKUHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO0rMHXl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO0rMHXl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so2623792a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750655813; x=1751260613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En0pq+jCzMYs3olwKBVBf+cE3fdHEMn7c2+JHjmC2Bc=;
        b=PO0rMHXl/VLoo7W7GaFl0mkYbCJW7wDd7/P4L1XvpvEFo2gTDA8SAkuX2Hgqbat7Wt
         kJ+3+bwRSDFr8nituBJJAuA8pbHxB8YsAgKpFJ4fEp/+qJ4SI/XfHM4OlAIdku7iCJdj
         +yXzyBlrl9L9cfdeQY0g906zeQFTDKrW+keABY4zf1j3HtzfRTs+9ANTp0lugzXcjEmf
         yOB/W4z10xrepep0JmDwKCAYIbda5cBsmbDirvQrmhTPxjHuYLRaZjl9iIsVsRkfKz8X
         x0V/wlOW4EUBLwhft/ZUdOsKTz+sJM9Ow8qsHkxv+fGGHLuOk+i4pZ5yGYI8e9dNqdwn
         X6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750655813; x=1751260613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=En0pq+jCzMYs3olwKBVBf+cE3fdHEMn7c2+JHjmC2Bc=;
        b=T42o4l3IV+af6dl9VJ/sTnuLjD5iwd1QH99oyE5qjkNqSOElyandBZQkhDsIIrKg8D
         0mNxlokS0f5DC1jwAQmiSY+9A+RsyWswguHRExS+D6XAII/QUaWOy6rUeDwIK1mF0smM
         XkKQElOXIXLcL/7Bzi/naptkMqwJPOuzeCqC3R6KWMWtiV1cLYZkLiT3czBXt46LhW0h
         4GOIRHuL7RuPkyVHjzQDhknoLhThxYVAyGCP2ggfsQwEof+4Xo5+F+3O/VtQx+ldcSFp
         AfZ7oXronUnoxN6N/GVAoVTjVms4iXK6+eSbnHVfaQSK/2E2NcRwqMWdkbTS+phvCo7M
         7l6w==
X-Forwarded-Encrypted: i=1; AJvYcCXCu5yzaIxj7R8iIM1BOlJjj/KqoV6nxir1ZCyoG5HuMvq0SOgHT/hMjIy+m+wO4AODZ5oVZ0l+dcfV/DU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx98wpAOIicKJgaAK+1zo9SwW1Th5hq7f8j8EQP5ir3iwxWImx8
	E9lQoPNRRdzmb09xfD7kVv8vXbCTbIVe2eqOWzwUm8e/HhCSUhWabqP0
X-Gm-Gg: ASbGncs/vIUTZHWJ7clo0duR9yg1+B15rGfuc0HwpLPpq7S0I6aUadQpWHMQ0tVUGLE
	VWy72YqvaR47zvXS2X7YPXwtRzgMD3GiGCft3dBeGFaL4dpqLYGoGA4aJCxKELaEuC3Ry7tKNMO
	29c3l2+Cfmws31KPXKZO5pcDnfmIZO9JJcieoi6HLRlVcxImN0KYBaZ0KQCFOqJG1ZwC/LFHAFr
	SGZGLbXwoL5Zan0DAEGZllVfCmt1KhhtmazXh8RMgIp99DISfxARpX3zrAgkIWZ3gGz3cQhxZ2y
	C9HRVadT+sJ+iIZwNBYRryZYUQmCdfO8PQzn4yFVTTdwSck7Rc3Q5SwkUnsnFSW9xZivlLEW
X-Google-Smtp-Source: AGHT+IG9TUKXoeyvlp4X4lyFMSjBOFbruQUMqCiCZF+ohvgS9TLgNer/JkiWcjcRvc8wDgqad/VFHw==
X-Received: by 2002:a17:90b:390f:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-3159d6470dbmr17802629a91.10.1750655812825;
        Sun, 22 Jun 2025 22:16:52 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.21.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e06ce4bsm7136997a91.38.2025.06.22.22.16.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Jun 2025 22:16:52 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: nphamcs@gmail.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	andrew.yang@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	hannes@cmpxchg.org,
	james.hsu@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	matthias.bgg@gmail.com,
	minchan@kernel.org,
	qun-wei.lin@mediatek.com,
	rppt@kernel.org,
	senozhatsky@chromium.org,
	sj@kernel.org
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
Date: Mon, 23 Jun 2025 17:16:42 +1200
Message-Id: <20250623051642.3645-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
References: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nhat,

On Wed, Jun 18, 2025 at 2:21 AM Nhat Pham <nphamcs@gmail.com> wrote:
>
> On Sun, Jun 15, 2025 at 8:41 PM Barry Song <21cnbao@gmail.com> wrote:
> > >>
> > >> That seems unnecessary. There is an existing method for asynchronous
> > >> writeback, and pageout() is naturally fully set up to handle this.
> > >>
> > >> IMO the better way to do this is to make zswap_store() (and
> > >> zram_bio_write()?) asynchronous. Make those functions queue the work
> > >> and wake the compression daemon, and then have the daemon call
> > >> folio_end_writeback() / bio_endio() when it's done with it.
> >
> > > +1.
> >
> >
> > But,
> > How could this be possible for zswap? zswap_store() is only a frontend —
> > we still need its return value to determine whether __swap_writepage()
> > is required. Waiting for the result of zswap_store() is inherently a
> > synchronous step.
>
> Hmm, I might be misunderstanding either of you, but it sounds like
> what you're describing here does not contradict what Johannes is
> proposing?

It seems contradictory: Johannes proposes that zswap could behave like zRAM
by invoking `folio_end_writeback()` or `bio_endio()`, but this doesn’t align
with actual behavior since zswap_store might not end `swap_writeout()`—it may
still proceed to `__swap_writeback()` to complete the final steps.

Meanwhile, Qun-wei’s RFC has already explored using `folio_end_writeback()` and
`bio_endio()` at the end of `__swap_writepage()` for zRAM, though that approach
also has its own issues.

>
> >
> > My point is that folio_end_writeback() and bio_endio() can only be
> > called after the entire zswap_store() → __swap_writepage() sequence is
> > completed. That’s why both are placed in the new kcompressed.
>
> Hmm, how about:
>
> 1. Inside zswap_store(), we first obtain the obj_cgroup reference,
> check cgroup and pool limit, and grab a zswap pool reference (in
> effect, determining the slot allocator and compressor).
>
> 2. Next, we try to queue the work to kcompressd, saving the folio and
> the zswap pool (and whatever else we need for the continuation). If
> this fails, we can proceed with the old synchronous path.
>
> 3. In kcompressed daemon, we perform the continuation of
> zswap_store(): compression, slot allocation, storing, zswap's LRU
> modification, etc. If this fails, we check if the mem_cgroup enables
> writeback. If it's enabled, we can call __swap_writepage(). Ideally,
> if writeback is disabled, we should activate the page, but it might
> not be possible since shrink_folio_list() might already re-add the
> page to the inactive lru. Maybe some modification of pageout() and
> shrink_folio_list() can make this work, but I haven't thought too
> deeply about it :) If it's impossible, we can perform async
> compression only for cgroups that enable writeback for now. Once we
> fix zswap's handling of incompressible pages, we can revisit this
> decision (+ SJ).
>
> TLDR: move the work-queueing step forward a bit, into the middle of
> zswap_store().
>
> One benefit of this is we skip pages of cgroups that disable zswap, or
> when zswap pool is full.

I assume you meant something like the following:

bool try_to_sched_async_zswap_store()
{
	get_obj_cgroup_from_folio()
	if (err) goto xxx;
	zswap_check_limits();
	if (err) goto xxx;
	zswap_pool_current_get()
	if (err) goto xxx;
	   
	queue_folio_to_kcompressd(folio);
	return true;

xxx:
	error handler things;
	return false;
}

If this function returns true, it suggests that compression requests  
have been queued to kcompressd. Following that, in kcompressd():

int __zswap_store(folio)
{
	for(i=0;i<nr_pages;i++) {
		zswap_store_page();
		if (err) return err;
	}
	return 0;
}

kcompressd()
{
	while(folio_queue_is_not_empty) {
		folio = dequeue_folio();
		if (folio_queued_by_zswap(folio)) {
			if(!__zswap_store(folio))
				continue;
		}
		if ((zswap_store_page_fails && mem_cgroup_zswap_writeback_enabled()) ||
		    folio_queued_by_zram) {
			__swap_writepage();
		}
	}
}

In kswapd, we will need to do
int swap_writeout(struct folio *folio, struct swap_iocb **swap_plug)
{
	...
	if (try_to_sched_async_zswap_store(folio))
		return;
	if (is_sync_comp_blkdev(swap)) {
		queue_folio_to_kcompressd(folio);
		return;
	}
	__swap_writepage();
}

To be honest, I'm not sure if there's a flag that indicates whether the  
folio was queued by zswap or zram. If not, we may need to add a member  
associated with folio pointers in the queue between kswapd and kcompressd,  
since we need to identify zswap cases. Maybe we can reuse bit 0 of the  
folio pointer?

What I mean is: while queuing, if the folio is queued by zswap, we do  
`pointer |= BIT(0)`. Then in kcompressd, we restore the original folio  
with `folio = pointer & ~BIT(0)`. It's a bit ugly, but I’m not sure  
there’s a better approach.

Thanks
Barry
