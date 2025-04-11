Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435A5208A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372999; cv=none; b=jGUbT2HUkgSzMieBLAWQrNORRa3rxZR5p21g81qSeSWLFj9OG+PPbfqIWFfzJCSjxqNIqkp7CMQMLyO367cHWuEDPozk/A8LSeMYenX1jKXuL1ye9P1EAqusSgH78Bo8Mu2M52y8ikj4AgVAtz4QbPzeiIoLrVe0S3AhuPGX4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372999; c=relaxed/simple;
	bh=oCU3vedl5doF6iYUq0ED4E7nJQ1ERBJfXZjBRFR79gc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apYkFPcRLfhCY7vRzjhTSFZ52SnDB121zUPQhYT7sKaTl6A0KKomLR3l1IDN9ugE2XPKFooXE/cwiVZ4b598SrtXiIq7QRgJdMI/vWi19rXKx6+87RqmvfZgKevDAL1C6cG4UYGeJI3lth5qTkiO3uXSWq5D4n2U9xdlt+9PT14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBtIeMlV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBtIeMlV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso19102795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744372996; x=1744977796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XUXdxG/BhkCfZVlPJvHGNM3P7ArX2Kcz52iyJMQG+U=;
        b=ZBtIeMlVlXSb0ZNi9jyt41UDv/VRaiBoiAlM71umBsHVIMaOBVaHpA/YTVQg3lKbOc
         sPEEr3waBVVvGEZlppBLsoxai1c/OYrLOWKRQ6S45x1u4qzi8oaqDpE+u0irhKvXpDzi
         VePq4pXCWEf6rKCW6AI4nEigCYXw+HeejCrUeCoibYWYZ5ZjkFuHquyBkAzxLvtEfJ4/
         VB/2yX1VUksVGvl70vii0yJep+xO3W4BtlEY1IUayvyeKZF0UHznvRBsoyypdnwR89Ba
         ajxM6F/4kF1/jlzx55ADOSTwVqmG8lzlpms7QzRP7kLoxlh3qhmo8THpRw/T6wKj42hj
         i07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372996; x=1744977796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XUXdxG/BhkCfZVlPJvHGNM3P7ArX2Kcz52iyJMQG+U=;
        b=V89JjGFics4/OTBsToZwY6mL/BSTTt/PH0tEcQkZbAoXeYxmITr/xitsF0aKlKmVh6
         E6E9uo+yR6fvRqoJ8ms2LaqkJLq6wtCfCpWJGFbXoOYgfVuiUZil4tc44rnBwg2f0vO3
         wHh6xpBoTil2EtzTY4Us5555UgyqRpd7aplk9tlLeiz7Z7aoBB1d2/HTs8DNuXsZRyLX
         s2B12jOkERaViRSX1jh5hCPmAaKOZNFaBUS6j0EUpwa8ZXa1CgKm/6Up+fFHJ49d7S0G
         /8zSXudCVn8RINScKPNW/buFWlhsMIUbNEmgnpVsoi9DvjcQKBQi55lk7Bkt8RTpfkP9
         j9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsoaVVqv9GN3l0q/e60upX0AsCoiepxqDBzwmPDu31lpRZotRBMzni9Mr/xxgxdOEr/qdGk0DF57tS+us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz35oeL0UiWfmYBJuQCYHztfkntO+KwBIx2VR+LsHblAziHBtu2
	Wamg0RbZBN7nze3g8fWSpSBaIztukNXXmtiqfPg/p/GNtMyl+CHhnzLm0Q==
X-Gm-Gg: ASbGnctEGIS5oSzYa9w+Day2QP88Yxe4gc1w0+YOgUam6Qb+O3a4iDds5I7FvnVrzrt
	ydksqcIXHINcxIEVXrK993KZkMKNu/eFmhSUUn2iB80UphxHJMmL4S5cCU9t87EE7scfAlzpvxO
	WtaJ7OHAlOqDc6zxDhgr92u1EZXtUBT4f5R/tx7j3hotMYltuYVquoKoQM6OOXSeJQlwfSwWwkN
	TS+2u6Og1D7vUbBsX0KGMnrhNLFN+XBXerBCKqbgpRBTdQgbZll0+THq87jU8uKHMmD3g+vZplm
	gEdjoT22qN+/uMYc0omBsRKqzZrM188ov3lDOcAR0WfWafIG3Zr5tkSg4xk7Tqx+obDN04PsQtZ
	OIACpYjxRINQ8Qg==
X-Google-Smtp-Source: AGHT+IFjJLiz90Y/fxzwTEEZjSN23htjHcLr+F0TlWnjvsqsniNtlVdnHF/+XW9GHr3Jqk8W2SymPg==
X-Received: by 2002:a5d:584b:0:b0:39d:724f:a8f0 with SMTP id ffacd0b85a97d-39eaaebb54fmr1676129f8f.42.1744372996097;
        Fri, 11 Apr 2025 05:03:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97b249sm1834556f8f.58.2025.04.11.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:03:15 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:03:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Xavier <xavier_qy@163.com>, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, ryan.roberts@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
Message-ID: <20250411130309.7894f204@pumpkin>
In-Reply-To: <CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
References: <20250407092243.2207837-1-xavier_qy@163.com>
	<CAGsJ_4wsW+urp6gbp+yDG40fZw9Bszny2iJVsV_AzzGqgQy+4g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Apr 2025 09:25:39 +1200
Barry Song <21cnbao@gmail.com> wrote:

> On Mon, Apr 7, 2025 at 9:23=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
> >
> > This commit optimizes the contpte_ptep_get function by adding early
> >  termination logic. It checks if the dirty and young bits of orig_pte
> >  are already set and skips redundant bit-setting operations during
> >  the loop. This reduces unnecessary iterations and improves performance.
> >
> > Signed-off-by: Xavier <xavier_qy@163.com>
> > ---
> >  arch/arm64/mm/contpte.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index bcac4f55f9c1..ca15d8f52d14 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pt=
e)
> >
> >         pte_t pte;
> >         int i;
> > +       bool dirty =3D false;
> > +       bool young =3D false;
> >
> >         ptep =3D contpte_align_down(ptep);
> >
> >         for (i =3D 0; i < CONT_PTES; i++, ptep++) {
> >                 pte =3D __ptep_get(ptep);
> >
> > -               if (pte_dirty(pte))
> > +               if (!dirty && pte_dirty(pte)) {
> > +                       dirty =3D true;
> >                         orig_pte =3D pte_mkdirty(orig_pte);
> > +               }
> >
> > -               if (pte_young(pte))
> > +               if (!young && pte_young(pte)) {
> > +                       young =3D true;
> >                         orig_pte =3D pte_mkyoung(orig_pte);
> > +               }
> > +
> > +               if (dirty && young)
> > +                       break; =20
>=20
> This kind of optimization is always tricky. Dev previously tried a similar
> approach to reduce the loop count, but it ended up causing performance
> degradation:
> https://lore.kernel.org/linux-mm/20240913091902.1160520-1-dev.jain@arm.co=
m/
>=20
> So we may need actual data to validate this idea.

You might win with 3 loops.
The first looks for both 'dirty' and 'young'.
If it finds only one it jumps to a different loop that continues
the search but only looks for the other flag.

	David

>=20
> >         }
> >
> >         return orig_pte;
> > --
> > 2.34.1
> > =20
>=20
> Thanks
> Barry
>=20

