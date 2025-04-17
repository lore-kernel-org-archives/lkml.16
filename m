Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461F1FBCAF;
	Thu, 17 Apr 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885052; cv=none; b=KeW7EPvV8pw4I94vh7vE755IFV8F/0eB1U8sQZV0f//qdAdN2PpsywaTIbtt0lCyrnoelDM2HJ0d/9zmRWxj4rh9V8nIZJGBbUVYBKEHgQuJ2HfdHuSMxgPMrAGyNj1djTxtbKw4KA4bO0Rhpr2Egku6/xZJKqJ1BIpSOPNLj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885052; c=relaxed/simple;
	bh=h3UCEJIIGeY1tUsuc/qIZ1JHXh0UjMxmhnt8IJ/77uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBZ4OX7+fSq+sA6IlUZg4Tf8qE+fb/LALoX5UupOQ+VDA2eBC+LVc1fguheqcA1pAOjU2bNd5MDiegWTZY+8mQ7TEovHKiYxRXS4Oudl1BS943edNH8IwG4Qhm67EYQXu5/5gbfI0FH177yTvOoNxBwZZzKhRnYjK8qc7La/bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC+aK3nt; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC+aK3nt"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so596966e87.1;
        Thu, 17 Apr 2025 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744885049; x=1745489849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr4iHssyb6BG/1AKbGKXTkraXilD33gxEVEHI0uTy7c=;
        b=nC+aK3ntAniqwQhQogNGGRXFghF4H6gVk3M4EL0OMwxvhIFHc+HoBKDzWqXbvrSJ+3
         bfa/RXi/OFjyWvfuBwmSzRvRhursXrn0bWkOaeGqXEuhUEfjbLGcHaal5MamR4NfoK5D
         PFgQ9itbY37hj3276QiglP02ddDK6qE52QATmoNiyb8hbCOTYxP+B0M1MZ37n8kQQLP6
         UeGW5aKR2yrYzSTHsA3C7i8D4N5khsXsofhH8H0LwwxC5X9eO940Y9lGQts/diBF7DyQ
         GMbnSAIxgvFcqQ+nfEFsGr6yMLBpnhO+NbsWa2tx57F6Io4cxC4j4+nT6P1c3op4Yifo
         VrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885049; x=1745489849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mr4iHssyb6BG/1AKbGKXTkraXilD33gxEVEHI0uTy7c=;
        b=UgB/7OGzhhhIqYcSq74uAHzLtXKz/KtcLHJgQBxV8lTRUHmWOo4evkqw82k6nzpVyv
         n/MDlKylpxhfg30RPLyg+vc9G03l77OCA8jnI03AlqfvVo1S72nzU9vg5xI7fsw1EUWs
         aUdG2Y3dSf60vBvls2NGBA30GTGmAGldT5HzYKZjWQq+NvO/QJD7k71lOLCpDQppsw8k
         XLBnI6rgbQZY9lS8yRJX9z3bVKgiF9Ih4Y5vhMwgprEM+NU9x2NAlTP7hidX8iFDmqub
         5feidsroZsvSD74vJ/H/QaUreBDkgLuZcKsOoTfssWd2lTttma8eWeEyhwRy6qbZE9ho
         zerw==
X-Forwarded-Encrypted: i=1; AJvYcCW6NVSAfQ5NChOvKT9QaYyap8tywtJ8Tpr/wxPGdrkreMrTSXHw9sDks1OdWeEqD14mbKzg0Ef51qogY2nQ@vger.kernel.org, AJvYcCWj0crG4NaXqq+mwzVd/UKhHg/fEptPqbzYUCLZssMCIs9vgVA4+2EijsmWVhir7PvFnl8U4WZ9jTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqAd/0eDIKsNDwEM6CA8O0SP58cZhs19vGYXkAb+VYWG9wqODR
	yvgxJFL6CMOkAvSar85m1gUpXAqJo8cVKa/zxwV9WN6tFJhVT/Mgv3mu6X/JJeaiiCk/cMgbsYI
	EmfCNWrdMuDqSdxzV5tpQKG2jNI8=
X-Gm-Gg: ASbGncvBNWBTVCx69wscDP6oPyiPXJquHQyXYjWlWyy47Q9cOAZeya7mD1R1kAfAE3j
	FPsb9YkUDiH9vdyDKIji+EHH11y84nC0hIerXAuGWxUheRIfd150pH0C8IHlbfgKx5njepUwTTz
	W3547eRCRTXgqLujDnrfnImA==
X-Google-Smtp-Source: AGHT+IEvRSTyP0SY5ojVdpl7yM7WjI0aehemNKpV20d6KfCvjuDMKOIi2DQC57sqiNxjCYpB1GvaF2rMc9iGaUjrjwM=
X-Received: by 2002:a05:6512:3b8f:b0:545:fc8:e155 with SMTP id
 2adb3069b0e04-54d64a9c105mr1945636e87.20.1744885048467; Thu, 17 Apr 2025
 03:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
 <20250402020513.42628-1-bsdhenrymartin@gmail.com> <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
In-Reply-To: <14654c19-fa26-4d37-8f0f-9cf092982b67@gmx.net>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Thu, 17 Apr 2025 18:17:20 +0800
X-Gm-Features: ATxdqUHZfP5CWnv2EfUodjm25gfdmY6UfSse5sOTHfNb3TCeaJauUAPMA3I37KI
Message-ID: <CAEnQdOqoCuiN67oWisJs7RYandhHxcvbPXXxHKmPaoS5=puPyw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
To: Stefan Wahren <wahrenst@gmx.net>
Cc: mturquette@baylibre.com, sboyd@kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, 
	mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, 
	dave.stevenson@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Just a note, please don't send new patch versions as a reply to older
> ones. This makes them harder to find.

Noted, thanks for the review! I'll make sure to send new patch versions as
separate emails in the future.

Regards,
Henry

Stefan Wahren <wahrenst@gmx.net> =E4=BA=8E2025=E5=B9=B44=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=9B=9B 18:09=E5=86=99=E9=81=93=EF=BC=9A
>
> Am 02.04.25 um 04:05 schrieb Henry Martin:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> > raspberrypi_clk_register() does not check for this case, which results
> > in a NULL pointer dereference.
> >
> > Add NULL check after devm_kasprintf() to prevent this issue.
> >
> > Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>
> Just a note, please don't send new patch versions as a reply to older
> ones. This makes them harder to find.
>
> Thanks
> > ---
> > V1 -> V2: Correct the commit hash in the Fixes: tag.
> >
> >   drivers/clk/bcm/clk-raspberrypi.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ra=
spberrypi.c
> > index 0e1fe3759530..720acc10f8aa 100644
> > --- a/drivers/clk/bcm/clk-raspberrypi.c
> > +++ b/drivers/clk/bcm/clk-raspberrypi.c
> > @@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(stru=
ct raspberrypi_clk *rpi,
> >       init.name =3D devm_kasprintf(rpi->dev, GFP_KERNEL,
> >                                  "fw-clk-%s",
> >                                  rpi_firmware_clk_names[id]);
> > +     if (!init.name)
> > +             return ERR_PTR(-ENOMEM);
> >       init.ops =3D &raspberrypi_firmware_clk_ops;
> >       init.flags =3D CLK_GET_RATE_NOCACHE;
> >
>
