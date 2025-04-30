Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7291020B7F9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999562; cv=none; b=UUCP0QaVQqGuTdn2DyrKkrW1Q+Nix/Y3c6rKBKBC+g1jhbyoSoKc15EaUe18tbtZQGZ2jmBbY0X8g0B1WQH3rqfDhwaExkx3Hhv7/s0SWfahn70BvUz7zJkbNOq1ofzJ2UtKiJqBlRkA7XeVJVkrRpT5zE3133TOiIlt7e4DUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999562; c=relaxed/simple;
	bh=roySooOoup4fu4QmJMTkWQ2pUs0IThrB2hKyWF/XehI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=V2EUGLDUEQJY8ALtDmxDnLBLgKuYK3yAes4qVKfcibpoVvJdKK4Ql3AfCDHmjmpok1TK/jSFS5K7xSMW3+LiaTvKDLlm9tHiFeNz6DUfT/CDzzOkeX7w/rqjAzZS8qu8toIU1ZmEhg0PycYzW896qP8qyxkiqEc8QmDDfuX6NAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=huZuIR3/; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="huZuIR3/"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250430075231euoutp028f958c319a1d0fec36b54d2a2eebdefb~7CVdv0mO21563315633euoutp026
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:52:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250430075231euoutp028f958c319a1d0fec36b54d2a2eebdefb~7CVdv0mO21563315633euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745999551;
	bh=qI3xeJtXvmwbkwfCNGhT9/+KA3tkoCUGRYmZdMz5vr8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=huZuIR3/NjO36Ip4MwWyXJoc9F87b9Pbh2SgiZH6z7FLmWBYs+2c3s1JkepjYJAy+
	 Ld3FOqBDuN6Z0X1L8VWUp/UFQxiMNI+/yNLaZcnuYkn8/qsfh8sZGtpKNYZ8o1siQ2
	 K3URzLHwgecuMMjcpl5Keq/TwaOgaXkV331Z/KOI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250430075230eucas1p12da87b9a4202316b95a70a82c251185c~7CVc1y5D_1711917119eucas1p13;
	Wed, 30 Apr 2025 07:52:30 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250430075229eusmtip20196a0472e6c82627cb89c1c3f5965ea~7CVcCfJC02585025850eusmtip2F;
	Wed, 30 Apr 2025 07:52:29 +0000 (GMT)
Message-ID: <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
Date: Wed, 30 Apr 2025 09:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
To: Stephen Boyd <sboyd@kernel.org>, Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250430075230eucas1p12da87b9a4202316b95a70a82c251185c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-EPHeader: CA
X-CMS-RootMailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
	<20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1>
	<17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
	<9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>



On 4/30/25 00:29, Stephen Boyd wrote:
> Quoting Michal Wilczynski (2025-04-07 08:30:43)
>> On 4/5/25 01:16, Drew Fustini wrote:
>>>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>>>> index 527336417765..d4cba0713cab 100644
>>>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>>>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>>>> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
>>>>                      #clock-cells = <1>;
>>>>              };
>>>>  
>>>> +            clk_vo: clock-controller@ffef528050 {
>>>> +                    compatible = "thead,th1520-clk-vo";
>>>> +                    reg = <0xff 0xef528050 0x0 0xfb0>;
>>>
>>> Thanks for your patch. It is great to have more of the clocks supported
>>> upstream.
>>>
>>> The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
>>> 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
>>>
>>> I see on page 213 that the first register for VO_SUBSYS starts with
>>> VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
>>> CCU_GATE macros use offset of 0x0 instead 0x50.
>>>
>>> I kind of think the reg property using the actual base address
>>> (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
>>> in the manual. But I don't have a strong preference if you think think
>>> using 0xef528050 makes the CCU_GATE macros easier to read.
>>
>> Thank you for your comment.
>>
>> This was discussed some time ago. The main issue was that the address
>> space was fragmented between clocks and resets. Initially, I proposed
>> using syscon as a way to abstract this, but the idea wasn't particularly
>> well received.
>>
>> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
>> I need for resetting the GPU.
>>
>> For reference, here's the earlier discussion: [1]
>>
>> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/
>>
> 
> In that email I said you should have one node
> clock-controller@ffef528000. Why did 0x50 get added to the address?

Hi Stephen,
In the v2 version of the patchset, there was no reset controller yet, so
I thought your comment was made referring to that earlier version.
This representation clearly describes the hardware correctly, which is
the requirement for the Device Tree.

The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
starting at 0xFF_EF52_8000:

GPU_RST_CFG             0x00
DPU_RST_CFG             0x04
MIPI_DSI0_RST_CFG       0x8
MIPI_DSI1_RST_CFG       0xc
HDMI_RST_CFG            0x14
AXI4_VO_DW_AXI          0x18
X2H_X4_VOSYS_DW_AXI_X2H 0x20

And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
VOSYS_CLK_GATE          0x50
VOSYS_CLK_GATE1         0x54
VOSYS_DPU_CCLK_CFG0     0x64
TEST_CLK_FREQ_STAT      0xc4
TEST_CLK_CFG            0xc8

So I considered this back then and thought it was appropriate to divide
it into two nodes, as the reset node wasn't being considered at that
time.

When looking for the reference [1], I didn't notice if you corrected
yourself later, but I do remember considering the single-node approach
at the time.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
