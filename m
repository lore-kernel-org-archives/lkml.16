Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15F28DB66
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066506; cv=none; b=ZjeoytIwdl8BmEmvcvDmbkHqnP1DF7IqPMlRSAd8HuTV3U3p9mz8hd/iN3ytWGgY0u1OK+LrkwVh/e7lug+xmx0y9mCG1BuvcrK4GNOlPFfM4pNzbirxM8qYoDVS961IGRURrNoqXlZo1hG1eZyOCld+gnJV2Aty5CYcPgaI/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066506; c=relaxed/simple;
	bh=PpXyI7PeSrlf4nbt7ZQ9GlchK9jy0WgZ8xMwQdBEMMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwI9yXDsvUw/HEGWwkTLAdFyLZVj9qna8YazVLJGjxk88fguf7EBhz876tJm3/ecMkIolW+SKvUBMAKA5UqnlCOWL4BZvTaMPHifadU0oZOnqHb0ojIAzP9AwJi+hkD7Po5RQhoi0ZDr4UNDYTF7uMS7RATJbyMhewcIHNjX+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R60Rdz51; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R60Rdz51"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facacf521eso26276636d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751066504; x=1751671304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucJkPKtW7Pg719flpv7obuaScxhby2iCUB5MbPa/kpk=;
        b=R60Rdz51KTD6BDh1sJBHZXwmlhnhO+M1J/rv0amxxT2YvgaEOAjzPx2SXvnD7qcECD
         hvOQbLV2C3HWuQhOxdxuX6nKsCdufUJMmvyzAuFDTkvORBrNzpBSzogs3V2Ox9NYjoLR
         FnlNETomINyzywRwlWnif96/JoU5BgavhLVQTqONj873EL1DHTNKOSc0UT8/N61XPX+q
         KVMqznS/nsORYeMckZCDNwMckoMmiIhHBzGpN6N1lORZ5yheX81tBOKeeSsu1da/ZXaN
         gbynU3lhSzrK1FMnsvqqUEKGSDhM7/0gA79thqCDDF+V0JBZ0UMtPH6NXlzq5PINGz8y
         Z7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066504; x=1751671304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucJkPKtW7Pg719flpv7obuaScxhby2iCUB5MbPa/kpk=;
        b=ue+wgMOgHfytVjQOk52WWUhgX+RKAtBEsEn/LNNPLIniEqcZky7moeLdGJbmN/66w8
         ZMJxTwWgMP2US9Slf+vhU3314OG6wHt8BepBcg+Paytual5V+KO44QD2NJycMa7dTOWw
         /0sNNR38cqbk0RjnP2xAiQsCr4V7lJXHrQxnj5Hi8HNbzZSqbXeroyHlNFNKSXV5+jHG
         n810dx327/esaZgRh7jmwVf38aT9AD4MTiJDLLnK3s5sZlX36X9aTrQN0TrkAafdTW0V
         anJ1V28m4+/gCFA5baLr4KGpIC6ICzAZXtBrk4dq4kJRd/srg0KYqRrdFLllMI8CTONA
         DPyA==
X-Forwarded-Encrypted: i=1; AJvYcCWGyLN2uBoJtMXB3ATjpUctxwmch+gF/+zsjy1uM59O4iwV3vEAHue4vuq2nmoo+LT8eK/2+TmMVpdYFq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpait4itJTPgX4JfFHJ9HiVE0+ZMNP1ywsNB6TIbt/8L6yXz4n
	Oo1SBqJpQpU607hSVlfHqfR1f6ZPgfDDGkDievRARDMQ3M4IPhhLmOjYgj6JW/XWMFOYlh815KY
	CLhrkKgM8RDfwjEkaBLrbl0o/jUs7obk=
X-Gm-Gg: ASbGncvvVuqecNXeyb1GZ/XuE98AdUKTb/olNpUcVhthRMsZJTa3UTwLAl2q6D1q1nj
	BOXeEyvYkisvfrxX41Ahsge9PewDOvECXRKD29JpBuwCaZfOeRfV47nIcsjNpiv5DOOH5AhYdsd
	Cr4VqXcpVMBfN/h9WUKZQhXP+XlLkeNd11HJ/pJ/kzE4c=
X-Google-Smtp-Source: AGHT+IHt7Bnl1QDdVB6cTrkscdZrmsp2tuuy01YtS0lHhra3cCiP4pdY5RNPLzOZWdY2wMvLK7r6ZqOWRGCudJ2pzN8=
X-Received: by 2002:a05:6214:19e2:b0:6e4:2dd7:5c88 with SMTP id
 6a1803df08f44-70005d01547mr81865596d6.38.1751066503861; Fri, 27 Jun 2025
 16:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
 <20250623051642.3645-1-21cnbao@gmail.com>
In-Reply-To: <20250623051642.3645-1-21cnbao@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 27 Jun 2025 16:21:32 -0700
X-Gm-Features: Ac12FXw9SLcgHLB1-sjIGFMt6c57r8Qm130o6AnwRJ48KBb5RI23RH4t3Y7AL0Q
Message-ID: <CAKEwX=MTuxSbbSWaKOwdjAgdar2=D83UW-j9mV3qDSg+ZHHwkA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, andrew.yang@mediatek.com, 
	angelogioacchino.delregno@collabora.com, casper.li@mediatek.com, 
	chinwen.chang@mediatek.com, hannes@cmpxchg.org, james.hsu@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, 
	matthias.bgg@gmail.com, minchan@kernel.org, qun-wei.lin@mediatek.com, 
	rppt@kernel.org, senozhatsky@chromium.org, sj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 10:16=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> Hi Nhat,
>
> On Wed, Jun 18, 2025 at 2:21=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Sun, Jun 15, 2025 at 8:41=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> > > >>
> > > >> That seems unnecessary. There is an existing method for asynchrono=
us
> > > >> writeback, and pageout() is naturally fully set up to handle this.
> > > >>
> > > >> IMO the better way to do this is to make zswap_store() (and
> > > >> zram_bio_write()?) asynchronous. Make those functions queue the wo=
rk
> > > >> and wake the compression daemon, and then have the daemon call
> > > >> folio_end_writeback() / bio_endio() when it's done with it.
> > >
> > > > +1.
> > >
> > >
> > > But,
> > > How could this be possible for zswap? zswap_store() is only a fronten=
d =E2=80=94
> > > we still need its return value to determine whether __swap_writepage(=
)
> > > is required. Waiting for the result of zswap_store() is inherently a
> > > synchronous step.
> >
> > Hmm, I might be misunderstanding either of you, but it sounds like
> > what you're describing here does not contradict what Johannes is
> > proposing?
>
> It seems contradictory: Johannes proposes that zswap could behave like zR=
AM
> by invoking `folio_end_writeback()` or `bio_endio()`, but this doesn=E2=
=80=99t align
> with actual behavior since zswap_store might not end `swap_writeout()`=E2=
=80=94it may
> still proceed to `__swap_writeback()` to complete the final steps.
>
> Meanwhile, Qun-wei=E2=80=99s RFC has already explored using `folio_end_wr=
iteback()` and
> `bio_endio()` at the end of `__swap_writepage()` for zRAM, though that ap=
proach
> also has its own issues.


Hmm OK. I'll let Johannes comment on this then :)

>
> >
> > >
> > > My point is that folio_end_writeback() and bio_endio() can only be
> > > called after the entire zswap_store() =E2=86=92 __swap_writepage() se=
quence is
> > > completed. That=E2=80=99s why both are placed in the new kcompressed.
> >
> > Hmm, how about:
> >
> > 1. Inside zswap_store(), we first obtain the obj_cgroup reference,
> > check cgroup and pool limit, and grab a zswap pool reference (in
> > effect, determining the slot allocator and compressor).
> >
> > 2. Next, we try to queue the work to kcompressd, saving the folio and
> > the zswap pool (and whatever else we need for the continuation). If
> > this fails, we can proceed with the old synchronous path.
> >
> > 3. In kcompressed daemon, we perform the continuation of
> > zswap_store(): compression, slot allocation, storing, zswap's LRU
> > modification, etc. If this fails, we check if the mem_cgroup enables
> > writeback. If it's enabled, we can call __swap_writepage(). Ideally,
> > if writeback is disabled, we should activate the page, but it might
> > not be possible since shrink_folio_list() might already re-add the
> > page to the inactive lru. Maybe some modification of pageout() and
> > shrink_folio_list() can make this work, but I haven't thought too
> > deeply about it :) If it's impossible, we can perform async
> > compression only for cgroups that enable writeback for now. Once we
> > fix zswap's handling of incompressible pages, we can revisit this
> > decision (+ SJ).
> >
> > TLDR: move the work-queueing step forward a bit, into the middle of
> > zswap_store().
> >
> > One benefit of this is we skip pages of cgroups that disable zswap, or
> > when zswap pool is full.
>
> I assume you meant something like the following:
>
> bool try_to_sched_async_zswap_store()
> {
>         get_obj_cgroup_from_folio()
>         if (err) goto xxx;
>         zswap_check_limits();
>         if (err) goto xxx;
>         zswap_pool_current_get()
>         if (err) goto xxx;
>
>         queue_folio_to_kcompressd(folio);

Something like this, yeah. Can queue_folio_to_kcompressd() fail? If
so, we can also try synchronous compression on failure here
(__zswap_store() ?).


>         return true;
>
> xxx:
>         error handler things;
>         return false;
> }
>
> If this function returns true, it suggests that compression requests
> have been queued to kcompressd. Following that, in kcompressd():
>
> int __zswap_store(folio)
> {
>         for(i=3D0;i<nr_pages;i++) {
>                 zswap_store_page();
>                 if (err) return err;
>         }
>         return 0;
> }
>
> kcompressd()
> {
>         while(folio_queue_is_not_empty) {
>                 folio =3D dequeue_folio();
>                 if (folio_queued_by_zswap(folio)) {
>                         if(!__zswap_store(folio))
>                                 continue;
>                 }
>                 if ((zswap_store_page_fails && mem_cgroup_zswap_writeback=
_enabled()) ||
>                     folio_queued_by_zram) {

If !mem_cgroup_zswap_writeback_enabled(), I wonder if we can activate
the page here?

>                         __swap_writepage();
>                 }
>         }
> }
>
> In kswapd, we will need to do
> int swap_writeout(struct folio *folio, struct swap_iocb **swap_plug)
> {
>         ...
>         if (try_to_sched_async_zswap_store(folio))
>                 return;
>         if (is_sync_comp_blkdev(swap)) {
>                 queue_folio_to_kcompressd(folio);
>                 return;
>         }
>         __swap_writepage();
> }
>
> To be honest, I'm not sure if there's a flag that indicates whether the
> folio was queued by zswap or zram. If not, we may need to add a member

I don't think there is.

> associated with folio pointers in the queue between kswapd and kcompressd=
,
> since we need to identify zswap cases. Maybe we can reuse bit 0 of the
> folio pointer?
>
> What I mean is: while queuing, if the folio is queued by zswap, we do
> `pointer |=3D BIT(0)`. Then in kcompressd, we restore the original folio
> with `folio =3D pointer & ~BIT(0)`. It's a bit ugly, but I=E2=80=99m not =
sure
> there=E2=80=99s a better approach.

I think this approach is fine.

We can also hack struct zswap_entry, but that would require an extra
xarray look up. OTOH, if we can assume that zram users will not enable
zswap, we might optimize that lookup away? Not sure if it's much
cleaner than just pointer tagging though.

>
> Thanks
> Barry
