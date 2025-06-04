Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F414C7C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047216; cv=none; b=MFmcuBS/RQj0nYpx5M8hT8SgTdQdPhk9HTK6en+XlXuyOrSSxEZI3OeLXYwvRgWwGIDc4VSsS/+lqDZ4Gq6v5j45vyTX/OIA92wvv4W4kQurr3uJmXQMXeokZy+bdsh2htTnwnXXk6S0UYvr3/pQX72+KywsODjxbZK83EhO0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047216; c=relaxed/simple;
	bh=NM0DCuaQUITzAzptwZ0C59YK5/JvpXmYWeeJVeRCoso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTyccWOxdAyYrzSHzC2KLG2gOH8dKzpYSSMPwhA460I7WAaao6LEY4CA67AadP9+cIyGKEeyesSio0fAvBWz1HAdKrIxEYzA9q0oEqH0/HzNQgCf195v1eKESb1OHt/pEORe3yXqLCURrhzkKuUJcV3psTAZlONK8rjjD8n/gRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQUFsPCz; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQUFsPCz"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo449911cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749047213; x=1749652013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAp/1HGbBLv6qtx/n8Ypumuz56YxupYXz6XcmTVLY0A=;
        b=IQUFsPCzTrTdqTmcXCpnzd4Kdq789uDcB4lXavBsqjXve+k6fsNMrUX5Jihlg4dxFC
         g+Reut3rJvfQSA0P0lBtXKAmpOr1VFjspgdmZTyOh76pgS3Ng9QSLXq71gSbjp1uA0jB
         z/PXk/oSsD1B2OarPXQsH9KPpxV61io/Re0B4oFB7vp0WoEP+OpU0AjUAyKe0KXa7Tzc
         pH2EVriBhIaQ4A5kakATq2BnlJvCIYdfxw+NJUhbqyV6kCQxRd9xyAj6/hDL4ei9pCd2
         ovM0ULAEXUyDGqI9l2M+nXH01WF04iFmYhi7WD6JLFj1ucKejD/81QurLAbeQd2jfihH
         XvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749047213; x=1749652013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAp/1HGbBLv6qtx/n8Ypumuz56YxupYXz6XcmTVLY0A=;
        b=BEqg5e0tJXDpZ/wcvZMEHaNoul9Lsl4fbt52RPBzDOZFCtfJqPz2VDlx8eEqVVt/Uw
         hXaJpeuZwNiiXJJFTfmFv172+da0/apBoYqWb+CnEDuaXD22VmNWQmzJzptSD0xoZhFt
         BDGU2e9pIU2pCladpGHeVZ/k47K4Sg5Xtdp4pqrusk2HcU08FDHrZcYht6p4QzyNMN7H
         ANBi0pL2K7ROXRww7azts8KWwdcFYnTnOIS8K7VH2vz6srfxaZjyOVZ1lVtCdeVP3XAn
         Q1u8NOogfmm4kmil3cijQEjo0hU4Wq9r53fiUUM3tEA84Nd3Bl0KSR6n37lplcic+WDX
         wnsg==
X-Forwarded-Encrypted: i=1; AJvYcCXWX2gR1q23Lt/2+r13ZpyU+sXQqTFjnqLYhPlJvie6rZf8It8Jiz/hQ/zoNdoIaftb3aNDnmPjdQBjjlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA5V2od3eCDIxa777a5S8kIu/7v18RgqCutfQRiagZJHBtDREX
	FprVHilN3iUOxLMvZuaiT9MbKOKVx3iCW2uFyAUBFVDuBFJhUM/FwLeoouFGeREyGGDo0WeKmIG
	Z+3eE8Fv/2ZO2tv3q7E2DBYS1Gp9HsYNk/QQA06V5
X-Gm-Gg: ASbGncs37RSUVkf4qxXTkw+nyRhp3yCK4BaqB1+1Qv4tSmPKgMD87sT/C4lO1PNFgQr
	zOSg+JfoaPlDP4SYNoSvLCKpoAukGTfsBe+ytwCWIhRJIi4VARMJS9AH2XvMzic2+1Xre5AvfHC
	fUhohe9cu4gAd14+pNhEG0fpNBA7/ym0ABvL8pRZ1djwfh4Jktjby87vmvq19ZwLHwR/x15QoU
X-Google-Smtp-Source: AGHT+IFzdOA+3P2PyHFB0pEDLQ0XnMtUkTcxsnX3H6Bkc6gXrGQls44k6HcVZWeCRhjdatLqR5+P87mlE7vGBQH6TYo=
X-Received: by 2002:ac8:650e:0:b0:4a5:a8b7:6c12 with SMTP id
 d75a77b69052e-4a5a8b770d4mr1977241cf.26.1749047212170; Wed, 04 Jun 2025
 07:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604140544.688711-1-david@redhat.com> <202d338d-30f6-4f3b-bddc-b0818a940732@suse.cz>
In-Reply-To: <202d338d-30f6-4f3b-bddc-b0818a940732@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 4 Jun 2025 07:26:40 -0700
X-Gm-Features: AX0GCFvHLF0qLYBnBbkp2Yp92Lpgzy-k84kOFcNhayBjADpHAViy2MHD967dpb8
Message-ID: <CAJuCfpHyj+9dSfiqRg6dSUZax3wk3kqK1iR+kMT+sac4n4qBtQ@mail.gmail.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:22=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 6/4/25 16:05, David Hildenbrand wrote:
> > Especially once we hit one of the assertions in
> > sanity_check_pinned_pages(), observing follow-up assertions failing
> > in other code can give good clues about what went wrong, so use
> > VM_WARN_ON_ONCE instead.
> >
> > While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> > well. Add one comment for the pfn_valid() check.
> >
> > We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> >
> > Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> > something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> > VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> > happen", but more reasonable to check for during early testing.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
>
> Makes sense, BUG_ONs bad.
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> > ---
> >
> > Wanted to do this for a long time, but my todo list keeps growing ...
> >
> > Based on mm/mm-unstable
> >
> > ---
> >  include/linux/mmdebug.h | 12 ++++++++++++
> >  mm/gup.c                | 41 +++++++++++++++++++----------------------
> >  2 files changed, 31 insertions(+), 22 deletions(-)
> >
> > diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> > index a0a3894900ed4..14a45979cccc9 100644
> > --- a/include/linux/mmdebug.h
> > +++ b/include/linux/mmdebug.h
> > @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *v=
mi);
> >       }                                                               \
> >       unlikely(__ret_warn_once);                                      \
> >  })
> > +#define VM_WARN_ON_ONCE_VMA(cond, vma)               ({               =
       \
> > +     static bool __section(".data..once") __warned;                  \
> > +     int __ret_warn_once =3D !!(cond);                                =
 \
> > +                                                                     \
> > +     if (unlikely(__ret_warn_once && !__warned)) {                   \
> > +             dump_vma(vma);                                          \
> > +             __warned =3D true;                                       =
 \
> > +             WARN_ON(1);                                             \
> > +     }                                                               \
> > +     unlikely(__ret_warn_once);                                      \
> > +})
> >  #define VM_WARN_ON_VMG(cond, vmg)            ({                      \
> >       int __ret_warn =3D !!(cond);                                     =
 \
> >                                                                       \
> > @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *=
vmi);
> >  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
> >  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
> >  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> > +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
> >  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
> >  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
> >  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> > diff --git a/mm/gup.c b/mm/gup.c
> > index e065a49842a87..3c3931fcdd820 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct=
 page **pages,
> >                   !folio_test_anon(folio))
> >                       continue;
> >               if (!folio_test_large(folio) || folio_test_hugetlb(folio)=
)
> > -                     VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), =
page);
> > +                     VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->p=
age), page);
> >               else
> >                       /* Either a PTE-mapped or a PMD-mapped THP. */
> > -                     VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &=
&
> > -                                    !PageAnonExclusive(page), page);
> > +                     VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->p=
age) &&
> > +                                          !PageAnonExclusive(page), pa=
ge);
> >       }
> >  }
> >
> > @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_=
struct *vma,
> >       if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
> >               return ERR_PTR(-EMLINK);
> >
> > -     VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> > -                     !PageAnonExclusive(page), page);
> > +     VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> > +                          !PageAnonExclusive(page), page);
> >
> >       ret =3D try_grab_folio(page_folio(page), 1, flags);
> >       if (ret)
> > @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_=
struct *vma,
> >               goto out;
> >       }
> >
> > -     VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> > -                    !PageAnonExclusive(page), page);
> > +     VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> > +                          !PageAnonExclusive(page), page);
> >
> >       /* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is s=
et. */
> >       ret =3D try_grab_folio(folio, 1, flags);
> > @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vm=
a,
> >       if (unshare) {
> >               fault_flags |=3D FAULT_FLAG_UNSHARE;
> >               /* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatib=
le */
> > -             VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> > +             VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
> >       }
> >
> >       ret =3D handle_mm_fault(vma, address, fault_flags, NULL);
> > @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_loc=
ked(struct mm_struct *mm,
> >               }
> >
> >               /* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return err=
ors */
> > -             if (!*locked) {
> > -                     BUG_ON(ret < 0);
> > -                     BUG_ON(ret >=3D nr_pages);
> > -             }
> > +             VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >=3D nr_pages=
));
> >
> >               if (ret > 0) {
> >                       nr_pages -=3D ret;
> > @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_lock=
ed(struct mm_struct *mm,
> >
> >               ret =3D mmap_read_lock_killable(mm);
> >               if (ret) {
> > -                     BUG_ON(ret > 0);
> >                       if (!pages_done)
> >                               pages_done =3D ret;
> >                       break;
> > @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_lo=
cked(struct mm_struct *mm,
> >                                      pages, locked);
> >               if (!*locked) {
> >                       /* Continue to retry until we succeeded */
> > -                     BUG_ON(ret !=3D 0);
> > +                     VM_WARN_ON_ONCE(ret !=3D 0);
> >                       goto retry;
> >               }
> >               if (ret !=3D 1) {
> > -                     BUG_ON(ret > 1);
> > +                     VM_WARN_ON_ONCE(ret > 1);
> >                       if (!pages_done)
> >                               pages_done =3D ret;
> >                       break;
> > @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_str=
uct *vma,
> >       int gup_flags;
> >       long ret;
> >
> > -     VM_BUG_ON(!PAGE_ALIGNED(start));
> > -     VM_BUG_ON(!PAGE_ALIGNED(end));
> > -     VM_BUG_ON_VMA(start < vma->vm_start, vma);
> > -     VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> > +     VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> > +     VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> > +     VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> > +     VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
> >       mmap_assert_locked(mm);
> >
> >       /*
> > @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, uns=
igned long start,
> >       int gup_flags;
> >       long ret;
> >
> > -     VM_BUG_ON(!PAGE_ALIGNED(start));
> > -     VM_BUG_ON(!PAGE_ALIGNED(end));
> > +     VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> > +     VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> >       mmap_assert_locked(mm);
> >
> >       /*
> > @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *p=
mdp, unsigned long addr,
> >               } else if (pte_special(pte))
> >                       goto pte_unmap;
> >
> > -             VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> > +             /* If it's not marked as special it must have a valid mem=
map. */
> > +             VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
> >               page =3D pte_page(pte);
> >
> >               folio =3D try_grab_folio_fast(page, 1, flags);
> >
> > base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
>
