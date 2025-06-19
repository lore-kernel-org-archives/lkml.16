Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FBE27F4D9;
	Thu, 19 Jun 2025 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323779; cv=none; b=jGYDB/O0nCAegSe2FjI7Nye/lgaFyJA7WL2zfwukO+zS99IkvfHAoq68x7OerjJ5zybkqy+F64XrzYWj84z/ekeUIJ+SWGozI9rG9tdhjWkvSmxhaj2EDtSrZt7zwGJBqIIUx/qwk6s+xC3iTAaomkO0gjhDsevS0Njl6h2Zh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323779; c=relaxed/simple;
	bh=2MpgnpETN30hIWP4oUrrnam/CZGRD3pdlPHARl+Rlxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3+vZyLXUBIet6/jdk29QTRBtGKqNQh/bF6LderPldhrQVujJdXQYsXbVy/kTg5MEY1TadJtFWnn9w3UxkAKnbViE9PPVWBFR8sAufu9LjvXqRtfiRzf09rE7PMx3UHlDZw/xBWVXnFFPsHW9DsHlEhAlL4ZcSYWJcw1LMtGQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca2Clzv6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca2Clzv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9552AC4CEEA;
	Thu, 19 Jun 2025 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323779;
	bh=2MpgnpETN30hIWP4oUrrnam/CZGRD3pdlPHARl+Rlxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ca2Clzv6y2qTL8zOzuK2HG1grncyKjUdACrWtHGk6JrPvmJCr8kr9la93CEdJMyFZ
	 LXG1zUveZZVpoPV1Ri5UanlIUMy6q1qwl4DxuzBTi8pVTN87tCXVpRiYTOQzfP3gQP
	 fPtFJmD4ubJolyw/JGU8ljEKh4B8kKW2gXx3gs3F5A6sp7uQrwmtt5zx8OAGOh86zk
	 fDszTbdVXc48p+Sid12IBOzJKZDvUGQh+mlF9cRlndLm7sLUvmv//Cd8teq3w5amUh
	 eyHpcBEYPlg+qyqB9ifrczNqFymr38sshik0bMpEJJUtx07ePDj5UvzAc+2BYtMWBg
	 u9HErfh1CNiyA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so729401a12.3;
        Thu, 19 Jun 2025 02:02:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOThlHPNAjEbSOsu1eHhMuv4OOkLQbr0yVp2SpeNxe84tWpLfuRCW9phYGXZfz8W1HMWg+Zc8DK0fI@vger.kernel.org, AJvYcCVkbmne/OJKZLo58REIzxhpeqVmQNJEjAO6W5G0MygDPjjDhF7z4dvRTah5lH8czXCDxqcF1YoOIFOsepni@vger.kernel.org, AJvYcCXrOJgJarv6bydmLHphB9EDoOP9EZwG0oajthmPlVvKHm+39+aIOd4fWOv5my5KK2Ugq74VRL9a7HDA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QeTvTahe2bHpuV0n4BrpgZdtPvlaaR1yxhxO0NuaqejeS/S1
	P1CGuYFtmdF/khutLNH5K10rolf2WjbTl9DrJE1jTSyVDHAe+wD81DzWYWThb+K025/LiwuY/4/
	YDpqFMNg4LMsGGKE12pskmdLl1i9BBrQ=
X-Google-Smtp-Source: AGHT+IHU2t65H/WSJAAf31vaV2JfeWemEmHkIfJZcXjpQJvot/8B04gIiUFgIR9cHmq9zj8EAvshhPokPD86/DAMoH0=
X-Received: by 2002:a05:6402:34d3:b0:607:e83a:d698 with SMTP id
 4fb4d7f45d1cf-608d0834080mr17871001a12.2.1750323778167; Thu, 19 Jun 2025
 02:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617162426.12629-1-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Jun 2025 17:02:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4dR3cd6g2+bGS1uLRKkpVVEjHY6Kd_QCYx4LuY71y6uA@mail.gmail.com>
X-Gm-Features: AX0GCFtjs8_WZ5UK-Nxd53DwS9qeVOp0ND9KE0T_PbhGXDyWxYxLrMOHlefPrnY
Message-ID: <CAAhV-H4dR3cd6g2+bGS1uLRKkpVVEjHY6Kd_QCYx4LuY71y6uA@mail.gmail.com>
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

Hi, Yao,

I suggest dropping the last two patches temporarily, because:
1, the last two should be merged via another tree.
2, the last two depend on another series which hasn't been merged now,
and can be squashed to that series.

Huacai

On Wed, Jun 18, 2025 at 12:25=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> This series adds support for Loongson 2K0300's clock controller.
> Loongson 2 clock driver is prepared to support more clock variants and
> its flexibility is improved. All clock hardwares except the output one
> for GMAC module are then defined.
>
> A clock tree dump could be obtained here[1]. This series depends on v3
> of series "Initial support for CTCISZ Forever Pi"[2] to apply.
>
> [1]: https://gist.github.com/ziyao233/160bb4693e7758b2a2a996d4510b7247
> [2]: https://lore.kernel.org/all/20250523095408.25919-1-ziyao@disroot.org=
/
>
> Changed from v1:
> - Fold loongson,ls2k0300-clk.yaml into loongson,ls2k-clk.yaml
> - Include the new binding header in MAINTAINERS
> - Link to v1: https://lore.kernel.org/all/20250523104552.32742-1-ziyao@di=
sroot.org/
>
> Yao Zi (8):
>   dt-bindings: clock: loongson2: Add Loongson 2K0300 compatible
>   clk: loongson2: Allow specifying clock flags for gate clock
>   clk: loongson2: Support scale clocks with an alternative mode
>   clk: loongson2: Allow zero divisors for dividers
>   clk: loongson2: Avoid hardcoding firmware name of the reference clock
>   clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
>   LoongArch: dts: Add clock tree for Loongson 2K0300
>   LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi
>
>  .../bindings/clock/loongson,ls2k-clk.yaml     |  26 +++-
>  MAINTAINERS                                   |   1 +
>  .../dts/loongson-2k0300-ctcisz-forever-pi.dts |   1 -
>  arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  17 ++-
>  drivers/clk/clk-loongson2.c                   | 124 +++++++++++++++---
>  .../dt-bindings/clock/loongson,ls2k0300-clk.h |  54 ++++++++
>  6 files changed, 193 insertions(+), 30 deletions(-)
>  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
>
> --
> 2.49.0
>
>
