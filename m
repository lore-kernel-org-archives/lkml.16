Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7889EEC3
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751179965; cv=none; b=FlSzsja9FeHbm0/KZvv5NE2dwFBDjq6buNMdxWwpL6Snttcr44fIwLQfopH9SYsbnRJAEKYt9F4poHl36r51pdjN0y/IVSFVeuQh+zRN6X9p01XnqejwTFrWnUXHRk4TK9qPj0gr8XdgQBN6+5znWTcKhb6iYmQg1YdD4/LWGcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751179965; c=relaxed/simple;
	bh=aG+3sDnTFlWtzx02Sf74IFYNroVWYH1wkRdG5vsGHrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SUgkWgrUGdeTHDppHECupjxm35u50p+xXl1Z4qbfm8oxZnMsYz5m9XXrft/3Dk6dhxfzr0nCmMBmfqq4tnUZmkaHVB0qy5Z7GtMYZZlSxBEwhrSpiM+iWfKMv8SHJgZwsEXFU2mg7SRS99vIO+Fb6be05VdJUOZgGKfF9JPU9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XK0TxYKi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XK0TxYKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751179962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYKXeabm4uMs6XSfO74X92NI0bG52d5ihWZ68rikNBA=;
	b=XK0TxYKizIQKzLYXJeHDy5RPODjm/L5WQ0gt9M0JQX0bGDDkOxV3YiwD0Bf+aCIrgF8XXD
	vs4ysWxeI+9HT4kOm5OxlO/neQYh6IKcGJvD24VaRWQSIcB5+CTEuNnAQbAD3pMCa6pthk
	yXGE3gwhXHHfu739uR8/3OBhqpcAr8E=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-kP6WsPUeMH-7xpsDTSu2PQ-1; Sun, 29 Jun 2025 02:52:40 -0400
X-MC-Unique: kP6WsPUeMH-7xpsDTSu2PQ-1
X-Mimecast-MFC-AGG-ID: kP6WsPUeMH-7xpsDTSu2PQ_1751179960
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-713ff70871dso12644247b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 23:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751179960; x=1751784760;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYKXeabm4uMs6XSfO74X92NI0bG52d5ihWZ68rikNBA=;
        b=tdWimUIu7h/xobviNwqX8QYrTlJ0jK6VaP6HRg0l2jgmog9dxlmGR/ubXKdLzdJgwC
         P04IlNBxx42bJtnVDsxqb503qWMewJdZelJ+4/TcfIefL+LzZ4UphHM6TMzZhfw2CdoJ
         4QDWvIe9rfGYc59b98T1vKmVgJgIGUxkUKI4IM6AhooAELflPFtOg7AcrEJJiZsMKhRR
         EOTJ7JgJabfrqqPm+fyjDkIdgvTzFb7YG10B/SjVaj73Qt8lLy8JGNBdz9RHxJFdfSY/
         kUW0TiOQqz1gOva41Dyv4hk2IBn97Sq8lG2G5ZYCtOFspApo3c5Jm2HwBIuqo5D0SXK7
         trJw==
X-Forwarded-Encrypted: i=1; AJvYcCVjscyf512ofsY7sAjvzvZ4xJF0aaLHJeT3ZKVb/8f09zcPoujWWA3hHSk/3wqnYoug1gAVu8GlsnmqnUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kCiOkqar65YPfW2H/C0HFJa5zz6Cxw9DVJRpRwnsAq85MnVf
	XjULavPxOR2kRRbtS1g5MyJswOL1PaJOOEGlQzdy3eauqzh6faLp4IhhGivl1Au7O0uXjyLOM4D
	KkBIzt0MYciwp4MMRUZPHzCUgaNq79sZFVSvJBKeXsakW8HXWD6URUGIl/u85iU7cl+reQHvqVp
	MJWyvUOEw2d47mM5Nscx9FDlkw9xc06hqy29vm9Pkt
X-Gm-Gg: ASbGncvtz4/HPe2FBJgV7iEKaWlGf52S3bmAf0jZk/fLlxdYTuqQhwOTWLZ273AHtjV
	p/l3Sq3YNrUdoU3lZMgHZ2jIRD2myvMN3rrksjAtFuz7l4TJ7RqKwE8aYwfiNVtWdGz660cQdtf
	non6IdfQ==
X-Received: by 2002:a05:690c:d8c:b0:70e:73ae:766d with SMTP id 00721157ae682-71517145944mr139960167b3.3.1751179960166;
        Sat, 28 Jun 2025 23:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV9tulolTDqeKx817OlO2V38cTNra+CLch7PoUZFn5KyoTzJyoZroREGy4iSbC8tLkIvc7uSniKycYnD1iKQ4=
X-Received: by 2002:a05:690c:d8c:b0:70e:73ae:766d with SMTP id
 00721157ae682-71517145944mr139960027b3.3.1751179959775; Sat, 28 Jun 2025
 23:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-4-npache@redhat.com>
 <5u5ealsawrsaybblcfqorwljb4delzlmcjhdd274333daxb4p2@m47iodmem2fg>
In-Reply-To: <5u5ealsawrsaybblcfqorwljb4delzlmcjhdd274333daxb4p2@m47iodmem2fg>
From: Nico Pache <npache@redhat.com>
Date: Sun, 29 Jun 2025 00:52:13 -0600
X-Gm-Features: Ac12FXwM1imoTwD6Lo2Sv9yym4xtJfMvJUshpuuhNpF_67zHIVGOwugkX3PYNkw
Message-ID: <CAA1CXcBQzgTeKcDN+p9fF14SmMJSzkRcKwdUB0jr_72etc+Rdw@mail.gmail.com>
Subject: Re: [PATCH v7 03/12] khugepaged: generalize hugepage_vma_revalidate
 for mTHP support
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 11:15=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Nico Pache <npache@redhat.com> [250514 23:23]:
> > For khugepaged to support different mTHP orders, we must generalize thi=
s
> > to check if the PMD is not shared by another VMA and the order is
> > enabled.
> >
> > No functional change in this patch.
>
> This patch needs to be with the functional change for git blame and
> reviewing the changes.
I don't think that is the case. I've seen many series' that piecemeal
their changes including separating out nonfunctional changes before
the actual functional change. A lot of small changes were required to
generalize this for mTHP collapse. Doing it all in one patch would
have made the mTHP support patch huge and noisy. I tried to make that
patch cleaner (for review purposes) by separating out some of the
noise.


-- Nico
>
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 5457571d505a..0c4d6a02d59c 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -920,7 +920,7 @@ static int khugepaged_find_target_node(struct colla=
pse_control *cc)
> >  static int hugepage_vma_revalidate(struct mm_struct *mm, unsigned long=
 address,
> >                                  bool expect_anon,
> >                                  struct vm_area_struct **vmap,
> > -                                struct collapse_control *cc)
> > +                                struct collapse_control *cc, int order=
)
> >  {
> >       struct vm_area_struct *vma;
> >       unsigned long tva_flags =3D cc->is_khugepaged ? TVA_ENFORCE_SYSFS=
 : 0;
> > @@ -934,7 +934,7 @@ static int hugepage_vma_revalidate(struct mm_struct=
 *mm, unsigned long address,
> >
> >       if (!thp_vma_suitable_order(vma, address, PMD_ORDER))
> >               return SCAN_ADDRESS_RANGE;
> > -     if (!thp_vma_allowable_order(vma, vma->vm_flags, tva_flags, PMD_O=
RDER))
> > +     if (!thp_vma_allowable_order(vma, vma->vm_flags, tva_flags, order=
))
> >               return SCAN_VMA_CHECK;
> >       /*
> >        * Anon VMA expected, the address may be unmapped then
> > @@ -1130,7 +1130,7 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >               goto out_nolock;
> >
> >       mmap_read_lock(mm);
> > -     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc);
> > +     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc, H=
PAGE_PMD_ORDER);
> >       if (result !=3D SCAN_SUCCEED) {
> >               mmap_read_unlock(mm);
> >               goto out_nolock;
> > @@ -1164,7 +1164,7 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
> >        * mmap_lock.
> >        */
> >       mmap_write_lock(mm);
> > -     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc);
> > +     result =3D hugepage_vma_revalidate(mm, address, true, &vma, cc, H=
PAGE_PMD_ORDER);
> >       if (result !=3D SCAN_SUCCEED)
> >               goto out_up_write;
> >       /* check if the pmd is still valid */
> > @@ -2782,7 +2782,7 @@ int madvise_collapse(struct vm_area_struct *vma, =
struct vm_area_struct **prev,
> >                       mmap_read_lock(mm);
> >                       mmap_locked =3D true;
> >                       result =3D hugepage_vma_revalidate(mm, addr, fals=
e, &vma,
> > -                                                      cc);
> > +                                                      cc, HPAGE_PMD_OR=
DER);
> >                       if (result  !=3D SCAN_SUCCEED) {
> >                               last_fail =3D result;
> >                               goto out_nolock;
> > --
> > 2.49.0
> >
>

