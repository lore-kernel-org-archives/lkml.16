Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB552AC17
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655840; cv=none; b=Gn6r7jxLCSfaiEJbg7ymEEabqAoe3Bwmy0ouXCg8wFlQ9gEd3HbjdW8Ce8pjxRza/A/5jA0AtMBg7Tp5Z7qnwvsRTXstfHZOKFFPnqfGEjGYpN5triHoOaJ2+FvhWMji1n0x2U0YW7Eo90itpj4CRFTx46X9LmvQ5ATdfpWj5aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655840; c=relaxed/simple;
	bh=XyqGG5O0Jd1QoaDB8tXO+ZFlOe+jYzkht1EPfeiWTGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vESx/V4ZQYwMHwdy/pUd+AVYbt7B3zkfgcsmSWwTTiWlVjG7ab5XCA4YpWUXp8dTtBTFYnLK7Fh0yvnLXi1QajBDhhuhpo2rrtP3ZZ4zjjnBv53RENDiIetsraRg54KHzPh8g2fL49xsF5FuFz2r9zLOpYnNa3zrLSl116L+XsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuMBmCdN; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuMBmCdN"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e1779de654so605006137.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655837; x=1748260637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iL8SSoPTf+h+2fWHyjND1bGGDDWafnZ04LXRcbQOsBY=;
        b=OuMBmCdNIeZRdtt4h5nci1PxYZpTWbrhdXM3uzPbS1Pat8oELD7Go7By6Edt5NPkao
         UMnWs9MYfS3bIGhtSyaRAatms7AtTs8lQf0DGJZcorGCyaHa2axEhVXbLAAUJ8POLRk9
         7Rzfrit2zcLzBxCYNZx6HWq3GyXrdE0Rr6W5kAuAzfg2zlSk0M7pDx5fgST2whC+UoXi
         WsnoR7d3WLhIHWPimeLOqcyhu7dpy7mVqQtFyau8C6a9txJUCZdCHCZwy3Ah/TVj3/Id
         eWQtKmLJa7UUo4eOeRlrCdDUzyn7PgzfUUlDHOuhP5UA4kpMMd1SMTm9EHBavxNOZcyd
         S51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655837; x=1748260637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL8SSoPTf+h+2fWHyjND1bGGDDWafnZ04LXRcbQOsBY=;
        b=T5+CxWkYjdSZlYr96kUWslgSj7bLFw1AanE3Cpmvs0bF3x02Xz0R1zuoa1Zfxx+zC1
         lYfzSDIRfIh39ynOwsR7M8cTjym5NjeNxfHtM7DTX+6b8RfW6CHmUueu0Hw2VzynFc/8
         e3fHeYH8Dk8RF3dBOtMiTOWNH4MiPanQ0TlJFD64gpDe0DcBuoWRbFV49/rdxZMbUA5c
         GmWN7j6+nT8nMj6b1HHb5rZx8iKsipIj2ehERkbkhcapf4GvQAVvpSMt9GtNeKYCANBs
         Y7V6oQMwgZtEn2kSzr6eWn2L4N5G1ZxbI9Gf97pD+WLbg78uGO4UQOqbKbH8Rvauh9RF
         ic8A==
X-Forwarded-Encrypted: i=1; AJvYcCXt+k8EF13S6G14YrR0CkdxN/GJimCLUS8+LkLdRYNo5Ku2HUaojP5o1MP2Ut41zfXMYKcM2P+Ckqy2nYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdTHjx7vV6HAYmbOLyBiJ8ybsOXrm1fC8KJddV3d5ofXl1dRbx
	guNKCd4R5EwvHMPkQ6Z4gzJdfZQWEKuPiGmx5IRBIkvRiRMgTIsIKNEKhu2zT6Jt3ykjNilX602
	CZohRyoIZBSmvsMYItNWvjgd+Cp5E0VYrzc2T
X-Gm-Gg: ASbGncsGufuu7Jc6nbcre/V9D1TYGwISDa1/EipC4bivZHyHjTRP7u4t1in9sFHiHnb
	HTKGVn7wZxjAVCiOIS8LN7YTEpUR6Q9SUyn4tNTNaiQxusWXMU+T2CZwggagm21MR+AFg/wIZHN
	CMZTAvx0njxyeSY5t8+J0foUesrJhx32vhpA==
X-Google-Smtp-Source: AGHT+IHS+YfZKWqmaKo9RToqcSHKUN3WXU6nex26fqkeRtKeG8caA3vTeQELrTJbfcJ+4R/a6LAjgwo50C0q69tWC/Y=
X-Received: by 2002:a05:6102:15a2:b0:4c1:9780:3830 with SMTP id
 ada2fe7eead31-4e053c6d5cemr9518137137.23.1747655837341; Mon, 19 May 2025
 04:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-12-ryncsn@gmail.com> <20250519070801.2588-1-21cnbao@gmail.com>
 <CAMgjq7CMrRc=BPy=-H9UiHDHTv1drOq7fkruKHq4Tvh1FxM_sA@mail.gmail.com>
In-Reply-To: <CAMgjq7CMrRc=BPy=-H9UiHDHTv1drOq7fkruKHq4Tvh1FxM_sA@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 19 May 2025 19:57:06 +0800
X-Gm-Features: AX0GCFu_mDgXvOG7bNTnWkzRUodvZ6RNM2XcP0E2b5OEfVYbHmdfT-JTt_liJZo
Message-ID: <CAGsJ_4wQBG+kNuqgWs5+V+pyJGGN3ok=fJd0caub18CiUSOLwg@mail.gmail.com>
Subject: Re: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP
 swapin check
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, bhe@redhat.com, 
	chrisl@kernel.org, david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 7:10=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Mon, May 19, 2025 at 3:08=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > > From: Kairui Song <kasong@tencent.com>
> >
> >
> > > -static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr=
_pages)
> > > +static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep,
> > > +                        unsigned long addr, unsigned int nr_pages)
> >
> > > +     if (unlikely(addr < max(addr & PMD_MASK, vmf->vma->vm_start) ||
> > > +                  addr_end > pmd_addr_end(addr, vmf->vma->vm_end)))
> >
> >
> > > @@ -4731,27 +4732,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >       page_idx =3D 0;
> > >       address =3D vmf->address;
> > >       ptep =3D vmf->pte;
> > > +
> > >       if (folio_test_large(folio) && folio_test_swapcache(folio)) {
> > > -             int nr =3D folio_nr_pages(folio);
> > > +             unsigned long nr =3D folio_nr_pages(folio);
> > >               unsigned long idx =3D folio_page_idx(folio, page);
> > > -             unsigned long folio_start =3D address - idx * PAGE_SIZE=
;
> > > -             unsigned long folio_end =3D folio_start + nr * PAGE_SIZ=
E;
> > > -             pte_t *folio_ptep;
> > > -             pte_t folio_pte;
> > > +             unsigned long folio_address =3D address - idx * PAGE_SI=
ZE;
> > > +             pte_t *folio_ptep =3D vmf->pte - idx;
> > >
> > > -             if (unlikely(folio_start < max(address & PMD_MASK, vma-=
>vm_start)))
> > > -                     goto check_folio;
> >
> > We are handling a corner case a large folio is remapped to an unaligned=
 address.
> > For example,
> >
> > A 64KiB mTHP at address:  XGB + 2MB +4KB,
> >
> > Its start address will be XGB + 2MB - 60KB which is another PMD.
> >
> > The previous code will return false; now your can_swapin_thp() will ret=
urn true
> > as you are using XGB + 2MB - 60KB as the argument "addr" in can_swapin_=
thp().
>
> Thanks very much for the info and explanation.
>
> You are right, I need to keep using vmf->address in can_swapin_thp:
>
> if (unlikely(addr < max(vmf->address & PMD_MASK, vmf->vma->vm_start) ||
>      addr_end > pmd_addr_end(vmf->address, vmf->vma->vm_end)))
> return false;
>
> But one thing I'm not so sure is how that happens? And there isn't an
> address checking in the direct swapin mTHP check above?

In page faults, we always make the start address aligned with
PAGE_SIZE * nr_pages.
but for a mremap, we can't actually control the dst address.

so the original code can exclude this case for direct mTHP swapin by
the below you are
dropping:

- if (unlikely(folio_start < max(address & PMD_MASK, vma->vm_start)))
-               goto check_folio;
- if (unlikely(folio_end > pmd_addr_end(address, vma->vm_end)))
-               goto check_folio;

Thanks
Barry
