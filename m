Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E91BC09A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131572; cv=none; b=YQ9LyGLmaElM4+V2w3LuKclugEVuIXu6T9ySl2UKMaUuUnvlUOkl+pWkn2tRwEusxcAYsW7DcxjJoE1vEo2RLCb52FFwkDZtingnfSogTjycaXrLKGcG5u3z/4azRmRu8V3DGmkDvTxflYzzilB0AtoJO89kBd6OBy+zejIbMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131572; c=relaxed/simple;
	bh=EUen950rVlqD3ijE9T6pVem2TJoWkuc5INbmibM4S0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvB2POZgtG3fjjphbe3UX8Di2S5E69nRRvMs6IcDH0azg2li7LA471ljZo4IXeKY2Yd5Gi9LODI2wOLPtcM6Ar9W/6uTETC1eR+7xxtqCDNCht0nb7o5S6MGyDOZrcuHGjyetH79vTKKuShu+RWZ7JWs9bMp1w1Kl7PAkc2tXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yWTcg0Q9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yWTcg0Q9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549946c5346so6834190e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131569; x=1744736369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=yWTcg0Q9PBfR2Ym2DaddAHf3W8UbbqVkapLAay4CVch/G/aS9nderc0tMxiaqa3ECD
         BiySVswKx2OQsLHqouOvuM36tX9nflTAmpGV1C5/dEea9PSD6WG8iimMRGi/+t2HbV2N
         XUrLh8HAvlTyOkRPI9twLp5tOTiTaqgRXY9+DqrBFHOfqDdBamizuZV71WbZf3FWn0mJ
         x2Nt7Clb76dIGoFjsgAcoH8cVcmsUdnMPhsgKytWeVcNfaIF5RG/yDpq2Hs5MaLEcYQB
         qA0QfY/lrsEGjMaZdT/ogkt6XLca0UaAfx+D90612FiPVDgiJaADM06R3nIcNnhEKPMU
         0STQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131569; x=1744736369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9bdlMTBH0pZP1vfIIBZfl68hQHlVUhTU84A0dLxWUE=;
        b=C8nvnJIyzMjxcy1YC/9GMAfj3fRGm5ZI8wYlbLnUZHFSP6j0AYXyFRHF6emykFh++d
         VeUA5B+wvBH87Z2paiWGfAxIcU597l+onWpwEV5zHHSAOGC6Te6KLb71rVtt0VtutiNH
         CkYhipUmcEn3pacUU+HAIq4eGQNrB1yieAPt4frBM8n6MvS53+Wu90JrQrrcOMSFw1UQ
         O1WcXpe5ubWYQghGTyWnSrVg2GbvykKyO5gAKSPjYOXcc8TQI38qa1jMR0i9jUMN9uv6
         Pk0uOcY5zL5bvrtGXL1zzZhDvlw6WkqzJMygY1uv8XYrtVcDQ3voHq8axXl3Wa8g++Pp
         AuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYwgo1E7SmUGU3XGYhzpxMHJBzhR8SALgBt5LDcP/C1cHi4hS2fWLp8pnVstW3wjCCQctRJYz0yILN6aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPUOni7rqcTDJxnqkcfLCXU1yRtnsrElY9FkQAVLXn+HvX1xX
	Z8pxHYLwG0nIOWgvsO95c11tu8D7z7l542kb3E59AjYDeuLN7DJcTWhGS9KPUhH5K8LnAp+KFil
	x9x1/NMrS1n1zXxirbtJlE1p1IWhByc5BKomelQ==
X-Gm-Gg: ASbGncs0PKT69ioXn6NpMQkFEbxpxeztp2U44i8aKl+UBYPH0u+LtB+2ROdFZdYTRlm
	Cc2pHyZmpJePfePblehBJpdPD65nrd2nsw9FDnh9mu0Bkzr5vzmDFYbdKoD2IN5WlooqRHqGssH
	wIFH0vvar+AL7WWN4o6TCQ2B5BOLg4wslNqym9KUJnJX8L6/eZX8UVT+ySMA==
X-Google-Smtp-Source: AGHT+IFf+rKu3T7g4RXnGFAVwKLGYMFo6Zqu68CucFmhU42UIICJdAnEONryqtNi8mj8oclBDQsJoWOTWw94ILqOE3w=
X-Received: by 2002:a05:6512:33d2:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54c22767d83mr4780246e87.12.1744131568769; Tue, 08 Apr 2025
 09:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org> <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
In-Reply-To: <6790f337-8578-4ecb-b879-f5a254f109e6@riscstar.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 18:59:15 +0200
X-Gm-Features: ATxdqUFebT_4pyoTiD_cVWGxoRBkYoQNT5n1rg0F0zfP1Dh_NRC8OHcIuixy1l8
Message-ID: <CAMRc=MeEQi0rnr-mA1bsvAZu-NxqKp2Rjg9x9HYaSbuWY1seiQ@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
To: Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:05=E2=80=AFPM Alex Elder <elder@riscstar.com> wrot=
e:
>
> On 4/8/25 10:11 AM, Yixun Lan wrote:
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >    irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > In this patch [1], the GPIO controller add support for describing
> > hardware with a three-cell scheme:
> >
> >      gpios =3D <&gpio instance offset flags>;
> >
> > It also result describing interrupts in three-cell as this in DT:
> >
> >      node {
> >              interrupt-parent =3D <&gpio>;
> >              interrupts =3D <instance hwirq irqflag>;
> >      }
> >
> > This series try to extend describing interrupts with three-cell scheme.
> >
> > The first patch will add capability for parsing irq number and flag
> > from last two cells which eventually will support the three-cells
> > interrupt, the second patch support finding irqdomain according to
> > interrupt instance index.
>
> Did you intend to send more than just one patch?        -Alex
>

That's alright, the original series was 2 patches, Thomas picked up
the first and now I'm taking the second through the GPIO tree.

Bart
