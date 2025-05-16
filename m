Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A032C9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747362932; cv=none; b=bPizHRmIW38Aew0GRkDqOdsSmt10yKPPwn44LjF0+lEb1sH5JjkQ77gFAVC0ww31SGBK/k99nGJt/rvOoOa3NFYaxci24oY0JU5nM2fS+6tG7S/zg0of3B6IP4ZNR0DXcN1c/s3aXBFWoUMUWwZgzqdOGyVSp4zEhITAdvF8+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747362932; c=relaxed/simple;
	bh=W5zn7yhRCgSTypR1MNOp6RkPEKp6BkOX/Av7lpF8cYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvPr99Dy+0foBPVtCX3M5vqmIBdH2EJXb6pV6bloIMulvnJmcfxJ/38tux8Mr28YVgdwE/mPxWOnNix/eyyONZI81YtiJu56JWAT9zqvCf6MzxmaP3rD4+4Dk6wsOSo7lcPMPp4nM+eAavOM3LNerhueqI1cZ29s3npR2U1MBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSsGqaTw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSsGqaTw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2109074e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747362929; x=1747967729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97eSBRvWwlOrFi0Xp4lcOze8Tl5VcCyOGmtZ2nesnIs=;
        b=MSsGqaTwS+9tfTPHmcs+6nnVrRDVUJ60/Iek3YDEP0jAK30c/jF/ULnyNhfYsRDsTj
         7bl6ba/gRCYTH5faHX15gt8ojTCOCW14KyQaYiJCktRbmUYgv5Bjf1W+h3N1AlmCGSWP
         j9qRnxtiNLj8pfvpW49KyVshHirM5ob76mIKQT/xdlJFpJXBPi5phfBFWe7xPUHs8Fuh
         FbF8r1fMk97qwoDNy+75u5CijZ+hRe2L9dOyBubzXIvJQLApLTPfzRnTajRJypQafLgu
         GcTSBcCKXqlPgrHVajrwD0vlDXQw4smPPBBRH/vYnt8tgmYkivlKmutxxnFAbdMJhlfg
         W6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747362929; x=1747967729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97eSBRvWwlOrFi0Xp4lcOze8Tl5VcCyOGmtZ2nesnIs=;
        b=pF6y9ySyD5Rdo9zPjzym+35WNUHdmU8yLmN9eHV0VX8U4ajp/xOvIhKqMO7FsVBWRz
         aQ9XK1MDmavhq0KkMuxpnb/yT7jrxbnIvx/iVS9FmaTtxTBpkPP7s0HEka0wPjIRT39b
         qox+X1BzEDN8VcU+6vpmzVgn65MJdCTKaIi1t+YmHGuFmo0pjaPCnwXdo5geTC/TOAOo
         duaXY1X6PwjRPfyCDYkqr6wgkcDIUBnkTgI/o/azuehVQx0K/t8vn1uIbRbo9CNRUfzT
         Cj2cNryuhlNagC+4aWM4aTdxX70CF88XnxNYVQW6Xn5O++WTPeGWdbyqv1WuFnZ6+OGf
         VF/w==
X-Forwarded-Encrypted: i=1; AJvYcCXB8cpLUgCRfwX2h3in+W6Rk+APB2trQUJhaH0VbU/kUa+c2+Pk+cL0LewnD11a/pTlzLlJ6HV4kYvF7gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJX9FI+aIW1x/+CbBgMI8EE7ykk2OIAqb+slDNwIQvPSAmz/rp
	xoGtn4E/GIiQ6J3oaVRzXgUSkR2r8XoTl7H4RpsOQ9TLPpIDuqq2WIJLVtYk0XL5mb3+rufb0bf
	Rfs0EiT16zIWE1VN2ZbwxleRcDW28cOk=
X-Gm-Gg: ASbGncspU/G3dXa72Z6gI/B5EmhxeXugldb43eYTM0WBsOhlaKqPWDTQzrOUdzrpj31
	E4sJDw52eceYbECTjOAcS9bC+XK8lffGc7d3cKUPpFa9AO1HeWVr87MPdLas57RVCcE3BULk/KW
	b2J/NUyqYMaItXTGlfTgZ+NKkOlXimH0OO
X-Google-Smtp-Source: AGHT+IGEohsDPf3NZ6sD9c5xqEKRveBataHl0LHi8PdktB/2oe88QR4GcLZC6tkcSuWsKxJIW+5aytWv8kp0WAQB8Lg=
X-Received: by 2002:a05:6512:641a:b0:54d:67e3:91cd with SMTP id
 2adb3069b0e04-550e7242ca6mr420414e87.36.1747362928688; Thu, 15 May 2025
 19:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-1-ryncsn@gmail.com> <20250514201729.48420-25-ryncsn@gmail.com>
 <flxeg6dxdanixfcfw2sc4qtgisngt22d6ltwkql5hkvx4ixzwe@oyoo4vefepie>
In-Reply-To: <flxeg6dxdanixfcfw2sc4qtgisngt22d6ltwkql5hkvx4ixzwe@oyoo4vefepie>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 16 May 2025 10:35:11 +0800
X-Gm-Features: AX0GCFumbLnuslXGYK9kx0T1AKHDSlFx0F-UW-ydDI3uOdbN3xW8b2P59RwRcXk
Message-ID: <CAMgjq7DJvHZ-0VztN5axwy4X3z-dKRtp9xHSP4RrE=nQ4G_siA@mail.gmail.com>
Subject: Re: [PATCH 24/28] mm, swap: implement helpers for reserving data in
 swap table
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Kalesh Singh <kaleshsingh@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 5:42=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-05-15 04:17:24 +0800, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > To prepare for using swap table as the unified swap layer, introduce
> > macro and helpers for storing multiple kind of data in an swap table
> > entry.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/swap_table.h | 130 ++++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 119 insertions(+), 11 deletions(-)
> >
> > diff --git a/mm/swap_table.h b/mm/swap_table.h
> > index 69a074339444..9356004d211a 100644
> > --- a/mm/swap_table.h
> > +++ b/mm/swap_table.h
> > @@ -5,9 +5,41 @@
> >  #include "swap.h"
> >
> >  /*
> > - * Swap table entry could be a pointer (folio), a XA_VALUE (shadow), o=
r NULL.
> > + * Swap table entry type and bit layouts:
> > + *
> > + * NULL:     | ------------    0   -------------|
> > + * Shadow:   | SWAP_COUNT |---- SHADOW_VAL ---|1|
> > + * Folio:    | SWAP_COUNT |------ PFN -------|10|
> > + * Pointer:  |----------- Pointer ----------|100|
> > + *
> > + * Usage:
> > + * - NULL: Swap Entry is unused.
> > + *
> > + * - Shadow: Swap Entry is used and not cached (swapped out).
> > + *   It's reusing XA_VALUE format to be compatible with workingset
> > + *   shadows. SHADOW_VAL part could be all 0.
> > + *
> > + * - Folio: Swap Entry is in cache.
> > + *
> > + * - Pointer: Unused yet. Because only the last three bit of a pointer
> > + *   is usable so now `100` is reserved for potential pointer use.
> >   */
> >
> > +#define ENTRY_COUNT_BITS     BITS_PER_BYTE
> > +#define ENTRY_SHADOW_MARK    0b1UL
> > +#define ENTRY_PFN_MARK               0b10UL
> > +#define ENTRY_PFN_LOW_MASK   0b11UL
> > +#define ENTRY_PFN_SHIFT              2
> > +#define ENTRY_PFN_MASK               ((~0UL) >> ENTRY_COUNT_BITS)
> > +#define ENTRY_COUNT_MASK     (~((~0UL) >> ENTRY_COUNT_BITS))
> > +#define ENTRY_COUNT_SHIFT    (BITS_PER_LONG - BITS_PER_BYTE)
> > +#define ENTRY_COUNT_MAX              ((1 << ENTRY_COUNT_BITS) - 2)
> > +#define ENTRY_COUNT_BAD              ((1 << ENTRY_COUNT_BITS) - 1) /* =
ENTRY_BAD */
> > +#define ENTRY_BAD            (~0UL)
> > +
> > +/* For shadow offset calculation */
> > +#define SWAP_COUNT_SHIFT     ENTRY_COUNT_BITS
> > +
> >  /*
> >   * Helpers for casting one type of info into a swap table entry.
> >   */
> > @@ -19,17 +51,27 @@ static inline swp_te_t null_swp_te(void)
> >
> >  static inline swp_te_t folio_swp_te(struct folio *folio)
> >  {
> > -     BUILD_BUG_ON(sizeof(swp_te_t) !=3D sizeof(void *));
> > -     swp_te_t swp_te =3D { .counter =3D (unsigned long)folio };
>
> > +     BUILD_BUG_ON((MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT) >
> > +                  (BITS_PER_LONG - ENTRY_PFN_SHIFT - ENTRY_COUNT_BITS)=
);
>
> MAX_POSSIBLE_PHYSMEM_BITS does not seem to be available on all
> arches/configs.
>
> E.g. zsmalloc seems to set it to MAX_PHYSMEM_BITS when this is the case
> but I don't know if that applies here.
>

Thanks, I think I'll just copy the snip from zsmalloc, it's basically
doing the same check to ensure there are still enough bits left after
embedding a PFN in a LONG.
