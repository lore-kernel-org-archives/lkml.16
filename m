Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796E7292098;
	Fri, 23 May 2025 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006945; cv=none; b=RU2c+2PcNX9w+Sd9VFEvPwLXvTp65Z/JavPL78FBeNtwIg3Erd1WBRMAYMPzb0xG9trC9+4IskwqRlOx6+976zX8QHq8x3685WFuM6ejcE1JA1NdcUOj7pXJkj4M1TGQRQnUtKPjRRCtfrCEpPR/su4C1DtUSG7incJXs8vqLXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006945; c=relaxed/simple;
	bh=HoDzFFvTt+7MIu4vOoIJxdfsGPzEEGuPpV1OfsMUwZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2+h9xleAYhQeX7x9GE7vtAFIsis3IsKwrCVZg6QJo5BPFkP6DziOyj5+wB4P7X4/vtZLzdS4Do+KdxrKoPYFzo7rMFrque0x3B5p0pmIv+W4QXQgA+vNwG95ULk0EonlJs1Hw2NbQF4KLA1vxzqWIV5MqNUNi1ow/lZ0lNnOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gmJU6Eob; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gmJU6Eob"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7B4D02627A;
	Fri, 23 May 2025 15:29:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oF88uI5vZrak; Fri, 23 May 2025 15:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1748006939; bh=HoDzFFvTt+7MIu4vOoIJxdfsGPzEEGuPpV1OfsMUwZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmJU6EobsLP4eJiaUqwCoFGR+N1kFtqfuourF2s7eKDL2AbKi3spkZo8n4Cf/DcRH
	 cjLlTH30DNvGVM4cjV6EBMbAmgAsVZ++3Up+O0jTkS8J2TNIpn03fIUxwIEXZZBh5x
	 +078vGLPycx1G1odmPKmiMh/V+k+x4nLECjVlw9PhbPDMXj5U/6zRZjE3V1iIl7eNe
	 Nz7hVS5PLXEwbcuEBLD4oP4EZ8eRjw3kwDnKpRys8tPDM7sHfBVVw43tEIcIYBnAaj
	 2s3zAG5aPXbsukgu76U0mKapArBLhjcmJ4HlTd4Mk6BU8GB+kVuNuKBv/kbpj5avHb
	 uyKhypTxwJ53Q==
Date: Fri, 23 May 2025 13:28:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
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
Message-ID: <aDB4DTd1Y29lJlyM@pie.lan>
References: <20250523104552.32742-1-ziyao@disroot.org>
 <20250523104552.32742-2-ziyao@disroot.org>
 <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>

On Fri, May 23, 2025 at 08:30:57PM +0800, Binbin Zhou wrote:
> On Fri, May 23, 2025 at 6:46 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Document the clock controller shipped in Loongson 2K0300 SoC, which
> > generates various clock signals for SoC peripherals.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
> >  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
> 
> I don't think a new binding file for 2K0300 is needed. Adding
> compatible entries to loongson,ls2k-clk.yaml would be more appropriate
> as they are almost all similar.

Originally I've tried to integrate the 2K0300 stuff with
loongson,ls2k-clk.yaml, but found it's hard to describe some properties.

For example, currently in loongson,ls2k-clk.yaml, the clocks property is
described as

  clocks:
    items:
      - description: 100m ref

what should the description look like with 2K0300 introduced, whose
reference clock runs at 120MHz instead of 100MHz? It'll be hard to
describe things correctly without losing existing information. "120MHz
reference clock for Loongson 2K0300, or 100MHz reference clock for other
SoCs" sounds even a worse idea.

Another example is about the description of clock IDs. loongson,ls2k-clk.yaml
describes available clock IDs as

  '#clock-cells':
    const: 1
    description:
      The clock consumer should specify the desired clock by having the clock
      ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
      for the full list of Loongson-2 SoC clock IDs.

what should the description look like if we add 2K0300 support? With a
different header being introduced, the description will be messy.

I think keeping SoCs peripherals that are different in hardware design
in the same binding is really a bad idea. Yes, these clock controllers
are similar enough to reuse the clock hardware driver, but they have
different clock tree structures and register definitions, making them
essentially different things. Trying to keep everything in the same
place only makes the binding messy.

For the reason to introduce a new binding header: loongson,ls2k-clk.h
contains clocks that aren't present in 2K0300 and misses IDs for ones
present. It's just messy if we mix everything in the same place, so here
comes loongson,ls2k0300-clk.h.

Thanks,
Yao Zi
