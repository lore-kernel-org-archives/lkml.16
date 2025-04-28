Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01D1CAA7B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745823078; cv=none; b=JxRkb9yMEczXAIeGcqOyWMjztcJ+DNDds7eWssefa76Fco8u8O6ixo0RHMONafXmTA25LFllUsGnEMpkY5GWZiasVfm7QaUotTiLYSpBgydw+oiI1zZTI0nye0uLL51l/exSWg7VPedSVe4ydePyx3QV6y9EdezAmJlHYdfiQew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745823078; c=relaxed/simple;
	bh=yPwiv3LIPXq7QwC+Z6qeGGumORWMUcAQ8Rt34+S+TqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyUhaQJgiRnr1dgShBrPxYOAgqGjqeGsji7tDUX0nLVJGwelcEdD+vvDTt48ptNlmmiXTJsT39hdDIQB3CKdTrcu+22cug4yTQXQc0LfmZQU/3gGeySX8T6Sfpyn0d1XzAR5OE8enZAp9yWsJK84lhCZf+zcxB2PIdn6olTiE1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1K6otC4L; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1K6otC4L"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso947826266b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745823074; x=1746427874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=1K6otC4LVS8Mr2e6mKhawp9VCVtNjoaiXCOU8gPOnpx/XLl/euBLq5mV+dzC8MRa9u
         xyD/rBCRFZ2eOrfwngfGPbTYBhMA7O4xaJ8h9GQKDMiLIN6zKbjHtVBA72pG8tc4wNy8
         r93ENVJB9hSzfvDyd+6Ogdx+48I7BRzwGceuOtj4aGnt5SI1tBwletGkBUsg1AcM1mx+
         yau5zc/m4KGbPKUZdH50LBq7TvHx+k1jM8yNY28SWcZHZx0KZOWzjthAEhJ0xGhKYU7K
         lWqSlyZDLLff1ywCcDvWOXXJ/EOPC/Gzo2G7WILW5jiyPDSDcQZerUA97EgJHHUllxdt
         tFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823074; x=1746427874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olp7njR9Ybm79qV02JWYfEZZNtFSE8MfHDfoR2yiSUc=;
        b=rs3RfY+ApTeEbfqXSTArpuYvVSO4Bb22YP8ueZkoiylmkKBiaA3pUND8g0KBcCV7mF
         aUWktW7Vvef9PNbSbfEtaZBF8446ysdyipVEnb6Tq0ob+vwgS4XKBZ85bPZg49pRa//4
         7xCcSkwby0wGQ9ORg5a+y7ip+395OXGD34Kay+7XMpXDXo6J38q/zGAzDyYDEI2fbMcq
         KTG3khUNl+NeYd1IYQwj7uMQd17BIIJLTPs3cf0rcqG6Zpsgksx2TliXbzK1ZGpY6cNO
         TITMJlG2ntIKm/NzV09zA2iW3eM5rv1MEUVfpSZnzAlxuZrCFpnos+OaMb4nJ17Pb/98
         R0PA==
X-Forwarded-Encrypted: i=1; AJvYcCUMwv4KMiaO2F40mYEpnAWBiwqw6raFL8SKV93JEXtKV/+pCcG/ysVWkGxOuc0KAeAijwuWtHiQhLqyVEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypS+Uhqm6ixUZSc4lXol63LSRWLl1yM+xav4XEOiBCQMbq7VmD
	/fYQomzwhxH3VEqSKsrxFQ1aaU4FilSi4Wo5+GAuOLqsqDLAH2XIbqpSnEv9TYbvO/p5otFKqlS
	4psdDsOnAHMSyQnEBHh4QtydrXCXI09WozwuGIw==
X-Gm-Gg: ASbGnctspINbJGqhK3VimMynE9KBMh/htSiZEB+wEPpbL/dzeH7+fvBhdTMe8GJDt3d
	pCReCAr9dvzHIjPwFMjrdsTw4w16c8a9Zl83QeH4uFkcIDYsYlKVcNCfx7LJbZ1U2fgZDlNPG9L
	zSlWfcXkKFoYSLzv3wdG3W6yQ=
X-Google-Smtp-Source: AGHT+IEtEaxs9n/fqGJEuZ8Xotr69RVdjbKFMaVctCQmuSvnkMpXaGIdiMr0ZU582rbQFSZfQks/8XyJ+CzfPm0I+P0=
X-Received: by 2002:a17:907:1b0b:b0:ac7:4d45:f13e with SMTP id
 a640c23a62f3a-ace710a0eacmr947603266b.13.1745823074048; Sun, 27 Apr 2025
 23:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250420070251.378950-1-guodong@riscstar.com> <20250420070251.378950-3-guodong@riscstar.com>
 <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
In-Reply-To: <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 28 Apr 2025 14:50:52 +0800
X-Gm-Features: ATxdqUER8JSTuuOTantCFeixTZRLC93zvf7G5uIviwPU2QmuQNBr7asOpX-Fl3I
Message-ID: <CAH1PCMZ4hqYo9SLCnzHYp_EiQKs5nhgW3XpxwqLEk4eX8=vWPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] pwm: pxa: add optional reset control
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:30=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Sun, Apr 20, 2025 at 03:02:47PM +0800, Guodong Xu wrote:
> > @@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
> >  #define PWMDCR_FD    (1 << 10)
> >
> >  struct pxa_pwm_chip {
> > -     struct device   *dev;
> > -
> > -     struct clk      *clk;
> > -     void __iomem    *mmio_base;
> > +     struct device           *dev;
> > +     struct clk              *clk;
> > +     void __iomem            *mmio_base;
> > +     struct reset_control    *reset;
>
> Changes like these are the reason I prefer to not align the member
> names. Luckily reset is a write only variable and you can just drop this
> hunk if you use a local variable for it in pwm_probe() below.
>

Thanks Uwe for the suggestion, I agree.
I will update it in v3 by dropping this hunk and using a local variable for
reset in pwm_probe() as you recommended.

BR,
Guodong

> >  };
> >
> >  static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *ch=
ip)
> > @@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
> >       if (IS_ERR(pc->clk))
> >               return PTR_ERR(pc->clk);
> >
> > +     pc->reset =3D devm_reset_control_get_optional_exclusive_deasserte=
d(
> > +                     &pdev->dev, NULL);
> > +     if (IS_ERR(pc->reset))
> > +             return PTR_ERR(pc->reset);
> > +
> >       chip->ops =3D &pxa_pwm_ops;
> >
> >       if (IS_ENABLED(CONFIG_OF))
>
> Best regards
> Uwe
