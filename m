Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2743F9E8;
	Mon, 26 May 2025 04:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748232688; cv=none; b=NaA315ZqmHILbV6k36FjRojDIt/X4kojTqDqpjZGN8h4Mmlh+V654wdxwmQUFxljZ7KvZENiYcVit0CoWhXvyFrkoX1gWnJDKYirV6yQ+TysCALWMdGsTRXJeTn2CSl3Mz/95/iRQFFYGVYsVSUU63qTOp/WlAndJnHfBghj1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748232688; c=relaxed/simple;
	bh=dgbarJqXPFPUQBlWN+OqzRIxfFDHAFWwjZTEUideGZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1GkQKSxzJoEAHZlFswP/AUX75L1nUWMsEARqqCEpE3KedgPFchsoMH+NhS4EYTwIQkvvjbvKsbYYJ1jIiKNu6RL3CRxj0FFYV5yiy+7ji6VEeSbtcenVbPX33Q+p3RB1LrkngFWTbdehP4d1+4N9kCPKB1Hy/twQGXEAbYAGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWs35SBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWs35SBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE39C4CEE7;
	Mon, 26 May 2025 04:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748232688;
	bh=dgbarJqXPFPUQBlWN+OqzRIxfFDHAFWwjZTEUideGZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uWs35SBJKzSqyMwakQmnKqopKL+DK5eMs0nVpGp+xS4/ijv2aTyfFW4e36cR0bGj8
	 n7Mp7l94vSKmdMyu5J6YDNeUB2NOy75q8kFzvrO0jIBMKrEsjVIk+Sw2K/28r9j0LX
	 9I9qF3I1VPntkfzU/ckiKr1CiJF9fDlbfWmjY3v1ckKnBCAnDVvWNseY0nUC9slD0D
	 TyOotJKv+Htv6v7nmxkkZ0XxGcXtOohblmPtcQxYwCRijSbpVw2r0pW3iUT8TiIkSF
	 3qGH8vy262+zIJF3jsqsKzV4AyxdukCVlBtLbh8Sk2bnRIojPR2/bGJZb8Zd0R88bg
	 2cLhL/Xu/Zovg==
Message-ID: <dfe02190-8e7a-48e7-8d2d-8d3af2392eb5@kernel.org>
Date: Mon, 26 May 2025 06:11:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: clock: Document Loongson 2K0300 clock
 controller
To: Yao Zi <ziyao@disroot.org>, Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250523104552.32742-1-ziyao@disroot.org>
 <20250523104552.32742-2-ziyao@disroot.org>
 <CAMpQs4JRy+Q2D5B9cOLyuD=8EcWNqqyhJcm+X5wiqTgjy5cikA@mail.gmail.com>
 <aDB4DTd1Y29lJlyM@pie.lan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aDB4DTd1Y29lJlyM@pie.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2025 15:28, Yao Zi wrote:
> On Fri, May 23, 2025 at 08:30:57PM +0800, Binbin Zhou wrote:
>> On Fri, May 23, 2025 at 6:46 PM Yao Zi <ziyao@disroot.org> wrote:
>>>
>>> Document the clock controller shipped in Loongson 2K0300 SoC, which
>>> generates various clock signals for SoC peripherals.
>>>
>>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>>> ---
>>>  .../bindings/clock/loongson,ls2k0300-clk.yaml | 52 ++++++++++++++++++
>>>  .../dt-bindings/clock/loongson,ls2k0300-clk.h | 54 +++++++++++++++++++
>>>  2 files changed, 106 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls2k0300-clk.yaml
>>
>> I don't think a new binding file for 2K0300 is needed. Adding
>> compatible entries to loongson,ls2k-clk.yaml would be more appropriate
>> as they are almost all similar.
> 
> Originally I've tried to integrate the 2K0300 stuff with
> loongson,ls2k-clk.yaml, but found it's hard to describe some properties.
> 
> For example, currently in loongson,ls2k-clk.yaml, the clocks property is
> described as
> 
>   clocks:
>     items:
>       - description: 100m ref
> 
> what should the description look like with 2K0300 introduced, whose
> reference clock runs at 120MHz instead of 100MHz? It'll be hard to
> describe things correctly without losing existing information. "120MHz
> reference clock for Loongson 2K0300, or 100MHz reference clock for other
> SoCs" sounds even a worse idea.

Drop the frequency anyway, it is kind of pointless here.

> 
> Another example is about the description of clock IDs. loongson,ls2k-clk.yaml
> describes available clock IDs as
> 
>   '#clock-cells':
>     const: 1
>     description:
>       The clock consumer should specify the desired clock by having the clock
>       ID in its "clocks" phandle cell. See include/dt-bindings/clock/loongson,ls2k-clk.h
>       for the full list of Loongson-2 SoC clock IDs.
> 
> what should the description look like if we add 2K0300 support? With a
> different header being introduced, the description will be messy.

No, just list the headers.

> 
> I think keeping SoCs peripherals that are different in hardware design
> in the same binding is really a bad idea. Yes, these clock controllers
> are similar enough to reuse the clock hardware driver, but they have
> different clock tree structures and register definitions, making them
> essentially different things. Trying to keep everything in the same
> place only makes the binding messy.

How is binding messy if you only add one compatible?


Best regards,
Krzysztof
