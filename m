Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6D28F1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391993; cv=none; b=nQAVaBlwVV0nAXZ5UBYnmgT2Iq8qZLLL/1R1ZhWI0GK37jAVGIgb6BebtnMS63Yle6zBKsg1axABRKyFZFZP4XEYkM6q416Ttp8eMaiwW6c5VsBt8/l0z0BkZsdrXR1Ab4dPaEkNdl3jUj69s2tlAGyQhzAG+v9Xz2aQO19OJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391993; c=relaxed/simple;
	bh=lLqKv0R0kL0eb+FWIFo3ut3HXEE8IuEBwVZOyXaE33w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyu76Q4LJlOqMGXnLlHxPKu4SiZzDrrhIepds489EqK1A+gCtpqEvpU6DRtEdce12x4x9uXbUphGsfRLEj/DS6gfNzJKKAbVIFvllhXZ6EvweZGVsPEhAj0JN7jjg3DBLFHg4bmnPr7BJZZ2J018sLAhsVTlDhzNmhLGH7xS5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiL+pLVl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiL+pLVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745391990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1JjUTR5AO6/ELifNnwiuDnWLUGlhgp/n6mKbz4s1r8=;
	b=AiL+pLVl20R4ZqgGLF1Y1/qrd4dAeh/46BoyGDEsf6uhPwTZrPAkzb28FkX1F1PP9X9Te3
	7WwHT8DI5X0PxHc53U4xQFU9T3A9WuHFR7t/T1JDFlrr3w6nslp7lAecx74kS7jXLfPld2
	9Usu5bjChYvlnyxso+lPc3iLarnNQVw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-fFHn3pImPW-xp636WpdAhA-1; Wed, 23 Apr 2025 03:06:28 -0400
X-MC-Unique: fFHn3pImPW-xp636WpdAhA-1
X-Mimecast-MFC-AGG-ID: fFHn3pImPW-xp636WpdAhA_1745391988
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7071dd5dbc1so65462967b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391988; x=1745996788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1JjUTR5AO6/ELifNnwiuDnWLUGlhgp/n6mKbz4s1r8=;
        b=k2uqJYOX3uaUXe1QGWwDB1sG4nGBsbCwKn7FMlmm/9W3LlDWSz64qwafI0vtuglNjo
         PXSTlVM06iWICy/1pHme8UhsRKTHubZKa2e0Q7UBr9Al+8K+A63r6yXjGl06uMW9YCY7
         8iCLMVDD9vqeUHnFdDfNtL+qIsZ6nQSn4mSa/WaWDCU7mWxVvgZpMjWNEHa+qJJLvSud
         5IPk07QSEwaOAouA4qGTWjqQs7l54usYx+yV6PESHMBcduMaTHIFU2QoTx0JO9+NB7lt
         EeEqF/H0G63qpk6mFPTDTe82PVuhlYf4wEjs6TPdqr278jWpOimDH1T0f3dn1VSmq806
         jHkw==
X-Forwarded-Encrypted: i=1; AJvYcCXBLoUO/8St47rq93W6lVL3pHJ/BbcEq/MwCEavoCKUMPlbxzSXhEMr22GK4JnnYSd/vi4k89EBlRYkwGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkymUx4tsFSbJVpx/ZJs+LCFaEc1+fajjg1XME2aSziuz7+fYp
	DbJsFbZH00vsqEyWLCgcBQZ2HLfoH88XdXrCN+l4gCh3s5wYLpe7jp2SC1wr6JibVTNQNH+Q5BW
	Ae2q15Qgaj5VeTBLgsBgB6t9Gv0xJ6g3OWZFGvp9EZHS6+w+K3mBRTcDeEB0R1xjAIVq0F2l02I
	E3bYBhbuiEnbpMJaMwEke9JNT5RF/Uu3X+wAuE
X-Gm-Gg: ASbGnctRkqftmrShax8BA3Ip40OIiIoruOAvSMWpFJ1mSzs9b1QZwJdBcY4AMWiXQto
	cxtcbKTg6omx5cCnzPz7V2cflOByTPDOX6kpZQhK6cUAYxMJMBMqMcRsSdX/XAGE3iRz10HVyof
	igulLRwSc=
X-Received: by 2002:a05:6902:c10:b0:e6d:f41c:6bdb with SMTP id 3f1490d57ef6-e7297d93324mr23626283276.6.1745391988147;
        Wed, 23 Apr 2025 00:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn1zWiBl7mj2ZHMbPzEt4TQGJA7ZA52O1IykfzgHQk9rLrJ75DUXlgd4SeW7i6QSPYXTpfssBeJp5N7K7bY+g=
X-Received: by 2002:a05:6902:c10:b0:e6d:f41c:6bdb with SMTP id
 3f1490d57ef6-e7297d93324mr23626241276.6.1745391987773; Wed, 23 Apr 2025
 00:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-2-npache@redhat.com>
 <a881ed65-351a-469f-b625-a3066d0f1d5c@linux.alibaba.com>
In-Reply-To: <a881ed65-351a-469f-b625-a3066d0f1d5c@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 23 Apr 2025 01:06:01 -0600
X-Gm-Features: ATxdqUHpjU8S0MShRUQwhPVFS5hZ7SZaiRUxbW-9PYZFjeXZxNqacPcUS1Nsk1c
Message-ID: <CAA1CXcC+QrDJ0XkjX5MqwRGgHh6Q1jXSmBqLgaOnz_FZY6dQLg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] introduce khugepaged_collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 12:44=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/17 08:02, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create khugepaged_collapse_single_pmd to increase code
> > reuse and create an entry point for future khugepaged changes.
> >
> > Refactor madvise_collapse and khugepaged_scan_mm_slot to use
> > the new khugepaged_collapse_single_pmd function.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> Can you add a prefix 'khugepaged:' for the subject line?
I had that originally but the subject line is already extremely long.
>
> > ---
> >   mm/khugepaged.c | 92 ++++++++++++++++++++++++------------------------=
-
> >   1 file changed, 46 insertions(+), 46 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index b8838ba8207a..cecadc4239e7 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2363,6 +2363,48 @@ static int hpage_collapse_scan_file(struct mm_st=
ruct *mm, unsigned long addr,
> >   }
> >   #endif
> >
> > +/*
> > + * Try to collapse a single PMD starting at a PMD aligned addr, and re=
turn
> > + * the results.
> > + */
> > +static int khugepaged_collapse_single_pmd(unsigned long addr,
> > +                                struct vm_area_struct *vma, bool *mmap=
_locked,
> > +                                struct collapse_control *cc)
> > +{
> > +     int result =3D SCAN_FAIL;
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +     unsigned long tva_flags =3D cc->is_khugepaged ? TVA_ENFORCE_SYSFS=
 : 0;
> > +
> > +     if (thp_vma_allowable_order(vma, vma->vm_flags,
> > +                                     tva_flags, PMD_ORDER)) {
>
> We've already checked the thp_vma_allowable_order() before calling this
> function, why check again?
>
> > +             if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
> > +                     struct file *file =3D get_file(vma->vm_file);
> > +                     pgoff_t pgoff =3D linear_page_index(vma, addr);
> > +
> > +                     mmap_read_unlock(mm);
> > +                     *mmap_locked =3D false;
> > +                     result =3D hpage_collapse_scan_file(mm, addr, fil=
e, pgoff,
> > +                                                       cc);
> > +                     fput(file);
> > +                     if (result =3D=3D SCAN_PTE_MAPPED_HUGEPAGE) {
> > +                             mmap_read_lock(mm);
> > +                             if (hpage_collapse_test_exit_or_disable(m=
m))
> > +                                     goto end;
> > +                             result =3D collapse_pte_mapped_thp(mm, ad=
dr,
> > +                                                              !cc->is_=
khugepaged);
>
> why drop the following check?
> if (*result =3D=3D SCAN_PMD_MAPPED)
>         *result =3D SCAN_SUCCEED;

Good catch! When generalizing this for madvise_collapse i forgot to
properly handle the khugepaged case of PMD_MAPPED=3D=3DSUCCEED.
>
> > +                             mmap_read_unlock(mm);
> > +                     }
> > +             } else {
> > +                     result =3D hpage_collapse_scan_pmd(mm, vma, addr,
> > +                                                      mmap_locked, cc)=
;
> > +             }
> > +             if (cc->is_khugepaged && result =3D=3D SCAN_SUCCEED)
> > +                     ++khugepaged_pages_collapsed;
> > +     }
> > +end:
> > +     return result;
> > +}
> > +
> >   static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *=
result,
> >                                           struct collapse_control *cc)
> >       __releases(&khugepaged_mm_lock)
> > @@ -2437,33 +2479,9 @@ static unsigned int khugepaged_scan_mm_slot(unsi=
gned int pages, int *result,
> >                       VM_BUG_ON(khugepaged_scan.address < hstart ||
> >                                 khugepaged_scan.address + HPAGE_PMD_SIZ=
E >
> >                                 hend);
> > -                     if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous=
(vma)) {
> > -                             struct file *file =3D get_file(vma->vm_fi=
le);
> > -                             pgoff_t pgoff =3D linear_page_index(vma,
> > -                                             khugepaged_scan.address);
> >
> > -                             mmap_read_unlock(mm);
> > -                             mmap_locked =3D false;
> > -                             *result =3D hpage_collapse_scan_file(mm,
> > -                                     khugepaged_scan.address, file, pg=
off, cc);
> > -                             fput(file);
> > -                             if (*result =3D=3D SCAN_PTE_MAPPED_HUGEPA=
GE) {
> > -                                     mmap_read_lock(mm);
> > -                                     if (hpage_collapse_test_exit_or_d=
isable(mm))
> > -                                             goto breakouterloop;
> > -                                     *result =3D collapse_pte_mapped_t=
hp(mm,
> > -                                             khugepaged_scan.address, =
false);
> > -                                     if (*result =3D=3D SCAN_PMD_MAPPE=
D)
> > -                                             *result =3D SCAN_SUCCEED;
> > -                                     mmap_read_unlock(mm);
> > -                             }
> > -                     } else {
> > -                             *result =3D hpage_collapse_scan_pmd(mm, v=
ma,
> > -                                     khugepaged_scan.address, &mmap_lo=
cked, cc);
> > -                     }
> > -
> > -                     if (*result =3D=3D SCAN_SUCCEED)
> > -                             ++khugepaged_pages_collapsed;
> > +                     *result =3D khugepaged_collapse_single_pmd(khugep=
aged_scan.address,
> > +                                             vma, &mmap_locked, cc);
>
> If the khugepaged_collapse_single_pmd() returns a failure caused by
> hpage_collapse_test_exit_or_disable(), we should break out of the loop
> according to the original logic. But you've changed the action in this
> patch, is this intentional?

Nope, not intentional! Thanks for pointing that out. I'll get that fixed!

Thanks for the in depth review ! I'll work on cleaning up these corner case=
s.
>
> >
> >                       /* move to next address */
> >                       khugepaged_scan.address +=3D HPAGE_PMD_SIZE;
> > @@ -2783,36 +2801,18 @@ int madvise_collapse(struct vm_area_struct *vma=
, struct vm_area_struct **prev,
> >               mmap_assert_locked(mm);
> >               memset(cc->node_load, 0, sizeof(cc->node_load));
> >               nodes_clear(cc->alloc_nmask);
> > -             if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
> > -                     struct file *file =3D get_file(vma->vm_file);
> > -                     pgoff_t pgoff =3D linear_page_index(vma, addr);
> >
> > -                     mmap_read_unlock(mm);
> > -                     mmap_locked =3D false;
> > -                     result =3D hpage_collapse_scan_file(mm, addr, fil=
e, pgoff,
> > -                                                       cc);
> > -                     fput(file);
> > -             } else {
> > -                     result =3D hpage_collapse_scan_pmd(mm, vma, addr,
> > -                                                      &mmap_locked, cc=
);
> > -             }
> > +             result =3D khugepaged_collapse_single_pmd(addr, vma, &mma=
p_locked, cc);
> > +
> >               if (!mmap_locked)
> >                       *prev =3D NULL;  /* Tell caller we dropped mmap_l=
ock */
> >
> > -handle_result:
> >               switch (result) {
> >               case SCAN_SUCCEED:
> >               case SCAN_PMD_MAPPED:
> >                       ++thps;
> >                       break;
> >               case SCAN_PTE_MAPPED_HUGEPAGE:
> > -                     BUG_ON(mmap_locked);
> > -                     BUG_ON(*prev);
> > -                     mmap_read_lock(mm);
> > -                     result =3D collapse_pte_mapped_thp(mm, addr, true=
);
> > -                     mmap_read_unlock(mm);
> > -                     goto handle_result;
> > -             /* Whitelisted set of results where continuing OK */
> >               case SCAN_PMD_NULL:
> >               case SCAN_PTE_NON_PRESENT:
> >               case SCAN_PTE_UFFD_WP:
>

