Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F33AC1C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030495; cv=none; b=EOgZm7IbpkqqlROfeDJbey2N/TL+aU3prSh1JhGi18tgpTnEphgm7lJKR8WAeXTnwURyf4nOFK1NJmsZbHlnOlR6PeBaReAv3CMnRTtphof0IP73GzJQGLQCXLfM7ziUcvSHtrJo8QvBTeARyucR9/RdqsuYD9mRVx2zKfeqlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030495; c=relaxed/simple;
	bh=dmWUVWiEmk5YV1+IoffOUZ/H2jEgbR+y/ndTZCyDWxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rzfl30ciCSbdG2ZTMnnNyvvsirYZ0+CSe3EUau+7KP5VrWpF2IH7sN4OFUqv3Tx2IoGI8O2z29/nn15/fZj/2tHZMQwcfKywFmqrFZqPxbI1HyNUBgCrig4x0ajdb3qVC8/RogvjmOEOFsYCxvLt5wUzdcVdAFk6Gdj6P2HEUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1VPFzhQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1VPFzhQ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-31062172698so2558701fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748030491; x=1748635291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+w9SMCGJOBxFdtkMOTm2SmdrS/iWnk1LdyGgwi+LfGg=;
        b=d1VPFzhQdpFbu0bYOra/9PaWvjpi+/e9P6E9s2NrzgQw2+A7fJVfEgz45ZDn69r9YR
         pEu2uCpT9jyCHl6y7V2oTxZBb9m+xtUAVz3mreQyEGLS9/HTFQ9aJ3+lKHb6AUgzE2h7
         NXSgw38J/92Df42suZAXrEuDyo1fjY0/QPkQ2XEI/Ge3PJnm2woXFwIFh5YG9/DaQKWU
         eE118BJ+anzYz7ju7Fvg1Zq+OEodzu+nO0djbHnAHRpjhADn+HK2reh4+4uVb9YXQmCm
         kS0/YZXxVGwOf02nAo0CVNhRQ0mdvwwPj4q3jZa3zwWhwr5iHBta6RqPlKkPhaq5eyeW
         rRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748030491; x=1748635291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w9SMCGJOBxFdtkMOTm2SmdrS/iWnk1LdyGgwi+LfGg=;
        b=M6epj6tydLJC8ISedfVMh5jWHkbxi7IJWlHcMzZT4Ibjhwv46xkotoQEto+c24ooVs
         WfOn118+W4LjFaZ43fhEeY6XOZ1P/W3+wPeHpAD/Js3XjyGEwiYnrFbcAT8DwZYazYb/
         6X4coVIr0g8D8l7tdDo79XScR+sZ4HvkLZdF0M0MdxyF4XuUixSoew2DaS3xBSVVxCaP
         ATLaDs62U42TZxaMSi5r4jK5TP0UOWUR/T6V9M8mzXpPnlv66yceb4knQuCDf6UTr4b2
         bWdbARC8UvDrMqclx7dNGziHlRaJ9qrHFBs3RvmYeX+5RNzqVy/hzvUuQOv/gjRL7oFA
         cchQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRImVEmFvcKydRVyXC2jLQ5JqJPCXc0RBh7xFJhGRZai9s7kIvWs0vnnt3K94R/f0Q6vKzUNy4b/ozTbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+CLvTWyJo48YU5PDwIQgvJwL1xymU6sDP1JMaiAWn4cImGRR
	wrbHwMJYrc3KTw6xtRbOU1hLCvqH+NzFeIUo2bJZ9aT/zmWAwM+JYz/vjMLf7f1qiR5+f2GUBJ3
	sT2LJLe20hcVtrpMLGxWAtsKQr23LiHs=
X-Gm-Gg: ASbGncsrXyLkzzsNC4I+EUeGw3/hcF+WB1FaokkwxSS4S3Lr3gty76bfey8pjlMQ+rg
	AqPStkIw0HPLZQFKPFofrEdCl85nskuRRYpIc8PigH9lpjppWFTaeeUNbg38LsDT1pFpH3obv/g
	aKl7hwFWNdXbZ/frDwwWu/XYlLi4XK3FluOfTtPQ1A4ew=
X-Google-Smtp-Source: AGHT+IG8LpGR+FLklM3jTLwJhxqn5AYHh5ue5QKpwLZ1MbccKhxQtOmsqjjrHbUwFNm5JVn9LatDQ0dl5344FVRGWjs=
X-Received: by 2002:a2e:a54a:0:b0:30a:2a8a:e4b5 with SMTP id
 38308e7fff4ca-3295bada9c2mr1149181fa.27.1748030490834; Fri, 23 May 2025
 13:01:30 -0700 (PDT)
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
 <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com> <CAGsJ_4wo6u1WSXdzj8RUUDNdk5_YCfLV_mcJtvhiv2UonXw+nw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wo6u1WSXdzj8RUUDNdk5_YCfLV_mcJtvhiv2UonXw+nw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 24 May 2025 04:01:13 +0800
X-Gm-Features: AX0GCFsQv7Tim25pnQCXZYeXez9fQMau0NOHjvzSFVhIRAc0Gg1S-imH6voOJp0
Message-ID: <CAMgjq7Bc0-eXZ8G=bN8bo2NG1ndtPmCUvxCi0bdM+HdqmOjaPQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Barry Song <21cnbao@gmail.com>
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

On Fri, May 23, 2025 at 10:30=E2=80=AFAM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, May 21, 2025 at 7:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com=
> wrote:
> > > >
> > > > On Tue, May 20, 2025 at 12:41=E2=80=AFPM Barry Song <21cnbao@gmail.=
com> wrote:
> > > > >
> > > > > On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gmail=
.com> wrote:
> > > > > >
> > > > > > On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gm=
ail.com> wrote:
> > > > > > >
> > > > > > > > From: Kairui Song <kasong@tencent.com>
> > > > > > >
> > > > > > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > > > > > index e5a0db7f3331..5b4f01aecf35 100644
> > > > > > > > --- a/mm/userfaultfd.c
> > > > > > > > +++ b/mm/userfaultfd.c
> > > > > > > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_=
struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
> > > > > > > >                               goto retry;
> > > > > > > >                       }
> > > > > > > >               }
> > > > > > > > +             if (!folio_swap_contains(src_folio, entry)) {
> > > > > > > > +                     err =3D -EBUSY;
> > > > > > > > +                     goto out;
> > > > > > > > +             }
> > > > > > >
> > > > > > > It seems we don't need this. In move_swap_pte(), we have been=
 checking pte pages
> > > > > > > are stable:
> > > > > > >
> > > > > > >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_p=
te, orig_src_pte,
> > > > > > >                                  dst_pmd, dst_pmdval)) {
> > > > > > >                 double_pt_unlock(dst_ptl, src_ptl);
> > > > > > >                 return -EAGAIN;
> > > > > > >         }
> > > > > >
> > > > > > The tricky part is when swap_cache_get_folio returns the folio,=
 both
> > > > > > folio and ptes are unlocked. So is it possible that someone els=
e
> > > > > > swapped in the entries, then swapped them out again using the s=
ame
> > > > > > entries?
> > > > > >
> > > > > > The folio will be different here but PTEs are still the same va=
lue to
> > > > > > they will pass the is_pte_pages_stable check, we previously saw
> > > > > > similar races with anon fault or shmem. I think more strict che=
cking
> > > > > > won't hurt here.
> > > > >
> > > > > This doesn't seem to be the same case as the one you fixed in
> > > > > do_swap_page(). Here, we're hitting the swap cache, whereas in th=
at
> > > > > case, there was no one hitting the swap cache, and you used
> > > > > swap_prepare() to set up the cache to fix the issue.
> > > > >
> > > > > By the way, if we're not hitting the swap cache, src_folio will b=
e
> > > > > NULL. Also, it seems that folio_swap_contains(src_folio, entry) d=
oes
> > > > > not guard against that case either.
> > > >
> > > > Ah, that's true, it should be moved inside the if (folio) {...} blo=
ck
> > > > above. Thanks for catching this!
> > > >
> > > > > But I suspect we won't have a problem, since we're not swapping i=
n =E2=80=94
> > > > > we didn't read any stale data, right? Swap-in will only occur aft=
er we
> > > > > move the PTEs.
> > > >
> > > > My concern is that a parallel swapin / swapout could result in the
> > > > folio to be a completely irrelevant or invalid folio.
> > > >
> > > > It's not about the dst, but in the move src side, something like:
> > > >
> > > > CPU1                             CPU2
> > > > move_pages_pte
> > > >   folio =3D swap_cache_get_folio(...)
> > > >     | Got folio A here
> > > >   move_swap_pte
> > > >                                  <swapin src_pte, using folio A>
> > > >                                  <swapout src_pte, put folio A>
> > > >                                    | Now folio A is no longer valid=
.
> > > >                                    | It's very unlikely but here SW=
AP
> > > >                                    | could reuse the same entry as =
above.
> > >
> > >
> > > swap_cache_get_folio() does increment the folio's refcount, but it se=
ems this
> > > doesn't prevent do_swap_page() from freeing the swap entry after swap=
ping
> > > in src_pte with folio A, if it's a read fault.
> > > for write fault, folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(fo=
lio))
> > > will be false:
> > >
> > > static inline bool should_try_to_free_swap(struct folio *folio,
> > >                                            struct vm_area_struct *vma=
,
> > >                                            unsigned int fault_flags)
> > > {
> > >        ...
> > >
> > >         /*
> > >          * If we want to map a page that's in the swapcache writable,=
 we
> > >          * have to detect via the refcount if we're really the exclus=
ive
> > >          * user. Try freeing the swapcache to get rid of the swapcach=
e
> > >          * reference only in case it's likely that we'll be the exlus=
ive user.
> > >          */
> > >         return (fault_flags & FAULT_FLAG_WRITE) && !folio_test_ksm(fo=
lio) &&
> > >                 folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(fol=
io));
> > > }
> > >
> > > and for swapout, __removing_mapping does check refcount as well:
> > >
> > > static int __remove_mapping(struct address_space *mapping, struct fol=
io *folio,
> > >                             bool reclaimed, struct mem_cgroup *target=
_memcg)
> > > {
> > >         refcount =3D 1 + folio_nr_pages(folio);
> > >         if (!folio_ref_freeze(folio, refcount))
> > >                 goto cannot_free;
> > >
> > > }
> > >
> > > However, since __remove_mapping() occurs after pageout(), it seems
> > > this also doesn't prevent swapout from allocating a new swap entry to
> > > fill src_pte.
> > >
> > > It seems your concern is valid=E2=80=94unless I'm missing something.
> > > Do you have a reproducer? If so, this will likely need a separate fix
> > > patch rather than being hidden in this patchset.
> >
> > Thanks for the analysis. I don't have a reproducer yet, I did some
> > local experiments and that seems possible, but the race window is so
> > tiny and it's very difficult to make the swap entry reuse to collide
> > with that, I'll try more but in theory this seems possible, or at
> > least looks very fragile.
> >
> > And yeah, let's patch the kernel first if that's a real issue.
> >
> > >
> > > >     double_pt_lock
> > > >     is_pte_pages_stable
> > > >       | Passed because of entry reuse.
> > > >     folio_move_anon_rmap(...)
> > > >       | Moved invalid folio A.
> > > >
> > > > And could it be possible that the swap_cache_get_folio returns NULL
> > > > here, but later right before the double_pt_lock, a folio is added t=
o
> > > > swap cache? Maybe we better check the swap cache after clear and
> > > > releasing dst lock, but before releasing src lock?
> > >
> > > It seems you're suggesting that a parallel swap-in allocates and adds
> > > a folio to the swap cache, but the PTE has not yet been updated from
> > > a swap entry to a present mapping?
> > >
> > > As long as do_swap_page() adds the folio to the swap cache
> > > before updating the PTE to present, this scenario seems possible.
> >
> > Yes, that's two kinds of problems here. I suspected there could be an
> > ABA problem while working on the series, but wasn't certain. And just
> > realised there could be another missed cache read here thanks to your
> > review and discussion :)
> >
> > >
> > > It seems we need to double-check:
> > >
> > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > index bc473ad21202..976053bd2bf1 100644
> > > --- a/mm/userfaultfd.c
> > > +++ b/mm/userfaultfd.c
> > > @@ -1102,8 +1102,14 @@ static int move_swap_pte(struct mm_struct *mm,
> > > struct vm_area_struct *dst_vma,
> > >         if (src_folio) {
> > >                 folio_move_anon_rmap(src_folio, dst_vma);
> > >                 src_folio->index =3D linear_page_index(dst_vma, dst_a=
ddr);
> > > +       } else {
> > > +               struct folio *folio =3D
> > > filemap_get_folio(swap_address_space(entry),
> > > +                                       swap_cache_index(entry));
> > > +               if (!IS_ERR_OR_NULL(folio)) {
> > > +                       double_pt_unlock(dst_ptl, src_ptl);
> > > +                       return -EAGAIN;
> > > +               }
> > >         }
> > > -
> > >         orig_src_pte =3D ptep_get_and_clear(mm, src_addr, src_pte);
> > >  #ifdef CONFIG_MEM_SOFT_DIRTY
> > >         orig_src_pte =3D pte_swp_mksoft_dirty(orig_src_pte);
> >
> > Maybe it has to get even dirtier here to call swapcache_prepare too to
> > cover the SYNC_IO case?
> >
> > >
> > > Let me run test case [1] to check whether this ever happens. I guess =
I need to
> > > hack kernel a bit to always add folio to swapcache even for SYNC IO.
> >
> > That will cause quite a performance regression I think. Good thing is,
> > that's exactly the problem this series is solving by dropping the SYNC
> > IO swapin path and never bypassing the swap cache, while improving the
> > performance, eliminating things like this. One more reason to justify
> > the approach :)

Hi Barry,

>
> I attempted to reproduce the scenario where a folio is added to the swapc=
ache
> after filemap_get_folio() returns NULL but before move_swap_pte()
> moves the swap PTE
> using non-synchronized I/O. Technically, this seems possible; however,
> I was unable
> to reproduce it, likely because the time window between swapin_readahead =
and
> taking the page table lock within do_swap_page() is too short.

Thank you so much for trying this!

I have been trying to reproduce it too, and so far I didn't observe
any crash or warn. I added following debug code:

 static __always_inline
 bool validate_dst_vma(struct vm_area_struct *dst_vma, unsigned long dst_en=
d)
@@ -1163,6 +1167,7 @@ static int move_pages_pte(struct mm_struct *mm,
pmd_t *dst_pmd, pmd_t *src_pmd,
        pmd_t dummy_pmdval;
        pmd_t dst_pmdval;
        struct folio *src_folio =3D NULL;
+       struct folio *tmp_folio =3D NULL;
        struct anon_vma *src_anon_vma =3D NULL;
        struct mmu_notifier_range range;
        int err =3D 0;
@@ -1391,6 +1396,15 @@ static int move_pages_pte(struct mm_struct *mm,
pmd_t *dst_pmd, pmd_t *src_pmd,
                if (!src_folio)
                        folio =3D filemap_get_folio(swap_address_space(entr=
y),
                                        swap_cache_index(entry));
+               udelay(get_random_u32_below(1000));
+               tmp_folio =3D filemap_get_folio(swap_address_space(entry),
+                                       swap_cache_index(entry));
+               if (!IS_ERR_OR_NULL(tmp_folio)) {
+                       if (!IS_ERR_OR_NULL(folio) && tmp_folio !=3D folio)=
 {
+                               pr_err("UFFDIO_MOVE: UNSTABLE folio
%lx (%lx) -> %lx (%lx)\n", folio, folio->swap.val, tmp_folio,
tmp_folio->swap.val);
+                       }
+                       folio_put(tmp_folio);
+               }
                if (!IS_ERR_OR_NULL(folio)) {
                        if (folio_test_large(folio)) {
                                err =3D -EBUSY;
@@ -1413,6 +1427,8 @@ static int move_pages_pte(struct mm_struct *mm,
pmd_t *dst_pmd, pmd_t *src_pmd,
                err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr,
dst_pte, src_pte,
                                orig_dst_pte, orig_src_pte, dst_pmd, dst_pm=
dval,
                                dst_ptl, src_ptl, src_folio);
+               if (tmp_folio !=3D folio && !err)
+                       pr_err("UFFDIO_MOVE: UNSTABLE folio passed
check: %lx -> %lx\n", folio, tmp_folio);
        }

And I saw these two prints are getting triggered like this (not a real
issue though, just help to understand the problem)
...
[ 3127.632791] UFFDIO_MOVE: UNSTABLE folio fffffdffc334cd00 (0) ->
fffffdffc7ccac80 (51)
[ 3172.033269] UFFDIO_MOVE: UNSTABLE folio fffffdffc343bb40 (0) ->
fffffdffc3435e00 (3b)
[ 3194.425213] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d481c0 (0) ->
fffffdffc34ab8c0 (76)
[ 3194.991318] UFFDIO_MOVE: UNSTABLE folio fffffdffc34f95c0 (0) ->
fffffdffc34ab8c0 (6d)
[ 3203.467212] UFFDIO_MOVE: UNSTABLE folio fffffdffc34b13c0 (0) ->
fffffdffc34eda80 (32)
[ 3206.217820] UFFDIO_MOVE: UNSTABLE folio fffffdffc7d297c0 (0) ->
fffffdffc38cedc0 (b)
[ 3214.913039] UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc34db=
140
[ 3217.066972] UFFDIO_MOVE: UNSTABLE folio fffffdffc342b5c0 (0) ->
fffffdffc3465cc0 (21)
...

The "UFFDIO_MOVE: UNSTABLE folio fffffdffc3435180 (0) ->
fffffdffc3853540 (53)" worries me at first. On first look it seems the
folio is indeed freed completely from the swap cache after the first
lookup, so another swapout can reuse the entry. But as you mentioned
__remove_mapping won't release a folio if the refcount check fails, so
they must be freed by folio_free_swap or __try_to_reclaim_swap, there
are many places that can happen. But these two helpers won't free a
folio from swap cache if its swap count is not zero. And the folio
will either be swapped out (swap count non zero), or mapped (freeing
it is fine, PTE is non_swap, and another swapout will still use the
same folio).

So after more investigation and dumping the pages, it's actually the
second lookup (tmp_folio) seeing the entry being reused by another
page table entry, after the first folio is swapped back and released.
So the page table check below will always fail just fine.

But this also proves the first look up can see a completely irrelevant
folio too: If the src folio is swapped out, but got swapped back and
freed, then another folio B shortly got added to swap cache reuse the
src folio's old swap entry, then the folio B got seen by the look up
here and get freed from swap cache, then src folio got swapped out
again also reusing the same entry, then we have a problem as PTE seems
untouched indeed but we grabbed a wrong folio. Seems possible if I'm
not wrong:

Something like this:
CPU1                             CPU2
move_pages_pte
  entry =3D pte_to_swp_entry(orig_src_pte);
    | Got Swap Entry S1 from src_pte
  ...
                                 <swapin src_pte, using folio A>
                                 <free folio A from swap cache freeing S1>
                                 <someone else try swap out folio B >
                                 <put folio B to swap cache using S1 >
                                ...
  folio =3D swap_cache_get_folio(S1)
    | Got folio B here !!!
  move_swap_pte
                                 <free folio B from swap cache>
                                   | Holding a reference doesn't pin the ca=
che
                                   | as we have demonstrated
                                 <Swapout folio A also using S1>
    double_pt_lock
    is_pte_pages_stable
      | Passed because of S1 is reused
    folio_move_anon_rmap(...)
      | Moved invalid folio B here !!!

But this is extremely hard to reproduce though, even if doing it
deliberately...

So I think a "folio_swap_contains" or equivalent check here is a good
thing to have, to make it more robust and easier to understand. The
checking after locking a folio has very tiny overhead and can
definitely ensure the folio's swap entry is valid and stable.

The "UFFDIO_MOVE: UNSTABLE folio passed check: 0 -> fffffdffc385fb00"
here might seem problematic, but it's still not a real problem. That's
the case where the swapin in src region happens after the lookup, and
before the PTE lock. It will pass the PTE check without moving the
folio. But the folio is guaranteed to be a completely new folio here
because the folio can't be added back to the page table without
holding the PTE lock, and if that happens the following PTE check here
will fail.

So I think we should patch the current kernel only adding a
"folio_swap_contains" equivalent check here, and maybe more comments,
how do you think?
