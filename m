Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B06206F31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103889; cv=none; b=HRxScvG2qC5QQWZ2eJMkKXOgZKsj6C4BS98HheK1N1foTwxyMNMPecHeio4FroIxfU9ixQ8ONVi3qTB6lzVHzJqbpN/BQPFaC8WHFBoqYJFEv7qb/KPd1lbvtS/a18WkSTs/xM3u+g0j3TIWGvY9CCrq6kzKqkuvLBHjY5S10Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103889; c=relaxed/simple;
	bh=5+gUy1dN6uYSKs3exM0C1VRRvHuDbZSPJD3/2bicIuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDnujX58+1JdWVZ0aW7gGUu9DOry/BHtiiwOOT9NIgn6sdVDRSNmCQ7hQt/HcAQdvwWeb+hMpTghUPftWHwGP2rEOIcJPWNLGxPZ9qrWl2ijwgul8u5wtM0B2/L+GjhS4wh/LvYYbygIeIIyqeG5dnIZU+BHuBzvadESVVjT2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRwM0E60; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRwM0E60"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso6905552a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744103885; x=1744708685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+jjPBdVXPK7qpzd9qCSG+7czxPL8ohrXnLYNLrJ3o0=;
        b=DRwM0E608c3a0C8RIehOw5UeFXqKsgRhHoYektHPmQMkgyjP4CgUZ9K1L0f0oZaqbn
         YGc+tNiXXNjk9EsgUcczAusvP0iZkLRB8no+BCo1OP6z1S5e/BLH4LWH8IbpSUeJ7gMr
         4HBoh4J3797BhwO5rDg6c57iyhccyhD21RgTespGQ4n1hnFhpHkfjSqCm/hb5YpbV5df
         Aaj8SuSDIrs9d2yhdGDGHqiOBwSXfESR4D6zsUn7f9vNnHWuMCNO1nbEya7noAZPSD6a
         RW2GD2U1HH1BHVgksRNd4Nvi9fHsVOds0woZG+Ktiny3/5N/0wr0EA6w68uYQpWBxe6/
         PR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103885; x=1744708685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jjPBdVXPK7qpzd9qCSG+7czxPL8ohrXnLYNLrJ3o0=;
        b=IHsVq8bUCel0AQJOOohFNPXmqM9AQwtGcMwMeE9LE0VadtyAd/jCWoBVTjbp2+uXu7
         qQ0w18LS5c0/tqILZFiYxPGz/BtVDahuHlcrauFrL6aSFdwNvO01zkIc9vKKZ8aNQ+bd
         diB+DbCZsjsq5x7dqRZioHp215ZCUGxShnCnlmk2slknwk9xcDBogzTN2WjLcC0NWJC4
         0B6K0lXZ+Doem2TEQULEMRksUmm5gOTGh7yWjan8LC9GKX3vveYNi6LnNdRhvtI+319N
         IRMzowLfuwYRzrMkDIiIJJbn7DqWVDEMZQhCV79fsWMIPZL6F57kT6WZW5dd19t+hg6+
         QU5w==
X-Forwarded-Encrypted: i=1; AJvYcCUTaKG7FeoSTY+TUPSahwGsHuzfBHQdABQ1kNHSVy1WQAcDaIIx9u73/mYEAWo+H7z7xsC6EEzdVcgbeqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39ekfyQEaadizK4Cit4wNHNLrFxSFFCTAa1spivFIfqZQI6Zf
	EYA34Ro9PPqsvuoSyLVQMPU6DoU91BKLmuFWc9Q7aMSCMcYZR6dPJcbpQvFMe/lRZ3vZ0adgQmo
	2uLYIe9F/17SMg4Vu9YUK+WBVRuqEubsVz2Y=
X-Gm-Gg: ASbGncsASswYZuSrSKhSPO6rb06Xdg/AXPtACe9fbEM4b9d1Q8gy8/w43RGJONyiNgJ
	jyoBLMeY1fK7bVcd7rCM6sGttSsMDYQUflERxQ/JBBYQKUYRgITTkQE4lu5fJROxdtc7MYZrAte
	Ad2QGmxHc9+NWFvnnJC+faOEw8ig==
X-Google-Smtp-Source: AGHT+IGrlLWV41GaegSAaM8iXEmdd5mkWasA+28fz3ufZ5Wi9wLfXdTkvWBnY64Gcct6jx2leLCkzFVsACi79f1rHeI=
X-Received: by 2002:a05:6402:26d4:b0:5f0:7290:394b with SMTP id
 4fb4d7f45d1cf-5f0db889fb1mr11656706a12.27.1744103885242; Tue, 08 Apr 2025
 02:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com> <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
 <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
In-Reply-To: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 8 Apr 2025 17:17:27 +0800
X-Gm-Features: ATxdqUG7uvOu-cRYXmAw458BlDMbN0mphcEb4IU_35tVjzzvBU2iT353Pl_0Awo
Message-ID: <CAK1f24nR9kYE7OA3onPYi0_jYeAPeX-yqLCFh8GJOkUuZOt45g@mail.gmail.com>
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Dev Jain <dev.jain@arm.com>
Cc: Xavier <xavier_qy@163.com>, akpm@linux-foundation.org, baohua@kernel.org, 
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ryan.roberts@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:19=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> Hi Xavier,
>
> On 07/04/25 7:01 pm, Lance Yang wrote:
> > On Mon, Apr 7, 2025 at 8:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote=
:
> >>
> >>
> >>
> >> Hi Lance,
> >>
> >> Thanks for your feedback, my response is as follows.
> >>
> >> --
> >> Thanks,
> >> Xavier
> >>
> >>
> >>
> >>
> >>
> >> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
> >>> Thanks for the patch. Would the following change be better?
> >>>
> >>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >>> index 55107d27d3f8..64eb3b2fbf06 100644
> >>> --- a/arch/arm64/mm/contpte.c
> >>> +++ b/arch/arm64/mm/contpte.c
> >>> @@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >>>
> >>>                if (pte_young(pte))
> >>>                        orig_pte =3D pte_mkyoung(orig_pte);
> >>> +
> >>> +              if (pte_young(orig_pte) && pte_dirty(orig_pte))
> >>> +                      break;
> >>>        }
>
> Quite the coincidence, I was thinking of doing exactly this some days
> back and testing it out : ) Can you do a microanalysis whether this gets
> us a benefit or not? This looks like an optimization on paper but may
> not be one after all because CONT_PTES is only 16 and a simple loop
> without extra if-conditions may just be faster.

Yeah, I was thinking the same ;)

This change seems reasonable in theory. But with CONT_PTES=3D16, keeping
it simple might actually be faster, IMO.

Thanks,
Lance

>
> >>>
> >>>        return orig_pte;
> >>> --
> >>>
> >>> We can check the orig_pte flags directly instead of using extra boole=
an
> >>> variables, which gives us an early-exit when both dirty and young fla=
gs
> >>> are set.
> >> Your way of writing the code is indeed more concise. However, I think
> >>   using boolean variables might be more efficient. Although it introdu=
ces
> >>   additional variables, comparing boolean values is likely to be more
> >>   efficient than checking bit settings.
> >>
> >>>
> >>> Also, is this optimization really needed for the common case?
> >> This function is on a high-frequency execution path. During debugging,
> >>   I found that in most cases, the first few pages are already marked a=
s
> >>   both dirty and young. But currently, the program still has to comple=
te
> >>   the entire loop of 16 ptep iterations, which seriously reduces the e=
fficiency.
> >
> > Hmm... agreed that this patch helps when early PTEs are dirty/young, bu=
t
> > for late-ones-only cases, it only introduces overhead with no benefit, =
IIUC.
> >
> > So, let's wait for folks to take a look ;)
> >
> > Thanks,
> > Lance
> >
> >>>
> >>> Thanks,
> >>> Lance
> >
>
