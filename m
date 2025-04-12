Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9B13B293
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744434353; cv=none; b=CgaV5uIpXXuslqDfozEDlt3cT65F4PsOtofjrBAuWChwBF2H4zWf/QsE/TY9UXbf8u1gBoXgLXxsuQx2WbWBZw9mdcIwsLz53sMf3Ok3DHLTNm6CQEMKi9bxC43i9lXQiI2NQXGH4CTEdOJ6xwEh5j2yLupV6yXDQmenFp6HQ3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744434353; c=relaxed/simple;
	bh=zj5pj7uWN2aB3cCRtb7PTtZVOk6oJELucZKqJvpmMXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7EBQBFU5uWLV+IO0NXSA6eWzNO+6spcpD9+fl3IVXf1UoCxjntKwppz2Ar5fZLOAPTuZAEnlrEFbH1bhru6kKejlToiToXLK1J4vSAmmynMg7kyqdmH5kO3NUCnA5pkp1V3gMjLXk+8LyL2OetxGK3SXMlJ4JLDcd7crMkdCkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J84jepzT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J84jepzT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so4507620a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744434350; x=1745039150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmcQ3QSDEsYPOXt4vueIi6q3EffCVeNKtD8G4iyJL/E=;
        b=J84jepzTOQ4qIZyFz7Q+X284e93skqlCNJMWl2nsnVwkhrJXgA5Vv4H2pT9mr/Sqkg
         v+4vnY7VL3iBPS/VyQuNJO1KFwQpTZ28lqDlEfJmbxOZPYEAuBKKB6z4XNfraG2h6Lbs
         bnZ1vqcKzxIGED7tlxqdR7C4a4bMjT3JLyO8YVzcpG3y7dl64T9904Tdkkf/ZggkXZHh
         jvNKK+TWW6SyBr71ZeJNDHPgSathrkoIoAfVisey6JPSYF3q2+pO5S0wyaHkyTO/A4Er
         gIAaBYlwZPG77whQ7n/VXoWCkOR7CX8MovCyL/rb9wTXdqy4dD9WC5s62mVTweCFZVN5
         JpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744434350; x=1745039150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmcQ3QSDEsYPOXt4vueIi6q3EffCVeNKtD8G4iyJL/E=;
        b=gpPzLC6wi7Kt/XCR7S+IeKPWwZk5q0azOJnBN2zXOWaWqz0EjMTWMPc+r9lbV2VBYT
         0G8IDY0C4T71PPfBadi07XIhvIuh23Kv1UZEB9LdTpCWyI68uxRKeX7Jp6CmZiLAzFxA
         H3p34RelF3M6YenV3HutUwd1znss7HrH65WnTJReRM5JR46f/ef1gD3BmUhz6klyAina
         tG54czP+M99cSpBfp3dtqsAhYbbqUQK3taU8SD+Y8twUyi0UkMTSIY9eQq/1pwNZWQMh
         3o8Ohz1WNr2NMyjqL2EGrBbUWCSIwehIgzz4JbmLupnLdhJrXaIMOCLfCxt55VhGs3tX
         ivkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz7EOhWV4rVnincpGuAYkU7BoWidc3DYAfe5EAPqVBuZ5WHnwhtIJh2dUoM02D6dgULSqQceMYjMW2nFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpncZqmv7abAXmyLI7ydi2JJdvqxJAK7+fFp5tCCeCfJw+WOi
	VHDk1XVNT1Tke7k0pvzzrGlcunv/vL/H2kQQxvNuCDdp70h0CIbGD5BaWax+W8l+5aXMvKg70ZN
	l4OreWziV30gQV3/oVmyIIamBCyw=
X-Gm-Gg: ASbGncuN9r2D3yAqd5J+is/ta9yKcljgpY59KWee5NGjSjwdZYAV9tgjUHTA3zLlmxx
	CJjthNiwMGJ2DhL6O6xLKEGgXpYHVbysidTELyzLBVZ+t4FWU+k1PmsDxcnQSqaHP1i83Nf5l7F
	pUMTAIzBapeEjYIRDcTsM3Eg==
X-Google-Smtp-Source: AGHT+IHBf+UMftA4CGaOd6iqURletqUiakkY5VrOrUEsqMmq4BL3w7CAqbX9kxxB8kCkj2w+GTEZDzOe3fvcpG2pkPk=
X-Received: by 2002:a05:6402:2406:b0:5f3:26be:d0a8 with SMTP id
 4fb4d7f45d1cf-5f3701434fbmr4395531a12.34.1744434349861; Fri, 11 Apr 2025
 22:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
 <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
In-Reply-To: <7dccb3a2-f5e2-4f9e-8f5c-465a1d3ffdb6@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Sat, 12 Apr 2025 13:05:13 +0800
X-Gm-Features: ATxdqUF7hj7xajw8pWYtG6W9HcBwU0cx0wU6iVE9RZKOEDT2l8HVv-NXGVrK21g
Message-ID: <CAK1f24=5-VVJoE75wrskXxrGi=KmrbxSYH9P69PRPiOxQuArpA@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Dev Jain <dev.jain@arm.com>, Xavier <xavier_qy@163.com>
Cc: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, ryan.roberts@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 1:30=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
> +others
>
> On 11/04/25 2:55 am, Barry Song wrote:
> > On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> >>
> >> This commit optimizes the contpte_ptep_get function by adding early
> >>   termination logic. It checks if the dirty and young bits of orig_pte
> >>   are already set and skips redundant bit-setting operations during
> >>   the loop. This reduces unnecessary iterations and improves performan=
ce.
> >>
> >> Signed-off-by: Xavier <xavier_qy@163.com>
> >> ---
> >>   arch/arm64/mm/contpte.c | 13 +++++++++++--
> >>   1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >> index bcac4f55f9c1..ca15d8f52d14 100644
> >> --- a/arch/arm64/mm/contpte.c
> >> +++ b/arch/arm64/mm/contpte.c
> >> @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_p=
te)
> >>
> >>          pte_t pte;
> >>          int i;
> >> +       bool dirty =3D false;
> >> +       bool young =3D false;
> >>
> >>          ptep =3D contpte_align_down(ptep);
> >>
> >>          for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >>                  pte =3D __ptep_get(ptep);
> >>
> >> -               if (pte_dirty(pte))
> >> +               if (!dirty && pte_dirty(pte)) {
> >> +                       dirty =3D true;
> >>                          orig_pte =3D pte_mkdirty(orig_pte);
> >> +               }
> >>
> >> -               if (pte_young(pte))
> >> +               if (!young && pte_young(pte)) {
> >> +                       young =3D true;
> >>                          orig_pte =3D pte_mkyoung(orig_pte);
> >> +               }
> >> +
> >> +               if (dirty && young)
> >> +                       break;
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
> The original v2 patch does not work, I changed it to the following:
>
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..db0ad38601db 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm,
> unsigned long addr,
>   }
>   EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>
> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +       int _start; \
> +       pte_t *_ptep =3D ptep; \
> +       for (_start =3D start; _start < CONT_PTES; _start++, ptep++) { \
> +               if (pte_##flag(__ptep_get(_ptep))) { \
> +                       orig_pte =3D pte_mk##flag(orig_pte); \
> +                       break; \
> +               } \
> +       }
> +
>   pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   {
>          /*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>          for (i =3D 0; i < CONT_PTES; i++, ptep++) {
>                  pte =3D __ptep_get(ptep);
>
> -               if (pte_dirty(pte))
> +               if (pte_dirty(pte)) {
>                          orig_pte =3D pte_mkdirty(orig_pte);
> +                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +                       break;
> +               }
>
> -               if (pte_young(pte))
> +               if (pte_young(pte)) {
>                          orig_pte =3D pte_mkyoung(orig_pte);
> +                       CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +                       break;
> +               }
>          }
>
>          return orig_pte;
>
> Some rudimentary testing with micromm reveals that this may be
> *slightly* faster. I cannot say for sure yet.

Yep, this change works as expected, IIUC.

However, I'm still wondering if the added complexity is worth it for
such a slight/negligible performance gain. That said, if we have
solid numbers/data to back it up, all doubts would disappear ;)

Thanks,
Lance

>
> >
> >>          }
> >>
> >>          return orig_pte;
> >> --
> >> 2.34.1
> >>
> >
> > Thanks
> > Barry
> >
>
