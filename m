Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B051C54A2;
	Sun, 27 Apr 2025 04:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745728997; cv=none; b=qiKhGSg+oNuRYYvrWWFBragW94HcQgDVvOzGEYWOx7VwnAvymZjLp7h4HEHkK+LBlbFjaM4uu0xvdgu0iRfTWc93UrT3DXUqsz3QrZQ2Sio8nUsdTljf+qhpoRV4ut9q5McDOdGOU9T6/PWxVxKeSuUYE3XnFrtQs6gOQnK2uwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745728997; c=relaxed/simple;
	bh=NMOsczUUODVt3Zolp3/Xl1vOQEtVEsrHp6FHpA3NJYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udRsJq/F0332cVFfmrpmGQjmEY+GL/M6Lf3e4viINITIavWWt+/6MrjDjmWvpkwwEp387XGUxQNB/+0DGt551cy1auYds0QTT3TpGoEThuxrJbJsJEtoNjn/vSCja5UJlYLtEDYc9sL2pRnjH+3fy+K33E6oyT2UB9Qh8TVPccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so98979239f.3;
        Sat, 26 Apr 2025 21:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728990; x=1746333790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=;
        b=GJ+FysYdH0eMiYDJ26PFXpOkdCLlU04pSqcCuzaXymN4KH7I0wKMdoLFjSUYdHK0vq
         exkjJa4FEH/6XejypHaQ+cd6dsi02+wtpd+HX/PJthBCPquX/u3oY/gyD3XK3ZthmUP1
         keYj3BFrAzAJTC4pkHD9nsksJfZNKfHO7XPA4iBQeVibiehCz8l3OLb5rgksl1DmT8Ca
         o9JmlBEfsXrtWe0kNQeTT9a95baKxUmHxA3RjLhNq4Ikqj/svb8oMNxaxE/H7LIcqKM6
         kP0FGkbWJuw14u8MrEwLPtFgrqTK/46iHKljvUoZH70B4sfyS7YHvxhVwSQejndIaE0V
         mGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYXe7aaPjg8R+UtsSUmEmY/Ym6nvM7o5QgNr2d0T1PX2juU14CR7P2irTw0aDU5pfh5ZEyBaV9hrg=@vger.kernel.org, AJvYcCWlP8k79z3iEyYzPKmqKhfie7p3oeZTyab1yZalqw43NyRpnqe6vhJSSEez23NlJThS99OcTUjqdbfDFwHD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bYAAwmdbpx1AH/VtO4jHux/YOJdgVeJKARc9dMWpKxgcVncg
	o85ebSpU5uPR7DePD53bF7JPOUqUXO2n3UAC7PW5acyBiU9+uQ03isiMH/Wq7AQ=
X-Gm-Gg: ASbGncuGdg4qNJRuC8pkPZv3eQkO1tvuqOF7XiURcWXQ1dIUc6g0w+hJlZjveEOfvUo
	NiZwqpCAdzJr29KjWhM/Rilif91wN6O01rItwsV8Ffh1nl19udtzZg+JuEokqIk7DV1kVxB/Luq
	7fHGyggYmW7UTmFoV2MZ86psBHQ7vB1dJy13bXYq4Lf1cCkCEzidsVWyQVkh+ONPX6czOz1HDha
	+CQm0Ax9sm1E0xTO9q91EYJO6HlGRx2lPKVEOd12XVH3Kwn4czI4MpT0PiBudxelJfgxcjNvjEu
	ogit4PLMgjqj5HCnhgnuN8j/M+0Jjo2VnOn3a1oPVQpzRfc3XmBZ21RUhBHMXoWb85lkwkA82Q=
	=
X-Google-Smtp-Source: AGHT+IFiAnRl2ecxXQh5D/IXLW8A12TS+rj1lXbJwxeFTyjWPnUUhBCHZXgNbuwebFRCW2/SCkQvHQ==
X-Received: by 2002:a05:6602:2c85:b0:861:c744:5a4a with SMTP id ca18e2360f4ac-8645ccafb67mr771116339f.5.1745728990196;
        Sat, 26 Apr 2025 21:43:10 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824b84816sm1543477173.101.2025.04.26.21.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d7f4cb7636so11458955ab.3;
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbi5jkJBonr+/yTUrSlP9vGjv6/86eBfwsqvM0BmLSlF2UIoUL1fNY6AkSMFsW6kVWfKoJ0KpXn8c=@vger.kernel.org, AJvYcCUyAGzc0e6XIAG91T++dE0nZaFL/nUbU23NPmA6xhTaKvY1huXCdznp3H+e3fX6fGyWZKApOAm+Nl8sbP6t@vger.kernel.org
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71427715ab.7.1745728988001; Sat, 26 Apr 2025
 21:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org> <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
In-Reply-To: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGlkS5EQPGwaf23ftJzckW9DcLS2uG0Iv-DsC8_L7KpG4vBmNT4ibxuK1o
Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Enabling the compile test should not cause automatic enabling of all
> > drivers.  Restrict the default to ARCH also for individual drivers, eve=
n
> > though their choice is not visible without selecting parent Kconfig
> > symbol, because otherwise selecting parent would select the child durin=
g
> > compile testing.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  drivers/clk/sunxi/Kconfig | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> > index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b17=
5dce798ac8b3268b0 100644
> > --- a/drivers/clk/sunxi/Kconfig
> > +++ b/drivers/clk/sunxi/Kconfig
> > @@ -2,13 +2,13 @@
> >  menuconfig CLK_SUNXI
> >         bool "Legacy clock support for Allwinner SoCs"
> >         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> > -       default y
> > +       default (ARM && ARCH_SUNXI)
>
> Just wondering, shouldn't this change alone be enough? The remaining
> Kconfig options are gated by this one.

Having re-read your reply to the other patch, this one makes sense now.

Sorry for the noise.

> >  if CLK_SUNXI
> >
> >  config CLK_SUNXI_CLOCKS
> >         bool "Legacy clock drivers"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock drivers being used on older (A10, A13, A20,
> >           A23, A31, A80) SoCs. These drivers are kept around for
> > @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
> >
> >  config CLK_SUNXI_PRCM_SUN6I
> >         bool "Legacy A31 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A31 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> >  config CLK_SUNXI_PRCM_SUN8I
> >         bool "Legacy sun8i PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the sun8i family PRCM clocks.
> >           Those are usually needed for the PMIC communication,
> > @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
> >
> >  config CLK_SUNXI_PRCM_SUN9I
> >         bool "Legacy A80 PRCM driver"
> > -       default y
> > +       default ARCH_SUNXI
> >         help
> >           Legacy clock driver for the A80 PRCM clocks. Those are
> >           usually needed for the PMIC communication, mostly.
> >
> > --
> > 2.45.2
> >
> >
