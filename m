Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B528001D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543105; cv=none; b=blXcbRn3z7j0hF1UuSxg49xdgw1IEsDU6fcafq3zRuJNtvHiv6NqG0aL/hjZ80wHz0mRYysAXFMBYRVvTosay11e8gJCREuF8CkC3SJFiFfBqnfwF+8VUTjSknXnwZc56pnADAvpBl1iomJjf+Gwggz3WZjaay8EbjQ//iQ1N6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543105; c=relaxed/simple;
	bh=j6uHppOZRIiGHJjS980e7EsQXN6AMcGV6U3JMTlj7II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xye8RdlsilnVsWjt30ukGQ5qWy4YWAlMt+GMj5zX+MH6GVha92Ddnrtc7UB25bF1gsjRkcu/GwcH/9KQFLn5+LYmdBiolyrEiSGKAInmzirA2UN6XVlX/kLAfBx46XE12qoXfpg4D9LAvXJJ8EZixOjKi/8Blbex91BLq4rDqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVrgK5yv; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVrgK5yv"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-530f9edd032so1644683e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543102; x=1750147902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn0wbc6lEUEago4mKd8U5pWPg4kTjjsOa+9yDlNZsgQ=;
        b=eVrgK5yvnCZAdJB3054NRuUcXR+DmVY1cI6Cj9UmRNMzm8/X0PBam4caaaf/fzL/nN
         sqRUYir+Y1M9sqkavozIYiybbfkGp+TiXeinkxsA9HbXeMqdDZfeUgPwzvrn+QmoVsAW
         6zuW1dIqDYms4SNuYDb3pUCJXNdsypXJJqJmiIp8oWB18aGx7GAwGvYMUBvLLLxqPkW7
         htpsXiCsDjx9rTAGC7eOnLoyQZxrkEoQl8hNAGasbItANN/h3I6BGqeRcfiZCU4rO0vl
         mVFO2mH2hlT0J2fF2sVrdNipRRHxrQyhF0O2kTb+m1Exv3B/8LHOTZN0DvwNmOGlglXm
         q22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543102; x=1750147902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn0wbc6lEUEago4mKd8U5pWPg4kTjjsOa+9yDlNZsgQ=;
        b=KPxBC1NCQ98KC+oANDpB0ed9KX1MQ2JpwXAQiifzJsWlgNXIa41H2F1e6ghNcmuiiq
         HTRGeQ21tRopzY+ij2Suxaf4ishfzfiYXSeSPhv1MYj7T+NETUtwrQo8Rhs2wAIPRcOm
         77CUiQnrN3DlPcSuYLhCa/MP6bD5WeOmlQ/gyahp7/pS1LfxCMWHhN0FWwUuctK+0RIO
         X0Gss7t82jWooqkbgl366PFizIQROgaLE/Lbc7CtLY5ZuojG1mHBoOYWqrtWUS0gpSEk
         mX9JKjkhoySbmCW5dqsVdaWbo6UsEqDdpq4+bpY7myjvdbXV9CKsbF4rP9INonvcVkW5
         Uy9A==
X-Forwarded-Encrypted: i=1; AJvYcCWgZvdvfgSKtxvuG/vJNPQmKj54KXL47fAvcJOvKNj/tRupC/soPx601m/0bl5Slmhv++Bbdue1d8Q974Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJdLSD14zy4BaodWUUkuEHpYyR8/JrfvTRbH/g+mAHY7NgKXZ2
	yAGHQpFttviE63DQ56p80oQk8ApmPbCkmpXC94YlsW8lBZ41qCcT5kJ6uSNwbwwGnd6a9x594l1
	fTjs0E8hqm+nxC81vz1/7LVEaOheAPz0=
X-Gm-Gg: ASbGncsJ5bZLzbk+jUu+/c/8MsA6ozJOFm2Y2SELOOPAawrfhQZh3fzl+CXsYLQHdEF
	QfO4mBiOIQ+TQdJmw5RyJy/+wiUxUK+qHc2a08uZtplakQWBy7G8vH9I2s/rSnivV1a7TV4dZ4U
	chlBOEfPVe2FIBqUjia9zDmzl2PBpWEUBbkRjEaFHGXY+o
X-Google-Smtp-Source: AGHT+IEGEzAEtu+csMPWQWNFbl6NTrSKQH12N5HlKYz4Yle+6IUBkcQBSSs5CYZOqK6bq7ZiDaDQbfD/sAZmujBm5Sg=
X-Received: by 2002:a05:6122:640c:10b0:527:67d9:100d with SMTP id
 71dfb90a1353d-53113144d99mr1287762e0c.4.1749543102357; Tue, 10 Jun 2025
 01:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610035043.75448-1-dev.jain@arm.com> <20250610035043.75448-3-dev.jain@arm.com>
 <CAGsJ_4xPq-eJ7JE-SFhhO2TboH8HKGifaYCwKw8cqd_2K=uD4w@mail.gmail.com> <bf185ecc-8310-48ad-b9cc-5c78e3da6d0b@arm.com>
In-Reply-To: <bf185ecc-8310-48ad-b9cc-5c78e3da6d0b@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 10 Jun 2025 20:11:31 +1200
X-Gm-Features: AX0GCFvDGDuDSnfkPf-NWYVXTiddf4fI4DcZ1MZ9I4Kd1QbrYWe3BlRqTTWLwRs
Message-ID: <CAGsJ_4yEJLoxuH=tTJLxgsS5Hu6pPhJfwXAttoFrHNUwJL6=YA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mm: Optimize mremap() by PTE batching
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org, 
	libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com, 
	anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com, 
	yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com, 
	hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:45=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 10/06/25 12:33 pm, Barry Song wrote:
> > Hi Dev,
> >
> > On Tue, Jun 10, 2025 at 3:51=E2=80=AFPM Dev Jain <dev.jain@arm.com> wro=
te:
> >> Use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> >> are painted with the contig bit, then ptep_get() will iterate through =
all 16
> >> entries to collect a/d bits. Hence this optimization will result in a =
16x
> >> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear(=
)
> >> will eventually call contpte_try_unfold() on every contig block, thus
> >> flushing the TLB for the complete large folio range. Instead, use
> >> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, a=
nd only
> >> do them on the starting and ending contig block.
> >>
> >> For split folios, there will be no pte batching; nr_ptes will be 1. Fo=
r
> >> pagetable splitting, the ptes will still point to the same large folio=
;
> >> for arm64, this results in the optimization described above, and for o=
ther
> >> arches (including the general case), a minor improvement is expected d=
ue to
> >> a reduction in the number of function calls.
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >> ---
> >>   mm/mremap.c | 39 ++++++++++++++++++++++++++++++++-------
> >>   1 file changed, 32 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/mm/mremap.c b/mm/mremap.c
> >> index 180b12225368..18b215521ada 100644
> >> --- a/mm/mremap.c
> >> +++ b/mm/mremap.c
> >> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
> >>          return pte;
> >>   }
> >>
> >> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigne=
d long addr,
> >> +               pte_t *ptep, pte_t pte, int max_nr)
> >> +{
> >> +       const fpb_t flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY=
;
> >> +       struct folio *folio;
> >> +
> >> +       if (max_nr =3D=3D 1)
> >> +               return 1;
> >> +
> >> +       folio =3D vm_normal_folio(vma, addr, pte);
> >> +       if (!folio || !folio_test_large(folio))
> > I'm curious about the following case:
> > If the addr/ptep is not the first subpage of the folio=E2=80=94for exam=
ple, the
> > 14th subpage=E2=80=94will mremap_folio_pte_batch() return 3?
>
> It will return the number of PTEs, starting from the PTE pointing to the =
14th
> subpage, that point to consecutive pages of the same large folio, up till=
 max_nr.
> For an example, if we are operating on a single large folio of order 4, t=
hen max_nr
> will be 16 - 14 + 1 =3D 3. So in this case we will return 3, since the 14=
th, 15th and
> 16th PTE point to consec pages of the same large folio.
>
> > If so, get_and_clear_full_ptes() would operate on 3 subpages of the fol=
io.
> > In that case, can unfold still work correctly?
>
> Yes, first we unfold as in, we do a BBM sequence: cont -> clear -> non-co=
nt.
> Then, on this non-contig block, we will clear only the PTEs which were as=
ked
> for us to do.

While going through the code,

static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
                                unsigned long addr, pte_t *ptep,
                                unsigned int nr, int full)
{
        pte_t pte;
        if (likely(nr =3D=3D 1)) {
                contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
                pte =3D __get_and_clear_full_ptes(mm, addr, ptep, nr, full)=
;
        } else {
                pte =3D contpte_get_and_clear_full_ptes(mm, addr, ptep, nr,=
 full);
        }

        return pte;
}

Initially, I thought it only unfolded when nr =3D=3D 1, but after reading
contpte_get_and_clear_full_ptes more closely, I realized we do
support partial unfolding=E2=80=94that's what I had missed.

pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
                                unsigned long addr, pte_t *ptep,
                                unsigned int nr, int full)
{
        contpte_try_unfold_partial(mm, addr, ptep, nr);
        return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
}

I think you are right.

>
> >
> > Similarly, if the addr/ptep points to the first subpage, but max_nr is
> > less than CONT_PTES, what will happen in that case?
> >
> >
> >> +               return 1;
> >> +
> >> +       return folio_pte_batch(folio, addr, ptep, pte, max_nr, flags, =
NULL,
> >> +                              NULL, NULL);
> >> +}
> >> +
> >>   static int move_ptes(struct pagetable_move_control *pmc,
> >>                  unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
> >>   {
> >> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control=
 *pmc,
> >>          bool need_clear_uffd_wp =3D vma_has_uffd_without_event_remap(=
vma);
> >>          struct mm_struct *mm =3D vma->vm_mm;
> >>          pte_t *old_ptep, *new_ptep;
> >> -       pte_t pte;
> >> +       pte_t old_pte, pte;
> >>          pmd_t dummy_pmdval;
> >>          spinlock_t *old_ptl, *new_ptl;
> >>          bool force_flush =3D false;
> >> @@ -185,6 +202,8 @@ static int move_ptes(struct pagetable_move_control=
 *pmc,
> >>          unsigned long new_addr =3D pmc->new_addr;
> >>          unsigned long old_end =3D old_addr + extent;
> >>          unsigned long len =3D old_end - old_addr;
> >> +       int max_nr_ptes;
> >> +       int nr_ptes;
> >>          int err =3D 0;
> >>
> >>          /*
> >> @@ -236,14 +255,16 @@ static int move_ptes(struct pagetable_move_contr=
ol *pmc,
> >>          flush_tlb_batched_pending(vma->vm_mm);
> >>          arch_enter_lazy_mmu_mode();
> >>
> >> -       for (; old_addr < old_end; old_ptep++, old_addr +=3D PAGE_SIZE=
,
> >> -                                  new_ptep++, new_addr +=3D PAGE_SIZE=
) {
> >> +       for (; old_addr < old_end; old_ptep +=3D nr_ptes, old_addr +=
=3D nr_ptes * PAGE_SIZE,
> >> +               new_ptep +=3D nr_ptes, new_addr +=3D nr_ptes * PAGE_SI=
ZE) {
> >>                  VM_WARN_ON_ONCE(!pte_none(*new_ptep));
> >>
> >> -               if (pte_none(ptep_get(old_ptep)))
> >> +               nr_ptes =3D 1;
> >> +               max_nr_ptes =3D (old_end - old_addr) >> PAGE_SHIFT;
> >> +               old_pte =3D ptep_get(old_ptep);
> >> +               if (pte_none(old_pte))
> >>                          continue;
> >>
> >> -               pte =3D ptep_get_and_clear(mm, old_addr, old_ptep);
> >>                  /*
> >>                   * If we are remapping a valid PTE, make sure
> >>                   * to flush TLB before we drop the PTL for the
> >> @@ -255,8 +276,12 @@ static int move_ptes(struct pagetable_move_contro=
l *pmc,
> >>                   * the TLB entry for the old mapping has been
> >>                   * flushed.
> >>                   */
> >> -               if (pte_present(pte))
> >> +               if (pte_present(old_pte)) {
> >> +                       nr_ptes =3D mremap_folio_pte_batch(vma, old_ad=
dr, old_ptep,
> >> +                                                        old_pte, max_=
nr_ptes);
> >>                          force_flush =3D true;
> >> +               }
> >> +               pte =3D get_and_clear_full_ptes(mm, old_addr, old_ptep=
, nr_ptes, 0);
> >>                  pte =3D move_pte(pte, old_addr, new_addr);
> >>                  pte =3D move_soft_dirty_pte(pte);
> >>
> >> @@ -269,7 +294,7 @@ static int move_ptes(struct pagetable_move_control=
 *pmc,
> >>                                  else if (is_swap_pte(pte))
> >>                                          pte =3D pte_swp_clear_uffd_wp=
(pte);
> >>                          }
> >> -                       set_pte_at(mm, new_addr, new_ptep, pte);
> >> +                       set_ptes(mm, new_addr, new_ptep, pte, nr_ptes)=
;
> >>                  }
> >>          }
> >>
> >> --
> >> 2.30.2

Thanks
Barry
