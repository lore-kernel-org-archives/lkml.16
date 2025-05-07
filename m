Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A1213E66
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612253; cv=none; b=TeVGLTxbQmTGHb5xAPJ3EGD4avZTkXmeCv0EJTr+cVoloEplrjWF47GrBytY2JE71iQ9c82/BLDlOkFc19Omse2cCSyqqs1Rafeya15lSj/l4X1frviQ9+dFlBOrR80owbtlnxllj5W8eL1oObOmX+CLgg4HCAQvOoSloJRtjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612253; c=relaxed/simple;
	bh=KKDPdf+RYih2MpxRJbdswI13umMtHPKoTSKbUwdg2SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=OkzUECpGeHpCT89wLdRZL/5J7218aLIJeLcqBT7fLkwIUlTZm553B0SljNk9NGpDB+fZmxOsRhrGqS9ZzP9vYhb7kQ4z70LUPKnooBTRTEqpnrWJ1jKIM1SaweiC9AgT33rYtpfdB24Blwn2NWStHe/ABS8vG+xu1Bvpi7GBdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JkPLRVWu; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JkPLRVWu"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250507100403euoutp01612ba194b53756c58ff997548e8a6885~9NpT5d5eT1175611756euoutp01J
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:04:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250507100403euoutp01612ba194b53756c58ff997548e8a6885~9NpT5d5eT1175611756euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746612243;
	bh=N32TfHVqNTkje4PcTK07rh/HIsJBsQBWcN1H8kWn9js=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JkPLRVWuHBDbxns/R/3DK8w87IPCtNOg2sGMoqr4GavTq/yF0viOnzZnBTs8ZrWI6
	 lYvhnCAFyq59EGWlnhGYpCXwQzDsHeXwqOD/orpLzP+waygrJJjzqYthmqoUeCMMKg
	 PCaedNImP5Y/Dbgr/zZOR/RRE7Oq68itdkMfRpGQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250507100403eucas1p1c31cf23f55512589a7663132f9f50778~9NpTWWOeV1269412694eucas1p11;
	Wed,  7 May 2025 10:04:03 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250507100402eusmtip2f16f3da88a0473dad88a4f960a19539c~9NpSR_l2o2857428574eusmtip2I;
	Wed,  7 May 2025 10:04:02 +0000 (GMT)
Message-ID: <91ecca14-2102-4c29-9252-025ce6b6a07f@samsung.com>
Date: Wed, 7 May 2025 12:04:01 +0200
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
In-Reply-To: <c46de621e098b7873a00c1af4ca550a1@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250507100403eucas1p1c31cf23f55512589a7663132f9f50778
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
	<475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
	<c46de621e098b7873a00c1af4ca550a1@kernel.org>



On 5/6/25 23:30, Stephen Boyd wrote:
> Quoting Michal Wilczynski (2025-04-30 00:52:29)
>>
>> In the v2 version of the patchset, there was no reset controller yet, so
>> I thought your comment was made referring to that earlier version.
>> This representation clearly describes the hardware correctly, which is
>> the requirement for the Device Tree.
>>
>> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
>> starting at 0xFF_EF52_8000:
>>
>> GPU_RST_CFG             0x00
>> DPU_RST_CFG             0x04
>> MIPI_DSI0_RST_CFG       0x8
>> MIPI_DSI1_RST_CFG       0xc
>> HDMI_RST_CFG            0x14
>> AXI4_VO_DW_AXI          0x18
>> X2H_X4_VOSYS_DW_AXI_X2H 0x20
>>
>> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at offset 0x50:
>> VOSYS_CLK_GATE          0x50
>> VOSYS_CLK_GATE1         0x54
>> VOSYS_DPU_CCLK_CFG0     0x64
>> TEST_CLK_FREQ_STAT      0xc4
>> TEST_CLK_CFG            0xc8
>>
>> So I considered this back then and thought it was appropriate to divide
>> it into two nodes, as the reset node wasn't being considered at that
>> time.
>>
>> When looking for the reference [1], I didn't notice if you corrected
>> yourself later, but I do remember considering the single-node approach
>> at the time.
>>
> 
> If the two register ranges don't overlap then this is probably OK. I
> imagine this is one device shipped by the hardware engineer, VO_SUBSYS,
> which happens to be a clock and reset controller. This is quite common,
> and we usually have one node with both #clock-cells and #reset-cells in
> it. Then we use the auxiliary bus to create the reset device from the
> clk driver with the same node. This helps match the device in the
> datasheet to the node and compatible in DT without making the compatible
> provider specific (clk or reset postfix).
> 
> That's another reason why we usually have one node. DT doesn't describe
> software, i.e. the split between clk and reset frameworks may not exist
> in other operating systems. We don't want to put the software design
> decisions into the DT.
> 
> It may also be that a device like this consumes shared power resources
> like clks or regulators that need to be enabled to drive the device, or
> an IOMMU is used to translate the register mappings. We wouldn't want to
> split the device in DT in that case so we can easily manage the power
> resources or memory mappings for the device.
> 
> TL;DR: This is probably OK, but I'd be careful to not make it a thing.

Thank you very much for the comprehensive explanation. Because the
registers don’t overlap, it’s fine in this case. Since Drew also seem to
agree, we can probably push these patches forward, while keeping in mind
that for future SoCs it would be better to use a single node.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
