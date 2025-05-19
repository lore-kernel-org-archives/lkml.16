Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D81272E57
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653020; cv=none; b=mqWoGS2cVz2K2UfZHo3Zgd0pFV+vgjj2C3UXmV+7F4fw+RS1wtCi6pGIO1OAbehJj30Sb4NG/rpJALpa5243otCWYEJO6wRnTxjRUfOxYLoKJjOrBZ0N7mXjeTFGaTh5Jtxn5cK2LOjPKJlXWZG+5XqFy0GRQOBczwZ0OGCtH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653020; c=relaxed/simple;
	bh=DpLxGmv6kAnEnjDPDsi9nUB1a1InmBrd6gWuzi2yYXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j73ZUOPmGAeQSNJFInGkPAs5n0sRwN3CzJrM/RrYG1JS2ga+dezMf52BA5w5Txqo6RpTey83lA1PLYJMCkIblv4YhFe9pnEBv8ITnL8O0/IBwBwSFPi0c5Nq+atkIzyI9Q60Mls7jVexwFKKC6Cy/9D6tEzfnsvhptWPKFQ3fC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwa/mmz6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwa/mmz6"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso45379221fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747653016; x=1748257816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2AvfjeQ3YfmsLFEpdAcg+rkwn/b2OgTHJg9Jk5co+M=;
        b=Wwa/mmz6iYyQXK9u49/kcVOtZxh86e1RCEpg7+3r8GXo8j5//1usAV7rcmtt52Zxr8
         1jOqLiUHxUdZGC086MNfG9oBJQlxioRykOOIhojx3tOvylWHf8ZdYGrSSeUR34TmBi3N
         mYDC58mO5KFl4fE8RDoqKOzdzBbjEF9Wb4t/ruo2NlEy0BsusEkcI7iQy6KX2UROwTVx
         33HI3kpsmT/Y020JgP1F5+atcVB2jhAC4ukfOWo/WL556ScqgafV3Rjih/MM5LaXNAV4
         1M08EpCB2cJWoD+4Vb1qWQtNDPyBq+YVXxpd1nHQeVmOrHI4EbT+4WMOuC29XUSFK+Ls
         h9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653016; x=1748257816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2AvfjeQ3YfmsLFEpdAcg+rkwn/b2OgTHJg9Jk5co+M=;
        b=BY/WSr1zF+7fMqd6SsrYpsHkNYNnB0jZMiRxNykvVgA35g5UE/Euxg+nx3WYT+q4mH
         kqhwnOspPzDfDUfeEeYoYL5srvVhi0V2AukAI/tbBDmi0Kmy8OGr7d+yBmENPQP186YM
         E/T3MeuNOKxVsxMkBmjxDn3xfOyrMAt+caHLLfBV+/AnyeUU34mxk20px3FFY+rPmXLU
         iv0dvEPMz4Vxowrvpnj+C6q/rqmsDjwqTIbsc1mtjjraHoMz44xSIJda28g+PJKaryUh
         J30fIBs5wof034MMoL7krGEs0cCM7qvNarQEdfMUpjtuncxuhqU62r3cUJfR79VXNpDv
         lH9g==
X-Forwarded-Encrypted: i=1; AJvYcCXpCdfuZ47oD9dlhDBd/lihV3spfH0GegGdD03Ld0yTiaaM849X6HxHyUwkIRb6ACrYO6Rf8OS/+KgR9Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNsu8/wJq2KQmlosD0oYWlcfJjrTll8dxHE6DkXmJuoU7DmrAx
	D43H04F4+ot6CTKQTPBahF9rHAeVx13QMt7Gl9tD67wuJ29LEoClhVwn1wJNZMT5XLJNaetc05j
	irxKRsHIcNfVDAVqQ7+Zd3DHNmOkgTXvtwPTNrXY=
X-Gm-Gg: ASbGnctrhjH8ICA4rxvBgl1bzePEt9JDaxdQzyVucaGXzby2kQn95rgbBjHV0jrPSS4
	1Lp4gmt+H55HozcxNz19iZc95TPeT1kxYlZt02nK2Vkp3pXHGQKrG6Nvb0B10iIeRu61BMEUvCa
	yJKeTnQLYN7GIYRFlSsSXxG/IXJFZv3yeT
X-Google-Smtp-Source: AGHT+IFc36PK0gwzyRW3jvTzPP8Ia4hzGVk+PX8Wa2IpeeDgsDuGiSrx9fPUqLrrQga13EdImwRtcMJ+Mm6/uMty4ZE=
X-Received: by 2002:a05:651c:304f:b0:30d:b216:ef0e with SMTP id
 38308e7fff4ca-328096d1c98mr28929491fa.17.1747653016018; Mon, 19 May 2025
 04:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-12-ryncsn@gmail.com> <20250519070801.2588-1-21cnbao@gmail.com>
In-Reply-To: <20250519070801.2588-1-21cnbao@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 19 May 2025 19:09:58 +0800
X-Gm-Features: AX0GCFtxHH5fnd6DYr57VR2wQe4QhvHj2zdkruqQEm3hvGo78Izs-oKQBNQi6x0
Message-ID: <CAMgjq7CMrRc=BPy=-H9UiHDHTv1drOq7fkruKHq4Tvh1FxM_sA@mail.gmail.com>
Subject: Re: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP
 swapin check
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, chrisl@kernel.org, 
	david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:08=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> > From: Kairui Song <kasong@tencent.com>
>
>
> > -static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_p=
ages)
> > +static bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep,
> > +                        unsigned long addr, unsigned int nr_pages)
>
> > +     if (unlikely(addr < max(addr & PMD_MASK, vmf->vma->vm_start) ||
> > +                  addr_end > pmd_addr_end(addr, vmf->vma->vm_end)))
>
>
> > @@ -4731,27 +4732,18 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >       page_idx =3D 0;
> >       address =3D vmf->address;
> >       ptep =3D vmf->pte;
> > +
> >       if (folio_test_large(folio) && folio_test_swapcache(folio)) {
> > -             int nr =3D folio_nr_pages(folio);
> > +             unsigned long nr =3D folio_nr_pages(folio);
> >               unsigned long idx =3D folio_page_idx(folio, page);
> > -             unsigned long folio_start =3D address - idx * PAGE_SIZE;
> > -             unsigned long folio_end =3D folio_start + nr * PAGE_SIZE;
> > -             pte_t *folio_ptep;
> > -             pte_t folio_pte;
> > +             unsigned long folio_address =3D address - idx * PAGE_SIZE=
;
> > +             pte_t *folio_ptep =3D vmf->pte - idx;
> >
> > -             if (unlikely(folio_start < max(address & PMD_MASK, vma->v=
m_start)))
> > -                     goto check_folio;
>
> We are handling a corner case a large folio is remapped to an unaligned a=
ddress.
> For example,
>
> A 64KiB mTHP at address:  XGB + 2MB +4KB,
>
> Its start address will be XGB + 2MB - 60KB which is another PMD.
>
> The previous code will return false; now your can_swapin_thp() will retur=
n true
> as you are using XGB + 2MB - 60KB as the argument "addr" in can_swapin_th=
p().

Thanks very much for the info and explanation.

You are right, I need to keep using vmf->address in can_swapin_thp:

if (unlikely(addr < max(vmf->address & PMD_MASK, vmf->vma->vm_start) ||
     addr_end > pmd_addr_end(vmf->address, vmf->vma->vm_end)))
return false;

But one thing I'm not so sure is how that happens? And there isn't an
address checking in the direct swapin mTHP check above?
