Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8E748D;
	Tue,  6 May 2025 21:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746567030; cv=none; b=YhjpqPGV94Xr31Dn/H5yuXSp9jqgZBUVLHgjOlZd0MDJT3yqSyF5O7Hbk51yz/NKDUCG7RRIoFZklPmdLNwwBBmU+4mc7IMC+8y6bcFMUJduRLZJkpMd75LLXejZYbb80ZXVIRhhpU2nt1/QBVNOGJi2l8mOjJ36nT11Ov9d6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746567030; c=relaxed/simple;
	bh=tHVSCMowVHak9eFvdfPawbHvEbN8M8vOtdhU5mpQIbU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=fCiv/oRbaA0FLIb/Vd373H6kn25+pLNs2n1ft7f/AQlDiz/3mokJIlNlI444SrDwepfRr+1HZ36Bi8n45OaHTiX/2xog/8WBlHcxfeccmTNzpZTgnZ4NsoPJE9qwOj1MIKlLnRKC76aOrE9Z1vu3EvI27/lKRQxc+OQ+EGmZHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIxHCMEV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIxHCMEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CB3C4CEE4;
	Tue,  6 May 2025 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567029;
	bh=tHVSCMowVHak9eFvdfPawbHvEbN8M8vOtdhU5mpQIbU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tIxHCMEVNzGmZlsR7hg0FiY2js/ySu7vVNW0VTozqzvoEdwXRqRhVKo00FIIcTvVD
	 jBH2l5E0TL6aBm7Fw3hHCJctfykIjwrQGnrzoFKMsixFIEQVVGRA1G8winWudeS6sz
	 Rynlhtjp5LckOsx6gnK8G33zda4cT+oGr4repRWgN2DRqQvEX7DVuSNPfxCyCPnc1I
	 xZozNJY0PeBs43kwRdMWdQmGj9bCxPoq80+9NggkdGwq4L4mWXIPMXZItq9wXiSD3o
	 bCLAcvDZxCC7PsjLm+78YJH7SBW1PJunjrcn1Khu9F0A68ExXqAd0yvNWNq5QSWtIQ
	 NZ3FLz3dBHoBA==
Message-ID: <c46de621e098b7873a00c1af4ca550a1@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
References: <20250403094425.876981-1-m.wilczynski@samsung.com> <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com> <20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1> <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com> <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org> <475c9a27-e1e8-4245-9ca0-74c9ed663920@samsung.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Drew Fustini <drew@pdp7.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 06 May 2025 14:30:27 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Michal Wilczynski (2025-04-30 00:52:29)
>=20
> In the v2 version of the patchset, there was no reset controller yet, so
> I thought your comment was made referring to that earlier version.
> This representation clearly describes the hardware correctly, which is
> the requirement for the Device Tree.
>=20
> The manual, in section 5.4.1.6 VO_SUBSYS, describes the reset registers
> starting at 0xFF_EF52_8000:
>=20
> GPU_RST_CFG             0x00
> DPU_RST_CFG             0x04
> MIPI_DSI0_RST_CFG       0x8
> MIPI_DSI1_RST_CFG       0xc
> HDMI_RST_CFG            0x14
> AXI4_VO_DW_AXI          0x18
> X2H_X4_VOSYS_DW_AXI_X2H 0x20
>=20
> And the clock registers for VO_SUBSYS, manual section 4.4.1.6 start at of=
fset 0x50:
> VOSYS_CLK_GATE          0x50
> VOSYS_CLK_GATE1         0x54
> VOSYS_DPU_CCLK_CFG0     0x64
> TEST_CLK_FREQ_STAT      0xc4
> TEST_CLK_CFG            0xc8
>=20
> So I considered this back then and thought it was appropriate to divide
> it into two nodes, as the reset node wasn't being considered at that
> time.
>=20
> When looking for the reference [1], I didn't notice if you corrected
> yourself later, but I do remember considering the single-node approach
> at the time.
>=20

If the two register ranges don't overlap then this is probably OK. I
imagine this is one device shipped by the hardware engineer, VO_SUBSYS,
which happens to be a clock and reset controller. This is quite common,
and we usually have one node with both #clock-cells and #reset-cells in
it. Then we use the auxiliary bus to create the reset device from the
clk driver with the same node. This helps match the device in the
datasheet to the node and compatible in DT without making the compatible
provider specific (clk or reset postfix).

That's another reason why we usually have one node. DT doesn't describe
software, i.e. the split between clk and reset frameworks may not exist
in other operating systems. We don't want to put the software design
decisions into the DT.

It may also be that a device like this consumes shared power resources
like clks or regulators that need to be enabled to drive the device, or
an IOMMU is used to translate the register mappings. We wouldn't want to
split the device in DT in that case so we can easily manage the power
resources or memory mappings for the device.

TL;DR: This is probably OK, but I'd be careful to not make it a thing.
