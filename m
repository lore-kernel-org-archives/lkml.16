Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6F161320
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673484; cv=none; b=Ctco+N2vVh9qRfi31okomjsHwcFBf7jZ34qWlhAuPL006RtSD4b4Z7rA4ot/r8YIj5kLRAr4xXrnEl1H/XQaMd/PFQWzbX8wDhKqH0vMmri+bEbNUwYhi/An2p2O66gb2lySky/48Z+e2ObKEpWX0mGxhmuMObWM7S/cGmFVxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673484; c=relaxed/simple;
	bh=mE16EQfLtI8YC0ioIPAty6Iveh39Y1n9XEwLjNdcsoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ONfA+Ttl322FwXGqmyBiZgyZ11VkvTPUFDAuRMwkAnTXKDXFOQ8oG0TcVbxlRAM36fAscgrSOHewSiEpWGxUuIulKfN2+pVYAe0CGI0nTZKx99KAEKxyE2xei1W9e5efrE4qahdExTfSh58vSguCb8msq1Swpex9skabI6NjtVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BKYosx5J; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BKYosx5J"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250403094433euoutp02300cbf9f7c8bcec6ebb29b59b292ebbe~yxckyZAsW0284502845euoutp02k
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:44:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250403094433euoutp02300cbf9f7c8bcec6ebb29b59b292ebbe~yxckyZAsW0284502845euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743673473;
	bh=JVz+J6XgGz3bH650bKz3vULyAjc600Df30OjTt9CAzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKYosx5JbYs6umHwFg8I3V9eBu12+BoY1DunVvPYTnEjZyV4G6biG/4Y8SwwfcZ22
	 VTEybES2irMyx6e4+irOns5ETg6GkqkCaQW94ER19JqIYHIcYPS92SlqfKUUVp3ues
	 K7d7uMFKbOw6zsBbJOMZSIX7yTej2RbGN6UNEqKU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250403094433eucas1p2ac1cd3d2b255b7b3b8d8b44604f216d2~yxckSOldP1404914049eucas1p2L;
	Thu,  3 Apr 2025 09:44:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id D0.79.20409.0885EE76; Thu,  3
	Apr 2025 10:44:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250403094432eucas1p112aada697802092266bc36ef863f4299~yxcjv990Y3042730427eucas1p1t;
	Thu,  3 Apr 2025 09:44:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403094432eusmtrp291f625723e9f3af64d9a227c93826c59~yxcjvCjIK1352013520eusmtrp2l;
	Thu,  3 Apr 2025 09:44:32 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-e7-67ee588087ad
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 62.FF.19654.0885EE76; Thu,  3
	Apr 2025 10:44:32 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250403094431eusmtip2f27e9f1924d8ad49f2f4d7a0fa06adc7~yxcivBiaD3263832638eusmtip2N;
	Thu,  3 Apr 2025 09:44:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v7 2/3] clk: thead: Add clock support for VO subsystem in
 T-HEAD TH1520 SoC
Date: Thu,  3 Apr 2025 11:44:24 +0200
Message-Id: <20250403094425.876981-3-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403094425.876981-1-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7djP87qNEe/SDVreMlo8u/OV1WLr71ns
	Fmv2nmOymH/kHKvFvUtbmCxe7G1ksWg+tp7N4uWse2wWH3vusVpc3jWHzWLb5xY2i7VH7rJb
	rP86n8ni4ilXi7v3TrBYvLzcw2zRNovf4v+eHewW/65tZLFo2T+FxUHE4/2NVnaPNy9fsngc
	7vjC7nHvxDRWj02rOtk8Ni+p92hZe4zJo/+vgcf7fVfZPPq2rGL0uNR8nd3j8ya5AJ4oLpuU
	1JzMstQifbsEroxbt/4xFjyIqJjw/AhTA+Mx7y5GDg4JAROJCYf4uhi5OIQEVjBKbHl0nhnC
	+cIosejAfXYI5zOjxKW+uWxdjJxgHW/nLWAFsYUEljNKbOu2gCh6wyhx4vIlRpAEm4CRxIPl
	81lBEiICe5gkvn//CTaXWWAVo8STbx/ZQaqEBWIlLv1uALNZBFQlOi/tYQaxeQXsJF7v6YNa
	Jy+x/+BZsDingL3EhimPGSFqBCVOznzCAmIzA9U0b50NtkBC4BSnRO+MbcwQzS4SfQtmskPY
	whKvjm+BsmUk/u+czwRh50s82PoJqr5GYmfPcSjbWuLOuV9soFBiFtCUWL9LHyLsKLFpxgpm
	SODxSdx4KwhxAp/EpG3TocK8Eh1tQhDVahJTe3rhlp5bsQ1qqYfEubbXLBMYFWcheWYWkmdm
	IexdwMi8ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzBVnv53/MsOxuWvPuodYmTiYDzE
	KMHBrCTCW6j1Nl2INyWxsiq1KD++qDQntfgQozQHi5I476L9relCAumJJanZqakFqUUwWSYO
	TqkGJsknEt/cvENiDFiqFidPYQ62iYkqLm6+fKoxRu1a4lF3xr0uT895BjVMeF8ruMzs7lwV
	eYUpAkYOySqPjYKnR/889EklvHnB1qQHSqo7L6x//PZJc2iXqt3f9Fe/r743E+OxmLGK42/N
	hbI3k48Kfzh1hi2U9f3qp2zdc0pXeGUYTKsP2v32OgvHBv57ERw5a9h5g95Pe2bN0fduWWEC
	d2zWS/ntLL9yjgnfdW7W092uHK3O0JxZn/lXxvzvw205yxfrlVe/vT4rS+Ch8XeRrdPmFTxY
	U2nw+ObG4oI3e/8JeLXNmLL4b6XhkQ0Fn0WTFbgv6xWdF3VZPfXnJ/t/bi1bz3SmnFzCMuuj
	Ybv7IiWW4oxEQy3mouJEAE1ZE7YEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7oNEe/SDZ5tkrR4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	WP91PpPFxVOuFnfvnWCxeHm5h9mibRa/xf89O9gt/l3byGLRsn8Ki4OIx/sbreweb16+ZPE4
	3PGF3ePeiWmsHptWdbJ5bF5S79Gy9hiTR/9fA4/3+66yefRtWcXocan5OrvH501yATxRejZF
	+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehm3bv1jLHgQ
	UTHh+RGmBsZj3l2MnBwSAiYSb+ctYO1i5OIQEljKKHFq/W1miISMxLXulywQtrDEn2tdbBBF
	rxglbjS3sIEk2ASMJB4snw/WLSJwgUli17rVTCAOs8A6Rokp23cwgVQJC0RLLFzfzApiswio
	SnRe2gO2glfATuL1nj42iBXyEvsPngWLcwrYS2yY8pgRxBYCqvlzsx+qXlDi5MwnYCcxA9U3
	b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECI3vbsZ9bdjCufPVR
	7xAjEwfjIUYJDmYlEd5CrbfpQrwpiZVVqUX58UWlOanFhxhNge6eyCwlmpwPTC15JfGGZgam
	hiZmlgamlmbGSuK8bFfOpwkJpCeWpGanphakFsH0MXFwSjUwzf/0V7dG68YWFrErclvfxUvK
	3Q/k3hdl7blm2pz+RbHiU+5VXV3drcz2MDtMQGB+WPWkS5f+Gq20Kj5avvRgtGNJo1Tf+Tlu
	q3z4LVZnT978rztgouOdArEJ6wWkdhsJ7a7mvWzVsGJbvbjFqkvf0vvCNxU08l2Rl3DKKVV8
	tORTx77JQcWFu/d8bNDsFi76/8nxhphf5blWkdv2M3w4FPrqj4pNnvLVOEhK6dENK56ysg1z
	w1pL2HNdlzNyR3Ut2s366U1X9c1lnz8zeC9ewrD5pqfbW8Nc5xcbQ28UTCiQczDpY/lnNz/B
	5b6tn4RRW8HsKxM2PCo6+FHrtUsgh9JxK9tF6d2z0u6q8B9XYinOSDTUYi4qTgQAVL26GXUD
	AAA=
X-CMS-MailID: 20250403094432eucas1p112aada697802092266bc36ef863f4299
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094432eucas1p112aada697802092266bc36ef863f4299
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094432eucas1p112aada697802092266bc36ef863f4299
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094432eucas1p112aada697802092266bc36ef863f4299@eucas1p1.samsung.com>

The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
including the Application Processor (AP) and the Video Output (VO) [1].
Up until now, the T-Head clock driver only supported AP clocks.

Extend the driver to provide clock functionality for the VO subsystem.
At this stage, the focus is on implementing the VO clock gates, as these
are currently the most relevant and required components for enabling and
disabling the VO subsystem functionality.  Future enhancements may
introduce additional VO-related clocks as necessary.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 196 +++++++++++++++++++++++++-----
 1 file changed, 168 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 4c9555fc6184..ebfb1d59401d 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
 static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
 
+static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
+		video_pll_clk_pd, 0x0, BIT(0), 0);
+static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
+		0x0, BIT(3), 0);
+static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
+		video_pll_clk_pd, 0x0, BIT(4), 0);
+static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
+		video_pll_clk_pd, 0x0, BIT(5), 0);
+static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
+		video_pll_clk_pd, 0x0, BIT(6), 0);
+static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
+		BIT(7), 0);
+static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
+		BIT(8), 0);
+static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
+		BIT(9), 0);
+static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
+		0x0, BIT(10), 0);
+static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
+		BIT(11), 0);
+static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
+		0x0, BIT(12), 0);
+static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
+		video_pll_clk_pd, 0x0, BIT(13), 0);
+static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
+		video_pll_clk_pd, 0x0, BIT(14), 0);
+static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
+		video_pll_clk_pd, 0x0, BIT(15), 0);
+static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
+		video_pll_clk_pd, 0x0, BIT(16), 0);
+static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
+		video_pll_clk_pd, 0x0, BIT(17), 0);
+static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
+		video_pll_clk_pd, 0x0, BIT(18), 0);
+static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
+		0x0, BIT(19), 0);
+static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
+		video_pll_clk_pd, 0x0, BIT(20), 0);
+static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(21), 0);
+static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
+		video_pll_clk_pd, 0x0, BIT(22), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
+		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
+		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
+static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
+		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
+static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
+		video_pll_clk_pd, 0x0, BIT(27), 0);
+static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(28), 0);
+static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
+		video_pll_clk_pd, 0x0, BIT(29), 0);
+static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
+		video_pll_clk_pd, 0x0, BIT(30), 0);
+static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
+		video_pll_clk_pd, 0x0, BIT(31), 0);
+static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
+		0x4, BIT(0), 0);
+
 static CLK_FIXED_FACTOR_HW(gmac_pll_clk_100m, "gmac-pll-clk-100m",
 			   &gmac_pll_clk.common.hw, 10, 1, 0);
 
@@ -963,7 +1024,38 @@ static struct ccu_common *th1520_gate_clks[] = {
 	&sram3_clk.common,
 };
 
-#define NR_CLKS	(CLK_UART_SCLK + 1)
+static struct ccu_common *th1520_vo_gate_clks[] = {
+	&axi4_vo_aclk.common,
+	&gpu_core_clk.common,
+	&gpu_cfg_aclk.common,
+	&dpu0_pixelclk.common,
+	&dpu1_pixelclk.common,
+	&dpu_hclk.common,
+	&dpu_aclk.common,
+	&dpu_cclk.common,
+	&hdmi_sfr_clk.common,
+	&hdmi_pclk.common,
+	&hdmi_cec_clk.common,
+	&mipi_dsi0_pclk.common,
+	&mipi_dsi1_pclk.common,
+	&mipi_dsi0_cfg_clk.common,
+	&mipi_dsi1_cfg_clk.common,
+	&mipi_dsi0_refclk.common,
+	&mipi_dsi1_refclk.common,
+	&hdmi_i2s_clk.common,
+	&x2h_dpu1_aclk.common,
+	&x2h_dpu_aclk.common,
+	&axi4_vo_pclk.common,
+	&iopmp_vosys_dpu_pclk.common,
+	&iopmp_vosys_dpu1_pclk.common,
+	&iopmp_vosys_gpu_pclk.common,
+	&iopmp_dpu1_aclk.common,
+	&iopmp_dpu_aclk.common,
+	&iopmp_gpu_aclk.common,
+	&mipi_dsi0_pixclk.common,
+	&mipi_dsi1_pixclk.common,
+	&hdmi_pixclk.common
+};
 
 static const struct regmap_config th1520_clk_regmap_config = {
 	.reg_bits = 32,
@@ -972,8 +1064,44 @@ static const struct regmap_config th1520_clk_regmap_config = {
 	.fast_io = true,
 };
 
+struct th1520_plat_data {
+	struct ccu_common **th1520_pll_clks;
+	struct ccu_common **th1520_div_clks;
+	struct ccu_common **th1520_mux_clks;
+	struct ccu_common **th1520_gate_clks;
+
+	int nr_clks;
+	int nr_pll_clks;
+	int nr_div_clks;
+	int nr_mux_clks;
+	int nr_gate_clks;
+};
+
+static const struct th1520_plat_data th1520_ap_platdata = {
+	.th1520_pll_clks = th1520_pll_clks,
+	.th1520_div_clks = th1520_div_clks,
+	.th1520_mux_clks = th1520_mux_clks,
+	.th1520_gate_clks = th1520_gate_clks,
+
+	.nr_clks = CLK_UART_SCLK + 1,
+
+	.nr_pll_clks = ARRAY_SIZE(th1520_pll_clks),
+	.nr_div_clks = ARRAY_SIZE(th1520_div_clks),
+	.nr_mux_clks = ARRAY_SIZE(th1520_mux_clks),
+	.nr_gate_clks = ARRAY_SIZE(th1520_gate_clks),
+};
+
+static const struct th1520_plat_data th1520_vo_platdata = {
+	.th1520_gate_clks = th1520_vo_gate_clks,
+
+	.nr_clks = CLK_HDMI_PIXCLK + 1,
+
+	.nr_gate_clks = ARRAY_SIZE(th1520_vo_gate_clks),
+};
+
 static int th1520_clk_probe(struct platform_device *pdev)
 {
+	const struct th1520_plat_data *plat_data;
 	struct device *dev = &pdev->dev;
 	struct clk_hw_onecell_data *priv;
 
@@ -982,11 +1110,16 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int ret, i;
 
-	priv = devm_kzalloc(dev, struct_size(priv, hws, NR_CLKS), GFP_KERNEL);
+	plat_data = device_get_match_data(&pdev->dev);
+	if (!plat_data)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "No device match data found\n");
+
+	priv = devm_kzalloc(dev, struct_size(priv, hws, plat_data->nr_clks), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->num = NR_CLKS;
+	priv->num = plat_data->nr_clks;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -996,35 +1129,35 @@ static int th1520_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	for (i = 0; i < ARRAY_SIZE(th1520_pll_clks); i++) {
-		struct ccu_pll *cp = hw_to_ccu_pll(&th1520_pll_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_pll_clks; i++) {
+		struct ccu_pll *cp = hw_to_ccu_pll(&plat_data->th1520_pll_clks[i]->hw);
 
-		th1520_pll_clks[i]->map = map;
+		plat_data->th1520_pll_clks[i]->map = map;
 
-		ret = devm_clk_hw_register(dev, &th1520_pll_clks[i]->hw);
+		ret = devm_clk_hw_register(dev, &plat_data->th1520_pll_clks[i]->hw);
 		if (ret)
 			return ret;
 
 		priv->hws[cp->common.clkid] = &cp->common.hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_div_clks); i++) {
-		struct ccu_div *cd = hw_to_ccu_div(&th1520_div_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_div_clks; i++) {
+		struct ccu_div *cd = hw_to_ccu_div(&plat_data->th1520_div_clks[i]->hw);
 
-		th1520_div_clks[i]->map = map;
+		plat_data->th1520_div_clks[i]->map = map;
 
-		ret = devm_clk_hw_register(dev, &th1520_div_clks[i]->hw);
+		ret = devm_clk_hw_register(dev, &plat_data->th1520_div_clks[i]->hw);
 		if (ret)
 			return ret;
 
 		priv->hws[cd->common.clkid] = &cd->common.hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_mux_clks); i++) {
-		struct ccu_mux *cm = hw_to_ccu_mux(&th1520_mux_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_mux_clks; i++) {
+		struct ccu_mux *cm = hw_to_ccu_mux(&plat_data->th1520_mux_clks[i]->hw);
 		const struct clk_init_data *init = cm->common.hw.init;
 
-		th1520_mux_clks[i]->map = map;
+		plat_data->th1520_mux_clks[i]->map = map;
 		hw = devm_clk_hw_register_mux_parent_data_table(dev,
 								init->name,
 								init->parent_data,
@@ -1040,10 +1173,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		priv->hws[cm->common.clkid] = hw;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(th1520_gate_clks); i++) {
-		struct ccu_gate *cg = hw_to_ccu_gate(&th1520_gate_clks[i]->hw);
+	for (i = 0; i < plat_data->nr_gate_clks; i++) {
+		struct ccu_gate *cg = hw_to_ccu_gate(&plat_data->th1520_gate_clks[i]->hw);
 
-		th1520_gate_clks[i]->map = map;
+		plat_data->th1520_gate_clks[i]->map = map;
 
 		hw = devm_clk_hw_register_gate_parent_data(dev,
 							   cg->common.hw.init->name,
@@ -1057,19 +1190,21 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		priv->hws[cg->common.clkid] = hw;
 	}
 
-	ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
-	if (ret)
-		return ret;
-	priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
+	if (plat_data == &th1520_ap_platdata) {
+		ret = devm_clk_hw_register(dev, &osc12m_clk.hw);
+		if (ret)
+			return ret;
+		priv->hws[CLK_OSC12M] = &osc12m_clk.hw;
 
-	ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
-	if (ret)
-		return ret;
-	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
+		ret = devm_clk_hw_register(dev, &gmac_pll_clk_100m.hw);
+		if (ret)
+			return ret;
+		priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
 
-	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
-	if (ret)
-		return ret;
+		ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
+		if (ret)
+			return ret;
+	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
 	if (ret)
@@ -1081,6 +1216,11 @@ static int th1520_clk_probe(struct platform_device *pdev)
 static const struct of_device_id th1520_clk_match[] = {
 	{
 		.compatible = "thead,th1520-clk-ap",
+		.data = &th1520_ap_platdata,
+	},
+	{
+		.compatible = "thead,th1520-clk-vo",
+		.data = &th1520_vo_platdata,
 	},
 	{ /* sentinel */ },
 };
-- 
2.34.1

