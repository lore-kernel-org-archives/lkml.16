Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393CF9CB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303989; cv=none; b=p6FLZPUMxn4EhlySr6zfXlEqlPyPH+YnCoseYSt18JpAybwfwLS2w7XBD+tz4zwY7e1NNevHfPH62H27rvZa3b2mdjGWkNlfsZ26LnN2+osSOwrb3qzrxnkb4NtNEFLcifqJCbVtzPrskHm48d+5bvW2xCssjnZHQQYm78+We3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303989; c=relaxed/simple;
	bh=o1cKqqrl3WcFN3B0siBCxSoKZjsWO26WSrvEnr5m2so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phUFQJF8LRAkJ672VefGoQZrK0eQHTArIOCYxTfbXKPDN2354B22wGOQOCCUXFVT3Qtfw6XVWOwwdazi/5OC98KgyB4jZfYImSa3BZ4lX683aJPIyTZj6MWko1KQonJ0x8TbxUt7GpfZTyB1W2H4zvCvpms1y2iXMxJ20o7kWAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0YIfDtff; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0YIfDtff"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e82596e88c4so348741276.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750303985; x=1750908785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=0YIfDtff8P2WYey3hbMLXaL5ajaAxfyzquZLWavw9WfTE37Ck4NKGPhCu+ZK629Or1
         QlkbRu3Jrh47Cr4Ehnzth115VlZUYKjMtUYELIi6AR6Z01ncbr0TXFIvpja+6clCGPU2
         tL7UVbaMyoUfk+s20QzCRCt45lwl3/W+bxPJMeXaoFpHW10i4ShF7hJer37zkjbNkFLb
         dcjtIFwLgdvaCBzvC/qkga76fnAyQK161aSL3trnO/ey8vfxsi/CurHEKqoHZsoLvHvM
         0XHC0svOWnzbK4XM/eGCd/Jo7SCfpgw7KlgbEOxi9PWiYRNUO5ha94WV/7ORax9JvS3A
         t+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303985; x=1750908785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=C93BuhCxabljAsE2JAJdzNgD/RQi6FdWdbfwjcgcIz+mZjczPlAkKIR2a7SyzCWYqM
         Sff3y9QgZTe0XezHljwTfeawvEreZ1tt2X9g4GlPTjoKaoDoi0dGSmIiKin2EFyodcjg
         419rFwPVq1rUDsOwdLXf6XHpJsFNi1soDMwvwMGCNXHg+r0Cwe6qEESUyboWR10pq9qC
         2qndv5hO5GIJtQRbLk9MDgdrG2a/v8xvqnpanD2aIpG4gWUmmC6yD3Pwz5U/vaEE0nld
         FZDvhs/Og7XWALGJSj9vn0KW/4YAQDOeTEv4DsYYdaPcAlK1M9Q4vwy2wFgIVzP3fIip
         FbrA==
X-Forwarded-Encrypted: i=1; AJvYcCWdrrqmVDJyz40usVhvss129bhe1Sz3gTaKVH0rCPxwMSjHDlSbqMDUYb5yvq7US+5mccIrdCLHzztGLQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOwM8d+u9HitWbqLPM4qTSf2TvTYZRGz2ZpwNFqS/pk5TH/VU
	wse1qwFxfgYLL/SpmM/geXH9EJxnvCb6K/baoa/izEbaauJO4oS61ro72mgm3HnMuzh4aH8Yrw4
	C9A7sZSkIqs3FQVYTKFUB23F9p8QZgGWbu8AxL3QRhw==
X-Gm-Gg: ASbGncuGZZWKe/XNA6MTyubwDAdDCTa1D/B7tvCCYipHNJSAPRB6yv1qXdpzP4aXxDT
	UR00mRIcpxFMuHOB3btIG3VzbQHw6cVP/on7JYjItjdlivZEix8v6yVrL/3Ujqj2mCOlEjJFfYG
	bLbXWEa6Zx6ou/1B4uEGIuH9iDi2MtpJPY8V+n5FPyZw==
X-Google-Smtp-Source: AGHT+IGcgeMo27lTgaDy9bbMAdcQR1xe3fMVRu8/9DI/Df3XMM3eOfwyhPsLvfFCCnJDn+wQXZA6c6yxRggua+A+pZ4=
X-Received: by 2002:a05:690c:3501:b0:70a:36b2:8f94 with SMTP id
 00721157ae682-7117544b8a1mr301360657b3.18.1750303985204; Wed, 18 Jun 2025
 20:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr> <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
In-Reply-To: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 11:32:54 +0800
X-Gm-Features: AX0GCFtELZSRZqubW6lHS8cOASUCtzDo1F3xvWoK2w2WWudZIiFtQ6t7sUz4_vI
Message-ID: <CAH1PCMYR2L8TeuveA-XTorQE70wmJVA1Vbt3Qhz0864Vr206PQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, dlan@gentoo.org, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:57=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Thu, 12 Jun 2025 06:12:09 PDT (-0700), Alexandre Ghiti wrote:
> > On 6/12/25 11:32, Yixun Lan wrote:
> >> Hi Alexandre,
> >>
> >> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
> >>> Hi Yixun,
> >>>
> >>> On 6/11/25 16:56, Yixun Lan wrote:
> >>>> Changes to defconfig should be always updated via 'make
> >>>> savedefconfig', run this command to make it aligned again.
> >>>>
> >>>> This will ease the effort of reviewing changes of defconfig
> >>>> in the future.
> >>>>
> >>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >>>> ---
> >>>> Update PDMA config bring in unnecessary changes[1], let's fix
> >>>> it by run savedefconfig first.
> >>>
> >>> It would be easier if this patch was part of the PDMA series since th=
e
> >>> last patch will depend on it: @Guodong can you integrate this patch t=
o
> >>> your next revision of your patchset?
> >>>
> >> I'd rather make this patch independent, as nothing strongly ralated wi=
th PDMA,
> >> and it probably would take several rounds for PDMA patch to be settled=
 down..
>
> Ya, I agree.
>
> >> Besides, there is no problem for PDMA patch to depend on this patch if
> >> needed (easy to use b4 to handle this..)
>
> Yep, something like "b4 shazam -lts --merge --merge-base 958097bdf88"
> should do it on the merge side -- and maybe you don't even need the
> merge base, if all the b4 send side stuff picks it up right.
>
> >> The idea here is to get this patch merged as early as possible, as it'=
s
> >> quite straightforward, and other people may have similar problem inste=
ad
> >> of PDMA here
> >
> >
> > Ok makes sense, so let's Guodong deal with that then.
>
> (for some reason this isn't showing up in patchwork)
>
> I'm going to merge it as a single patch into for-next.  It'll loop

Sounds good. Thank you.
I will rebase, (or have it as a prerequisite in v2 of my PDMA
patchset).

Guodong

> through the tester, but things look in good shape so it shouldn't take
> too long.  This way there's a stable hash people can base stuff off,
> rather than waiting for some other patch set.
>
> >
> > Thanks,
> >
> > Alex
> >
> >
> >>
> >>> Thanks,
> >>>
> >>> Alex
> >>>
