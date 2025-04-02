Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EE81D7E57
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596269; cv=none; b=tEnNywI9cx8spEdIpGp0oNGCpzRv4wgVsJTdjTOXiWgQxxoUnQA0K6DmiWb9ELB4ZpokUAHYu2RqaQbyvZYy23PCWxr94TutmOKxVDTiH2aRJMaAU3vwVKHbEMeGrq/i8nqNTWFJTlXg6dMef3KW1bPt1M7VokDjC6E1G59La3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596269; c=relaxed/simple;
	bh=XW0LL/M5NKSqYy9JcEwbZw3WLkwEAqgfzE7DCRSJjUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uh8iiSnHqNdfFaDzyeeqmZSzg9H3gvR0RnduXuf4YkQ3RBDgQkH8Tz357tTlX1MspDqjoMupbu5sDkvj+/xIOtM46XPPkvv5RG2NV3qNucPlZ5URVUjbKFdyL8wY/nTyd5ZSwZmqPEsbDaqi9/bDt2U59YapY68JaBU8+8+jt+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYNsMKfR; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYNsMKfR"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af241f0a4beso47320a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743596267; x=1744201067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+Aiff+VJ5TY6uCX0FsWx+P2OR8WRq2iXQA2EiISelM=;
        b=UYNsMKfRpyKizv1NPc7i8j2sfWCR5R78/tQ22w3Up4JTwRTR6R3SYikdfZaNyeFP1r
         Ph65aB7h5JDD2CVAzlns6q727ZY9nQq4hqGXYxuoFROqPBeEpngNHjdoibO9VRFGqMgq
         IfxNZF4PFBV/fprsss6uc+gpGpEJnIT4ayd4Nj+749RZBcPIWrW1Px2orjDs86gz9Lkj
         HEaJYbsy53CtwrI6NccwTA1GOFJM1K7WZ/a8okRby3VNw4iJb9W2J48iKEtB+2MHPsYx
         wx7QZWhBxfEADbAToXoxJSJRzFmIwyrPCyglhUKpIxnpJfq30i1jqRsBy4t5E3AgU4g6
         jZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596267; x=1744201067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+Aiff+VJ5TY6uCX0FsWx+P2OR8WRq2iXQA2EiISelM=;
        b=dWydGYNxzi40096f6Ub6EEqS1zd4rqRadlg9kOqqa2trFHiXQlxr4Kz/yg3l5ASbJC
         +T8dq2T8V8qeutYZy27h0Nn5XQEd9Bs790QWWd7eYoZtGHOb/F3NiwvZfMcmZn28zric
         vY81dsCKBUb4nKdUj7TZw2XCKNpQRlLitZLVO9hCN9gHYUsm1BtmszOu2PgXqulBgLdd
         fpDFCV/sMfqXBivf8AUpxk9k4tlV2Lx8VXHTvWIS+KdsufmP9QkKKzigCaJPQAVaNizo
         6lgUyhEjOu0SeBc1++r/GH+9bLBfKi1topUGiGmWugkUzezmFG77DjEQOW40wX7H0W/D
         7FXA==
X-Forwarded-Encrypted: i=1; AJvYcCVpszQzeeqbLP3U7e7KpmcwC0yFNi0ZpVvw4/zliG0d3QxgEJO2AHrKzF7NFCjvlm+3l8W7Lvhb2oCh/nE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KG8poERFKtTCeL7LfNoasgt3w+q5O3SgFNCPWwpEWTHmGLQV
	N/6dSOKB2mZNqjOafZVchLIbprFrWePo6ayLP6nJlqj/zwHFor45X/2l2WKECknyrVdho+rFJ6q
	WMzUk6ud5BrLp0oS7MQEn2B+OzqwWMdHjBxEr/d9T
X-Gm-Gg: ASbGncst2DCcBkQyyxoZewf1sBEIR10RjEjM6Fa7QG6tJ+4HWlQboM/Mvq9Xyle1VRP
	lyieI3UMyAMtsZoXNhD8DX90xfO7HgNaU2Czk/HqJ18gR2P8C/v7uyOvmTA0XKnyR/qKsP9j496
	ZSmpRqQYvzGSJR/NwJKgZ8UohuKQ==
X-Google-Smtp-Source: AGHT+IG/LSbxzvoT/xeeqSmcctchEHRvDPSpksIPAmeT+7qawSM51TsN38gRTABv6UdwIco+b2JR0lGysRQUSGt6XfU=
X-Received: by 2002:a17:90b:1f91:b0:2ff:693a:7590 with SMTP id
 98e67ed59e1d1-305321705f1mr28534600a91.33.1743596267133; Wed, 02 Apr 2025
 05:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-4-linchengming884@gmail.com> <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
In-Reply-To: <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 2 Apr 2025 20:17:34 +0800
X-Gm-Features: AQ5f1JopUT7LorM0AaVO02_XOUBs7eOBdk1-K1hYSvDKdfihdC8IWeJ3LAk33zE
Message-ID: <CAAyq3Sb6XLC3WfDDZF1WpiBN1LtkP5A0rGBbVQFmC3=zSp3pWg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: macronix: Move macronix_nor_default_init
 logic to macronix_nor_late_init
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

Tudor Ambarus <tudor.ambarus@linaro.org> =E6=96=BC 2025=E5=B9=B44=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
>
>
> On 4/2/25 9:51 AM, Cheng Ming Lin wrote:
> > From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >
> > Remove macronix_nor_default_init and move its functionality to
> > macronix_nor_late_init to ensure proper quad_enable initialization.
> >
> > For MX25L3255E, SFDP follows JESD216, which does not include the Quad
> > Enable bit Requirements field in its version. When the size field is
> > removed, manufacturer->fixups->default_init hook is not executed, causi=
ng
> > params->quad_enable not being overwritten with the intended function.
> > Consequently, it remains as the default spi_nor_sr2_bit1_quad_enable.
> >
> > By moving quad_enable setup from default_init to late_init, quad_enable
> > is correctly assigned after spi_nor_init_params, regardless of the size
> > field removal.
> >
> > Additionally, according to spi-nor/core.h, quad_enable is more
> > appropriately placed in late_init, as older SFDP versions did not defin=
e
> > the Quad Enable bit Requirements. This change removes default_init and
> > moves quad_enable handling to late_init accordingly.
> >
> > Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macro=
nix.c
> > index 07e0bd0b70a0..216c02b92bfe 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -282,22 +282,17 @@ static int macronix_nor_set_octal_dtr(struct spi_=
nor *nor, bool enable)
> >       return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_oct=
al_dtr_dis(nor);
> >  }
> >
> > -static void macronix_nor_default_init(struct spi_nor *nor)
> > -{
> > -     nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
> > -}
> > -
> >  static int macronix_nor_late_init(struct spi_nor *nor)
> >  {
> >       if (!nor->params->set_4byte_addr_mode)
> >               nor->params->set_4byte_addr_mode =3D spi_nor_set_4byte_ad=
dr_mode_en4b_ex4b;
> > +     nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;
>
> Not at manufacturer level, please. You change the behavior and overwrite
> whatever is retrieved from SFDP for all the flashes. Instead you should
> introduce late init just for MX25L3255E, because set_4byte_addr_mode is
> not covered in rev A of JESD216 I assume. Then if other flashes get this
> param wrong from BFPT, amend them with post_bfpt hooks.

Yes, this part indeed only requires adding the late_init fixup
for older versions of JESD216 flash, rather than a manufacturer-level
late_init. I will make the necessary modifications and send out v2.
Thank you for your correction!

>
>
> >       nor->params->set_octal_dtr =3D macronix_nor_set_octal_dtr;
> >
> >       return 0;
> >  }
> >
> >  static const struct spi_nor_fixups macronix_nor_fixups =3D {
> > -     .default_init =3D macronix_nor_default_init,
> >       .late_init =3D macronix_nor_late_init,
> >  };
> >
>

Thanks,
Cheng Ming Lin
