Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719531A8F84;
	Mon, 26 May 2025 04:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748233607; cv=none; b=cIWmesvmbdPh7EfRdq+Dz7nWs1gbtOSztZHQgvbOiBaj5gEZ6yYz8d+WUljh9LY1BVTn52ivkN+CBxKeW6CRpQ/DtcH5SvYnyjpZa/Ldz9hW6nZu38TYD4w2DBtwI8TyZJ4rUwLuMNjXWSVdGBgjmQ1VBwSLB5JXVUqQDu6F1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748233607; c=relaxed/simple;
	bh=6PrPi9eX42dSkCoFKZGOsYQ5511s37Wj9FNKGaHX6vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJyEFIn5/KOMU/ocL57xIP4+N/n2sMwUzVdKdbCMfDdgf5C0dFjA54Qox2W9xvWXCOZqkh6lpKMkFw6BeGfpbsJWselB9YdP56EsFPGrL95P6RRr6zlOaXt9Tyjoms+dyhybNg7AoqePc/XnkKj4o9V1Vu4w6Ax7WAT2KvHc+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QGPnJFsq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QGPnJFsq"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D17C725D11;
	Mon, 26 May 2025 06:17:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhSyIzB5lUhx; Mon, 26 May 2025 06:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1748233046; bh=6PrPi9eX42dSkCoFKZGOsYQ5511s37Wj9FNKGaHX6vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QGPnJFsq5HFRsSxNe8GJ0s/gbSy4rFAwF81ecgDgIMkKkDHVH76UVsRbrt/Hfa3DB
	 a3TWtyqBbPmUAtn1Vw4pFXGfDaLsgycSSwcsoZdbXweeK/6d7obxqDm3wDTZWELZSg
	 NiPLVTtkM7giWjnPCiaUlqctWvYEC7BIHQZgtKGwmUBFtDbz86WdE6FOf7SVOrydt5
	 DYdHodk94NqNvLF3c/D9Iw/oliu3HZnOB7TCOlpIj9g+NhAbuyKwIeYeoHliXzdA3h
	 YXXsn0JNzudCTOp5qSvOFdHawgqvO6QjrWwW6vYj74ZfX3VhMJpsCW+VMjvYIbO3tO
	 0JTW8EruNIzpg==
Date: Mon, 26 May 2025 04:17:13 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Document Loongson 2K0300 clock
 controller
Message-ID: <aDPrSYeKp-YMNdhu@pie.lan>
References: <20250523104552.32742-1-ziyao@disroot.org>
 <20250523104552.32742-2-ziyao@disroot.org>
 <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
 <aDB4DTd1Y29lJlyM@pie.lan>
 <dfe02190-8e7a-48e7-8d2d-8d3af2392eb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfe02190-8e7a-48e7-8d2d-8d3af2392eb5@kernel.org>

On Mon, May 26, 2025 at 06:11:22AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 15:28, Yao Zi wrote:
> > On Fri, May 23, 2025 at 08:30:57PM +0800, Binbin Zhou wrote:
> >> On Fri, May 23, 2025 at 6:46 PM Yao Zi <ziyao@disroot.org> wrote:
> >>>
> >>> Document the clock controller shipped in Loongson 2K0300 SoC, which
> >>> generates various clock signals for SoC peripherals.
> >>>
> >>> Signed-off-by: Yao Zi <ziyao@disroot.org>
> >>> ---
> >>>  .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
> >>>  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
> >>>  2 files changed, 106 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
> >>
> >> I don't think a new binding file for 2K0300 is needed. Adding
> >> compatible entries to loongson,ls2k-clk.yaml would be more appropriate
> >> as they are almost all similar.
> > 
> > Originally I've tried to integrate the 2K0300 stuff with
> > loongson,ls2k-clk.yaml, but found it's hard to describe some properties.
> > 
> > For example, currently in loongson,ls2k-clk.yaml, the clocks property is
> > described as
> > 
> >   clocks:
> >     items:
> >       - description: 100m ref
> > 
> > what should the description look like with 2K0300 introduced, whose
> > reference clock runs at 120MHz instead of 100MHz? It'll be hard to
> > describe things correctly without losing existing information. "120MHz
> > reference clock for Loongson 2K0300, or 100MHz reference clock for other
> > SoCs" sounds even a worse idea.
> 
> Drop the frequency anyway, it is kind of pointless here.
> 
> > 
> > Another example is about the description of clock IDs. loongson,ls2k-clk.yaml
> > describes available clock IDs as
> > 
> >   '#clock-cells':
> >     const: 1
> >     description:
> >       The clock consumer should specify the desired clock by having the clock
> >       ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
> >       for the full list of Loongson-2 SoC clock IDs.
> > 
> > what should the description look like if we add 2K0300 support? With a
> > different header being introduced, the description will be messy.
> 
> No, just list the headers.
> 
> > 
> > I think keeping SoCs peripherals that are different in hardware design
> > in the same binding is really a bad idea. Yes, these clock controllers
> > are similar enough to reuse the clock hardware driver, but they have
> > different clock tree structures and register definitions, making them
> > essentially different things. Trying to keep everything in the same
> > place only makes the binding messy.
> 
> How is binding messy if you only add one compatible?
> 
> 
> Best regards,
> Krzysztof

Okay, thanks for the suggestions. Will merge 2K0300-related stuff into
loongson,ls2k-clk.yaml in the next version.

Thanks,
Yao Zi
