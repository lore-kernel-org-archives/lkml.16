Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D614221DAA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499710; cv=none; b=sPMNfiVLfWc+WD74rMFOy4VmIBPGWUZnQxF+wMQHAWXbvIT+vYMmPwJd44idJ3p5hTMaWEGU/rbBiImYS9cz/heIqbtNhTO3Wkh9kKAu7/cNLOa5xtweYO/9tCezdhs41DnqI74/yg+LBKJSBCWpjEsy956/xgFI9X51fhIlA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499710; c=relaxed/simple;
	bh=umiaGrTQFN8YrJ2B1vEBadeKNw103ZzdSr4SlLfT4W4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hiQMVD1kan/xH1me5q1Khk/o/T2HJqLFWL8EwXriqUu7bx4Ny49j1U5MNt8cvu4wRCQdESHZY4OjtU7MFCDrol5bvKBqv535geU/ZqkdEfJ35Td0oqlzevtN4gyo4IpX6JW8QOaSbYWEOKSqwI7pI6oMzb/OAzzC4RX+FYLUg/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=dGIjGiG0; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="dGIjGiG0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a5840ec53dso58294331cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749499707; x=1750104507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1DFQw67oYiMjYNfjgsljBrJ/qGcx57WY9wqDizp8tM=;
        b=dGIjGiG0U0z4315u00YwvUODrl/HyieERjmfiCzrdxZez9SZcN5owWqVyH/U9YMGpq
         JILObxDsiejysMXjsWEEPFVX9e9sm7BcsOiDyzyEjtyZlu2AnrcQUgZW8IMgVb9qnaxi
         CjFYUTShqzgALmKjNxWhLWqGWFE7m56rYY84v9inWpbHBEUxvOrAAgMFb5LIj6Sga1g8
         9AC8m7gozN340sY4RWOvI82L0UfQLNpFE48YIc75zyArfxBd4rXEoy2UZLtxNWsW4g5Z
         AyWLcS3dXwF2VOceybAOgZP+DfZs9tuNmMFCbUGunfWj+qRuhr+NfMoHfA0inxq4lnd/
         ZvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749499707; x=1750104507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1DFQw67oYiMjYNfjgsljBrJ/qGcx57WY9wqDizp8tM=;
        b=jruXM2AE0BQepg+5Hxv9xG079gFHum4XePw2qHxRmVeVrFqQHSah57ZivzxDb8Fpbi
         jVWmIoF4PHMwoRLj077bjFyfdLLXG18VhEIDYAjviwDQdN2jA1djqGpn5wsDUnCfxPGQ
         fD2Uo4kZjBO5FOfzW1KcGoapWxXC36OCqrOzss9izJx+yBxWZHEYaaMxFoERDfbGPpbE
         XwK3ZFC/xvUABE8iw56HHPFojcG9AD/G1j5EsIRekAIrg4AabJ2sO4vkqZPWJJsPL9md
         jB8sFwBUIyZdBwZkfYAX6UAW+t8PehqL4xpdbVG+xEXzvQ0dOBQAcAXDzWLScxeqI4Fk
         FNFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+ylyFAgudtcSSr+0O1N8gh902/o9z2zqWpAHRnbpOGegMObHvRTVKRAhLwD9SL5Pqbapp/v0hFQZfPOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJleX73Rhf6eYODScGl57nR+tXfSmsfrIQbsWWFavy7sRaBhL
	nYzGaBmkfrrr5danAHPgTgu/zGJZNJNyTpwW02RcGFZvtL5XwNmhjhnFiQy9t/ne8Iyh9l7lgvi
	crrRZ0njOW/zMMnYNdFuHnKgg65NZUuK5M3l9XTIpGBFCzyL/RduW3FI=
X-Gm-Gg: ASbGncsF445BroMNy6T4egA3cQaSiFftDZsOALIh369VRV3sJ1WndsnxL5+jgM+4EE2
	MMHuuw8/nnHaVYfnVUmAbqmnfsOXoNkz39nwrXfBctTixuQqRxMKfIMDR8BvVy+Vyp9j4JTFdwH
	E4GMFeXncv5zUVx9bU9l1aUcYVIzEcBlkKxR4WhUhD
X-Google-Smtp-Source: AGHT+IHwZ8xxwy1rbJ2XYzDgbb0cvWkJy5FW984f0Zrhq4kdp7mC5bx3gPRzk5/yaIfN5T8ydPXCdjKttoq3lg7ewfM=
X-Received: by 2002:a05:622a:4d94:b0:48c:54ad:c409 with SMTP id
 d75a77b69052e-4a5b9e00aacmr196256071cf.10.1749499706847; Mon, 09 Jun 2025
 13:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605171143.76963-1-pratyush@kernel.org> <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org> <aEc30BoLE9HRxiZm@kernel.org>
In-Reply-To: <aEc30BoLE9HRxiZm@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 9 Jun 2025 16:07:50 -0400
X-Gm-Features: AX0GCFtEuDZaSUxyvgIQvzavhtS0Upun00DQmQthsZKvdGuGbBntdnwQlmoxuqE
Message-ID: <CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios properly
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:36=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> Hi Pratyush,
>
> On Fri, Jun 06, 2025 at 06:23:06PM +0200, Pratyush Yadav wrote:
> > Hi Mike,
> >
> > On Fri, Jun 06 2025, Mike Rapoport wrote:
> >
> > > On Thu, Jun 05, 2025 at 07:11:41PM +0200, Pratyush Yadav wrote:
> > >> From: Pratyush Yadav <ptyadav@amazon.de>
> > >>
> > >> --- a/kernel/kexec_handover.c
> > >> +++ b/kernel/kexec_handover.c
> > >> @@ -157,11 +157,21 @@ static int __kho_preserve_order(struct kho_mem=
_track *track, unsigned long pfn,
> > >>  }
> > >>
> > >>  /* almost as free_reserved_page(), just don't free the page */
> > >> -static void kho_restore_page(struct page *page)
> > >> +static void kho_restore_page(struct page *page, unsigned int order)
> > >>  {
> > >> -  ClearPageReserved(page);
> > >
> > > So now we don't clear PG_Reserved even on order-0 pages? ;-)
> >
> > We don't need to. As I mentioned in the commit message as well,
> > PG_Reserved is never set for KHO pages since they are reserved with
> > MEMBLOCK_RSRV_NOINIT, so memmap_init_reserved_pages() skips over them.
>
> You are right, I missed it.
>
> > That said, while reading through some of the code, I noticed another
> > bug: because KHO reserves the preserved pages as NOINIT, with
> > CONFIG_DEFERRED_STRUCT_PAGE_INIT =3D=3D n, all the pages get initialize=
d
> > when memmap_init_range() is called from setup_arch (paging_init() on
> > x86). This happens before kho_memory_init(), so the KHO-preserved pages
> > are not marked as reserved to memblock yet.
> >
> > With deferred page init, some pages might not get initialized early, an=
d
> > get initialized after kho_memory_init(), by which time the KHO-preserve=
d
> > pages are marked as reserved. So, deferred_init_maxorder() will skip
> > over those pages and leave them uninitialized.
> >
> > So we need to either also call init_deferred_page(), or remove the
> > memblock_reserved_mark_noinit() call in deserialize_bitmap(). And TBH, =
I
> > am not sure why KHO pages even need to be marked noinit in the first
> > place. Probably the only benefit would be if a large chunk of memory is
> > KHO-preserved, the pages can be initialized later on-demand, reducing
> > bootup time a bit.
>
> One benefit is performance indeed, because in not deferred case the
> initialization of reserved pages in memmap_init_reserved_pages() is reall=
y
> excessive.
>
> But more importantly, if we remove memblock_reserved_mark_noinit(), with
> CONFIG_DEFERRED_STRUCT_PAGE_INIT we'd loose page->private because the
> struct page will be cleared after kho_mem_deserialize().
>
> > What do you think? Should we drop noinit or call init_deferred_page()?
> > FWIW, my preference is to drop noinit, since init_deferred_page() is
> > __meminit and we would have to make sure it doesn't go away after boot.
>
> We can't drop noinit and calling init_deferred_page() after boot just won=
't
> work because it uses memblock to find the page's node and memblock is gon=
e
> after init.
>
> The simplest short-term solution is to disable KHO when
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is set and then find an efficient way to
> make it all work together.

This is what I've done in LUOv3 WIP:
https://github.com/soleen/linux/commit/3059f38ac0a39a397873759fb429bd5d1f8e=
a681

We will need to teah KHO to work with deferred struct page init. I
suspect, we could init preserved struct pages and then skip over them
during deferred init.

Pasha

>
> --
> Sincerely yours,
> Mike.
