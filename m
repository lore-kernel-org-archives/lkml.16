Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6335957
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739157670; cv=none; b=Z/mhjDST3fNtKq+YtJlnI+uNsC8Uvp7IPNKMYkOPRH7KcUlGq5R1JCWyGaFoG7e4tIok35HCXZMLN98HvchHtxx9zzt6P6RQRcezqJB/A37hUvIejOG82FIkLQ/AggAjnm41tueV/7WcTichWlBMFv1gi3ubUacyobjeCIYV9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739157670; c=relaxed/simple;
	bh=PirnTzmLLW+5gn6niEYq4gn1EtZRWCdnlFA2ExWDARg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/t9MPhPzhlRa/ma3Xzpm+YROcBAbNCL8SIOBfJx1ayz6Mp419L/uIn9g1fsQoW0/GooH75dRq9jBPBFxXZL1O7V043CdWGKG6AwUt2IMIfZ1l7CajiYZ2FhvOAqH0GkCVpqLomIbtQuKojRd9hkFCjk90bI04TGTNbaXqUv3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrWtbUpO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrWtbUpO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f92258aa6so12846225ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 19:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739157667; x=1739762467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ierXgC96hwGdKlwsBqeSKwlRoTpZuq9z1RYQs90fMjI=;
        b=nrWtbUpOw3Z3RNIMvNv66/oj0XA1HOsWy4+Hm5uTnELK4OJLg3pyufHOhW3f4md8Jk
         dBPoc3vQ0sTq7Vfyq2LvlXINqArzFckBF+Jzy+Gacoe0V+at6eFt4GNZwdI5uHiIXGQy
         xCne1/Sh0IBJeYmZvzw/yE1eANhRz7t6brQit7LRj+bTLE2zGqwAHzhYhuGLqj/Hotxf
         frdWgA47tAUl/laYO28QOK1qzrHZfazPKaQbhv6ghw7iSrK9JXZg1EREcxnPPFDxr3M+
         evfPa+3/cm9ntC62vxCUjlbkF884x5TbxXfbLd9+mGoJ1U1aQcJ7X4z+JelWVYOo6Bnu
         KgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739157667; x=1739762467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ierXgC96hwGdKlwsBqeSKwlRoTpZuq9z1RYQs90fMjI=;
        b=fKqw8hzp9r3fzxWlqPWP5niyOkvrx1gRDUIzjmH4WNz9fQYG59faTEUXYjL9VabJHV
         scN7mQEOwPaGiBSxlFJbAMpf9cCdijxdtnDpgjxQlXSQZPIXwG+/VQfX7hHT+ebhMpBg
         ODLFeJCtljYjOlfCrEmei5OeWybCuNY8eXgPNXKhETT8DE+os83CtGQaUJVN0iRMEkN3
         G0XH2pXlY7va4oY47rCF/qQiDXT1Za6+CnJN4ztRpDwZE24jqm/m9+fq7aqDrxk1sBXs
         zVl/LCIOUGFCfQLjVfoX83rUvCcoQJ7C5TKwwBWR38SkmxjvtpSqXaGiLfeNIVrkhVXr
         VaVA==
X-Forwarded-Encrypted: i=1; AJvYcCV4NhHS8vtbI8SMNx+c3z9llCApadvh0ATOuUiEQV+GcGwvNzkTqj4iV5LCznVfMdxjOPD4WxFCAQyBzrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6UkHSH7KwVN2C+XiSxub5x8niTaOFhu/ATLWIOWaJTI7YbKAp
	na8ULP3mqoRGj5ipl0dW8bx3tl3xS/5mPfSHXhMMrlBckGzqXkCTAaGyT3mTDFc5d/GdikQFW2h
	J1zd9AI6ZOIG2Ic2aA4DXHS3mfqs=
X-Gm-Gg: ASbGncsRD90RRLykDAWvSh5axou7EFwEHIgB8BoEK39nj6BjUwb6a/DaPgMMzhzGAHo
	VTmPl380pgBh8Kf/YAS5WHperonXUFZQJgnQebiZqVcOPTfHzS7HN4sC01ZVOgunknR4ChYau
X-Google-Smtp-Source: AGHT+IEQdsXoQkr/8P/JCKHQ1Pe+5J9t9y5juRQZBtj9v/sbkI4O0dhjFDP+QIhNW2wXaeDS6/bsbf1EwjVMaxrQNzM=
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id
 d9443c01a7336-21f8099743emr68916965ad.27.1739157667431; Sun, 09 Feb 2025
 19:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
In-Reply-To: <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 11:16:57 +0800
X-Gm-Features: AWEUYZmVVv-4Y0evT9hlqj0Kh75MksKOXechWJSVFw8tDvCu3HhcMQIdiq_TQWg
Message-ID: <CAAyq3SbnX8WgN9U=YbJ465q6SBWz6GMuykC4svd9jzjnC3EVFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Michael Walle <mwalle@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Michael Walle <mwalle@kernel.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:36=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Cheng,
>
> > Although certain Macronix NOR flash support the Quad Input Page Program
> > feature, the corresponding information in the 4-byte Address
> > Instruction
> > Table of these flash is not properly filled. As a result, this feature
> > cannot be enabled as expected.
> >
> > To address this issue, a post_sfdp fixups implementation is required to
> > correct the missing information.
> >
> > Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c
> > b/drivers/mtd/spi-nor/macronix.c
> > index 830da21eea08..ada17999ccbb 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -45,8 +45,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
> >       return 0;
> >  }
> >
> > +static int
> > +macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
> > +{
> > +     /* PP_1_1_4_4B is supported but missing in 4BAIT. */
> > +     struct spi_nor_flash_parameter *params =3D nor->params;
> > +
> > +     params->hwcaps.mask |=3D SNOR_HWCAPS_PP_1_1_4;
> > +     spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4]=
,
> > +                     SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct spi_nor_fixups mx25l25635_fixups =3D {
> >       .post_bfpt =3D mx25l25635_post_bfpt_fixups,
> > +     .post_sfdp =3D macronix_qpp4b_post_sfdp_fixups,
> > +};
> > +
> > +static const struct spi_nor_fixups macronix_qpp4b_fixups =3D {
> > +     .post_sfdp =3D macronix_qpp4b_post_sfdp_fixups,
> >  };
> >
> >  static const struct flash_info macronix_nor_parts[] =3D {
> > @@ -102,11 +120,13 @@ static const struct flash_info
> > macronix_nor_parts[] =3D {
> >               .size =3D SZ_64M,
> >               .no_sfdp_flags =3D SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> >               .fixup_flags =3D SPI_NOR_4B_OPCODES,
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x20, 0x1b),
> >               .name =3D "mx66l1g45g",
> >               .size =3D SZ_128M,
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x23, 0x14),
> >               .name =3D "mx25v8035f",
> > @@ -154,18 +174,21 @@ static const struct flash_info
> > macronix_nor_parts[] =3D {
> >               .size =3D SZ_64M,
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> >               .fixup_flags =3D SPI_NOR_4B_OPCODES,
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x25, 0x3a),
> >               .name =3D "mx66u51235f",
> >               .size =3D SZ_64M,
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> >               .fixup_flags =3D SPI_NOR_4B_OPCODES,
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x25, 0x3c),
> >               .name =3D "mx66u2g45g",
> >               .size =3D SZ_256M,
> >               .no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_=
QUAD_READ,
> >               .fixup_flags =3D SPI_NOR_4B_OPCODES,
> > +             .fixups =3D &macronix_qpp4b_fixups,
> >       }, {
> >               .id =3D SNOR_ID(0xc2, 0x26, 0x18),
> >               .name =3D "mx25l12855e",
>
> Could you also please share the SFDP dumps of these flashes with us?

Certainly, I can share the SFDP dumps of these flashes with you.
I will send them over shortly.

>
> Thanks,
> -michael

Thanks,
Cheng Ming Lin
