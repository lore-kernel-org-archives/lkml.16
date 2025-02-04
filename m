Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23899200CB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 02:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738636491; cv=none; b=OZmM/p4MD2MKLQX7HnM1UHsYmesQcPQTEoyvDyQjlXRO54LRDKGlxM5zS2v+898ZseMYx3x73tpRhHYA98GQUItAIeD9NfKx1lEzbR9/KP+b2umI8fZBh8gjYMIycVF9r4NGdpstwDlzEbATfjqAuJ9LNBWucCPIVpnWM8UjiSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738636491; c=relaxed/simple;
	bh=qrZc70WY8fpRYVIF/n14Jw8Zaa1WPCHIz+gPP6fhy7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tioGgdLYoJLKj++girNJGgI/xJAxJJhsLX673oMyGjSpMXNKNn/YPZDbMogueaF/8qwvU5wBU6IpYgdUUPahsLiHAUEfs2N8UkWZxUwD/Y8FDy01bQWJQxZuimRFU13vP4gKABoSwWytyRD2keAXBBBr1EIii3W7ARDMvDtHHGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWbqTdTy; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWbqTdTy"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a1ee7ff2so47791201cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 18:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636489; x=1739241289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNTxfPJ8scz5P8ra0xEsV/4TfL1hI/K4qQuIKsBFcL4=;
        b=cWbqTdTyMegM9/BLTfgOnhERbDtm0LBKME0kcsX7CzjXojQ2ThmZws9R0yOmxQLvwO
         uwjJ5R82FjfObTS/IVxGJHHnq/+pP5pGV3dpdNMBkDxBNYDbFTGNYw2z0keLY2t8qaI+
         mETmyg8NbRTHAQCLuLeyi1cOfILufDwcnvtHwQMXbSA77gtLJokrGqoBc0H3joiRx/Gc
         ApiqdBQp8YBOcmnd+3JkTFDMpPEhMjPxUCFZOQ3SrORHbTr918WJ26DaajZldKXOA74O
         bzvYMwWD12C7zLgIGZxQJ1bQFbZmm8gDumuqVVxrCogHaAL219J1jNxzpYfqJDpb0MoN
         ZzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636489; x=1739241289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNTxfPJ8scz5P8ra0xEsV/4TfL1hI/K4qQuIKsBFcL4=;
        b=IlzPFEWPbXcZNsiDyQzAETnnyw836JyhxnzT/ILHeD0pvnphSzt6Kdq7sui+9pdENd
         0IF8BENuXFptIwPpzMcR9c8+RO9X48MFmNg8cUxSk7l0AZTN8/I+LRXU69ICXeoGAZwz
         ylGZp4+bocqfpV4gPxmtGdEM8DppxS5YCbGURlK9iZWOPJ3wnpvWYBJWs42zEHeTIWn3
         +P/t/aWvZ/R4fUzDM+oezaZQbEN/vSAgIRyL6eFaVHZBKt+zZhQEScXRlt5Z4k5pbLEO
         hLJOf+O7P2JI+2Nz8R8uczkRGBUHnGwt9NT6grcWUrAVZAsm9M7z68tUarSODFGVaCzE
         eNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2UqrPbsKUnbqavLCoOrQ5ZdiTc5iZ6FOlU9Y+5hIHXnRYWtOC8EMapfYLIC9JzUVbi4CwoKHaMLN0GFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0P9M6Ak8n6fl0qZSnbG7/4e8UiIxxsl4ft4vGYS0cVsrv7dnm
	tRAqUFWpbRDF/Y40rdxYCSJ6E4pW86vy3hckVpJZE7HjLU+7v9s+mBbMGObH0Viph5o3FDadZVd
	UVY8XuTZlKeCmS49selDhzhxC5SM=
X-Gm-Gg: ASbGncuAGnHDzLaQu5pk+BIWmgywzDJpuCiUmsIVxs8AFgiuztij/AzozI9VssNkC5F
	+Yeq9ymZj6k/vAkuPt5AcUr3OxOxEXeZzrNKq5vkrZ0hY1RSRBB4ohkHPx/VzoKE7ljlHdkwP
X-Google-Smtp-Source: AGHT+IEK50aSCmTeFuOHAwQQeYblTvCn6dbXx6xfD+SAIobH6xYybFfsHHkKFfIMfM5I5kQKiaBCu9KJhQwH6QbqrNY=
X-Received: by 2002:a05:622a:254:b0:467:613d:9a1 with SMTP id
 d75a77b69052e-46fd0b91021mr339827781cf.48.1738636488834; Mon, 03 Feb 2025
 18:34:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com> <87tt9bxwc0.fsf@bootlin.com>
In-Reply-To: <87tt9bxwc0.fsf@bootlin.com>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 3 Feb 2025 21:34:38 -0500
X-Gm-Features: AWEUYZl082pPVthAFAYQsgrgM0XrRlIDwdjYQMv7xi2bolv-wHodMKLbD9AsSKw
Message-ID: <CANeGvZWi3rZoLcgAyTVU_nKTaE0pHxPYzdqZy2oBsmH+LpUryg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, gmpy.liaowx@gmail.com, kees@kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Mon, Feb 3, 2025 at 3:32=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 02/02/2025 at 20:54:56 GMT, Jiasheng Jiang <jiashengjiangcool@gmail.co=
m> wrote:
>
> > Add a check for kcalloc() and print an error message if it fails.
>
> Checking, yes, but logging, no. IIRC the core does it already if required=
.
>
> > Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
>
> Cc: stable is missing
>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/mtd/mtdpstore.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
> > index 7ac8ac901306..368997155c07 100644
> > --- a/drivers/mtd/mtdpstore.c
> > +++ b/drivers/mtd/mtdpstore.c
> > @@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info *=
mtd)
> >       longcnt =3D BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
> >       cxt->badmap =3D kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> >
> > +     if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
> > +             dev_err(&mtd->dev, "failed to allocate memory for map\n")=
;
> > +             return;
> > +     }
> > +
> >       /* just support dmesg right now */
> >       cxt->dev.flags =3D PSTORE_FLAGS_DMESG;
> >       cxt->dev.zone.read =3D mtdpstore_read;
>
> What if register_pstore_device() fails? Your only partially fixing the
> problem if you don't handle the free()s there as well.
>
> Thanks,
> Miqu=C3=A8l

Thanks, I have submitted a v2 to fix the problems above.

-Jiasheng
