Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCCDF4ED
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744442311; cv=none; b=PDffg8KhiKtr436bDGd/SRYww4K8VlCDP9XNxPqqz/fCUvQaMEc6SRWj3OxHtx9spmewMBqXGXPuGshkJcm6M8Gzno7QCiSxRH6WctiN+UFDlwxGIQ6r7ZSX77vmD+8HfZFVa3CGGGekBHwPUdm0/xVKYsccaozFl9F+8c0Hdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744442311; c=relaxed/simple;
	bh=qfjvaHj5+zgxLqOpOE1AzvhB83QA6zymZxPgLSlgjj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZ84GWNQWUPgpLTJ5YEokwcb2lvUp26CLzY0wg5vS4qKkClvo0zWz3M8quQOFlxNkh5nLE2OAKx9QODnZzCk3H7vGahmh8qs922FrMEgpy66IbgoSoLPoWO2xLWCTi/f4Jhgtf5ueIjGN9phfcOZMF1xoLrkQCTjaeJLpW31Xuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fox6YTIN; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fox6YTIN"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51eb18130f9so1463315e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744442308; x=1745047108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VC0GWEM0TOvbpRj503Lx4FHEsT4eElQEaARZ2JDT8L8=;
        b=Fox6YTINUMqyzhXMe/7m+j7XBQY1klaoeJABrHP71SKc7YueKnAY3qRlxHnbn57wfe
         cjaNPPIK5UG0asD3yd25M4jDfFO93P29q2hmJ0K3BWM/gWpKxuQ5OF6xtxsZUApm/ok2
         wJGuuzXVPjny0YTgqEqEGmZ8R/boWFjEu+u+8RGkAbXKFlNQQJWiEDDp0OYflKtXzp8A
         /oCJJJosLRuodECkMIzN2QqmGy9m+u7fiDxAspSrGBQOcVGEcWMZJWQ3zAbXqGuo7HkM
         Yf99c+ZjgJGYYkIQvB55qn5s2Npvmkozh7m7p3jPBOdptX78DCOfZ9CQkmZCCcbaNHER
         UQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744442308; x=1745047108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC0GWEM0TOvbpRj503Lx4FHEsT4eElQEaARZ2JDT8L8=;
        b=OaLSzVl1FZqgXNlVmBOrzVnWyzvhkvWzTgOjdq2Bj6o+R/Vs5QKJ9120aaVp+sZcrw
         SGEDQzV4Doj/Lp8xLglDhsIbEOL3efx319hsW8sXRMVOqttohhd6xByRQQJwp/Nv/pzD
         SKP1P6s24mLPKm99lXE1DvJnlBQeKt6ZOoJdAoNaXe1pPCR7fy0PO1wk8UyOp8Fpn9Vq
         VcEFujYCYCwylVF98nPE5PsF+RjIGq+JQoxfa1U+PhdUNT87EjiGcAMdP5hNSLb38FqL
         qxNFvJcok/6NuHzwOEAmv16fT7QYGULM09Uj6wMBAtMHQRa3zF53bSgxdTnbZf6RLYkG
         +5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAC9LeL55M/RX+oMvbcsl+P/v6sUnVxjTs0EdygdZ/TlypyAvhRGwo44IrKUMna6E8jLQdWYe5P5d9Qgk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1Y4j3PGtjotB75NWeaQVpVoEgKGi1UmH+NmioaBwiikJBh8D
	1hn8Qwtgdqz4d3a46WS9Fx5+bMuXfK4niNC5g+CO8+WY2luIMvKSFs9IdggQrpUrandTOiZCjYN
	YRFnc03VXTSdyo9vb4MPbV8mLjnc=
X-Gm-Gg: ASbGncuxQ6WR3v8KIAvAGmDD9PNOhv6TbJbMDPYhl+7ban+0l6CY7P+KQU+YriJzrzy
	6GjP/5JtRsOUo7YYlTsXFrHf50N3L3rrjzoR6Ml8hafsgm9rQS5xMckpBrUE60h4YniX2JTa62g
	mSOf/HO8WARhrVelNNgTYytA==
X-Google-Smtp-Source: AGHT+IGLwhjL9UXOMlhWpGMgmfF7c6ZHFDY4fNpjB3r/u10XhaPNH3+4egF0XulPfge8tMvLS6WHPop4Po6A7QGLagI=
X-Received: by 2002:a05:6122:829d:b0:523:dd87:fe86 with SMTP id
 71dfb90a1353d-527c3587e86mr4217419e0c.6.1744442308131; Sat, 12 Apr 2025
 00:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
 <20250411130309.7894f204@pumpkin>
In-Reply-To: <20250411130309.7894f204@pumpkin>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 12 Apr 2025 15:18:16 +0800
X-Gm-Features: ATxdqUFAFVllearhPjdozPth5ZeaWQwWAltFxkp3eDui7FtSHRmQqUd3TJv7524
Message-ID: <CAGsJ_4xy=62Gtb2W4P0Fss4XZiuJvQikgO6MXtg4TB_2FX7haA@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: David Laight <david.laight.linux@gmail.com>
Cc: Xavier <xavier_qy@163.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, ryan.roberts@arm.com, ioworker0@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 8:03=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 11 Apr 2025 09:25:39 +1200
> Barry Song <21cnbao@gmail.com> wrote:
>
> > On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> > >
> > > This commit optimizes the contpte_ptep_get function by adding early
> > >  termination logic. It checks if the dirty and young bits of orig_pte
> > >  are already set and skips redundant bit-setting operations during
> > >  the loop. This reduces unnecessary iterations and improves performan=
ce.
> > >
> > > Signed-off-by: Xavier <xavier_qy@163.com>
> > > ---
> > >  arch/arm64/mm/contpte.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > > index bcac4f55f9c1..ca15d8f52d14 100644
> > > --- a/arch/arm64/mm/contpte.c
> > > +++ b/arch/arm64/mm/contpte.c
> > > @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_=
pte)
> > >
> > >         pte_t pte;
> > >         int i;
> > > +       bool dirty =3D false;
> > > +       bool young =3D false;
> > >
> > >         ptep =3D contpte_align_down(ptep);
> > >
> > >         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> > >                 pte =3D __ptep_get(ptep);
> > >
> > > -               if (pte_dirty(pte))
> > > +               if (!dirty && pte_dirty(pte)) {
> > > +                       dirty =3D true;
> > >                         orig_pte =3D pte_mkdirty(orig_pte);
> > > +               }
> > >
> > > -               if (pte_young(pte))
> > > +               if (!young && pte_young(pte)) {
> > > +                       young =3D true;
> > >                         orig_pte =3D pte_mkyoung(orig_pte);
> > > +               }
> > > +
> > > +               if (dirty && young)
> > > +                       break;
> >
> > This kind of optimization is always tricky. Dev previously tried a simi=
lar
> > approach to reduce the loop count, but it ended up causing performance
> > degradation:
> > https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.=
com/
> >
> > So we may need actual data to validate this idea.
>
> You might win with 3 loops.
> The first looks for both 'dirty' and 'young'.
> If it finds only one it jumps to a different loop that continues
> the search but only looks for the other flag.

However, there's no concrete evidence that this loop is a hot path. It migh=
t
save a few instructions when the first PTE is both young and dirty, but in
many cases, none of the PTEs are either. Previous profiling indicates that
the actual hot path lies in the rmap walk to locate the page table entries
during folio_reference in the reclamation path.

I suspect the code you're optimizing isn't actually part of a hot path at a=
ll.

>
>         David
>
> >
> > >         }
> > >
> > >         return orig_pte;
> > > --
> > > 2.34.1
> > >
> >

Thanks
Barry
