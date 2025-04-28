Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4626F478
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866493; cv=none; b=mrotAoWsMzXxKWk3tPC7CEp3L1iL90UiROftvVwnJJQYrUDvUG2qr+QBpM1KA8Fc7edYOTbm1oovlRP+eR11eZzVPN+qCicNhTZg+YYunzCSTywF8tJ4A54KicuAAo9ZAinYTQetBSbWMEzo1bwZstveUCcqja32g4BNBHDmq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866493; c=relaxed/simple;
	bh=glHgKvu5qMafceNRjAQWTK700+rJbJxcd7BLsI8dDKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awCqvOLj9E1S8BLqu+BIPhQoJyzPSo7UqJxWAwTkix4a5NrZDsY3hP1/Hyr+WyaS2yt9C3f5EY23ez+OvRtwa71zSvAwkT+pLlL7RBlHmKv08Nfy4siQArtG1jUT2cnN7o3k+nvwGUcrzD3MItJJIreqYBkHdPhHzh4mCGWNIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y41z2KU4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y41z2KU4"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6225437e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745866489; x=1746471289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I43ZMkcyctLc4IXUH1xZz0lw4Q70kaopNM4Qj8qwNVU=;
        b=Y41z2KU4Pvqe9aU7ISlbJS/h3GUmaoPhYBAVTC+dNxvnsZJFmEd4r2p0tMi6kpfsTB
         oaNwyKCx0XUV7F9Ks3x3SlI7uE5ZWTDx2wcwScIJNjCuThkQe0Oen3FTr2Bmx39YS5DJ
         H1iEHuKmKslg6Ue6axr+oKEr3gOiftIO9c3UCIXttOf2ZfrE/JEHaGOz2Aa6zVbLhXhz
         xAx6sX3ZW8YQ6h6jZ/ALe/vf/+uHkx2/Y/mmhov48yxbnh987JXbdD5Flk23CH5CsWhM
         R5Lijn31/S2qvKP6GUMfg1sNtMCu7/jGoHlvHc1aTOOebU/kaM15JTADUAxaspNc1HHP
         fdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866489; x=1746471289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I43ZMkcyctLc4IXUH1xZz0lw4Q70kaopNM4Qj8qwNVU=;
        b=bgHjZCZ7sJtylcyIC1iWiqKp87MxyheKqzBJO3nkGt3+n8U2y/7CShCKqI+NCR2Hsu
         b7fh/va8cOpj1mPE1guNbV/IIS2QMMrlg6uZRBjf1oM4C3nZMuUhv7MiWGsUlSzCqmMN
         mjsSdYHBJ5K6XB9OBkcP3vdj7AtAoWdSn3aT1u3j87dNfkJ2omw/0BKA3ien5mMXMcJd
         cJYuEI9Zajyge5MDIfObU4dKKybnjjUjLNCcwGNl3gHCAQOWvd3Flsq8CBzw6yaooRkU
         kvuCYQY3yD9ikVRFvGlzlPzoCVBq+KMikz3FfQWC3RGwZNAE4XF6EGLwo7dMr6TrcPWX
         EA6A==
X-Forwarded-Encrypted: i=1; AJvYcCVFojNMDUP76X+16prKe1M0ITnO9uLRH6FQEezZzzsfiJdBL2/xON9Ds2JRZBwxRt0AXdV8U5ta/EMWM+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbMdoi0ofY+MJmSM09KwxUlcatFJUcohvbPyXnrOXEopI5Mq9
	c8hZrgEhQypQR6y+7tBfyS1Z7JoWVYJ3BnpxldP1R9xXxTK0uuk86Lbv//GECsLjto2SNykSGyT
	eqDITDvg4ogvbGrJsvsmpQxLjDYY=
X-Gm-Gg: ASbGncveaTONxtvpq4O62jGUwEz9G9KIZANXGmW967e0Km5UX8UOEuTtJ9SirNBXs6A
	QEHmzQqE6Wcp2dggz4NVVOH1GRiLybkjRr2u5aonrBlkbsvAzUsyG1Qkfox79G7PFdtjjO12tM4
	J0gQFvO/CZ0gLidWHJwX6rFI+Do7uIJGSQ
X-Google-Smtp-Source: AGHT+IF9eRxEXFP0PqUTdi5OB+NyL32hrHSn/QN5Rz+OLeR/LBUYz6Lcf+yPsBsCQWA8ErnM7X+ZLTIkTzXoCDz3N/Y=
X-Received: by 2002:a05:6512:1288:b0:549:8d8d:2c62 with SMTP id
 2adb3069b0e04-54e8cc0bfb1mr4067926e87.36.1745866488899; Mon, 28 Apr 2025
 11:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com> <20250427185908.90450-5-ryncsn@gmail.com>
 <aA7PbiXv92WiTy8T@casper.infradead.org> <CAMgjq7CTtJ69W=6kOaEn740seY9Nh7To7WL+JTb_hFUHJ-TqAg@mail.gmail.com>
In-Reply-To: <CAMgjq7CTtJ69W=6kOaEn740seY9Nh7To7WL+JTb_hFUHJ-TqAg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 29 Apr 2025 02:54:31 +0800
X-Gm-Features: ATxdqUGTKRvMzwE_TJQTNf0P4gIR58HJ_Mvs3Pnte5Lo9Mwe8Ge_8uqoDsRzE9U
Message-ID: <CAMgjq7C7dxGqPu4=yLCrKe1vATemmXEgH6e-XyF+iQSSBYdiHA@mail.gmail.com>
Subject: Re: [PATCH 4/6] filemap: do not use folio_contains for swap cache folios
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 10:58=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Mon, Apr 28, 2025 at 8:44=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Mon, Apr 28, 2025 at 02:59:06AM +0800, Kairui Song wrote:
> > > For filemap and truncate, folio_contains is only used for sanity chec=
ks
> > > to verify the folio index matches the expected lookup/invalidation ta=
rget.
> > > The swap cache does not utilize filemap or truncate helpers in ways t=
hat
> > > would trigger these checks, as it mostly implements its own cache man=
agement.
> > >
> > > Shmem won't interact with these sanity checks either unless thing wen=
t
> > > wrong, it would directly trigger a BUG, because swap cache index are
> > > unrelated to shmem index, and would almost certainly mismatch (unless
> > > on collide).
> >
> > It does happen though.  If shmem is writing the folio to swap at the
> > same time that the file containing the folio is being truncated, we
> > can hit this.
>
> Thanks for the info! I didn't check it in detail because that would
> likley trigger a BUG_ON but so far I didn't see any BUG_ON commit from
> there.
>
> Just checked there are two users in truncate:
>
> One will lock the folio and check if `folio->mapping !=3D mapping`
> first, on swapout shmem removes the folio from shmem mapping so this
> check will skip the folio_contains check.
>
> Another seems might hit the check, the time window is extremely tiny
> though, only if the truncate's `xa_is_value(folio)` check passed while
> another CPU is running between `folio_alloc_swap` and
> `shmem_delete_from_page_cache` in shmem_writepage, then the next
> VM_BUG_ON_FOLIO(!folio_contains) will fail as folio is now  a
> swap cache, not shmem folio anymore. Let me double check if this needs
> another fix.

Checking all the code path, shmem managed to avoid all possible ways
to call into truncate_inode_pages_range, this is the only function
that seemed may call folio_contains with a swap cache folio.
(except tiny-shmem, it uses this function directly for truncate,
we can ignore that as it's basically just ramfs).

For truncate, shmem need to either zap a whole (large) swap/folio entry,
or zero part of folio, or swapin a large folio so that part of it can be ze=
ro'ed
(using shmem_get_partial_folio), the swapin part is a bit special so
calling generic truncate helpers might cause unexpected behaviour.

Similar story for filemap lookup.

So shmem won't call into the truncate helper here that may risk
calling folio_contains with swap cache.
Even if somehow it does, this commit won't change the BUG_ON
behaviour, except now it tells the user the folio shouldn't be a swap cache
at all, instead of reporting a buggy index. So I think this commit should
be good to have to make the swap cache less exposed.

---
List of potential call chains that may call into the truncate helper
here, and not initialized from other FS / block, none will be used by
shmem.

do_dentry_open
  /* filemap_nr_thps always 0 for shmem */
  truncate_inode_pages
    truncate_inode_pages_range

dquot_disable /* No quota file for shmem */
  truncate_inode_pages
    truncate_inode_pages_range

dquot_quota_sync /* No quota file for shmem */
  truncate_inode_pages
    truncate_inode_pages_range

truncate_inode_pages_final /* Override by shmem_evict_inode */
  truncate_inode_pages
    truncate_inode_pages_range

simple_setattr /* Override by shmem_setattr */
  truncate_setsize
    truncate_pagecache
      truncate_inode_pages
        truncate_inode_pages_range

put_aio_ring_file /* AIO calls it for private file */
  truncate_setsize
    truncate_pagecache
      truncate_inode_pages
        truncate_inode_pages_range

truncate_pagecache /* No user except other fs */
  truncate_inode_pages
    truncate_inode_pages_range

truncate_pagecache_range /* No user except other fs  */
  truncate_inode_pages_range

---

invalidate_inode_pages2 /* No user except other fs */
  invalidate_inode_pages2_range

filemap_invalidate_pages /* only used by block / direct io */
  invalidate_inode_pages2_range

filemap_invalidate_inode /* No user except other fs */
  invalidate_inode_pages2_range

kiocb_invalidate_post_direct_write /* only used by block / direct io */
  invalidate_inode_pages2_range
