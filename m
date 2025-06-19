Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915827494;
	Thu, 19 Jun 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346594; cv=none; b=DSMh+kxZv/k6zgEExMLwhSCXCiOIylA0+aog/vJz/92ImXocrY9mbkcOxumDbkX0XrKMQQ28bwLqYGRlx48rTfjJAdr3wihiZBCu2a0JeSzoBSmqPb9EdZtSZOGuikLf7D563c1A9PIPrxiFLlSTy98BJv08jzFPq0QJPOr7X7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346594; c=relaxed/simple;
	bh=SwDI5O+tZvIfRNuyVcMNkxY6LY3/oXoFoTGFL2+xKdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFqlSIYUZOO0bSUvZYLNh0npXpsA9880YfBGxghdwoVMXhxHuexDP+sGenfvQ2m2cstYkKI2pT99f6eIm5BAuaddlZ1v27B3f3e8ic6fMQ9yXkO4gDeezpN+4eUbxJw+TYxy1vmJS22nSeAYzoVHXE1dDxx+5PfQbPPv6qgR1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7PDLPTH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7PDLPTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F57C4CEF1;
	Thu, 19 Jun 2025 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346594;
	bh=SwDI5O+tZvIfRNuyVcMNkxY6LY3/oXoFoTGFL2+xKdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g7PDLPTH86VqIWFBR/dq5nZkYzcm/0ocX6eZdxVfOS9hAmc7LcdqDA4dP0UIVrbUJ
	 iiLvm2tsVxKjOh89r/HgntGu4MeALTZTYHM6gbQ99HrVnzkZagwL7vrdM489JXYOBv
	 ZKIIyFu4VDB7BhR/Zn+RYe6JiZZx4Y3MmxZCJzusuQcFHgD5Qelvo6fAA7w81xXxzi
	 Y11NFLg5IbIgyqdRLt4dsa5a3+KL3aeBn/XqdA0zatcRfu4LMoWIHrM3SufS0vzjqu
	 Zdq0MFIEodVvwNQ8Lw88Baeo8zniUAZhxRS1gs1yqLD3MjdwNezp8MJOSw0AGpcqh8
	 AqFlbNGwZEVgQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so1623586a12.0;
        Thu, 19 Jun 2025 08:23:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVjWXRif/iBSxZZ4J5XyyhZQw6PBQRuoh8C0wQv4OsnNSeTX/42G8G7Xi0LRjE/A50HbGq95I2P6wz@vger.kernel.org, AJvYcCW1XVLQVZ+q1xx1TJEOJtpxvS2hvVcYo2wyXGuJNUhkJNx0hvxgZ14jC3wmHbvaVH90HXJBhydw5w01r/mK@vger.kernel.org, AJvYcCXrO7caFvvkqB5W1yx6apP1R42q92pFc+hW63Ss3i4GJjTowzTr8vI8DY/1e4VzbgT5OnAK4c+JiSjX@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxrxYMGXZ/H83avUQ3AqrXTD3WZ4p3U9l2XP2fih3QH7UaHlB
	lvma/hOi1DBmcwXc9aoQZISj9LRl0Yx2ARIccpjvvxDkhgrEj9YDpHci5ti10rhz+T5HmBQKOXz
	M8U2bd64s3JJ3icdhB08Xb+exLPGv8qk=
X-Google-Smtp-Source: AGHT+IG/pZuTmErWjVZ0Wq/kq9f6qxWsOesVABoR2+f8hJPtebRo74IpJF1gGR0hdGST63n8p846BRR2Vx2xAjaeraU=
X-Received: by 2002:a05:6402:50d1:b0:607:6324:8da2 with SMTP id
 4fb4d7f45d1cf-608d09cf5e7mr19497555a12.24.1750346592796; Thu, 19 Jun 2025
 08:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617162426.12629-1-ziyao@disroot.org> <CAAhV-H4dR3cd6g2+bGS1uLRKkpVVEjHY6Kd_QCYx4LuY71y6uA@mail.gmail.com>
 <aFQN2TSjT1IOvOt3@pie.lan>
In-Reply-To: <aFQN2TSjT1IOvOt3@pie.lan>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 23:23:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6EDEf3U6w5KY3R3HCAdAbqDefqpE3ktCQeQtFbDK2Ypg@mail.gmail.com>
X-Gm-Features: AX0GCFvvW6SYVKrmH037GeOA3vr2AnqCqYBdHT4NDoXMM5cozrqAuCu19uS9S9U
Message-ID: <CAAhV-H6EDEf3U6w5KY3R3HCAdAbqDefqpE3ktCQeQtFbDK2Ypg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add clock support for Loongson 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:17=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> On Thu, Jun 19, 2025 at 05:02:48PM +0800, Huacai Chen wrote:
> > Hi, Yao,
> >
> > I suggest dropping the last two patches temporarily, because:
> > 1, the last two should be merged via another tree.
> > 2, the last two depend on another series which hasn't been merged now,
> > and can be squashed to that series.
>
> These are fair points, but I think including corresponding devicetree
> changes along with the binding patch helps review and proves the binding
> makes sense. it should be okay to merge only parts of a series, so I
> guess keeping the patches doesn't hurt, does it?
Yes, keeping them is just OK.

>
> By the way, do you prefer to wait until all fundamental drivers (clock,
> pinctrl, and reset) ready and merged, then merge the devicetree with all
> the three devices added? Or is it just fine to go part by part, with
> incremental changes to the devicetree?
Yes, I prefer to wait until fundamental drivers are merged.


Huacai

>
> Best regards,
> Yao Zi
>
> > Huacai
> >
> > On Wed, Jun 18, 2025 at 12:25=E2=80=AFAM Yao Zi <ziyao@disroot.org> wro=
te:
> > >
> > > This series adds support for Loongson 2K0300's clock controller.
> > > Loongson 2 clock driver is prepared to support more clock variants an=
d
> > > its flexibility is improved. All clock hardwares except the output on=
e
> > > for GMAC module are then defined.
> > >
> > > A clock tree dump could be obtained here[1]. This series depends on v=
3
> > > of series "Initial support for CTCISZ Forever Pi"[2] to apply.
> > >
> > > [1]: https://gist.github.com/ziyao233/160bb4693e7758b2a2a996d4510b724=
7
> > > [2]: https://lore.kernel.org/all/20250523095408.25919-1-ziyao@disroot=
.org/
> > >
> > > Changed from v1:
> > > - Fold loongson,ls2k0300-clk.yaml into loongson,ls2k-clk.yaml
> > > - Include the new binding header in MAINTAINERS
> > > - Link to v1: https://lore.kernel.org/all/20250523104552.32742-1-ziya=
o@disroot.org/
> > >
> > > Yao Zi (8):
> > >   dt-bindings: clock: loongson2: Add Loongson 2K0300 compatible
> > >   clk: loongson2: Allow specifying clock flags for gate clock
> > >   clk: loongson2: Support scale clocks with an alternative mode
> > >   clk: loongson2: Allow zero divisors for dividers
> > >   clk: loongson2: Avoid hardcoding firmware name of the reference clo=
ck
> > >   clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
> > >   LoongArch: dts: Add clock tree for Loongson 2K0300
> > >   LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever =
Pi
> > >
> > >  .../bindings/clock/loongson,ls2k-clk.yaml     |  26 +++-
> > >  MAINTAINERS                                   |   1 +
> > >  .../dts/loongson-2k0300-ctcisz-forever-pi.dts |   1 -
> > >  arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  17 ++-
> > >  drivers/clk/clk-loongson2.c                   | 124 +++++++++++++++-=
--
> > >  .../dt-bindings/clock/loongson,ls2k0300-clk.h |  54 ++++++++
> > >  6 files changed, 193 insertions(+), 30 deletions(-)
> > >  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
> > >
> > > --
> > > 2.49.0
> > >
> > >
>
