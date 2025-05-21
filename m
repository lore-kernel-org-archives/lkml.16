Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B724315855C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797912; cv=none; b=ok/nOkSDDGqawfs6t5WEZGrlfXnBWwgIKfhi9n89np1XP9lxIbPIfez7GNWW/j9pwJTp8mDnGwB6bJTH3yZTLWoITvv0T7jTq1urL1govL0lJfBrJ9gFTxS0tVfkH3hUMJr7q7dhYGWrTStSDGovDTlu4hDOWbLrcwXzmSykwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797912; c=relaxed/simple;
	bh=IFOgE9AGjTnTxaOdKHrRTcMwvPrh1rU2DpdYfM9P6So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8SuU32XcX6vQFsAJ+9GCJAfFVVa3a1QZqxrz+cv0XHzuotyRv1psTT7Rf1vnV+KO+zMGFlOgn0+mb9uMvVjmpCFDwUYtcVcOgeOJYdxGOpw9UA29QeBNUCAIItLlCkgQOxHxEyjQvlRU4Isfm0OADwIuugzZvoeGPb5R43Lce0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfccoFvj; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfccoFvj"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87bf5c80f56so2633581241.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747797909; x=1748402709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUITKC9D7ShfjPfuXdRjZj+CsBm2w9XbmNqmnF57EWo=;
        b=TfccoFvjAMUYuZUs0GNkZ4vpCclxHloQp+5jyAsxyAt+EhMFy/p9HbQKxruUBYhvr1
         1vR8VFsQ7LCLxZtDO1Vkt5eCutgMIT6mIE9+uqq4ZgrdQJ4E1CVV2OGaGWaBfm4ZeaYU
         D2MATDB0YxY1vlc7RRTbi9hLOWWEdyTNOFAODRIH6mibFCwtTKC7vb8kG7w23wpmqgEA
         dMU2IgQovfhROYx/AjI+IDC9bw3MQkeB8h8ydax4O98uOftTkdsXHbfxnv6X142448qT
         NG1a2K5uclT8dgPLV7wlQcdpMCPdl1LxKVlJhSAwx1IRkXC/IILWLWt9Ke4yGt15w+4/
         MLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747797909; x=1748402709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUITKC9D7ShfjPfuXdRjZj+CsBm2w9XbmNqmnF57EWo=;
        b=TiCyJA+3YcF/bhn1EnwxrKibgvzM2SJisVBiIUIkB1ae5Q0rn7x7y2Sgrzw8u1r1tI
         10jB0/s64cFHEYp3+fRG5QtS6WEAPsD8oC3TPP1TliuqpGxNz07ceL2+08Pwa2jzaI92
         dkrticX1gDOXtGDYYXLULukOHLmNJWuKNomPXEoCRkLeMPy5T9Rmrt9VgB/NsGgSV5jN
         N73YJIBdz5rjNsxH0M8XSu5gxsSsWbYvAt7gC1yOq5oh7wRGwJapJlJRVFYPh93AFkUz
         kSBcCw3f3P+vs9jIOnjY1OAv7JFpIVAn7dFUI5frAEbJY6YUjft+8RRvdnpGrhuX7fB6
         GP7A==
X-Forwarded-Encrypted: i=1; AJvYcCUkG5iTNmjNGMi9IKRDEZBwIXC4Vy2Cm+cbbum2ijg3h7akGYTROhMqwJ5SZewIJaFV+Gzm/6F6WFHj+WU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OgjxfdTK5tOEtLnIfC/0vTab3LLQi816+IOLELFmHL8a7f/L
	QKleReXz8Irt27dMyXVgifYKtPT8HxZwlLAM4x8g/cFGwW4sTnms+fuyo82CQVWvOOg8EhXKbld
	g5hJe9SHu3yH/Yy8dWVh4j7TQJh8Lgo0=
X-Gm-Gg: ASbGnct/YpFpxfcn9JthtJyos2R4mYpp7fy2GixZJ9XpZnDLwixHIDYr7yLFcwrTQbU
	akkh7Nx+ISZxxqSWO5DE0z5H0P+uzvBPqdbio98TgM3wsxm7hs1A78XzNXRN2JJ0QPw5t70o1Bl
	SecQudKsuXfmext7piH/Ee1snjzuKJmyerQw==
X-Google-Smtp-Source: AGHT+IF6Cv27F3kX+i+D4uM74OigVPJYd08slZUdRAXMrOeho4Wes1UCxkUZVKkSiT5c8Jvg/8HbTxG45o+r/HJetOQ=
X-Received: by 2002:a05:6102:5714:b0:4c1:94df:9aea with SMTP id
 ada2fe7eead31-4dfa6bebe78mr17449645137.15.1747797909376; Tue, 20 May 2025
 20:25:09 -0700 (PDT)
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
 <CAGsJ_4z1cJfOCcpZDt4EuHK7+SON1r0ptRJNv1h=cDv+eOcdSQ@mail.gmail.com> <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com>
In-Reply-To: <CAMgjq7CJ4_9bB=46TVzByFRuOwxNs4da=sN==x8cc++YsV+ETQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 May 2025 15:24:58 +1200
X-Gm-Features: AX0GCFtjQGZRg8liGvHHvK0xBqTur-JjSJbRmoubxb0-0IEZyRWgtX19nDy5H4g
Message-ID: <CAGsJ_4wYJpePQtJ5FbrSv8NVPExjZX0WTqPB1d73SXLstQtQhA@mail.gmail.com>
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

On Wed, May 21, 2025 at 2:45=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> Barry Song <21cnbao@gmail.com> =E4=BA=8E 2025=E5=B9=B45=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=B8=89 06:33=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, May 21, 2025 at 7:10=E2=80=AFAM Kairui Song <ryncsn@gmail.com> =
wrote:
> > >
> > > On Tue, May 20, 2025 at 12:41=E2=80=AFPM Barry Song <21cnbao@gmail.co=
m> wrote:
> > > >
> > > > On Tue, May 20, 2025 at 3:31=E2=80=AFPM Kairui Song <ryncsn@gmail.c=
om> wrote:
> > > > >
> > > > > On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gmai=
l.com> wrote:
> > > > > >
> > > > > > > From: Kairui Song <kasong@tencent.com>
> > > > > >
> > > > > > > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > > > > > > index e5a0db7f3331..5b4f01aecf35 100644
> > > > > > > --- a/mm/userfaultfd.c
> > > > > > > +++ b/mm/userfaultfd.c
> > > > > > > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_st=
ruct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
> > > > > > >                               goto retry;
> > > > > > >                       }
> > > > > > >               }
> > > > > > > +             if (!folio_swap_contains(src_folio, entry)) {
> > > > > > > +                     err =3D -EBUSY;
> > > > > > > +                     goto out;
> > > > > > > +             }
> > > > > >
> > > > > > It seems we don't need this. In move_swap_pte(), we have been c=
hecking pte pages
> > > > > > are stable:
> > > > > >
> > > > > >         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte=
, orig_src_pte,
> > > > > >                                  dst_pmd, dst_pmdval)) {
> > > > > >                 double_pt_unlock(dst_ptl, src_ptl);
> > > > > >                 return -EAGAIN;
> > > > > >         }
> > > > >
> > > > > The tricky part is when swap_cache_get_folio returns the folio, b=
oth
> > > > > folio and ptes are unlocked. So is it possible that someone else
> > > > > swapped in the entries, then swapped them out again using the sam=
e
> > > > > entries?
> > > > >
> > > > > The folio will be different here but PTEs are still the same valu=
e to
> > > > > they will pass the is_pte_pages_stable check, we previously saw
> > > > > similar races with anon fault or shmem. I think more strict check=
ing
> > > > > won't hurt here.
> > > >
> > > > This doesn't seem to be the same case as the one you fixed in
> > > > do_swap_page(). Here, we're hitting the swap cache, whereas in that
> > > > case, there was no one hitting the swap cache, and you used
> > > > swap_prepare() to set up the cache to fix the issue.
> > > >
> > > > By the way, if we're not hitting the swap cache, src_folio will be
> > > > NULL. Also, it seems that folio_swap_contains(src_folio, entry) doe=
s
> > > > not guard against that case either.
> > >
> > > Ah, that's true, it should be moved inside the if (folio) {...} block
> > > above. Thanks for catching this!
> > >
> > > > But I suspect we won't have a problem, since we're not swapping in =
=E2=80=94
> > > > we didn't read any stale data, right? Swap-in will only occur after=
 we
> > > > move the PTEs.
> > >
> > > My concern is that a parallel swapin / swapout could result in the
> > > folio to be a completely irrelevant or invalid folio.
> > >
> > > It's not about the dst, but in the move src side, something like:
> > >
> > > CPU1                             CPU2
> > > move_pages_pte
> > >   folio =3D swap_cache_get_folio(...)
> > >     | Got folio A here
> > >   move_swap_pte
> > >                                  <swapin src_pte, using folio A>
> > >                                  <swapout src_pte, put folio A>
> > >                                    | Now folio A is no longer valid.
> > >                                    | It's very unlikely but here SWAP
> > >                                    | could reuse the same entry as ab=
ove.
> >
> >
> > swap_cache_get_folio() does increment the folio's refcount, but it seem=
s this
> > doesn't prevent do_swap_page() from freeing the swap entry after swappi=
ng
> > in src_pte with folio A, if it's a read fault.
> > for write fault, folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(foli=
o))
> > will be false:
> >
> > static inline bool should_try_to_free_swap(struct folio *folio,
> >                                            struct vm_area_struct *vma,
> >                                            unsigned int fault_flags)
> > {
> >        ...
> >
> >         /*
> >          * If we want to map a page that's in the swapcache writable, w=
e
> >          * have to detect via the refcount if we're really the exclusiv=
e
> >          * user. Try freeing the swapcache to get rid of the swapcache
> >          * reference only in case it's likely that we'll be the exlusiv=
e user.
> >          */
> >         return (fault_flags & FAULT_FLAG_WRITE) && !folio_test_ksm(foli=
o) &&
> >                 folio_ref_count(folio) =3D=3D (1 + folio_nr_pages(folio=
));
> > }
> >
> > and for swapout, __removing_mapping does check refcount as well:
> >
> > static int __remove_mapping(struct address_space *mapping, struct folio=
 *folio,
> >                             bool reclaimed, struct mem_cgroup *target_m=
emcg)
> > {
> >         refcount =3D 1 + folio_nr_pages(folio);
> >         if (!folio_ref_freeze(folio, refcount))
> >                 goto cannot_free;
> >
> > }
> >
> > However, since __remove_mapping() occurs after pageout(), it seems
> > this also doesn't prevent swapout from allocating a new swap entry to
> > fill src_pte.
> >
> > It seems your concern is valid=E2=80=94unless I'm missing something.
> > Do you have a reproducer? If so, this will likely need a separate fix
> > patch rather than being hidden in this patchset.
>
> Thanks for the analysis. I don't have a reproducer yet, I did some
> local experiments and that seems possible, but the race window is so
> tiny and it's very difficult to make the swap entry reuse to collide
> with that, I'll try more but in theory this seems possible, or at
> least looks very fragile.

I think we don't necessarily need to prove the same swap entry. As long
as we can prove the original and current ptes are both swap with the same
offset or not, this could be the possibility they will have the same offset=
.
This can increase the likelihood of occurrence and help validate the
conceptual model.

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..f072d4a5bcd4 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c

@@ -1090,6 +1090,10 @@ static int move_swap_pte(struct mm_struct *mm,
struct vm_area_struct *dst_vma,
        if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_src_p=
te,
                                 dst_pmd, dst_pmdval)) {
+               if (src_folio && !non_swap_entry(orig_src_pte) &&
+                       !non_swap_entry(ptep_get(src_pte)))
+                               the case is true;
+
                double_pt_unlock(dst_ptl, src_ptl);
                return -EAGAIN;
        }


>
> And yeah, let's patch the kernel first if that's a real issue.
>
> >
> > >     double_pt_lock
> > >     is_pte_pages_stable
> > >       | Passed because of entry reuse.
> > >     folio_move_anon_rmap(...)
> > >       | Moved invalid folio A.
> > >
> > > And could it be possible that the swap_cache_get_folio returns NULL
> > > here, but later right before the double_pt_lock, a folio is added to
> > > swap cache? Maybe we better check the swap cache after clear and
> > > releasing dst lock, but before releasing src lock?
> >
> > It seems you're suggesting that a parallel swap-in allocates and adds
> > a folio to the swap cache, but the PTE has not yet been updated from
> > a swap entry to a present mapping?
> >
> > As long as do_swap_page() adds the folio to the swap cache
> > before updating the PTE to present, this scenario seems possible.
>
> Yes, that's two kinds of problems here. I suspected there could be an
> ABA problem while working on the series, but wasn't certain. And just
> realised there could be another missed cache read here thanks to your
> review and discussion :)
>
> >
> > It seems we need to double-check:
> >
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index bc473ad21202..976053bd2bf1 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -1102,8 +1102,14 @@ static int move_swap_pte(struct mm_struct *mm,
> > struct vm_area_struct *dst_vma,
> >         if (src_folio) {
> >                 folio_move_anon_rmap(src_folio, dst_vma);
> >                 src_folio->index =3D linear_page_index(dst_vma, dst_add=
r);
> > +       } else {
> > +               struct folio *folio =3D
> > filemap_get_folio(swap_address_space(entry),
> > +                                       swap_cache_index(entry));
> > +               if (!IS_ERR_OR_NULL(folio)) {
> > +                       double_pt_unlock(dst_ptl, src_ptl);
> > +                       return -EAGAIN;
> > +               }
> >         }
> > -
> >         orig_src_pte =3D ptep_get_and_clear(mm, src_addr, src_pte);
> >  #ifdef CONFIG_MEM_SOFT_DIRTY
> >         orig_src_pte =3D pte_swp_mksoft_dirty(orig_src_pte);
>
> Maybe it has to get even dirtier here to call swapcache_prepare too to
> cover the SYNC_IO case?
>
> >
> > Let me run test case [1] to check whether this ever happens. I guess I =
need to
> > hack kernel a bit to always add folio to swapcache even for SYNC IO.
>
> That will cause quite a performance regression I think. Good thing is,
> that's exactly the problem this series is solving by dropping the SYNC
> IO swapin path and never bypassing the swap cache, while improving the
> performance, eliminating things like this. One more reason to justify
> the approach :)
>
> >
> > [1] https://lore.kernel.org/linux-mm/20250219112519.92853-1-21cnbao@gma=
il.com/
>
> I'll try this too.
>
> >
> > >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > Also, -EBUSY is somehow incorrect error code.
> > > > >
> > > > > Yes, thanks, I'll use EAGAIN here just like move_swap_pte.
> > > > >
> > > > >
> > > > > >
> > > > > > >               err =3D move_swap_pte(mm, dst_vma, dst_addr, sr=
c_addr, dst_pte, src_pte,
> > > > > > >                               orig_dst_pte, orig_src_pte, dst=
_pmd, dst_pmdval,
> > > > > > >                               dst_ptl, src_ptl, src_folio);
> > > > > > >
> > > > > >
> > > >
> >

Thanks
Barry
