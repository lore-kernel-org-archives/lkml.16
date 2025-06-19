Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB192188CB1;
	Thu, 19 Jun 2025 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339055; cv=none; b=aod2KpuP0HbAzjJCsjfFVbCi0pQbmXQcRGQciUhGObBGnvQ8J/ntjIeSo4xH21J9H5/0f9rXHaO9pNnnQFP/KmkYFq52ou57ZwoXopqat8TNa3puYrc37dwOQncZHksEZ1LRRM8O5Rq2UWq7AgAvd1wGuDGENDfhEzbQrAvVchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339055; c=relaxed/simple;
	bh=dxcXKwEUj8sgXcUKb28ZiQzkgidZwqraHxlva4Jn0Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb3toixsthR599C9vH20d/9mQcC6BvMCjOau5SvQi5pCZZnuRJWmHtDy7q0Cv9c1k/KORGhhucUk6wXWbQZd2QXkZ0hp3Izbseg4VUxJ2VCx8FgWeLXr1IBJ3V6SFeEbnS1/Y0KfITdgqpQcTux9y837ptkOG1jBDGpkrnng+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kM/KoYs4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kM/KoYs4"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5BA2925EBB;
	Thu, 19 Jun 2025 15:17:31 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5OwfZ29gqk2; Thu, 19 Jun 2025 15:17:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750339050; bh=dxcXKwEUj8sgXcUKb28ZiQzkgidZwqraHxlva4Jn0Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kM/KoYs4eRXoxD9wPSZnlO3gwu6ERpf18PsCulKGZJnbethKYhiYGZuCDv4qzhPRi
	 d7nlpDRB5C7nzxFU8+ziAi15ImXo66IR69HGfk4srxBDisoObNf7Jppb4IT3DquhIs
	 g6ckn6YELS3otT0mN9OWS0kFvQ7p7rwFSWjuSpfa6wJZYSqjIiNoTVyxq36kGjaEj5
	 ct4aC1y7isC1Twhi+Vv9pjRjx/NAm2JxAWQrb40SngjmvFV7Xe8KSrbZeCePQ/ZaNr
	 w8ZHw72cRI9koQnZ41f8nt5fHwLl15BvVkad+9k6+xap4pBxLXqhl11SI+3OXj+/ie
	 n4UyQngXW87fw==
Date: Thu, 19 Jun 2025 13:17:13 +0000
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH v2 0/8] Add clock support for Loongson 2K0300 SoC
Message-ID: <aFQN2TSjT1IOvOt3@pie.lan>
References: <20250617162426.12629-1-ziyao@disroot.org>
 <CAAhV-H4dR3cd6g2+bGS1uLRKkpVVEjHY6Kd_QCYx4LuY71y6uA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4dR3cd6g2+bGS1uLRKkpVVEjHY6Kd_QCYx4LuY71y6uA@mail.gmail.com>

On Thu, Jun 19, 2025 at 05:02:48PM +0800, Huacai Chen wrote:
> Hi, Yao,
> 
> I suggest dropping the last two patches temporarily, because:
> 1, the last two should be merged via another tree.
> 2, the last two depend on another series which hasn't been merged now,
> and can be squashed to that series.

These are fair points, but I think including corresponding devicetree
changes along with the binding patch helps review and proves the binding
makes sense. it should be okay to merge only parts of a series, so I
guess keeping the patches doesn't hurt, does it?

By the way, do you prefer to wait until all fundamental drivers (clock,
pinctrl, and reset) ready and merged, then merge the devicetree with all
the three devices added? Or is it just fine to go part by part, with
incremental changes to the devicetree?

Best regards,
Yao Zi

> Huacai
> 
> On Wed, Jun 18, 2025 at 12:25 AM Yao Zi <ziyao@disroot.org> wrote:
> >
> > This series adds support for Loongson 2K0300's clock controller.
> > Loongson 2 clock driver is prepared to support more clock variants and
> > its flexibility is improved. All clock hardwares except the output one
> > for GMAC module are then defined.
> >
> > A clock tree dump could be obtained here[1]. This series depends on v3
> > of series "Initial support for CTCISZ Forever Pi"[2] to apply.
> >
> > [1]: https://gist.github.com/ziyao233/160bb4693e7758b2a2a996d4510b7247
> > [2]: https://lore.kernel.org/all/20250523095408.25919-1-ziyao@disroot.org/
> >
> > Changed from v1:
> > - Fold loongson,ls2k0300-clk.yaml into loongson,ls2k-clk.yaml
> > - Include the new binding header in MAINTAINERS
> > - Link to v1: https://lore.kernel.org/all/20250523104552.32742-1-ziyao@disroot.org/
> >
> > Yao Zi (8):
> >   dt-bindings: clock: loongson2: Add Loongson 2K0300 compatible
> >   clk: loongson2: Allow specifying clock flags for gate clock
> >   clk: loongson2: Support scale clocks with an alternative mode
> >   clk: loongson2: Allow zero divisors for dividers
> >   clk: loongson2: Avoid hardcoding firmware name of the reference clock
> >   clk: loongson2: Add clock definitions for Loongson 2K0300 SoC
> >   LoongArch: dts: Add clock tree for Loongson 2K0300
> >   LoongArch: dts: Remove clock-frquency from UART0 of CTCISZ Forever Pi
> >
> >  .../bindings/clock/loongson,ls2k-clk.yaml     |  26 +++-
> >  MAINTAINERS                                   |   1 +
> >  .../dts/loongson-2k0300-ctcisz-forever-pi.dts |   1 -
> >  arch/loongarch/boot/dts/loongson-2k0300.dtsi  |  17 ++-
> >  drivers/clk/clk-loongson2.c                   | 124 +++++++++++++++---
> >  .../dt-bindings/clock/loongson,ls2k0300-clk.h |  54 ++++++++
> >  6 files changed, 193 insertions(+), 30 deletions(-)
> >  create mode 100644 include/dt-bindings/clock/loongson,ls2k0300-clk.h
> >
> > --
> > 2.49.0
> >
> >
