Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0422655B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332752; cv=none; b=YKpX09tof7M2NxpQYpEQM7hsD5OjxDk576cMFT+62Krr4xQt1tPvFalukwwd69vltk0+1jP48+VluuerMP0tHfxAbVdILOwXxDDw+0ydFW8UdtgepeiUmu+wXr3Z6yVLiQkhkKp6uA3ruqcIcKRb+SHZb2sCND4P6Sm8J58sQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332752; c=relaxed/simple;
	bh=Ivy7uy1YlsWpEU+Fzej/9b7JacXaVTQ4w7O1lSCplZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhdkcLb5q46oxrUvZfCTW548VIXF+5/7dLJFjC5olm9oVW9c3pcZkibQ4vNbP9OM8Voj1qoDsttZ+F17jAskaVwIWHRTS0MSLSQB8bguZ0yRtnZD+GKZodnahWYtDq3PxLIdr0Rw7Dy+Md/lm/DpOunNWLouZ/3VjOxAWirRedg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ismys2oU; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ismys2oU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47664364628so30796091cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748332749; x=1748937549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hplfmEAI0ObABv6iennLOuBJUZpDNYU6guT+clGZ648=;
        b=Ismys2oUQtPMjB8VQpiUHbTzuMZ3A43Cgpdq43O1wFOCmuulzAR4+L4lsRCwQ8Wizs
         GMYfynka9dHRPnBzTQh2vQSHko8VuK7jXz4oxRe0B9O2Rg3jAm/0KduxzkRUQcxcEU1F
         KPMjy0PtO43/VZU/dvgCmd0NAMj5lmUw49WZHfgmd+UpRQDcnSL7z5502BycDKPDDgdT
         eCaer4aYNbmjSsdRP45E/5+R7jQUmf8HiUfqHLczc2VL3GSrFvHud3m3g1MtvAqby8p2
         rJZytaOhyXhr2MhJA6DkPp1eMHdxAlmTxDJ1Hiqnie0Ld4z1HBcGQacDwf5gq1tn70YU
         jO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332749; x=1748937549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hplfmEAI0ObABv6iennLOuBJUZpDNYU6guT+clGZ648=;
        b=n3GHGpvnrGQVRW+TYG18V+MQSHuny77KFRMrQ8NRPis8nvg22szCM8G+dbfdDhSbnO
         hzR/AglFIK9jOKT8JuSAV162xdWPZIk0If6pEFs+QPox2lLo9jCJpB0GVM03meNOyzSv
         pcvlBiAX8rKhkpGxWYd4NsTySFELFpzfj11HLep+3rExR4+MRJWRILk9AEqqAZL1pm7d
         6okgLFdAVboJNtQYAybWyaRU/EaSDgRSAUUxYuv1w9CQS2XBIcJk5kiILkVi8e6AlGZX
         fmwYxslhWK5z9ZuFCM0pk4vB9ltxjwduE4mRyLoHuxa0hrC8G+P5woX0ILFWskBdnr50
         Me/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyxJx7860kxZTeXRHxzFkxXQTSi0xXcIpkU48qF8USn3p90GnI9u/1KGUpYNG2GRAN9/yig83lLviMOAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxToY+CUD9ODdxX2ig0xVLCSimxhU8CEz7qrn8CL1u9H+yO7q
	0e4iixxZD5J2suOP4COBBaGac2R+oexxOFjaU5BvYv4XHLk8ssedX7bDWgcrKq0jJ8OIsdqW5Gt
	39fPmPchTLoczDcStAEyNSNIGF97xoLGkYwNn
X-Gm-Gg: ASbGncsh+C5CEKJY652Omu7k3xTTJzBBGwMdZ/99ElVWrjJSUxPFKv86c8fFRsjkdAR
	PFEkgDOtLmadyifDbL8+fHUvo27oqDAIYoxT2D/E8A0zIdnZs9xUD4NaaFNgbv/3W954qllMg4U
	a/3xax48LSDSiXIekLBUaX7blK3V2T59wUNw==
X-Google-Smtp-Source: AGHT+IGKzpgcFn4eQbWsqR5WJWfumDy1Xr9B/icnNkP390i2UgIIEEB1AFM6EhiUFaVHt+jC+iU0a1EqCrY90kksQjg=
X-Received: by 2002:a05:6102:dd2:b0:4dd:ab6c:7654 with SMTP id
 ada2fe7eead31-4e423e601e5mr9168751137.8.1748332738801; Tue, 27 May 2025
 00:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
 <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
 <CAGsJ_4wC5_YSMLNoY5q4hUsZTpD+YPHSBtzCAdWRFH65EJA_iw@mail.gmail.com>
 <CAMgjq7AO__8TFE8ibwQswWmmf4tTGg2NBEJp0aEn32vN+Dy8uw@mail.gmail.com>
 <CAGsJ_4z1cJfOCcpZDt4EuHK7+SON1r0ptRJNv1h=cDv+eOcdSQ@mail.gmail.com>
 <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com>
 <CAGsJ_4wo6u1WSXdzj8RUUDNdk5_YCfLV_mcJtvhiv2UonXw+nw@mail.gmail.com> <CAMgjq7Bc0-eXZ8G=bN8bo2NG1ndtPmCUvxCi0bdM+HdqmOjaPQ@mail.gmail.com>
In-Reply-To: <CAMgjq7Bc0-eXZ8G=bN8bo2NG1ndtPmCUvxCi0bdM+HdqmOjaPQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 27 May 2025 19:58:47 +1200
X-Gm-Features: AX0GCFtSjRdfbo_re4Zx58GpTYN0U7VxlXrr-1Kmf-HNfqbkzeyTydFvtPqllfU
Message-ID: <CAGsJ_4ymRwXhQdzabstHhkK0OM0JEWtvR3tjeyQppm7sKZ8FUw@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Chris Li <chrisl@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, Nhat Pham <nphamcs@gmail.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 8:01=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, May 23, 2025 at 10:30=E2=80=AFAM Barry Song <21cnbao@gmail.com> w=
rote:
> >
> > On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Wed, May 21, 2025 at 7:10=E2=80=AFAM Kairui Song <ryncsn@gmail.c=
om> wrote:
> > > > >
> > > > > On Tue, May 20, 2025 at 12:41=E2=80=AFPM Barry Song <21cnbao@gmai=
l.com> wrote:
> > > > > >
> > > > > > On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gma=
il.com> wrote:
> > > > > > >
> > > > > > > On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@=
gmail.com> wrote:
> > > > > > > >
> > > > > > > > > From: Kairui Song <kasong@tencent.com>
> > > > > > > >
> > > > > > > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > > > > > > index e5a0db7f3331..5b4f01aecf35 100644
> > > > > > > > > --- a/mm/userfaultfd.c
> > > > > > > > > +++ b/mm/userfaultfd.c
> > > > > > > > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct m=
m_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
> > > > > > > > >                               goto retry;
> > > > > > > > >                       }
> > > > > > > > >               }
> > > > > > > > > +             if (!folio_swap_contains(src_folio, entry))=
 {
> > > > > > > > > +                     err =3D -EBUSY;
> > > > > > > > > +                     goto out;
> > > > > > > > > +             }
> > > > > > > >
> > > > > > > > It seems we don't need this. In move_swap_pte(), we have be=
en checking pte pages
> > > > > > > > are stable:
> > > > > > > >
> > > > > > > >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst=
_pte, orig_src_pte,
> > > > > > > >                                  dst_pmd, dst_pmdval)) {
> > > > > > > >                 double_pt_unlock(dst_ptl, src_ptl);
> > > > > > > >                 return -EAGAIN;
> > > > > > > >         }
> > > > > > >
> > > > > > > The tricky part is when swap_cache_get_folio returns the foli=
o, both
> > > > > > > folio and ptes are unlocked. So is it possible that someone e=
lse
> > > > > > > swapped in the entries, then swapped them out again using the=
 same
> > > > > > > entries?
> > > > > > >
> > > > > > > The folio will be different here but PTEs are still the same =
value to
> > > > > > > they will pass the is_pte_pages_stable check, we previously s=
aw
> > > > > > > similar races with anon fault or shmem. I think more strict c=
hecking
> > > > > > > won't hurt here.
> > > > > >
> > > > > > This doesn't seem to be the same case as the one you fixed in
> > > > > > do_swap_page(). Here, we're hitting the swap cache, whereas in =
that
> > > > > > case, there was no one hitting the swap cache, and you used
> > > > > > swap_prepare() to set up the cache to fix the issue.
> > > > > >
> > > > > > By the way, if we're not hitting the swap cache, src_folio will=
 be
> > > > > > NULL. Also, it seems that folio_swap_contains(src_folio, entry)=
 does
> > > > > > not guard against that case either.
> > > > >
> > > > > Ah, that's true, it should be moved inside the if (folio) {...} b=
lock
> > > > > above. Thanks for catching this!
> > > > >
> > > > > > But I suspect we won't have a problem, since we're not swapping=
 in =E2=80=94
> > > > > > we didn't read any stale data, right? Swap-in will only occur a=
fter we
> > > > > > move the PTEs.
> > > > >
> > > > > My concern is that a parallel swapin / swapout could result in th=
e
> > > > > folio to be a completely irrelevant or invalid folio.
> > > > >
> > > > > It's not about the dst, but in the move src side, something like:
> > > > >
> > > > > CPU1                             CPU2
> > > > > move_pages_pte
> > > > >   folio =3D swap_cache_get_folio(...)
> > > > >     | Got folio A here
> > > > >   move_swap_pte
> > > > >                                  <swapin src_pte, using folio A>
> > > > >                                  <swapout src_pte, put folio A>
> > > > >                                    | Now folio A is no longer val=
id.
> > > > >                                    | It's very unlikely but here =
SWAP
> > > > >                                    | could reuse the same entry a=
s above.
> > > >
> > > >
> > > > swap_cache_get_folio() does increment the folio's refcount, but it =
seems this
> > > > doesn't prevent do_swap_page() from freeing the swap entry after sw=
apping
> > > > in src_pte with folio A, if it's a read fault.
> > > > for write fault, folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(=
folio))
> > > > will be false:
> > > >
> > > > static inline bool should_try_to_free_swap(struct folio *folio,
> > > >                                            struct vm_area_struct *v=
ma,
> > > >                                            unsigned int fault_flags=
)
> > > > {
> > > >        ...
> > > >
> > > >         /*
> > > >          * If we want to map a page that's in the swapcache writabl=
e, we
> > > >          * have to detect via the refcount if we're really the excl=
usive
> > > >          * user. Try freeing the swapcache to get rid of the swapca=
che
> > > >          * reference only in case it's likely that we'll be the exl=
usive user.
> > > >          */
> > > >         return (fault_flags & FAULT_FLAG_WRITE) && !folio_test_ksm(=
folio) &&
> > > >                 folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(f=
olio));
> > > > }
> > > >
> > > > and for swapout, __removing_mapping does check refcount as well:
> > > >
> > > > static int __remove_mapping(struct address_space *mapping, struct f=
olio *folio,
> > > >                             bool reclaimed, struct mem_cgroup *targ=
et_memcg)
> > > > {
> > > >         refcount =3D 1 + folio_nr_pages(folio);
> > > >         if (!folio_ref_freeze(folio, refcount))
> > > >                 goto cannot_free;
> > > >
> > > > }
> > > >
> > > > However, since __remove_mapping() occurs after pageout(), it seems
> > > > this also doesn't prevent swapout from allocating a new swap entry =
to
> > > > fill src_pte.
> > > >
> > > > It seems your concern is valid=E2=80=94unless I'm missing something=
.
> > > > Do you have a reproducer? If so, this will likely need a separate f=
ix
> > > > patch rather than being hidden in this patchset.
> > >
> > > Thanks for the analysis. I don't have a reproducer yet, I did some
> > > local experiments and that seems possible, but the race window is so
> > > tiny and it's very difficult to make the swap entry reuse to collide
> > > with that, I'll try more but in theory this seems possible, or at
> > > least looks very fragile.
> > >
> > > And yeah, let's patch the kernel first if that's a real issue.
> > >
> > > >
> > > > >     double_pt_lock
> > > > >     is_pte_pages_stable
> > > > >       | Passed because of entry reuse.
> > > > >     folio_move_anon_rmap(...)
> > > > >       | Moved invalid folio A.
> > > > >
> > > > > And could it be possible that the swap_cache_get_folio returns NU=
LL
> > > > > here, but later right before the double_pt_lock, a folio is added=
 to
> > > > > swap cache? Maybe we better check the swap cache after clear and
> > > > > releasing dst lock, but before releasing src lock?
> > > >
> > > > It seems you're suggesting that a parallel swap-in allocates and ad=
ds
> > > > a folio to the swap cache, but the PTE has not yet been updated fro=
m
> > > > a swap entry to a present mapping?
> > > >
> > > > As long as do_swap_page() adds the folio to the swap cache
> > > > before updating the PTE to present, this scenario seems possible.
> > >
> > > Yes, that's two kinds of problems here. I suspected there could be an
> > > ABA problem while working on the series, but wasn't certain. And just
> > > realised there could be another missed cache read here thanks to your
> > > review and discussion :)
> > >
> > > >
> > > > It seems we need to double-check:
> > > >
> > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > index bc473ad21202..976053bd2bf1 100644
> > > > --- a/mm/userfaultfd.c
> > > > +++ b/mm/userfaultfd.c
> > > > @@ -1102,8 +1102,14 @@ static int move_swap_pte(struct mm_struct *m=
m,
> > > > struct vm_area_struct *dst_vma,
> > > >         if (src_folio) {
> > > >                 folio_move_anon_rmap(src_folio, dst_vma);
> > > >                 src_folio->index =3D linear_page_index(dst_vma, dst=
_addr);
> > > > +       } else {
> > > > +               struct folio *folio =3D
> > > > filemap_get_folio(swap_address_space(entry),
> > > > +                                       swap_cache_index(entry));
> > > > +               if (!IS_ERR_OR_NULL(folio)) {
> > > > +                       double_pt_unlock(dst_ptl, src_ptl);
> > > > +                       return -EAGAIN;
> > > > +               }
> > > >         }
> > > > -
> > > >         orig_src_pte =3D ptep_get_and_clear(mm, src_addr, src_pte);
> > > >  #ifdef CONFIG_MEM_SOFT_DIRTY
> > > >         orig_src_pte =3D pte_swp_mksoft_dirty(orig_src_pte);
> > >
> > > Maybe it has to get even dirtier here to call swapcache_prepare too t=
o
> > > cover the SYNC_IO case?
> > >
> > > >
> > > > Let me run test case [1] to check whether this ever happens. I gues=
s I need to
> > > > hack kernel a bit to always add folio to swapcache even for SYNC IO=
.
> > >
> > > That will cause quite a performance regression I think. Good thing is=
,
> > > that's exactly the problem this series is solving by dropping the SYN=
C
> > > IO swapin path and never bypassing the swap cache, while improving th=
e
> > > performance, eliminating things like this. One more reason to justify
> > > the approach :)
>
> Hi Barry,
>
> >
> > I attempted to reproduce the scenario where a folio is added to the swa=
pcache
> > after filemap_get_folio() returns NULL but before move_swap_pte()
> > moves the swap PTE
> > using non-synchronized I/O. Technically, this seems possible; however,
> > I was unable
> > to reproduce it, likely because the time window between swapin_readahea=
d and
> > taking the page table lock within do_swap_page() is too short.
>
> Thank you so much for trying this!
>
> I have been trying to reproduce it too, and so far I didn't observe
> any crash or warn. I added following debug code:
>
>  static __always_inline
>  bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long dst_=
end)
> @@ -1163,6 +1167,7 @@ static int move_pages_pte(struct mm_struct *mm,
> pmd_t *dst_pmd, pmd_t *src_pmd,
>         pmd_t dummy_pmdval;
>         pmd_t dst_pmdval;
>         struct folio *src_folio =3D NULL;
> +       struct folio *tmp_folio =3D NULL;
>         struct anon_vma *src_anon_vma =3D NULL;
>         struct mmu_notifier_range range;
>         int err =3D 0;
> @@ -1391,6 +1396,15 @@ static int move_pages_pte(struct mm_struct *mm,
> pmd_t *dst_pmd, pmd_t *src_pmd,
>                 if (!src_folio)
>                         folio =3D filemap_get_folio(swap_address_space(en=
try),
>                                         swap_cache_index(entry));
> +               udelay(get_random_u32_below(1000));
> +               tmp_folio =3D filemap_get_folio(swap_address_space(entry)=
,
> +                                       swap_cache_index(entry));
> +               if (!IS_ERR_OR_NULL(tmp_folio)) {
> +                       if (!IS_ERR_OR_NULL(folio) && tmp_folio !=3D foli=
o) {
> +                               pr_err("UFFDIO_MOVE: UNSTABLE folio
> %lx (%lx) -> %lx (%lx)\n", folio, folio->swap.val, tmp_folio,
> tmp_folio->swap.val);
> +                       }
> +                       folio_put(tmp_folio);
> +               }
>                 if (!IS_ERR_OR_NULL(folio)) {
>                         if (folio_test_large(folio)) {
>                                 err =3D -EBUSY;
> @@ -1413,6 +1427,8 @@ static int move_pages_pte(struct mm_struct *mm,
> pmd_t *dst_pmd, pmd_t *src_pmd,
>                 err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr,
> dst_pte, src_pte,
>                                 orig_dst_pte, orig_src_pte, dst_pmd, dst_=
pmdval,
>                                 dst_ptl, src_ptl, src_folio);
> +               if (tmp_folio !=3D folio && !err)
> +                       pr_err("UFFDIO_MOVE: UNSTABLE folio passed
> check: %lx -> %lx\n", folio, tmp_folio);
>         }
>
> And I saw these two prints are getting triggered like this (not a real
> issue though, just help to understand the problem)
> ...
> [ 3127.632791] UFFDIO_MOVE: UNSTABLE folio fffffdffc334cd00 (0) ->
> fffffdffc7ccac80 (51)
> [ 3172.033269] UFFDIO_MOVE: UNSTABLE folio fffffdffc343bb40 (0) ->
> fffffdffc3435e00 (3b)
> [ 3194.425213] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d481c0 (0) ->
> fffffdffc34ab8c0 (76)
> [ 3194.991318] UFFDIO_MOVE: UNSTABLE folio fffffdffc34f95c0 (0) ->
> fffffdffc34ab8c0 (6d)
> [ 3203.467212] UFFDIO_MOVE: UNSTABLE folio fffffdffc34b13c0 (0) ->
> fffffdffc34eda80 (32)
> [ 3206.217820] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d297c0 (0) ->
> fffffdffc38cedc0 (b)
> [ 3214.913039] UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc34=
db140
> [ 3217.066972] UFFDIO_MOVE: UNSTABLE folio fffffdffc342b5c0 (0) ->
> fffffdffc3465cc0 (21)
> ...
>
> The "UFFDIO_MOVE: UNSTABLE folio fffffdffc3435180 (0) ->
> fffffdffc3853540 (53)" worries me at first. On first look it seems the
> folio is indeed freed completely from the swap cache after the first
> lookup, so another swapout can reuse the entry. But as you mentioned
> __remove_mapping won't release a folio if the refcount check fails, so
> they must be freed by folio_free_swap or __try_to_reclaim_swap, there
> are many places that can happen. But these two helpers won't free a
> folio from swap cache if its swap count is not zero. And the folio
> will either be swapped out (swap count non zero), or mapped (freeing
> it is fine, PTE is non_swap, and another swapout will still use the
> same folio).
>
> So after more investigation and dumping the pages, it's actually the
> second lookup (tmp_folio) seeing the entry being reused by another
> page table entry, after the first folio is swapped back and released.
> So the page table check below will always fail just fine.
>
> But this also proves the first look up can see a completely irrelevant
> folio too: If the src folio is swapped out, but got swapped back and
> freed, then another folio B shortly got added to swap cache reuse the
> src folio's old swap entry, then the folio B got seen by the look up
> here and get freed from swap cache, then src folio got swapped out
> again also reusing the same entry, then we have a problem as PTE seems
> untouched indeed but we grabbed a wrong folio. Seems possible if I'm
> not wrong:
>
> Something like this:
> CPU1                             CPU2
> move_pages_pte
>   entry =3D pte_to_swp_entry(orig_src_pte);
>     | Got Swap Entry S1 from src_pte
>   ...
>                                  <swapin src_pte, using folio A>

I=E2=80=99m assuming you mean `<swapin src_pte, using folio B>`, since I=E2=
=80=99m not
sure where folio B comes from in the statement `<someone else tried to
swap out folio B>`.

If that assumption is correct, and folio A is still in the swapcache,
how could someone swap in folio B without hitting folio A? That would
suggest folio A must have been removed from the swapcache earlier=E2=80=94r=
ight?

>                                  <free folio A from swap cache freeing S1=
>
>                                  <someone else try swap out folio B >
>                                  <put folio B to swap cache using S1 >
>                                 ...
>   folio =3D swap_cache_get_folio(S1)
>     | Got folio B here !!!
>   move_swap_pte
>                                  <free folio B from swap cache>
>                                    | Holding a reference doesn't pin the =
cache
>                                    | as we have demonstrated
>                                  <Swapout folio A also using S1>
>     double_pt_lock
>     is_pte_pages_stable
>       | Passed because of S1 is reused
>     folio_move_anon_rmap(...)
>       | Moved invalid folio B here !!!
>
> But this is extremely hard to reproduce though, even if doing it
> deliberately...
>
> So I think a "folio_swap_contains" or equivalent check here is a good
> thing to have, to make it more robust and easier to understand. The
> checking after locking a folio has very tiny overhead and can
> definitely ensure the folio's swap entry is valid and stable.
>
> The "UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc385fb00"
> here might seem problematic, but it's still not a real problem. That's
> the case where the swapin in src region happens after the lookup, and
> before the PTE lock. It will pass the PTE check without moving the
> folio. But the folio is guaranteed to be a completely new folio here
> because the folio can't be added back to the page table without
> holding the PTE lock, and if that happens the following PTE check here
> will fail.
>
> So I think we should patch the current kernel only adding a
> "folio_swap_contains" equivalent check here, and maybe more comments,
> how do you think?

The description appears to have some inconsistencies.
Would you mind rephrasing it?

Thanks
barry
