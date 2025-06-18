Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AFD27FD52
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236450; cv=none; b=XbJgGeRVIhq0hSxVVfjrvPUur36qUbbbyHRahwUjwSLPaTDEpddr7ZT+2j45o+3nOmplMain9sR//835AEecCy+DU1SvedxDJHkRzG/uswLGnx8q9hOfJ0hyVjXytwn1HAelz6HXoHeGzQNYGn5cmBcxOBPQx3ZPq6Pk3kzQ7qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236450; c=relaxed/simple;
	bh=hwlIcV1G0BgzIRhAJWL5b/oyfeQDCqbOxBwMqT1HW08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICvAYQBG5XES6hHya+lEqNA77vkFCtDuWws6SJX4NxnkNUAPKxcMQ3NrCLPWbH19hLLO4CQsbUeuSvYfagPRMCAvH7jEHE8H04na2qtsl7AduH3q/+pLSiDVCrUFiNjwlnVD1dQFnjedqIIjeBpOV/hiEmEUqLaGzBGdYJ7iZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZ9t8wbC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZ9t8wbC"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so9806351fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750236447; x=1750841247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2CToX4WSVqQjXei9WfJ9aCUL+KlH88ek3mxdl421Fo=;
        b=HZ9t8wbC7u5RYq3q9LgIvESfhcJmN99tr4kVca7MFNcZjL+rSEXh93rRA3jPqzA6fc
         CmxNngfcx68XTrkrM2jqLH9iu0MV3eX+hq2NzK5RZP8dxrtq+Bu7qJMyAD9ySbDJMHEw
         oWPoEUE5yZ2R5HTA/lvm5DVJWHoiRAv4jypovJJb6SI8qgtSvqJE1hEipIg9BhrewLY/
         L6kJt3d36VabgJWOUuxghBkB5yXk6AmENQ/u58RISjDz0PR06sXJTlFPEPg2/WqihBUj
         0gHbOUfRpBSAsRIpfSma2lhLZ4PW+fBZUyR6bWBLge8LbWrEJsvOK49demckWaMZnehv
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236447; x=1750841247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2CToX4WSVqQjXei9WfJ9aCUL+KlH88ek3mxdl421Fo=;
        b=oP5lYZR4Z/cZOsEXKC+pfSwYFVLvVS+eS0DK7U2TkycF2xTMf4WitFH/Foe/pO1BA/
         bnp9jMroLdGlQkwLvTRclV9clzzoyD7BBbkg+nhjAqJ1SDHYT0MGkGBlzG/FX4vZ8C1y
         kSU9fohfhbSVrXQnES0sw014lBZQfriGlhWupaMBc1EhAqrIgdMJ9tOS/vz6/+7nLspE
         46ZG6ei2T978AkRdlz6oX5/+dOtJEEtIc2nqGVZ7NQb26XtfL3XLDMVETHTSgD3FMmaQ
         /WAGGmDLMeJLfX5CCitI2oUbU2inTku1u2GLP15D/jPxZz16cVI1cOoURhCu5gu1p3Q7
         PKug==
X-Forwarded-Encrypted: i=1; AJvYcCUdTkehX0wSyaD5UrZd2oWlVEOwlNBh69was947hamGOL5RJy3xqcB24g5Zuo62K6pNWXXJ+VdWHIuKUDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbAQFQVD3ua8m9Jf3xfBjAEsXGoIyzWBDHnn8WDMAUQri59Ayz
	ijMvuYDCQZ58P6R4eE9iWisc3rvYGkQE4NXSkY04RicKxKzwz1Ui6tMPld+3TuHYczNmVPgt2nM
	Td1Ahk5MlCek+2b3V2g/edCmBaLgu518=
X-Gm-Gg: ASbGnct0nO7POErcu1ox59XIpkLUXkcHJUIEtJfe9vDBg4X3sYuRV03eVKgoAQrEHY/
	N7H9NmOOOscD2AXFQTmZjW8eOJuDNBMB3Rt10K24NZWVx17jLaTeP6adUFm7aQBNc5b5HvuRkh7
	2sH24EPqEPLYV5yHjVlyfAbQYx07kxGk2D7GcT7tJJPEHTuT4gZck3bA==
X-Google-Smtp-Source: AGHT+IHRu/2YzycOVrm/vD6RoVhDYIDMzJUv1Ihuz62QnJQicK9Z225AdgjQsi8A95sMDrFtCCH9wXOk69Ovet6yf18=
X-Received: by 2002:a05:651c:b0d:b0:32a:6aa0:2173 with SMTP id
 38308e7fff4ca-32b4a5b9752mr50178591fa.20.1750236446584; Wed, 18 Jun 2025
 01:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617183503.10527-1-ryncsn@gmail.com> <20250617183503.10527-4-ryncsn@gmail.com>
 <7e680582-ac35-3d2d-8945-c26410ff4f9b@huaweicloud.com>
In-Reply-To: <7e680582-ac35-3d2d-8945-c26410ff4f9b@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 18 Jun 2025 16:46:49 +0800
X-Gm-Features: AX0GCFvCgqTLJPeg3CwSZDs6ia4gdsgJJ5hjNvDEKOi15hov4HWh89v8lk8bRXM
Message-ID: <CAMgjq7DuFfikzzDeQPmBTnqUxprbGFfjL4tt5_ZJeZS_GP4ggg@mail.gmail.com>
Subject: Re: [PATCH 3/4] mm/shmem, swap: improve mthp swapin process
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:26=E2=80=AFPM Kemeng Shi <shikemeng@huaweicloud.c=
om> wrote:
> on 6/18/2025 2:35 AM, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Tidy up the mTHP swapin workflow. There should be no feature change, bu=
t
> > consolidates the mTHP related check to one place so they are now all
> > wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
> > compiler if not needed.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/shmem.c | 175 ++++++++++++++++++++++++-----------------------------
> >  1 file changed, 78 insertions(+), 97 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
>
> ...
>
> Hello, here is another potensial issue if shmem swapin can race with foli=
o
> split.
>
> >  alloced:
> > +     /*
> > +      * We need to split an existing large entry if swapin brought in =
a
> > +      * smaller folio due to various of reasons.
> > +      *
> > +      * And worth noting there is a special case: if there is a smalle=
r
> > +      * cached folio that covers @swap, but not @index (it only covers
> > +      * first few sub entries of the large entry, but @index points to
> > +      * later parts), the swap cache lookup will still see this folio,
> > +      * And we need to split the large entry here. Later checks will f=
ail,
> > +      * as it can't satisfy the swap requirement, and we will retry
> > +      * the swapin from beginning.
> > +      */
> > +     swap_order =3D folio_order(folio);
> > +     if (order > swap_order) {
> > +             error =3D shmem_split_swap_entry(inode, index, swap, gfp)=
;
> > +             if (error)
> > +                     goto failed_nolock;
> > +     }
> > +
> > +     index =3D round_down(index, 1 << swap_order);
> > +     swap.val =3D round_down(swap.val, 1 << swap_order);
> > +
> /* suppose folio is splited */
> >       /* We have to do this with folio locked to prevent races */
> >       folio_lock(folio);
> >       if ((!skip_swapcache && !folio_test_swapcache(folio)) ||
> >           folio->swap.val !=3D swap.val) {
> >               error =3D -EEXIST;
> > -             goto unlock;
> > +             goto failed_unlock;
> >       }
> >       if (!folio_test_uptodate(folio)) {
> >               error =3D -EIO;
> > @@ -2407,8 +2386,7 @@ static int shmem_swapin_folio(struct inode *inode=
, pgoff_t index,
> >                       goto failed;
> >       }
> >
> > -     error =3D shmem_add_to_page_cache(folio, mapping,
> > -                                     round_down(index, nr_pages),
> > +     error =3D shmem_add_to_page_cache(folio, mapping, index,
> >                                       swp_to_radix_entry(swap), gfp);
>
> The actual order swapin is less than swap_order and the swap-in folio
> may not cover index from caller.
>
> So we should move the index and swap.val calculation after folio is
> locked.

Hi, Thanks very much for checking the code carefully!

If I'm not wrong here, holding a reference is enough to stabilize the folio
order.
See split_huge_page_to_list_to_order, "Any unexpected folio references
...  -EAGAIN" and can_split_folio.

We can add a `swap_order =3D=3D folio_order(folio)` check after folio lock
though, as a (sanity) check, just in case.
