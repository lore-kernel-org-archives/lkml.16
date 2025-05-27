Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAACC120
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338281; cv=none; b=qzjpcBWgzwOFvxMD8V6ZHZEQxdW3tgkxBEBiKzpKzALEdV9WXq+V43IF1/Y3x32UsHIvFaiBLEIIBzEf+eDAId7yK8YGwrVobqo69T4ydMIgLnN7bYDzXy3KfVXGca4+jk9H3jQ/kFse3793IdPNgCO7L3qyLgve8EvjnbN8pkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338281; c=relaxed/simple;
	bh=mpK1CrRH8Iaqa/Ff0mAx6cLKBU+OYet/+uo3FaCNQoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8/Sk/ZrzLX4t+WiK6200sLLA32PMz/vnRTKPTMSPBdTJ9K8dxV08jg8/Y8rLNEER4JjRc0WKp/NLfBrLOxYQDS0KUy28QUq6QXLVv5ij9owZ9+FzgMJy1QqDVsmX/W9asaw1KHqKxPrbjmMYCg6quqUCO9F/EQWY6sWtY25O94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMM3jiit; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMM3jiit"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52dbcd398f9so2036294e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748338277; x=1748943077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97+T8oC1dJwTDjXMcPA6pmXDbFR9V/YrjWwp0CCMtPs=;
        b=jMM3jiitHRbg8Ly6pMy1oYEO28FvhJ7hCfK/siEhiN8CDfYr6IrsHHkNbJx4bCJyKw
         31ryi4YVgcDxKZQbbxV9TCGi0nwg8hITZf6H5ZZiSSa2q9nTaQERDmgsfPz8ffT09oJO
         Hy+lL5PGfj++gDdJ/PoNnweJ4DeJTG8sxRFkmzddc9qbLUIjZAhLXIuiAn+CZvRcJxd4
         7N5WS6OkVnq/WkgxaG9DM2fGR4lOvukioPt2pX7RAFedWPsgraJ3ncZ9OJtr06Bp/Its
         DB7t/NXzauiy46fb16JbN5Gnd+lq/YPaY1LLWV/MVCIrfvZaAQ5C3/9savT75O837tPI
         djxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748338277; x=1748943077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97+T8oC1dJwTDjXMcPA6pmXDbFR9V/YrjWwp0CCMtPs=;
        b=Tgg1HvN4gfborp+iR+loSDoyJGPzEyD9UMR9CaeWbet8+rc+Q8jOeFJfJ6nwV8Vj52
         9ua9y9ziipFpJvVR0KF/a8Crv90AGOopVl7z6VwZcB0rq+BTxJfEVEGzra7HLgbKB3Wl
         vReVM5YdEj2lpNEMpRs8EfgQ4+BgExfBBxBHcOKfL1G98ByaSxbp79vDbSyBevhjWTKz
         /11sgs/niOcRgXyly1+LovAlIgSpWSCxSO57X185nenGhLzut7vDZ8LhZkyQPPXN9BG5
         zcc+26Ii1Y1yr0R7t8qhNsHKelKEITQXSP/m+25X/tB59Mn4HDjdNBmp5LicrwdkhbeX
         Lpsw==
X-Forwarded-Encrypted: i=1; AJvYcCXwpOAiUfITtVPeZaj9tRnR4GXatDvszmIQE822mZSo0K792opgGTrpyxuJpPiXAi/NovozyGznBcllJk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOcwimjXGdJWpgUujzuOqr+cQqCk5/Qe01jUzia01sDigq807
	yLNBkPqI33YbKCTIWGh7rHXKBb1nXwhoNBGNeJ90LdAnEkdDJOfatUIlsyFulOvXXtChKlp9mIt
	3zPL4ysEYdWTYC/15dQBwJfzf9S3qJso=
X-Gm-Gg: ASbGnct6JHaRcamkHwCMUQKbA1+b8s1glB+lXn0fAkLNxK92jGaj4yQ73DfcLijpi8c
	s0shR079/0ATGz7GR/ki+RSJLkd6UXExyYQP+HGvwAhHqYKHtzaZn3oMuTbHu7zoSAr1wHLABZS
	I8v3WaA473zcwdMxR+KdKlNhL4EWgqvfWR9Q==
X-Google-Smtp-Source: AGHT+IEC6n+Jh7ll5RCcHL45yLJ31qkJq1Ed59X8Pjk9iz0BDBVctTKK8vDXycYmqs2PwBOWNrsQClc91os9m+niJt0=
X-Received: by 2002:a05:6122:2223:b0:526:23d2:6ecd with SMTP id
 71dfb90a1353d-52f2c025fe4mr8566706e0c.6.1748338277002; Tue, 27 May 2025
 02:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGsJ_4zOhNBe9b1m1LYaJbFur3TdLma+2EXbc=BhAToDeLfvAg@mail.gmail.com>
 <20250527083722.27309-1-21cnbao@gmail.com> <bcc5cbb6-4ce6-4c01-8b5b-f6e01b306b2d@redhat.com>
In-Reply-To: <bcc5cbb6-4ce6-4c01-8b5b-f6e01b306b2d@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 27 May 2025 17:31:05 +0800
X-Gm-Features: AX0GCFu2pfGa-TJu0at63iJrzVFoQlxp_JxZP5wS7HpNUnTLtTCvgDB2o3KhtmA
Message-ID: <CAGsJ_4xQ4-bszHNi=0QDCqsap+0WdfU9_u8ftaMuKCuNcn8RYA@mail.gmail.com>
Subject: Re: [BUG]userfaultfd_move fails to move a folio when swap-in occurs
 concurrently with swap-out
To: David Hildenbrand <david@redhat.com>
Cc: aarcange@redhat.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lokeshgidra@google.com, 
	peterx@redhat.com, ryncsn@gmail.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 5:00=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 27.05.25 10:37, Barry Song wrote:
> > On Tue, May 27, 2025 at 4:17=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> >>
> >> On Tue, May 27, 2025 at 12:39=E2=80=AFAM David Hildenbrand <david@redh=
at.com> wrote:
> >>>
> >>> On 23.05.25 01:23, Barry Song wrote:
> >>>> Hi All,
> >>>
> >>> Hi!
> >>>
> >>>>
> >>>> I'm encountering another bug that can be easily reproduced using the=
 small
> >>>> program below[1], which performs swap-out and swap-in in parallel.
> >>>>
> >>>> The issue occurs when a folio is being swapped out while it is acces=
sed
> >>>> concurrently. In this case, do_swap_page() handles the access. Howev=
er,
> >>>> because the folio is under writeback, do_swap_page() completely remo=
ves
> >>>> its exclusive attribute.
> >>>>
> >>>> do_swap_page:
> >>>>                  } else if (exclusive && folio_test_writeback(folio)=
 &&
> >>>>                             data_race(si->flags & SWP_STABLE_WRITES)=
) {
> >>>>                           ...
> >>>>                           exclusive =3D false;
> >>>>
> >>>> As a result, userfaultfd_move() will return -EBUSY, even though the
> >>>> folio is not shared and is in fact exclusively owned.
> >>>>
> >>>>                           folio =3D vm_normal_folio(src_vma, src_add=
r,
> >>>> orig_src_pte);
> >>>>                           if (!folio || !PageAnonExclusive(&folio->p=
age)) {
> >>>>                                   spin_unlock(src_ptl);
> >>>> +                               pr_err("%s %d folio:%lx exclusive:%d
> >>>> swapcache:%d\n",
> >>>> +                                       __func__, __LINE__, folio,
> >>>> PageAnonExclusive(&folio->page),
> >>>> +                                       folio_test_swapcache(folio))=
;
> >>>>                                   err =3D -EBUSY;
> >>>>                                   goto out;
> >>>>                           }
> >>>>
> >>>> I understand that shared folios should not be moved. However, in thi=
s
> >>>> case, the folio is not shared, yet its exclusive flag is not set.
> >>>>
> >>>> Therefore, I believe PageAnonExclusive is not a reliable indicator o=
f
> >>>> whether a folio is truly exclusive to a process.
> >>>
> >>> It is. The flag *not* being set is not a reliable indicator whether i=
t
> >>> is really shared. ;)
> >>>
> >>> The reason why we have this PAE workaround (dropping the flag) in pla=
ce
> >>> is because the page must not be written to (SWP_STABLE_WRITES). CoW
> >>> reuse is not possible.
> >>>
> >>> uffd moving that page -- and in that same process setting it writable=
,
> >>> see move_present_pte()->pte_mkwrite() -- would be very bad.
> >>
> >> An alternative approach is to make the folio writable only when we are
> >> reasonably certain it is exclusive; otherwise, it remains read-only. I=
f the
> >> destination is later written to and the folio has become exclusive, it=
 can
> >> be reused directly. If not, a copy-on-write will occur on the destinat=
ion
> >> address, transparently to userspace. This avoids Lokesh=E2=80=99s user=
space-based
> >> strategy, which requires forcing a write to the source address.
> >
> > Conceptually, I mean something like this:
> >
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index bc473ad21202..70eaabf4f1a3 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -1047,7 +1047,8 @@ static int move_present_pte(struct mm_struct *mm,
> >       }
> >       if (folio_test_large(src_folio) ||
> >           folio_maybe_dma_pinned(src_folio) ||
> > -         !PageAnonExclusive(&src_folio->page)) {
> > +         (!PageAnonExclusive(&src_folio->page) &&
> > +         folio_mapcount(src_folio) !=3D 1)) {
> >               err =3D -EBUSY;
> >               goto out;
> >       }
> > @@ -1070,7 +1071,8 @@ static int move_present_pte(struct mm_struct *mm,
> >   #endif
> >       if (pte_dirty(orig_src_pte))
> >               orig_dst_pte =3D pte_mkdirty(orig_dst_pte);
> > -     orig_dst_pte =3D pte_mkwrite(orig_dst_pte, dst_vma);
> > +     if (PageAnonExclusive(&src_folio->page))
> > +             orig_dst_pte =3D pte_mkwrite(orig_dst_pte, dst_vma);
> >
> >       set_pte_at(mm, dst_addr, dst_pte, orig_dst_pte);
> >   out:
> > @@ -1268,7 +1270,8 @@ static int move_pages_pte(struct mm_struct *mm, p=
md_t *dst_pmd, pmd_t *src_pmd,
> >                       }
> >
> >                       folio =3D vm_normal_folio(src_vma, src_addr, orig=
_src_pte);
> > -                     if (!folio || !PageAnonExclusive(&folio->page)) {
> > +                     if (!folio || (!PageAnonExclusive(&folio->page) &=
&
> > +                                     folio_mapcount(folio) !=3D 1)) {
> >                               spin_unlock(src_ptl);
> >                               err =3D -EBUSY;
> >                               goto out;
> >
> > I'm not trying to push this approach=E2=80=94unless Lokesh clearly sees=
 that it
> > could reduce userspace noise. I'm mainly just curious how we might make
> > the fixup transparent to userspace. :-)
>
> And that reveals the exact problem: it's all *very* complicated. :)
>
> ... and dangerous when we use the mapcount without having a complete
> understanding how it all works.
>
>
> What we would have to do for a small folio is
>
> 1) Take the folio lock
>
> 2) Make sure there is only this present page table mapping:
>         folio_mapcount(folio) !=3D 1
>
>         of better
>
>         !folio_maybe_mapped_shared(folio);
>
> 3) Make sure that there are no swap references
>
>         If in the swapcache, check the actual swapcount
>
> 3) Make sure it is not a KSM folio
>
>
> THPs are way, way, way more complicated to get right that way. Likely,
> the scenario described above cannot happen with a PMD-mapped THP for now
> at least (we don't have PMD swap entries).

Yeah, this can get really complicated.

>
>
> Of course, we'd then also have to handle the case when we have a swap
> pte where the marker is not set (e.g., because of swapout after the
> described swapin where we dropped the marker).
>
>
> What could be easier is triggering a FAULT_FLAG_UNSHARE fault. It's
> arguably less optimal in case the core will decide to swapin / CoW, but
> it leaves the magic to get all this right to the core -- and mimics the
> approach Lokesh uses.
>
> But then, maybe letting userspace just do a uffdio_copy would be even
> faster (only a single TLB shootdown?).
>
>
> I am also skeptical of calling this a BUG here. It's described to behave
> exactly like that [1]:
>
>         EBUSY
>                The pages in the source virtual memory range are either
>                pinned or not exclusive to the process. The kernel might
>                only perform lightweight checks for detecting whether the
>                pages are exclusive. To make the operation more likely to
>                succeed, KSM should be disabled, fork() should be avoided
>                or MADV_DONTFORK should be configured for the source
>               virtual memory area before fork().
>
> Note the "lightweight" and "more likely to succeed".
>

Initially, my point was that an exclusive folio (single-process case)
should be movable.
Now I understand this isn=E2=80=99t a bug, but rather a compromise made due
to implementation constraints.
Perhaps the remaining value of this report is that it helped better
understand scenarios beyond fork where a move might also fail.

I truly appreciate your time and your clear analysis.

>
> [1] https://lore.kernel.org/lkml/20231206103702.3873743-3-surenb@google.c=
om/
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
