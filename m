Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C62BF3FF
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153209; cv=none; b=C+THr04+XwZwJst+ak/SDLJPhyd82cD1g1PfuGhQPsPWJpLj0td3xEUzrlOfIV8NOChORNKQqnxrCBae0bqyB5I8D6IO+TqJYpZ+VZr+6ChhJxfvR2ov9LrqL/uizpEVi+uFIbUOl2JUnVFUkyZV8cOUVEhHxpu3rhHAEsScz4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153209; c=relaxed/simple;
	bh=cWhfEEAw+tV/nQS2PrbAq7o6mdRDmYJ67CQa4j3Vk2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxPgCBSZkUGBeFUU4Q6YPkexnxYwdo3Pjxq6TP7JUYBeeAlFG/Z/vFOeByhMXnpD8vlE/p2XI+icGGfo7PXzAEOxPgDFFZnJh0sEKfIeGDFTVnvIhsWAz1N4TW9qcbi8306Hd9oTpJSS/cE5jiM2gGv5zc0Sl4s7YjKpJBYcq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com; spf=pass smtp.mailfrom=lessconfused.com; dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b=PFI7ywq9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lessconfused.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lessconfused.com header.i=@lessconfused.com header.b="PFI7ywq9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e8461d872so56454175ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1747153207; x=1747758007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=PFI7ywq9Nxu7618sDhq/hrQh7AHQ/+myKdLHbqzke1KJi5dH3LKQhujwt64wR5Qb63
         PpSPoLYxtskCwVB02+GPWh3zkMnhKfDv9XPAQASlWO9zzhr6GyXJXLZA4ZaVQpYG5sQs
         6UetmO7zcnd2Sd2ZUsZj/mtd2112cOEM35PiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153207; x=1747758007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Okg4wdYw4WB8DO+V7q9yh5s+wPKhLzpza5jWmCmNzLM=;
        b=Q8A5U/0Au8uVWmoP5Wm17i87UVYA1Bsa+7jO8uEYk2tPfD0O1w4JYopeeE3yfz3dmf
         IZE4nAEajFepxvdAFs9F4H+87JSsD0zNOEVcB6IoUpmmng1Zt646koMI81+PySR7s1fd
         tKFyrtqZwh7sORVhOQrlNNuUn+JU8t0eODBGHe5LrQFS2GJ5ghwU9M6HCWQsaJbG+h53
         T4BEQUr8HmN2Yl5IkHEnuvgonKhVnSEvWVqVcRGIbuAsNx6Ug/VRg133d1xh1WNhPJg5
         a/YYzS0dljuj+bsLprsJzGR6If94MoxGcrO/BwUTpkg0s+5d375he5eKxo5vqpSpPO4L
         6TGg==
X-Forwarded-Encrypted: i=1; AJvYcCXgQ/wc1w/zqnevArf6nXojnOyhkvHLVWD14pj/WmqunxNnxy/wgckwC4Uy6o924lbKwjU4vimmfJMGiEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyufgwkrFgakzQ1I/sVsH9joxjRB4wA28zr8tEiOJw9+IZ2Ysyo
	qXB7rSP2gOIP5GlpeNP/vPAATEchLWvrcA825jAJq90TPtq8DVGyEw0Tj3hL+/e7qvIqjGZvuV2
	zoyCjpm/1qTKT7hkQJYfAFhT4Q2f7rXfoikyKNQ==
X-Gm-Gg: ASbGncv4CyG56e6bUwLJciSeO35ItWTzZEToNMccVFDCng8mzrTrWEZQNo3JFRmFUt7
	o5+7YmlexjlftT85Elm7I99s6Pzg+DopbY8PBzy11r0fMbv4CfQmm9zYxR3QM+c1fsoyKoB3ZhG
	mpCUWGSatAjnrPFG6IU9HfOkEaqb1BxF2Db0Zc33FOKAQ2oXYOJCa0uRJL+lzaPe7r8lo=
X-Google-Smtp-Source: AGHT+IEFiZZLEVm8p4exZqTgRnoEBDvu1NNpn5CecmgOUa1lbzow7S7xDOQ9y/PS6u/6mPTPI55hbsmTlWowpXVMs6Q=
X-Received: by 2002:a17:902:d492:b0:224:2a6d:55ae with SMTP id
 d9443c01a7336-231981d284emr53485ad.48.1747153207290; Tue, 13 May 2025
 09:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512142617.2175291-1-da@libre.computer> <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 13 May 2025 12:19:55 -0400
X-Gm-Features: AX0GCFvX20FlZeuRo40HJUU0H1dNyPENU2uA3HGGuO4tfwuq5uvg2W8hOH9cVak
Message-ID: <CACdvmAgNVf8jtRj-jONwunGXhheaizUEEyB4rz5tpqzXb6hKqg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@libre.computer>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:52=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:
>
> > SPICC is missing fclk_div2 which causes the spicc module to output sclk=
 at
> > 2.5x the expected rate. Adding the missing fclk_div2 resolves this.
>
> I had to re-read that a few times to get the what the actual problem is.
> If you don't mind, I'll amend the commit message with
>
> '''
> SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
> are wrong on this clock. This causes the spicc module to output sclk at
> 2.5x the expected rate when clock index 3 is picked.
>
> Adding the missing fclk_div2 resolves this.
> '''
>
> Is that OK with you Da ?

Feel free. Your description is better.

>
> >
> > Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK =
Source clocks")
> > Cc: <stable@vger.kernel.org> # 6.1
> > Signed-off-by: Da Xue <da@libre.computer>
> > ---
> > Changelog:
> >
> > v2 -> v3: remove gp0
> > v1 -> v2: add Fixes as an older version of the patch was sent as v1
> > ---
> >  drivers/clk/meson/g12a.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index 4f92b83965d5a..b72eebd0fa474 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_pa=
rent_data[] =3D {
> >       { .hw =3D &g12a_clk81.hw },
> >       { .hw =3D &g12a_fclk_div4.hw },
> >       { .hw =3D &g12a_fclk_div3.hw },
> > +     { .hw =3D &g12a_fclk_div2.hw },
> >       { .hw =3D &g12a_fclk_div5.hw },
> >       { .hw =3D &g12a_fclk_div7.hw },
> >  };
>
> --
> Jerome
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
