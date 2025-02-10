Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6442195FE8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168362; cv=none; b=Lyux7grE+JwaZa2R3y0Y1z/w5/gyiFE2lfEZjLWeLx1mty34MwQ0qLxCNq92axzNQpThNh7wmI4IvHHs+XepCKW0OQNWJG7uS7VQxbRo/8ZyZ4NfjJlxCSAenM/2wle8T8bm6BufGZOReqzYUC3qXG+CXLdIpbbKIZpmNKBZu98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168362; c=relaxed/simple;
	bh=QSB37BRmGvCCLvcwtLkt3Y0aJJhFuQy8WSUPkABTTeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OneABqUOhidfI+TNAPvsPNROzP6bu7wo2/la2gyoK8V82Z3liVsF9dFc08DmK8YrmshTb6lrtYGAeWdwLtTGfdXq1NO8iy4NXn9APhLOIxPoGZCMwefDqZc4MmQyGDYmOgNlX728sNz5m7Ljr+2Z+tXpYJrAm045WRC8kMVxN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIj9d9nM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIj9d9nM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f5a224544so26328745ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739168360; x=1739773160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0qE5ztiMfOqU/NNNTmSKqQDaw+xnPVhX8L7HjFr4oA=;
        b=AIj9d9nMo+wZ6fqwQczSee5fReNQD6s9Nr3YAEFulh/0PCfZ0RB1plGGDc5j5cmSwK
         qXIg1AIiQXroSEUgf9Djjj8qIEq1TaxryCtBrXVKa2FOkKCBxGtnN42xCgHzlGkOz3Ql
         Hoo8438PBkub2+mMWuxpigOGALF4IezwlIiXLLBSjxe8z0KZ9kYrvjSu1Y0ghz0TvvUf
         E3viMTRzK6yOGOdNaF3LzXGFLCHOrX7jWEAYwF4bmAOFaVTWPmUSoB1iFeDheUcgpNy8
         ZTjtvCFcIEqdFdW9qB5B5jYPbWEtjs9wLFRBa17A0kF5h1WbGWOhwmmaRDuqVW6qxF+/
         oJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168360; x=1739773160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0qE5ztiMfOqU/NNNTmSKqQDaw+xnPVhX8L7HjFr4oA=;
        b=C8/HT0QEXoB6tJ0YvTBqYEhNeRGSS7jXggbGl88lEn+LE2HfkJ1Wk4Fs2ka52fOIOa
         LX/TwNjYlqvGg/jdc06ecWg6VTX0spjkC9SkNoTkzUYikQcpE7WtZ5gJnK7PTPL69ytS
         bWWzJYUkZeGGz844j4zmfc+z7eqkPxoZUNyFn+plT4Qbq/6RzllSdIpSpyuV8u2U328D
         hW6aEVImpd/j+Dhhwxu5xfO8wuxaENrmQnnWsgX2QHv/h1luy97NYY5y4HJ8TwTHWOwl
         iY3FYu2gN2zLiwvYgEdHtuBSyez0Aw7NtUygLQCosAWZXTckiRwXBmDQANLMzXDWaVHr
         KHkg==
X-Forwarded-Encrypted: i=1; AJvYcCVuczunmf+ryYNEHHWuzzlNJxJmelGiAYHIzZJpRdzfPDctlbs0vS+EP+ZOynLxP7c4aR1DRxnsFVbSoxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG/W9oSle3KfaEdX5g2LNcZHSIO2n9dFs4se0EV3hisynsYh7G
	9M9tRYXxnEM8qcqRZcpbmZpeU3yfqUfcftHC/n+ub8fxrjK8h8ftLtokjHsFUhNj+0RgqksLdJp
	DFoah5IHw3hp/TZQGIxJ7Zu80Mz8=
X-Gm-Gg: ASbGncuhQN807ggQF9IG/A/MYnVF5iUR5efiaIYWbQcWumD3CH/aO7CL28RfOqyoSQs
	S1PQVgFyQpmJSyIyqmWvBb0fYzl8HuFW0RUOFJ/UEQ3D1jEcSRa/8wcP6DYvB9qWHjU2cA2NJ
X-Google-Smtp-Source: AGHT+IHEiyqiVUi2t1F1mNbx5wlvzLLnslQpCepJcKSarUrf6sjrv0hLv6E35ap/FJ/JwE1ea028muenoOeHERPobQQ=
X-Received: by 2002:a17:902:ef4c:b0:216:7c33:8994 with SMTP id
 d9443c01a7336-21f4e7aff63mr191970075ad.53.1739168360078; Sun, 09 Feb 2025
 22:19:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com> <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
In-Reply-To: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 14:15:11 +0800
X-Gm-Features: AWEUYZnuectraYtl_EVRebn2CreWWpWoYznqXAdJHe52mJrzoXRk2t8dsoXwmPU
Message-ID: <CAAyq3SYdGWANRTobbTahBZqU77xDnjS_WDJof6qkH-G2sVxzhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR Flash
To: Michael Walle <mwalle@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Michael Walle <mwalle@kernel.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Cheng,
>
> > From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >
> > Due to incorrect values in the 4-BAIT table for these two flash IDs,
> > it is necessary to add these two flash IDs with fixups.
>
> What's the part number of these flashes?
>
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -127,6 +127,9 @@ static const struct flash_info macronix_nor_parts[]
> > =3D {
> >               .size =3D SZ_128M,
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> >               .fixups =3D &macronix_qpp4b_fixups,
> > +     }, {
>
> Although we don't have .name anymore, a comment like
>
> /* <partname> */
>
> is recommended.

Got it. I'll add the partname comment in v2 and will follow this rule
going forward.

>
> > +             .id =3D SNOR_ID(0xc2, 0x20, 0x1c),
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x23, 0x14),
> >               .name =3D "mx25v8035f",
> > @@ -182,6 +185,9 @@ static const struct flash_info macronix_nor_parts[]
> > =3D {
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> >               .fixup_flags =3D SPI_NOR_4B_OPCODES,
> >               .fixups =3D &macronix_qpp4b_fixups,
> > +     }, {
>
> same same
>
> > +             .id =3D SNOR_ID(0xc2, 0x25, 0x3b),
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x25, 0x3c),
> >               .name =3D "mx66u2g45g",
>
> Thanks,
> -michael

Thanks,
Cheng Ming Lin
