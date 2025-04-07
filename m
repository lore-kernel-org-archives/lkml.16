Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957D207E1F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042619; cv=none; b=Z7o7YkBb/klYftAoqv0ZP75dqnoTr2hBDAcf7tevx+QbSZ497Ayzv1EEGvN/33bl12z172GdhiOMcsr8tbMfxH1AoR89gKN9V3mnOHdNByzteO0tfec0nDfndWs4CztpW/GvQVxOqJTuP6Ugj3kssS7n8WFfaHQj6osMpCd23k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042619; c=relaxed/simple;
	bh=58m2wS0q7Q7BjFVwR/oX0LFC7CZq2BczcFiJu09gNr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=mfXO/WLxHg1njRR21yHEBgaoYs7PTogXmrgvo6vK/n8H92IXMujdI08h3Kx9Z2sPDxHa3UpzQGKth9D+ORRERy7a0MNrCSKU0KDJWf1AYvPlN4QYVJLkumLNwCBcMrxvTNEWgu+QtodL/tC/XS5Rs2gnrglEZ6JwdIE6b1LD4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WgCtof/V; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WgCtof/V"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250407161655euoutp02435b49e537422fba6c117f45c514f379~0FYSgtf582673826738euoutp02Q
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:16:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250407161655euoutp02435b49e537422fba6c117f45c514f379~0FYSgtf582673826738euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744042615;
	bh=85Bs+EbT6rS/GMy7o7cvbObjYNugmORe6LQDN1upyyk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WgCtof/VKT87S3dvsAWqKi8a8+TP/j+vwLIudsQDIAeJ43r9e0dIlYI+ydxNGyZeR
	 9joXP20i3fF51P4e6VzhqaRSynDj64FulGyFpe7L4JCyW0H7kVFVx1R/1dwZYM+bhO
	 iGBX+/EdUSfCgr9+DuR1iHwi0xWtf2bLZ3yvhp84=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250407161653eucas1p1ea4b8f143ad4d015d3eee7fd6b6f6a0b~0FYRRZ-X43086630866eucas1p1h;
	Mon,  7 Apr 2025 16:16:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D8.4A.20821.57AF3F76; Mon,  7
	Apr 2025 17:16:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250407161653eucas1p15e883e9e31bbfd387ba603a7a9344b8f~0FYQzzhcN1046210462eucas1p12;
	Mon,  7 Apr 2025 16:16:53 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250407161653eusmtrp24c650f7e2268c2b9ed9c707b0bfd2d5c~0FYQy4Ywt1972019720eusmtrp21;
	Mon,  7 Apr 2025 16:16:53 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-b2-67f3fa7531e1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 15.C6.19654.57AF3F76; Mon,  7
	Apr 2025 17:16:53 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250407161652eusmtip10798271fedf7964a65ed49d638537a6c~0FYP_Ecrn1201412014eusmtip1-;
	Mon,  7 Apr 2025 16:16:52 +0000 (GMT)
Message-ID: <955e01e2-cfd4-4ac1-9e7b-d624d7d6a2d7@samsung.com>
Date: Mon, 7 Apr 2025 18:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clk: thead: Add clock support for VO subsystem
 in T-HEAD TH1520 SoC
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z/B78yemvvSS1oLe@x1>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7djP87qlvz6nG9zbq2Hx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZfOy5x2pxedccNottn1vYLNYeuctu
	cfGUq8XdeydYLF5e7mG2aJvFb/F/zw52i3/XNrJYtOyfwuIg7PH+Riu7x5uXL1k8Dnd8Yfe4
	d2Iaq8emVZ1sHpuX1Hu0rD3G5NH/18Dj/b6rbB59W1Yxelxqvs7u8XmTXABPFJdNSmpOZllq
	kb5dAlfGx9//2QpadCqWvV/A2MA4Ta2LkZNDQsBEomP5PMYuRi4OIYEVjBL/V++Ecr4wSszd
	fJoNwvnMKDF1SzsbTEvTnJvMEInljBJnXk9lh3DeMkqsvXmUFaSKV8BOounWOzCbRUBFYuqT
	x8wQcUGJkzOfsIDYogLyEvdvzWAHsYUFEiXur+oB2yAioCBxbsUlJpChzALLmSUW7tkAVsQs
	IC5x68l8JhCbTcBI4sHy+WALOAWUJN50PmKEqJGXaN46G+w8CYFnnBL31u9jhLjbReJrVycz
	hC0s8er4FnYIW0bi/06IoRIC+RIPtn6CqqmR2NlzHMq2lrhz7hfQdRxACzQl1u/Shwg7Smya
	sYIZJCwhwCdx460gxAl8EpO2TYcK80p0tAlBVKtJTO3phVt6bsU2pgmMSrOQQmUWkidnIXlm
	FsLeBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQJT5+l/xz/tYJz76qPeIUYmDsZD
	jBIczEoivJanPqUL8aYkVlalFuXHF5XmpBYfYpTmYFES5120vzVdSCA9sSQ1OzW1ILUIJsvE
	wSnVwJRroXn/TPcm2ZBn638L7Xl5V7/JfZ/Zu7nZQn5fZD8/0li/9JwLy760xzuvrKv9eURZ
	TuDkvTnHwq0MC/NXm/3mtZ+0fdU/zu35TNfcL13m6bTlPVLr9PRmRb/SvAP7dsmKGnvIrP7R
	kWF9exvvJvGvhjvW3fwzMaPKWbDUPT1HssVkg87BjTzXj0y0OuH088kzpfclP5+vlfhk8/Lv
	/2V9lukia8oC3x89k71vw+0TAlNb+VLSj08sffW6c1n3n6/ftn5Zes06pEDx5i4h9gbvNttU
	gwOLPrZOW1Pjfiipf2Va9N1lL95M1vxsMq0wUvlo7SKzKkvPI0ZpPVceXtnF9mLi2Y6b8f8v
	nJ/1L/skoxJLcUaioRZzUXEiAKE3wuIMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42I5/e/4Xd3SX5/TDd7957R4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	uHjK1eLuvRMsFi8v9zBbtM3it/i/Zwe7xb9rG1ksWvZPYXEQ9nh/o5Xd483Llywehzu+sHvc
	OzGN1WPTqk42j81L6j1a1h5j8uj/a+Dxft9VNo++LasYPS41X2f3+LxJLoAnSs+mKL+0JFUh
	I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j4+//bAUtOhXL3i9g
	bGCcptbFyMkhIWAi0TTnJnMXIxeHkMBSRompF6YxQiRkJK51v2SBsIUl/lzrYoMoes0o8fHo
	IbAiXgE7iaZb71hBbBYBFYmpTx4zQ8QFJU7OfALWLCogL3H/1gx2EFtYIFFiyZV/YLaIgILE
	uRWXmECGMgssZ5Z48Oor1Bl3GSU2b1rFBFLFLCAucevJfDCbTcBI4sHy+WDbOAWUJN50PgK6
	ggOoRl1i/TwhiHJ5ieats5knMArNQnLHLCSTZiF0zELSsYCRZRWjSGppcW56brGRXnFibnFp
	Xrpecn7uJkZgqth27OeWHYwrX33UO8TIxMF4iFGCg1lJhNfy1Kd0Id6UxMqq1KL8+KLSnNTi
	Q4ymwLCYyCwlmpwPTFZ5JfGGZgamhiZmlgamlmbGSuK8bFfOpwkJpCeWpGanphakFsH0MXFw
	SjUw2epvitLbI3y/cM/mZX4VC564CWxbFMosYG+3xDppwYwZWozfyvt22O5pM5DfMmtZy/zZ
	rg1JVx7/XPT/uW3Lb5GmklPKGxc2WyfsnLx0952wiY0V35fomOhzVVU1p06x/3B/zcSIW69+
	3Mw53rTnmX5tl7jvropFPzy9P/cWTZLMYdDJflu5+mzjjI4aOTer4jzN0lnWYcenfU4vvZXP
	5+AtKDO182bN5bb9h3kPSAgdbzzDnS9aYMzhtPyqKecCP/8GySZ5J5Ndt1OmLs0XVJB+abH3
	zoaTFqW8uW77158w4DuyoCTCYLpk69QTpn8CVaY3RVUdnfCmlbv5eNk7o7a9/Kf4ZWIfC7S0
	/DigxFKckWioxVxUnAgACvoX2p4DAAA=
X-CMS-MailID: 20250407161653eucas1p15e883e9e31bbfd387ba603a7a9344b8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094432eucas1p112aada697802092266bc36ef863f4299
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094432eucas1p112aada697802092266bc36ef863f4299
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094432eucas1p112aada697802092266bc36ef863f4299@eucas1p1.samsung.com>
	<20250403094425.876981-3-m.wilczynski@samsung.com> <Z/B78yemvvSS1oLe@x1>



On 4/5/25 02:40, Drew Fustini wrote:
> On Thu, Apr 03, 2025 at 11:44:24AM +0200, Michal Wilczynski wrote:
>> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
>> including the Application Processor (AP) and the Video Output (VO) [1].
>> Up until now, the T-Head clock driver only supported AP clocks.
>>
>> Extend the driver to provide clock functionality for the VO subsystem.
>> At this stage, the focus is on implementing the VO clock gates, as these
>> are currently the most relevant and required components for enabling and
>> disabling the VO subsystem functionality.  Future enhancements may
>> introduce additional VO-related clocks as necessary.
>>
>> Link: https://protect2.fireeye.com/v1/url?k=36dff7e6-5754e2d0-36de7ca9-74fe485cbff1-cfd601a10959d91c&q=1&e=fa692882-d05b-4276-bff3-01f7a237dd97&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf [1]
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/clk/thead/clk-th1520-ap.c | 196 +++++++++++++++++++++++++-----
>>  1 file changed, 168 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
>> index 4c9555fc6184..ebfb1d59401d 100644
>> --- a/drivers/clk/thead/clk-th1520-ap.c
>> +++ b/drivers/clk/thead/clk-th1520-ap.c
>> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
>>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
>>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
>>  
>> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(0), 0);
> 
> Is CLKCTRL_GPU_MEM_CLK_EN (bit 2) skipped on purpose?

Hi,
This one is marked as "Reserved" in the manual, so yeah it's on purpose.

> 
>> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
>> +		0x0, BIT(3), 0);
>> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(4), 0);
>> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
>> +		video_pll_clk_pd, 0x0, BIT(5), 0);
>> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
>> +		video_pll_clk_pd, 0x0, BIT(6), 0);
>> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
>> +		BIT(7), 0);
>> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
>> +		BIT(8), 0);
>> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
>> +		BIT(9), 0);
>> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
>> +		0x0, BIT(10), 0);
>> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
>> +		BIT(11), 0);
>> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
>> +		0x0, BIT(12), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(13), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(14), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
>> +		video_pll_clk_pd, 0x0, BIT(15), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
>> +		video_pll_clk_pd, 0x0, BIT(16), 0);
>> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
>> +		video_pll_clk_pd, 0x0, BIT(17), 0);
>> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
>> +		video_pll_clk_pd, 0x0, BIT(18), 0);
>> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
>> +		0x0, BIT(19), 0);
>> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(20), 0);
>> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(21), 0);
>> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
>> +		video_pll_clk_pd, 0x0, BIT(22), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
>> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
>> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
>> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
>> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
>> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(27), 0);
>> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(28), 0);
>> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
>> +		video_pll_clk_pd, 0x0, BIT(29), 0);
>> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
>> +		video_pll_clk_pd, 0x0, BIT(30), 0);
>> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
>> +		video_pll_clk_pd, 0x0, BIT(31), 0);
>> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
>> +		0x4, BIT(0), 0);
> 
> Did you intentionally skip VOSYS_DPU_CCLK_CFG.VOSYS_DPU_CCLK_CFG and
> TEST_CLK_CFG.TEST_CLK_CFG as they aren't needed?

Yeah I couldn't see a use for them even in the vendor kernel so skipped
them. I guess they could be added when we figure some way to use them.

Regards,
Michał

> 
> 
> Thanks,
> Drew
> 
