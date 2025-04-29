Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF8374D1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933580; cv=none; b=NeO8ZolEjFYUfGoO1Z/uW2ROB+gUMWQGQ1AfxdG3k9HbCoWQ0wO37jlcKFheCKbwRU/+kFT8eV5ER96X/IQjss1q92+eWzq0dJmzu0xBXJmFy0s7T75BYHgY3/Jk57HQgRJVlqv8FcmSuRHH82MP1qxny3ivQbyq7Zaz8D1nGIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933580; c=relaxed/simple;
	bh=lzL1TBiuOVpxl1JiYzNUwOseHUbBT2xcI4Twy7+CdWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyyB/dojeKRcuWOfuEGsAW+0OQ9e+6GKphFP2DXVXBkWG7oy7yeuDV9RUqedJmMp6Wa2hTD2FMEYbDo2QC/Q6w3E/tvMNBT4RSyobrnb4zPD6/vNJNY0WWqxnObPbsAB9nA+VsTcLFkdofqry5Gb81rP++7nOiQPxp7KxdGPrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLLXEos5; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLLXEos5"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-31062172698so63293181fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933576; x=1746538376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA9iSDXUw9fYILEdd8sfIy3Wc1IYLXuLlaxcqmIQD7A=;
        b=WLLXEos5tlcJtMpAC9TJ3CzPeFV/GuTTH95cAEPWK7kNni65uepQUkM+gzU89rf7NO
         zrZ12ob/kD3LHRbxQ+AMVIAy3+p4JPcH1lyjMb2QwNOZmTwISOCA3kRyML058n77dHSi
         z3/OTNZ0lvJJR6sOs2+VajT8DbPL5paegTH5X1FU9jicGgbi9p50IcOJ8keaJsNbM0EN
         B+gwr6cxGYd2awdYDTnVI5DVVhBA79FC0A8GB5qCuSWDTFLam286i7iRsdq9Mo8DD/iy
         3jDii9zL02JNeYQaxeywxWxZT97iyN94uQgZ9jXO0+tSvkr/3HxBFOleqf0oY4xoO1OY
         Y7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933576; x=1746538376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA9iSDXUw9fYILEdd8sfIy3Wc1IYLXuLlaxcqmIQD7A=;
        b=Aq89cGrXqvI+uu6U6BTW6NZU4OcocmpQREXc03QwnYMGzNEq1yZzyrjWcn0uuik1wo
         EeXmGr9CNkGFpvVYdW30w1OHsvnHlvLvxdMyvK5VXKiltqwShmt0f+QnbuDqLqb6e/Zt
         aLYLZ1+Y702BLosKiYgvIx2cv8pDcw1I9PFQJ+VhJo3NCZrl4VMD1VdDaggbpNYWvEVx
         quzDSv9E66OI/9UaDzpbMRpKGAsslrOmcAnI74+w2NVp/MXWLILdSbUqeIlwiUn+An3Q
         jQL+jQUqwXzDc552bqRsUb/ahUGj2wU7m2OiS2EfKlYoZ27LwCrOHDrR+biblmKPiHAM
         vyLA==
X-Forwarded-Encrypted: i=1; AJvYcCVoWqX7vbg5dgx5mwOf6VdGGjm4AEZSIQc5c77LHJ4cwTwyWQi1x+j0hPU+3Pgu3gQzStTUBuwSU7mdlp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvrxNFenjUAMzOoq48JtRW03ac21HKHbTaXtcTrTVLk71E9Eg7
	yL12AC5XRvsvYkuSEJ/BSgNW/ROoGbozXK6cX668k78FJwK46yu+hShAQtqeDCX2XRgqjChlpP+
	te1IlX3h/ucfknhAy81KFFFpDVqY=
X-Gm-Gg: ASbGncu80f/JtKs2VmJbtHJaxXG+UtKVIWURgUsEdFTbc56CU4U7T3fekbMBzPGDPWN
	UG7zOIKEAWaDe/8XCbr9gFE7m0H2wrbgY2NHRkskaFcIJxEtzYCaSy2pxhHfoYsk+0Y2NhovljS
	E9LD/OPAFKm/EJiaEpvdqyMg==
X-Google-Smtp-Source: AGHT+IEDdLYwgO3RacmTZBgf/vcmzo4EvuoguvJZCNmKySsM6c+bX0TZgPRI1PLNvjQQFaG6vvlKS6fXTpZUBFSjibw=
X-Received: by 2002:a2e:a10d:0:b0:309:bc3:3a71 with SMTP id
 38308e7fff4ca-31d366da678mr11488041fa.31.1745933575953; Tue, 29 Apr 2025
 06:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429114949.41124-1-ryncsn@gmail.com> <20250429114949.41124-5-ryncsn@gmail.com>
 <116d8920-6154-4ed1-946a-887cfe084fe9@redhat.com>
In-Reply-To: <116d8920-6154-4ed1-946a-887cfe084fe9@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 29 Apr 2025 21:32:38 +0800
X-Gm-Features: ATxdqUHoUuhpLeU5Fj7rU7y8Azm60EAgkDBT80F_4JUCnHpkDv2oQWGVrihzMIs
Message-ID: <CAMgjq7BxNX5HLCZ9+j2ivVwhtUE+rSYiHgOo_GPhaXJ12iNW6w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] filemap: do not use folio_contains for swap cache folios
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:22=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 29.04.25 13:49, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Currently, none of the folio_contains callers should encounter swap
> > cache folios.
> >
> > For fs/ callers, swap cache folios are never part of their workflow.
> >
> > For filemap and truncate, folio_contains is only used for sanity
> > checks to verify the folio index matches the expected
> > lookup / invalidation target.
> >
> > The swap cache does not utilize filemap or truncate helpers in ways
> > that would trigger these checks, as it mostly implements its own
> > cache management.
> >
> > Shmem won't trigger these sanity checks either unless thing went
> > wrong, as it would directly trigger a BUG because swap cache index are
> > unrelated and almost never matches shmem index. Shmem have to handle
> > mixed values of folios, shadows, and swap entries, so it has its own
> > way of handling the mapping.
> >
> > While some filemap helpers works for swap cache space, the swap cache
> > is different from the page cache in many ways. So this particular helpe=
r
> > will unlikely to work in a helpful way for swap cache folios.
> >
> > So make it explicit here that folio_contains should not be used for
> > swap cache folios. This helps to avoid misuse, make swap cache less
> > exposed and remove the folio_index usage here.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   include/linux/pagemap.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index af25fb640463..1dc3416a9c0d 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -935,14 +935,14 @@ static inline struct page *folio_file_page(struct=
 folio *folio, pgoff_t index)
> >    * @folio: The folio.
> >    * @index: The page index within the file.
> >    *
> > - * Context: The caller should have the page locked in order to prevent
> > - * (eg) shmem from moving the page between the page cache and swap cac=
he
> > - * and changing its index in the middle of the operation.
> > + * Context: The caller should have the folio locked and ensure
> > + * (e.g.) shmem did not move this folio to swap cache.
>
> The "(e.g.)" looks weird. Maybe "ensure that e.g., shmem ..."
>
> "to the"
>
> >    * Return: true or false.
> >    */
> >   static inline bool folio_contains(struct folio *folio, pgoff_t index)
> >   {
> > -     return index - folio_index(folio) < folio_nr_pages(folio);
> > +     VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
>
> Likely you want VM_WARN_ON_ONCE_FOLIO() here.

All its caller will trigger a bug if it encounters a swap cache, so I
kept that behaviour consistent. Let's keep that unchanged for now.

>
> > +     return index - folio->index < folio_nr_pages(folio);
> >   }
> >
> >   unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *s=
tart,
>
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

>
> --
> Cheers,
>
> David / dhildenb
>
>
