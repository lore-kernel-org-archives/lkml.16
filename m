Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5121F4CBE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744674034; cv=none; b=h6reIrXnEFfSeycj9ON/JZYDHP/ThIXhAPOilVa2fr6055impe4VPO3a+1stnKZJv0ECFaMw9b3iJjDNZ3GD0Dtv901Wgtiy7+aqycUgz7UKUZU0UnR1UjRiEC6JTUohyOL3dCBc5zDjxaOjLv7R47pZ1rKkFMv2z2OM2SupomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744674034; c=relaxed/simple;
	bh=v3SOwTl2r95Ney8s3d9zNXFL66CISZjaoynRKegj5yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+wM6PrIfXjL/uoozphkcTCapVxfDQ0lhMqbOOp8IpVHTetAQY6ZaMquSYl6thzd/U57Feb9EyglqngbMn3I9IQiJRNdgaX0Nl3gkEiIwYiD6XefiRNE+s7BQZL4D7+5OGb5HmrHDpavF5qr3BKmQMypu7tnwyvpYz+wguw3nEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJd/0lAU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJd/0lAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744674031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J2OiIsf2W8yk+5b++Qe2omt2QBDI07vwI1CVDpMYdO8=;
	b=cJd/0lAUV2BofAhfbyVjk+MYk6NbVaDfBz3KLCrzSsTEpn3qFFlYCMp31NvJ45vECyTv3C
	jwEVckvugoD/o8VfE8jPQ+Q5uHFFqaPca7bgJO7lRV4pf0wGzrXvkhyDXP27JDSVCT4Ohq
	2thOeyl2cZx8Wywz2lXDV1lxhprz2E8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-UwnTfiA1NAGaylCRXr9Lhw-1; Mon, 14 Apr 2025 19:40:28 -0400
X-MC-Unique: UwnTfiA1NAGaylCRXr9Lhw-1
X-Mimecast-MFC-AGG-ID: UwnTfiA1NAGaylCRXr9Lhw_1744674028
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e6e254127b2so1053869276.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744674028; x=1745278828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2OiIsf2W8yk+5b++Qe2omt2QBDI07vwI1CVDpMYdO8=;
        b=cWaZrAhXcNPyG/ThO9/AxDsY1/nmuffKjg96BD0HKry5jKqNJBex99bfIJJxuZpOqf
         LRs8wri1vo2xfTLlCdcxnIuQz3uavvQTMxEiDkg1/OhdK+H4zPIwKgiOrvIEdDWRiXHX
         cB1qQ78jMNCgMgZv2WB9N7iZVhNQzuvEwbFPgYRZ+K04UFydZjdQIoaIv73S/bf/AWH2
         7q6ySYRQ0yCbv1T9iIHQ1KTuZhCjLdl7VMEYYJ3s4UrrGNxCSrqkt6xxEFt/MChrfedK
         kHeXzb4wAzJd9X/O40cft5uinXVUjlQr6cmXUASQVn4+UqPBl39pEJXKDFZTZBlIZmp1
         JAdw==
X-Forwarded-Encrypted: i=1; AJvYcCVn9L8jKSdvCew7L9BFgijvbMw94vubbQbl4Xu4bC62IjuycBpFf483Zbe/Xk8QfOTdBd7gWDTMvKye/xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxBsYI9ltulYd4lVNWgRrSXs00kejWmzJ3/0QqhhfT9kBlhm9
	cSFrjXuTbz4VxjvahjTLBI/zVlkPNZagFf2hNxhpw8gD/r77ObclGkGYky+CJepBojwIEV3tJMA
	bEKhgUa/cjRTmJJujMSjSdFoX4SuqNBktvLX5RHgU7B7w75o87eZ8DPak2c8PMRVxW2eeLy0iNL
	bJPHqhY7aE5JFuqX38zrmlTz8JzdY3+nKHcfE5
X-Gm-Gg: ASbGncsriCTldMcVm9F2QFlI6nJW+SYygUchkxvm3ykL/tiPchqL2U8xxpQGAYICHTT
	rR5ZF+XTxSG6CQWEvsAVZ0OSeaprpU0OPb/xDako/VKjjBE76+Y6wA2q8Z1qfrCj3Gf/6roGwu9
	elNxfZucs=
X-Received: by 2002:a05:6902:1b81:b0:e60:9dd3:38c9 with SMTP id 3f1490d57ef6-e704de7aa84mr21194694276.7.1744674027838;
        Mon, 14 Apr 2025 16:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsa05k09ZEyzrJpdWgRU+tnATSjobx4Yocj67TnkEdOCqy2gsYruBCtGmLiUfT7BQ630Z7RXLReRvIiw2zlPI=
X-Received: by 2002:a05:6902:1b81:b0:e60:9dd3:38c9 with SMTP id
 3f1490d57ef6-e704de7aa84mr21194642276.7.1744674027458; Mon, 14 Apr 2025
 16:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414220557.35388-1-npache@redhat.com> <20250414220557.35388-7-npache@redhat.com>
 <CAA1CXcAo2gUmD8=0xKw-y=rLyUz0PyO7ObHB3ukG1LGikJY27g@mail.gmail.com>
In-Reply-To: <CAA1CXcAo2gUmD8=0xKw-y=rLyUz0PyO7ObHB3ukG1LGikJY27g@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 14 Apr 2025 17:40:01 -0600
X-Gm-Features: ATxdqUEqbiSySwg_g9kH4ICQWgseNWYHKE0lhhrHgMaiepLYzEBI-8jaq7Rw1iY
Message-ID: <CAA1CXcCKTEs4HBagtf4kJ+sUONWqutRC2OKoqY=n7iKd=R8zRQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 5:06=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
>
> On Mon, Apr 14, 2025 at 4:07=E2=80=AFPM Nico Pache <npache@redhat.com> wr=
ote:
> >
> > khugepaged scans PMD ranges for potential collapse to a hugepage. To ad=
d
> > mTHP support we use this scan to instead record chunks of fully utilize=
d
> > sections of the PMD.
> >
> > create a bitmap to represent a PMD in order MIN_MTHP_ORDER chunks.
> > by default we will set this to order 3. The reasoning is that for 4K 51=
2
> > PMD size this results in a 64 bit bitmap which has some optimizations.
> > For other arches like ARM64 64K, we can set a larger order if needed.
> >
> > khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
> > that represents chunks of utilized regions. We can then determine what
> > mTHP size fits best and in the following patch, we set this bitmap whil=
e
> > scanning the PMD.
> >
> > max_ptes_none is used as a scale to determine how "full" an order must
> > be before being considered for collapse.
> >
> > If a order is set to "always" lets always collapse to that order in a
> > greedy manner.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  include/linux/khugepaged.h |  4 ++
> >  mm/khugepaged.c            | 94 ++++++++++++++++++++++++++++++++++----
> >  2 files changed, 89 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
> > index 1f46046080f5..60d41215bc1a 100644
> > --- a/include/linux/khugepaged.h
> > +++ b/include/linux/khugepaged.h
> > @@ -1,6 +1,10 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> >  #ifndef _LINUX_KHUGEPAGED_H
> >  #define _LINUX_KHUGEPAGED_H
> > +#define KHUGEPAGED_MIN_MTHP_ORDER      3
> Somehow managed to drop
> #define KHUGEPAGED_MIN_MTHP_ORDER 2
> When cleaning up my patches.
>
> Sending a V4 of just this patch in reply to this email.
>
> Sorry for the noise...

Sorry more noise...

The #define KHUGEPAGED_MIN_MTHP_ORDER 2 fixup got merged into the
wrong commit, and is actually in 07/12. If we take this V4, the merge
will clean up the 07/12 commit with no additional changes.

If sending out a V4 of 07/12 is needed please let me know.
>
>
>
> > +#define KHUGEPAGED_MIN_MTHP_NR (1<<KHUGEPAGED_MIN_MTHP_ORDER)
> > +#define MAX_MTHP_BITMAP_SIZE  (1 << (ilog2(MAX_PTRS_PER_PTE) - KHUGEPA=
GED_MIN_MTHP_ORDER))
> > +#define MTHP_BITMAP_SIZE  (1 << (HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP=
_ORDER))
> >
> >  extern unsigned int khugepaged_max_ptes_none __read_mostly;
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index dfecedc6a515..5a3be30096fc 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -94,6 +94,11 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, M=
M_SLOTS_HASH_BITS);
> >
> >  static struct kmem_cache *mm_slot_cache __ro_after_init;
> >
> > +struct scan_bit_state {
> > +       u8 order;
> > +       u16 offset;
> > +};
> > +
> >  struct collapse_control {
> >         bool is_khugepaged;
> >
> > @@ -102,6 +107,18 @@ struct collapse_control {
> >
> >         /* nodemask for allocation fallback */
> >         nodemask_t alloc_nmask;
> > +
> > +       /*
> > +        * bitmap used to collapse mTHP sizes.
> > +        * 1bit =3D order KHUGEPAGED_MIN_MTHP_ORDER mTHP
> > +        */
> > +       DECLARE_BITMAP(mthp_bitmap, MAX_MTHP_BITMAP_SIZE);
> > +       DECLARE_BITMAP(mthp_bitmap_temp, MAX_MTHP_BITMAP_SIZE);
> > +       struct scan_bit_state mthp_bitmap_stack[MAX_MTHP_BITMAP_SIZE];
> > +};
> > +
> > +struct collapse_control khugepaged_collapse_control =3D {
> > +       .is_khugepaged =3D true,
> >  };
> >
> >  /**
> > @@ -851,10 +868,6 @@ static void khugepaged_alloc_sleep(void)
> >         remove_wait_queue(&khugepaged_wait, &wait);
> >  }
> >
> > -struct collapse_control khugepaged_collapse_control =3D {
> > -       .is_khugepaged =3D true,
> > -};
> > -
> >  static bool khugepaged_scan_abort(int nid, struct collapse_control *cc=
)
> >  {
> >         int i;
> > @@ -1118,7 +1131,8 @@ static int alloc_charge_folio(struct folio **foli=
op, struct mm_struct *mm,
> >
> >  static int collapse_huge_page(struct mm_struct *mm, unsigned long addr=
ess,
> >                               int referenced, int unmapped,
> > -                             struct collapse_control *cc)
> > +                             struct collapse_control *cc, bool *mmap_l=
ocked,
> > +                                 u8 order, u16 offset)
> >  {
> >         LIST_HEAD(compound_pagelist);
> >         pmd_t *pmd, _pmd;
> > @@ -1137,8 +1151,12 @@ static int collapse_huge_page(struct mm_struct *=
mm, unsigned long address,
> >          * The allocation can take potentially a long time if it involv=
es
> >          * sync compaction, and we do not need to hold the mmap_lock du=
ring
> >          * that. We will recheck the vma after taking it again in write=
 mode.
> > +        * If collapsing mTHPs we may have already released the read_lo=
ck.
> >          */
> > -       mmap_read_unlock(mm);
> > +       if (*mmap_locked) {
> > +               mmap_read_unlock(mm);
> > +               *mmap_locked =3D false;
> > +       }
> >
> >         result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
> >         if (result !=3D SCAN_SUCCEED)
> > @@ -1273,12 +1291,72 @@ static int collapse_huge_page(struct mm_struct =
*mm, unsigned long address,
> >  out_up_write:
> >         mmap_write_unlock(mm);
> >  out_nolock:
> > +       *mmap_locked =3D false;
> >         if (folio)
> >                 folio_put(folio);
> >         trace_mm_collapse_huge_page(mm, result =3D=3D SCAN_SUCCEED, res=
ult);
> >         return result;
> >  }
> >
> > +// Recursive function to consume the bitmap
> > +static int khugepaged_scan_bitmap(struct mm_struct *mm, unsigned long =
address,
> > +                       int referenced, int unmapped, struct collapse_c=
ontrol *cc,
> > +                       bool *mmap_locked, unsigned long enabled_orders=
)
> > +{
> > +       u8 order, next_order;
> > +       u16 offset, mid_offset;
> > +       int num_chunks;
> > +       int bits_set, threshold_bits;
> > +       int top =3D -1;
> > +       int collapsed =3D 0;
> > +       int ret;
> > +       struct scan_bit_state state;
> > +       bool is_pmd_only =3D (enabled_orders =3D=3D (1 << HPAGE_PMD_ORD=
ER));
> > +
> > +       cc->mthp_bitmap_stack[++top] =3D (struct scan_bit_state)
> > +               { HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP_ORDER, 0 };
> > +
> > +       while (top >=3D 0) {
> > +               state =3D cc->mthp_bitmap_stack[top--];
> > +               order =3D state.order + KHUGEPAGED_MIN_MTHP_ORDER;
> > +               offset =3D state.offset;
> > +               num_chunks =3D 1 << (state.order);
> > +               // Skip mTHP orders that are not enabled
> > +               if (!test_bit(order, &enabled_orders))
> > +                       goto next;
> > +
> > +               // copy the relavant section to a new bitmap
> > +               bitmap_shift_right(cc->mthp_bitmap_temp, cc->mthp_bitma=
p, offset,
> > +                                 MTHP_BITMAP_SIZE);
> > +
> > +               bits_set =3D bitmap_weight(cc->mthp_bitmap_temp, num_ch=
unks);
> > +               threshold_bits =3D (HPAGE_PMD_NR - khugepaged_max_ptes_=
none - 1)
> > +                               >> (HPAGE_PMD_ORDER - state.order);
> > +
> > +               //Check if the region is "almost full" based on the thr=
eshold
> > +               if (bits_set > threshold_bits || is_pmd_only
> > +                       || test_bit(order, &huge_anon_orders_always)) {
> > +                       ret =3D collapse_huge_page(mm, address, referen=
ced, unmapped, cc,
> > +                                       mmap_locked, order, offset * KH=
UGEPAGED_MIN_MTHP_NR);
> > +                       if (ret =3D=3D SCAN_SUCCEED) {
> > +                               collapsed +=3D (1 << order);
> > +                               continue;
> > +                       }
> > +               }
> > +
> > +next:
> > +               if (state.order > 0) {
> > +                       next_order =3D state.order - 1;
> > +                       mid_offset =3D offset + (num_chunks / 2);
> > +                       cc->mthp_bitmap_stack[++top] =3D (struct scan_b=
it_state)
> > +                               { next_order, mid_offset };
> > +                       cc->mthp_bitmap_stack[++top] =3D (struct scan_b=
it_state)
> > +                               { next_order, offset };
> > +                       }
> > +       }
> > +       return collapsed;
> > +}
> > +
> >  static int khugepaged_scan_pmd(struct mm_struct *mm,
> >                                    struct vm_area_struct *vma,
> >                                    unsigned long address, bool *mmap_lo=
cked,
> > @@ -1445,9 +1523,7 @@ static int khugepaged_scan_pmd(struct mm_struct *=
mm,
> >         pte_unmap_unlock(pte, ptl);
> >         if (result =3D=3D SCAN_SUCCEED) {
> >                 result =3D collapse_huge_page(mm, address, referenced,
> > -                                           unmapped, cc);
> > -               /* collapse_huge_page will return with the mmap_lock re=
leased */
> > -               *mmap_locked =3D false;
> > +                                           unmapped, cc, mmap_locked, =
HPAGE_PMD_ORDER, 0);
> >         }
> >  out:
> >         trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, refere=
nced,
> > --
> > 2.48.1
> >

