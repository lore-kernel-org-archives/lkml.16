Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED4269816
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388204; cv=none; b=Bdip6kT/0L+amN07mJiaxwTvLQFKB3re8xeHb5Tjq67hObZYywU8NnX9uiXlAEfusJ6k1WCiZB+STAxCwwTRn95/j4Oo/IUYnOi4MHK/5SinNEgPtgrnkTfjyRq/Uvj4vWGY7KKt5BuQzeFiIIEDu2jzQMlgUdKmASrUTEOV5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388204; c=relaxed/simple;
	bh=9Qscboeia2uNRBLH5/GZHOKIudnPwjvYFXRMx7RjKvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V78346PS279HF+bdCMw0GCffIcwgH9KDNRpg5lllM4wDF4nnN7aOG94FvnKi3+im+PwTqMFaYyy8qyJKuol+9MdHpz5il9QxBHiwET5yx/wXlgKQMEy9ZOPll2xfmzN62Aie1ewdG7n8K5Pi0jJANSj/quBGdEQG5TcQPBcxrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Xo8WiGLB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Xo8WiGLB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so890515366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388198; x=1745992998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1LPvgW76Syl4Gq/D4YwH1w+u1FqKAGdfyLm4OGDki8=;
        b=Xo8WiGLBrSH0oThaDVwrz/WFkIFseCYWBUlN/Donygdue83EcwzEriIvhz5gVBBACe
         aSwbdqSz177FoxT23UFnEkmBQ6mQXLtRMU3MBvBEtHOTQCttUB/FRVWNAXhVB2TN3+Zy
         j36aI3/3Ct8ZJKVwhrEzhw1quCYEuNqBmRk78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388198; x=1745992998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1LPvgW76Syl4Gq/D4YwH1w+u1FqKAGdfyLm4OGDki8=;
        b=VQ9fLftUWac0r/HfJk9sI8KvfdyechxNAEf/4bPhXzvN6YLigdJveYxONWLdGrqQCs
         BJ0HHIE7nx9oiS9s03gP2WPBfRObyj4Wl/+ycjQpBCkq7QDhYgI4ZVjRGlFUZC5lImGX
         fda/W3hy2vi+qg9f+HacZz230FncfNfDyJWimYDEOTK41M7XfY/iC9bL0HOG5GCzB0rW
         tYdC3urZiVJiWFUBYaE+9t1nz5aheHG7C2sQR9bSg5wWYbZJ7EUY/QlwCOMQGCWu254T
         mDHkd+N5DGKSMe8VBWPbsle3r6fKsd0gK+ctGa4ljwgkZ6Aap4MPOv6yoI2dw59kvjgh
         JWWQ==
X-Gm-Message-State: AOJu0Yyt9FfrGEzbirrciEr2jEq8wVNfkMHRibdvmd2KiJ1T+QDlmeEF
	8zQKI6rSCEDLa/1EcdnmtTbcqECvqA/GNhaNYMzQEI5xhMkVx4I96DC1N5tkRinUMfD0vEWbSJ/
	/
X-Gm-Gg: ASbGncsPoSPSj9rjxTBlW/4Z4F4XgXCVNX907jX7iQcJIi2TjdC3T1B5Rp/GM0Ib/lZ
	fvUxsE/ACr4s8MH+KM46chg3wybya/6K7Uv+cXTy01UV/uEju8AgzcZYsAXkqnQUdnSzpSoBEPD
	9TZZQPl48Mruzp7scPjsVc23CE20+NmByUeHYmJK453Cm+O7QYPJxyB6OCpRP2It/LxiB7bGJ80
	i2otTH8p/3XteqfI9YIja5oskJVtldbHvQiSwWavzL3TQ7/7kAAMDb9mh2HHSWqM5qC4EEd1W+h
	5j8dhu8Z3vl4OnEo9gOI5XyfJXdgAyvZTHXuavyfs+BcqqLLO5V7fQuecqFSLrn6UcHW2cb4BbR
	WcZ6s
X-Google-Smtp-Source: AGHT+IH7CUPO9d2B4FgKffdP14l+kQYdOEIRv7TdYTNksy3KVuCSFzHmMalHuKPqGKdShh5WXZlu6g==
X-Received: by 2002:a17:907:7246:b0:ac3:ccf7:3a11 with SMTP id a640c23a62f3a-acb74dd4b1bmr1634138466b.44.1745388197709;
        Tue, 22 Apr 2025 23:03:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 14/18] clk: imx8mp: rename ccm_base to base
Date: Wed, 23 Apr 2025 08:02:31 +0200
Message-ID: <20250423060241.95521-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old code also accessed the anatop address space and therefore used
the variables anatop_base and ccm_base to distinguish between the two
address spaces. However, now that a specific anatop driver exists for
the i.MX8MP platform, the variable ccm_base can be renamed to base, as
is usually the case for the variable pointing to the memory region
managed by a Linux driver.
The patch does not introduce any functional changes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v11:
- Add 'Reviewed-by' tag of Peng Fan
- Fix conflict while rebasing on master

 drivers/clk/imx/clk-imx8mp.c | 378 +++++++++++++++++------------------
 1 file changed, 189 insertions(+), 189 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 3fa6241dede9..f90533664953 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -532,13 +532,13 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
-	void __iomem *ccm_base;
+	void __iomem *base;
 	const char *opmode;
 	int err;
 
-	ccm_base = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(IS_ERR(ccm_base)))
-		return PTR_ERR(ccm_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, IMX8MP_CLK_END), GFP_KERNEL);
 	if (WARN_ON(!clk_hw_data))
@@ -634,198 +634,198 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2_DIV);
 	hws[IMX8MP_CLK_CLKOUT2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2);
 
-	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
+	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, base + 0x8000);
 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
 	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
-	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
-	hws[IMX8MP_CLK_ML_CORE] = imx8m_clk_hw_composite_core("ml_core", imx8mp_ml_sels, ccm_base + 0x8100);
-	hws[IMX8MP_CLK_GPU3D_CORE] = imx8m_clk_hw_composite_core("gpu3d_core", imx8mp_gpu3d_core_sels, ccm_base + 0x8180);
-	hws[IMX8MP_CLK_GPU3D_SHADER_CORE] = imx8m_clk_hw_composite("gpu3d_shader_core", imx8mp_gpu3d_shader_sels, ccm_base + 0x8200);
-	hws[IMX8MP_CLK_GPU2D_CORE] = imx8m_clk_hw_composite("gpu2d_core", imx8mp_gpu2d_sels, ccm_base + 0x8280);
-	hws[IMX8MP_CLK_AUDIO_AXI] = imx8m_clk_hw_composite("audio_axi", imx8mp_audio_axi_sels, ccm_base + 0x8300);
+	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, base + 0x8080);
+	hws[IMX8MP_CLK_ML_CORE] = imx8m_clk_hw_composite_core("ml_core", imx8mp_ml_sels, base + 0x8100);
+	hws[IMX8MP_CLK_GPU3D_CORE] = imx8m_clk_hw_composite_core("gpu3d_core", imx8mp_gpu3d_core_sels, base + 0x8180);
+	hws[IMX8MP_CLK_GPU3D_SHADER_CORE] = imx8m_clk_hw_composite("gpu3d_shader_core", imx8mp_gpu3d_shader_sels, base + 0x8200);
+	hws[IMX8MP_CLK_GPU2D_CORE] = imx8m_clk_hw_composite("gpu2d_core", imx8mp_gpu2d_sels, base + 0x8280);
+	hws[IMX8MP_CLK_AUDIO_AXI] = imx8m_clk_hw_composite("audio_axi", imx8mp_audio_axi_sels, base + 0x8300);
 	hws[IMX8MP_CLK_AUDIO_AXI_SRC] = hws[IMX8MP_CLK_AUDIO_AXI];
-	hws[IMX8MP_CLK_HSIO_AXI] = imx8m_clk_hw_composite("hsio_axi", imx8mp_hsio_axi_sels, ccm_base + 0x8380);
-	hws[IMX8MP_CLK_MEDIA_ISP] = imx8m_clk_hw_composite("media_isp", imx8mp_media_isp_sels, ccm_base + 0x8400);
+	hws[IMX8MP_CLK_HSIO_AXI] = imx8m_clk_hw_composite("hsio_axi", imx8mp_hsio_axi_sels, base + 0x8380);
+	hws[IMX8MP_CLK_MEDIA_ISP] = imx8m_clk_hw_composite("media_isp", imx8mp_media_isp_sels, base + 0x8400);
 
 	/* CORE SEL */
-	hws[IMX8MP_CLK_A53_CORE] = imx_clk_hw_mux2("arm_a53_core", ccm_base + 0x9880, 24, 1, imx8mp_a53_core_sels, ARRAY_SIZE(imx8mp_a53_core_sels));
-
-	hws[IMX8MP_CLK_MAIN_AXI] = imx8m_clk_hw_composite_bus_critical("main_axi", imx8mp_main_axi_sels, ccm_base + 0x8800);
-	hws[IMX8MP_CLK_ENET_AXI] = imx8m_clk_hw_composite_bus("enet_axi", imx8mp_enet_axi_sels, ccm_base + 0x8880);
-	hws[IMX8MP_CLK_NAND_USDHC_BUS] = imx8m_clk_hw_composite("nand_usdhc_bus", imx8mp_nand_usdhc_sels, ccm_base + 0x8900);
-	hws[IMX8MP_CLK_VPU_BUS] = imx8m_clk_hw_composite_bus("vpu_bus", imx8mp_vpu_bus_sels, ccm_base + 0x8980);
-	hws[IMX8MP_CLK_MEDIA_AXI] = imx8m_clk_hw_composite_bus("media_axi", imx8mp_media_axi_sels, ccm_base + 0x8a00);
-	hws[IMX8MP_CLK_MEDIA_APB] = imx8m_clk_hw_composite_bus("media_apb", imx8mp_media_apb_sels, ccm_base + 0x8a80);
-	hws[IMX8MP_CLK_HDMI_APB] = imx8m_clk_hw_composite_bus("hdmi_apb", imx8mp_media_apb_sels, ccm_base + 0x8b00);
-	hws[IMX8MP_CLK_HDMI_AXI] = imx8m_clk_hw_composite_bus("hdmi_axi", imx8mp_media_axi_sels, ccm_base + 0x8b80);
-	hws[IMX8MP_CLK_GPU_AXI] = imx8m_clk_hw_composite_bus("gpu_axi", imx8mp_gpu_axi_sels, ccm_base + 0x8c00);
-	hws[IMX8MP_CLK_GPU_AHB] = imx8m_clk_hw_composite_bus("gpu_ahb", imx8mp_gpu_ahb_sels, ccm_base + 0x8c80);
-	hws[IMX8MP_CLK_NOC] = imx8m_clk_hw_composite_bus_critical("noc", imx8mp_noc_sels, ccm_base + 0x8d00);
-	hws[IMX8MP_CLK_NOC_IO] = imx8m_clk_hw_composite_bus_critical("noc_io", imx8mp_noc_io_sels, ccm_base + 0x8d80);
-	hws[IMX8MP_CLK_ML_AXI] = imx8m_clk_hw_composite_bus("ml_axi", imx8mp_ml_axi_sels, ccm_base + 0x8e00);
-	hws[IMX8MP_CLK_ML_AHB] = imx8m_clk_hw_composite_bus("ml_ahb", imx8mp_ml_ahb_sels, ccm_base + 0x8e80);
-
-	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, ccm_base + 0x9000);
-	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, ccm_base + 0x9100);
-	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET_RATE_PARENT);
-
-	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
-
-	hws[IMX8MP_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mp_dram_alt_sels, ccm_base + 0xa000);
-	hws[IMX8MP_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mp_dram_apb_sels, ccm_base + 0xa080);
-	hws[IMX8MP_CLK_VPU_G1] = imx8m_clk_hw_composite("vpu_g1", imx8mp_vpu_g1_sels, ccm_base + 0xa100);
-	hws[IMX8MP_CLK_VPU_G2] = imx8m_clk_hw_composite("vpu_g2", imx8mp_vpu_g2_sels, ccm_base + 0xa180);
-	hws[IMX8MP_CLK_CAN1] = imx8m_clk_hw_composite("can1", imx8mp_can1_sels, ccm_base + 0xa200);
-	hws[IMX8MP_CLK_CAN2] = imx8m_clk_hw_composite("can2", imx8mp_can2_sels, ccm_base + 0xa280);
-	hws[IMX8MP_CLK_PCIE_AUX] = imx8m_clk_hw_composite("pcie_aux", imx8mp_pcie_aux_sels, ccm_base + 0xa400);
-	hws[IMX8MP_CLK_I2C5] = imx8m_clk_hw_composite("i2c5", imx8mp_i2c5_sels, ccm_base + 0xa480);
-	hws[IMX8MP_CLK_I2C6] = imx8m_clk_hw_composite("i2c6", imx8mp_i2c6_sels, ccm_base + 0xa500);
-	hws[IMX8MP_CLK_SAI1] = imx8m_clk_hw_composite("sai1", imx8mp_sai1_sels, ccm_base + 0xa580);
-	hws[IMX8MP_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mp_sai2_sels, ccm_base + 0xa600);
-	hws[IMX8MP_CLK_SAI3] = imx8m_clk_hw_composite("sai3", imx8mp_sai3_sels, ccm_base + 0xa680);
-	hws[IMX8MP_CLK_SAI5] = imx8m_clk_hw_composite("sai5", imx8mp_sai5_sels, ccm_base + 0xa780);
-	hws[IMX8MP_CLK_SAI6] = imx8m_clk_hw_composite("sai6", imx8mp_sai6_sels, ccm_base + 0xa800);
-	hws[IMX8MP_CLK_ENET_QOS] = imx8m_clk_hw_composite("enet_qos", imx8mp_enet_qos_sels, ccm_base + 0xa880);
-	hws[IMX8MP_CLK_ENET_QOS_TIMER] = imx8m_clk_hw_composite("enet_qos_timer", imx8mp_enet_qos_timer_sels, ccm_base + 0xa900);
-	hws[IMX8MP_CLK_ENET_REF] = imx8m_clk_hw_composite("enet_ref", imx8mp_enet_ref_sels, ccm_base + 0xa980);
-	hws[IMX8MP_CLK_ENET_TIMER] = imx8m_clk_hw_composite("enet_timer", imx8mp_enet_timer_sels, ccm_base + 0xaa00);
-	hws[IMX8MP_CLK_ENET_PHY_REF] = imx8m_clk_hw_composite("enet_phy_ref", imx8mp_enet_phy_ref_sels, ccm_base + 0xaa80);
-	hws[IMX8MP_CLK_NAND] = imx8m_clk_hw_composite("nand", imx8mp_nand_sels, ccm_base + 0xab00);
-	hws[IMX8MP_CLK_QSPI] = imx8m_clk_hw_composite("qspi", imx8mp_qspi_sels, ccm_base + 0xab80);
-	hws[IMX8MP_CLK_USDHC1] = imx8m_clk_hw_composite("usdhc1", imx8mp_usdhc1_sels, ccm_base + 0xac00);
-	hws[IMX8MP_CLK_USDHC2] = imx8m_clk_hw_composite("usdhc2", imx8mp_usdhc2_sels, ccm_base + 0xac80);
-	hws[IMX8MP_CLK_I2C1] = imx8m_clk_hw_composite("i2c1", imx8mp_i2c1_sels, ccm_base + 0xad00);
-	hws[IMX8MP_CLK_I2C2] = imx8m_clk_hw_composite("i2c2", imx8mp_i2c2_sels, ccm_base + 0xad80);
-	hws[IMX8MP_CLK_I2C3] = imx8m_clk_hw_composite("i2c3", imx8mp_i2c3_sels, ccm_base + 0xae00);
-	hws[IMX8MP_CLK_I2C4] = imx8m_clk_hw_composite("i2c4", imx8mp_i2c4_sels, ccm_base + 0xae80);
-
-	hws[IMX8MP_CLK_UART1] = imx8m_clk_hw_composite("uart1", imx8mp_uart1_sels, ccm_base + 0xaf00);
-	hws[IMX8MP_CLK_UART2] = imx8m_clk_hw_composite("uart2", imx8mp_uart2_sels, ccm_base + 0xaf80);
-	hws[IMX8MP_CLK_UART3] = imx8m_clk_hw_composite("uart3", imx8mp_uart3_sels, ccm_base + 0xb000);
-	hws[IMX8MP_CLK_UART4] = imx8m_clk_hw_composite("uart4", imx8mp_uart4_sels, ccm_base + 0xb080);
-	hws[IMX8MP_CLK_USB_CORE_REF] = imx8m_clk_hw_composite("usb_core_ref", imx8mp_usb_core_ref_sels, ccm_base + 0xb100);
-	hws[IMX8MP_CLK_USB_PHY_REF] = imx8m_clk_hw_composite("usb_phy_ref", imx8mp_usb_phy_ref_sels, ccm_base + 0xb180);
-	hws[IMX8MP_CLK_GIC] = imx8m_clk_hw_composite_critical("gic", imx8mp_gic_sels, ccm_base + 0xb200);
-	hws[IMX8MP_CLK_ECSPI1] = imx8m_clk_hw_composite("ecspi1", imx8mp_ecspi1_sels, ccm_base + 0xb280);
-	hws[IMX8MP_CLK_ECSPI2] = imx8m_clk_hw_composite("ecspi2", imx8mp_ecspi2_sels, ccm_base + 0xb300);
-	hws[IMX8MP_CLK_PWM1] = imx8m_clk_hw_composite("pwm1", imx8mp_pwm1_sels, ccm_base + 0xb380);
-	hws[IMX8MP_CLK_PWM2] = imx8m_clk_hw_composite("pwm2", imx8mp_pwm2_sels, ccm_base + 0xb400);
-	hws[IMX8MP_CLK_PWM3] = imx8m_clk_hw_composite("pwm3", imx8mp_pwm3_sels, ccm_base + 0xb480);
-	hws[IMX8MP_CLK_PWM4] = imx8m_clk_hw_composite("pwm4", imx8mp_pwm4_sels, ccm_base + 0xb500);
-
-	hws[IMX8MP_CLK_GPT1] = imx8m_clk_hw_composite("gpt1", imx8mp_gpt1_sels, ccm_base + 0xb580);
-	hws[IMX8MP_CLK_GPT2] = imx8m_clk_hw_composite("gpt2", imx8mp_gpt2_sels, ccm_base + 0xb600);
-	hws[IMX8MP_CLK_GPT3] = imx8m_clk_hw_composite("gpt3", imx8mp_gpt3_sels, ccm_base + 0xb680);
-	hws[IMX8MP_CLK_GPT4] = imx8m_clk_hw_composite("gpt4", imx8mp_gpt4_sels, ccm_base + 0xb700);
-	hws[IMX8MP_CLK_GPT5] = imx8m_clk_hw_composite("gpt5", imx8mp_gpt5_sels, ccm_base + 0xb780);
-	hws[IMX8MP_CLK_GPT6] = imx8m_clk_hw_composite("gpt6", imx8mp_gpt6_sels, ccm_base + 0xb800);
-	hws[IMX8MP_CLK_WDOG] = imx8m_clk_hw_composite("wdog", imx8mp_wdog_sels, ccm_base + 0xb900);
-	hws[IMX8MP_CLK_WRCLK] = imx8m_clk_hw_composite("wrclk", imx8mp_wrclk_sels, ccm_base + 0xb980);
-	hws[IMX8MP_CLK_IPP_DO_CLKO1] = imx8m_clk_hw_composite("ipp_do_clko1", imx8mp_ipp_do_clko1_sels, ccm_base + 0xba00);
-	hws[IMX8MP_CLK_IPP_DO_CLKO2] = imx8m_clk_hw_composite("ipp_do_clko2", imx8mp_ipp_do_clko2_sels, ccm_base + 0xba80);
-	hws[IMX8MP_CLK_HDMI_FDCC_TST] = imx8m_clk_hw_composite("hdmi_fdcc_tst", imx8mp_hdmi_fdcc_tst_sels, ccm_base + 0xbb00);
-	hws[IMX8MP_CLK_HDMI_24M] = imx8m_clk_hw_composite("hdmi_24m", imx8mp_hdmi_24m_sels, ccm_base + 0xbb80);
-	hws[IMX8MP_CLK_HDMI_REF_266M] = imx8m_clk_hw_composite("hdmi_ref_266m", imx8mp_hdmi_ref_266m_sels, ccm_base + 0xbc00);
-	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, ccm_base + 0xbc80);
-	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, ccm_base + 0xbd00);
-	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
-	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
-	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
-	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
-	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
-	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);
-	hws[IMX8MP_CLK_PDM] = imx8m_clk_hw_composite("pdm", imx8mp_pdm_sels, ccm_base + 0xc200);
-	hws[IMX8MP_CLK_VPU_VC8000E] = imx8m_clk_hw_composite("vpu_vc8000e", imx8mp_vpu_vc8000e_sels, ccm_base + 0xc280);
-	hws[IMX8MP_CLK_SAI7] = imx8m_clk_hw_composite("sai7", imx8mp_sai7_sels, ccm_base + 0xc300);
+	hws[IMX8MP_CLK_A53_CORE] = imx_clk_hw_mux2("arm_a53_core", base + 0x9880, 24, 1, imx8mp_a53_core_sels, ARRAY_SIZE(imx8mp_a53_core_sels));
+
+	hws[IMX8MP_CLK_MAIN_AXI] = imx8m_clk_hw_composite_bus_critical("main_axi", imx8mp_main_axi_sels, base + 0x8800);
+	hws[IMX8MP_CLK_ENET_AXI] = imx8m_clk_hw_composite_bus("enet_axi", imx8mp_enet_axi_sels, base + 0x8880);
+	hws[IMX8MP_CLK_NAND_USDHC_BUS] = imx8m_clk_hw_composite("nand_usdhc_bus", imx8mp_nand_usdhc_sels, base + 0x8900);
+	hws[IMX8MP_CLK_VPU_BUS] = imx8m_clk_hw_composite_bus("vpu_bus", imx8mp_vpu_bus_sels, base + 0x8980);
+	hws[IMX8MP_CLK_MEDIA_AXI] = imx8m_clk_hw_composite_bus("media_axi", imx8mp_media_axi_sels, base + 0x8a00);
+	hws[IMX8MP_CLK_MEDIA_APB] = imx8m_clk_hw_composite_bus("media_apb", imx8mp_media_apb_sels, base + 0x8a80);
+	hws[IMX8MP_CLK_HDMI_APB] = imx8m_clk_hw_composite_bus("hdmi_apb", imx8mp_media_apb_sels, base + 0x8b00);
+	hws[IMX8MP_CLK_HDMI_AXI] = imx8m_clk_hw_composite_bus("hdmi_axi", imx8mp_media_axi_sels, base + 0x8b80);
+	hws[IMX8MP_CLK_GPU_AXI] = imx8m_clk_hw_composite_bus("gpu_axi", imx8mp_gpu_axi_sels, base + 0x8c00);
+	hws[IMX8MP_CLK_GPU_AHB] = imx8m_clk_hw_composite_bus("gpu_ahb", imx8mp_gpu_ahb_sels, base + 0x8c80);
+	hws[IMX8MP_CLK_NOC] = imx8m_clk_hw_composite_bus_critical("noc", imx8mp_noc_sels, base + 0x8d00);
+	hws[IMX8MP_CLK_NOC_IO] = imx8m_clk_hw_composite_bus_critical("noc_io", imx8mp_noc_io_sels, base + 0x8d80);
+	hws[IMX8MP_CLK_ML_AXI] = imx8m_clk_hw_composite_bus("ml_axi", imx8mp_ml_axi_sels, base + 0x8e00);
+	hws[IMX8MP_CLK_ML_AHB] = imx8m_clk_hw_composite_bus("ml_ahb", imx8mp_ml_ahb_sels, base + 0x8e80);
+
+	hws[IMX8MP_CLK_AHB] = imx8m_clk_hw_composite_bus_critical("ahb_root", imx8mp_ahb_sels, base + 0x9000);
+	hws[IMX8MP_CLK_AUDIO_AHB] = imx8m_clk_hw_composite_bus("audio_ahb", imx8mp_audio_ahb_sels, base + 0x9100);
+	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, base + 0x9200);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp2_pix", imx8mp_media_disp_pix_sels, base + 0x9300, CLK_SET_RATE_PARENT);
+
+	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", base + 0x9080, 0, 1);
+
+	hws[IMX8MP_CLK_DRAM_ALT] = imx8m_clk_hw_fw_managed_composite("dram_alt", imx8mp_dram_alt_sels, base + 0xa000);
+	hws[IMX8MP_CLK_DRAM_APB] = imx8m_clk_hw_fw_managed_composite_critical("dram_apb", imx8mp_dram_apb_sels, base + 0xa080);
+	hws[IMX8MP_CLK_VPU_G1] = imx8m_clk_hw_composite("vpu_g1", imx8mp_vpu_g1_sels, base + 0xa100);
+	hws[IMX8MP_CLK_VPU_G2] = imx8m_clk_hw_composite("vpu_g2", imx8mp_vpu_g2_sels, base + 0xa180);
+	hws[IMX8MP_CLK_CAN1] = imx8m_clk_hw_composite("can1", imx8mp_can1_sels, base + 0xa200);
+	hws[IMX8MP_CLK_CAN2] = imx8m_clk_hw_composite("can2", imx8mp_can2_sels, base + 0xa280);
+	hws[IMX8MP_CLK_PCIE_AUX] = imx8m_clk_hw_composite("pcie_aux", imx8mp_pcie_aux_sels, base + 0xa400);
+	hws[IMX8MP_CLK_I2C5] = imx8m_clk_hw_composite("i2c5", imx8mp_i2c5_sels, base + 0xa480);
+	hws[IMX8MP_CLK_I2C6] = imx8m_clk_hw_composite("i2c6", imx8mp_i2c6_sels, base + 0xa500);
+	hws[IMX8MP_CLK_SAI1] = imx8m_clk_hw_composite("sai1", imx8mp_sai1_sels, base + 0xa580);
+	hws[IMX8MP_CLK_SAI2] = imx8m_clk_hw_composite("sai2", imx8mp_sai2_sels, base + 0xa600);
+	hws[IMX8MP_CLK_SAI3] = imx8m_clk_hw_composite("sai3", imx8mp_sai3_sels, base + 0xa680);
+	hws[IMX8MP_CLK_SAI5] = imx8m_clk_hw_composite("sai5", imx8mp_sai5_sels, base + 0xa780);
+	hws[IMX8MP_CLK_SAI6] = imx8m_clk_hw_composite("sai6", imx8mp_sai6_sels, base + 0xa800);
+	hws[IMX8MP_CLK_ENET_QOS] = imx8m_clk_hw_composite("enet_qos", imx8mp_enet_qos_sels, base + 0xa880);
+	hws[IMX8MP_CLK_ENET_QOS_TIMER] = imx8m_clk_hw_composite("enet_qos_timer", imx8mp_enet_qos_timer_sels, base + 0xa900);
+	hws[IMX8MP_CLK_ENET_REF] = imx8m_clk_hw_composite("enet_ref", imx8mp_enet_ref_sels, base + 0xa980);
+	hws[IMX8MP_CLK_ENET_TIMER] = imx8m_clk_hw_composite("enet_timer", imx8mp_enet_timer_sels, base + 0xaa00);
+	hws[IMX8MP_CLK_ENET_PHY_REF] = imx8m_clk_hw_composite("enet_phy_ref", imx8mp_enet_phy_ref_sels, base + 0xaa80);
+	hws[IMX8MP_CLK_NAND] = imx8m_clk_hw_composite("nand", imx8mp_nand_sels, base + 0xab00);
+	hws[IMX8MP_CLK_QSPI] = imx8m_clk_hw_composite("qspi", imx8mp_qspi_sels, base + 0xab80);
+	hws[IMX8MP_CLK_USDHC1] = imx8m_clk_hw_composite("usdhc1", imx8mp_usdhc1_sels, base + 0xac00);
+	hws[IMX8MP_CLK_USDHC2] = imx8m_clk_hw_composite("usdhc2", imx8mp_usdhc2_sels, base + 0xac80);
+	hws[IMX8MP_CLK_I2C1] = imx8m_clk_hw_composite("i2c1", imx8mp_i2c1_sels, base + 0xad00);
+	hws[IMX8MP_CLK_I2C2] = imx8m_clk_hw_composite("i2c2", imx8mp_i2c2_sels, base + 0xad80);
+	hws[IMX8MP_CLK_I2C3] = imx8m_clk_hw_composite("i2c3", imx8mp_i2c3_sels, base + 0xae00);
+	hws[IMX8MP_CLK_I2C4] = imx8m_clk_hw_composite("i2c4", imx8mp_i2c4_sels, base + 0xae80);
+
+	hws[IMX8MP_CLK_UART1] = imx8m_clk_hw_composite("uart1", imx8mp_uart1_sels, base + 0xaf00);
+	hws[IMX8MP_CLK_UART2] = imx8m_clk_hw_composite("uart2", imx8mp_uart2_sels, base + 0xaf80);
+	hws[IMX8MP_CLK_UART3] = imx8m_clk_hw_composite("uart3", imx8mp_uart3_sels, base + 0xb000);
+	hws[IMX8MP_CLK_UART4] = imx8m_clk_hw_composite("uart4", imx8mp_uart4_sels, base + 0xb080);
+	hws[IMX8MP_CLK_USB_CORE_REF] = imx8m_clk_hw_composite("usb_core_ref", imx8mp_usb_core_ref_sels, base + 0xb100);
+	hws[IMX8MP_CLK_USB_PHY_REF] = imx8m_clk_hw_composite("usb_phy_ref", imx8mp_usb_phy_ref_sels, base + 0xb180);
+	hws[IMX8MP_CLK_GIC] = imx8m_clk_hw_composite_critical("gic", imx8mp_gic_sels, base + 0xb200);
+	hws[IMX8MP_CLK_ECSPI1] = imx8m_clk_hw_composite("ecspi1", imx8mp_ecspi1_sels, base + 0xb280);
+	hws[IMX8MP_CLK_ECSPI2] = imx8m_clk_hw_composite("ecspi2", imx8mp_ecspi2_sels, base + 0xb300);
+	hws[IMX8MP_CLK_PWM1] = imx8m_clk_hw_composite("pwm1", imx8mp_pwm1_sels, base + 0xb380);
+	hws[IMX8MP_CLK_PWM2] = imx8m_clk_hw_composite("pwm2", imx8mp_pwm2_sels, base + 0xb400);
+	hws[IMX8MP_CLK_PWM3] = imx8m_clk_hw_composite("pwm3", imx8mp_pwm3_sels, base + 0xb480);
+	hws[IMX8MP_CLK_PWM4] = imx8m_clk_hw_composite("pwm4", imx8mp_pwm4_sels, base + 0xb500);
+
+	hws[IMX8MP_CLK_GPT1] = imx8m_clk_hw_composite("gpt1", imx8mp_gpt1_sels, base + 0xb580);
+	hws[IMX8MP_CLK_GPT2] = imx8m_clk_hw_composite("gpt2", imx8mp_gpt2_sels, base + 0xb600);
+	hws[IMX8MP_CLK_GPT3] = imx8m_clk_hw_composite("gpt3", imx8mp_gpt3_sels, base + 0xb680);
+	hws[IMX8MP_CLK_GPT4] = imx8m_clk_hw_composite("gpt4", imx8mp_gpt4_sels, base + 0xb700);
+	hws[IMX8MP_CLK_GPT5] = imx8m_clk_hw_composite("gpt5", imx8mp_gpt5_sels, base + 0xb780);
+	hws[IMX8MP_CLK_GPT6] = imx8m_clk_hw_composite("gpt6", imx8mp_gpt6_sels, base + 0xb800);
+	hws[IMX8MP_CLK_WDOG] = imx8m_clk_hw_composite("wdog", imx8mp_wdog_sels, base + 0xb900);
+	hws[IMX8MP_CLK_WRCLK] = imx8m_clk_hw_composite("wrclk", imx8mp_wrclk_sels, base + 0xb980);
+	hws[IMX8MP_CLK_IPP_DO_CLKO1] = imx8m_clk_hw_composite("ipp_do_clko1", imx8mp_ipp_do_clko1_sels, base + 0xba00);
+	hws[IMX8MP_CLK_IPP_DO_CLKO2] = imx8m_clk_hw_composite("ipp_do_clko2", imx8mp_ipp_do_clko2_sels, base + 0xba80);
+	hws[IMX8MP_CLK_HDMI_FDCC_TST] = imx8m_clk_hw_composite("hdmi_fdcc_tst", imx8mp_hdmi_fdcc_tst_sels, base + 0xbb00);
+	hws[IMX8MP_CLK_HDMI_24M] = imx8m_clk_hw_composite("hdmi_24m", imx8mp_hdmi_24m_sels, base + 0xbb80);
+	hws[IMX8MP_CLK_HDMI_REF_266M] = imx8m_clk_hw_composite("hdmi_ref_266m", imx8mp_hdmi_ref_266m_sels, base + 0xbc00);
+	hws[IMX8MP_CLK_USDHC3] = imx8m_clk_hw_composite("usdhc3", imx8mp_usdhc3_sels, base + 0xbc80);
+	hws[IMX8MP_CLK_MEDIA_CAM1_PIX] = imx8m_clk_hw_composite("media_cam1_pix", imx8mp_media_cam1_pix_sels, base + 0xbd00);
+	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, base + 0xbd80);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, base + 0xbe00, CLK_SET_RATE_PARENT);
+	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, base + 0xbe80);
+	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, base + 0xbf00);
+	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, base + 0xbf80);
+	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, base + 0xc100);
+	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, base + 0xc180);
+	hws[IMX8MP_CLK_PDM] = imx8m_clk_hw_composite("pdm", imx8mp_pdm_sels, base + 0xc200);
+	hws[IMX8MP_CLK_VPU_VC8000E] = imx8m_clk_hw_composite("vpu_vc8000e", imx8mp_vpu_vc8000e_sels, base + 0xc280);
+	hws[IMX8MP_CLK_SAI7] = imx8m_clk_hw_composite("sai7", imx8mp_sai7_sels, base + 0xc300);
 
 	hws[IMX8MP_CLK_DRAM_ALT_ROOT] = imx_clk_hw_fixed_factor("dram_alt_root", "dram_alt", 1, 4);
-	hws[IMX8MP_CLK_DRAM_CORE] = imx_clk_hw_mux2_flags("dram_core_clk", ccm_base + 0x9800, 24, 1, imx8mp_dram_core_sels, ARRAY_SIZE(imx8mp_dram_core_sels), CLK_IS_CRITICAL);
-
-	hws[IMX8MP_CLK_DRAM1_ROOT] = imx_clk_hw_gate4_flags("dram1_root_clk", "dram_core_clk", ccm_base + 0x4050, 0, CLK_IS_CRITICAL);
-	hws[IMX8MP_CLK_ECSPI1_ROOT] = imx_clk_hw_gate4("ecspi1_root_clk", "ecspi1", ccm_base + 0x4070, 0);
-	hws[IMX8MP_CLK_ECSPI2_ROOT] = imx_clk_hw_gate4("ecspi2_root_clk", "ecspi2", ccm_base + 0x4080, 0);
-	hws[IMX8MP_CLK_ECSPI3_ROOT] = imx_clk_hw_gate4("ecspi3_root_clk", "ecspi3", ccm_base + 0x4090, 0);
-	hws[IMX8MP_CLK_ENET1_ROOT] = imx_clk_hw_gate4("enet1_root_clk", "enet_axi", ccm_base + 0x40a0, 0);
-	hws[IMX8MP_CLK_GPIO1_ROOT] = imx_clk_hw_gate4("gpio1_root_clk", "ipg_root", ccm_base + 0x40b0, 0);
-	hws[IMX8MP_CLK_GPIO2_ROOT] = imx_clk_hw_gate4("gpio2_root_clk", "ipg_root", ccm_base + 0x40c0, 0);
-	hws[IMX8MP_CLK_GPIO3_ROOT] = imx_clk_hw_gate4("gpio3_root_clk", "ipg_root", ccm_base + 0x40d0, 0);
-	hws[IMX8MP_CLK_GPIO4_ROOT] = imx_clk_hw_gate4("gpio4_root_clk", "ipg_root", ccm_base + 0x40e0, 0);
-	hws[IMX8MP_CLK_GPIO5_ROOT] = imx_clk_hw_gate4("gpio5_root_clk", "ipg_root", ccm_base + 0x40f0, 0);
-	hws[IMX8MP_CLK_GPT1_ROOT] = imx_clk_hw_gate4("gpt1_root_clk", "gpt1", ccm_base + 0x4100, 0);
-	hws[IMX8MP_CLK_GPT2_ROOT] = imx_clk_hw_gate4("gpt2_root_clk", "gpt2", ccm_base + 0x4110, 0);
-	hws[IMX8MP_CLK_GPT3_ROOT] = imx_clk_hw_gate4("gpt3_root_clk", "gpt3", ccm_base + 0x4120, 0);
-	hws[IMX8MP_CLK_GPT4_ROOT] = imx_clk_hw_gate4("gpt4_root_clk", "gpt4", ccm_base + 0x4130, 0);
-	hws[IMX8MP_CLK_GPT5_ROOT] = imx_clk_hw_gate4("gpt5_root_clk", "gpt5", ccm_base + 0x4140, 0);
-	hws[IMX8MP_CLK_GPT6_ROOT] = imx_clk_hw_gate4("gpt6_root_clk", "gpt6", ccm_base + 0x4150, 0);
-	hws[IMX8MP_CLK_I2C1_ROOT] = imx_clk_hw_gate4("i2c1_root_clk", "i2c1", ccm_base + 0x4170, 0);
-	hws[IMX8MP_CLK_I2C2_ROOT] = imx_clk_hw_gate4("i2c2_root_clk", "i2c2", ccm_base + 0x4180, 0);
-	hws[IMX8MP_CLK_I2C3_ROOT] = imx_clk_hw_gate4("i2c3_root_clk", "i2c3", ccm_base + 0x4190, 0);
-	hws[IMX8MP_CLK_I2C4_ROOT] = imx_clk_hw_gate4("i2c4_root_clk", "i2c4", ccm_base + 0x41a0, 0);
-	hws[IMX8MP_CLK_MU_ROOT] = imx_clk_hw_gate4("mu_root_clk", "ipg_root", ccm_base + 0x4210, 0);
-	hws[IMX8MP_CLK_OCOTP_ROOT] = imx_clk_hw_gate4("ocotp_root_clk", "ipg_root", ccm_base + 0x4220, 0);
-	hws[IMX8MP_CLK_PCIE_ROOT] = imx_clk_hw_gate4("pcie_root_clk", "pcie_aux", ccm_base + 0x4250, 0);
-	hws[IMX8MP_CLK_PWM1_ROOT] = imx_clk_hw_gate4("pwm1_root_clk", "pwm1", ccm_base + 0x4280, 0);
-	hws[IMX8MP_CLK_PWM2_ROOT] = imx_clk_hw_gate4("pwm2_root_clk", "pwm2", ccm_base + 0x4290, 0);
-	hws[IMX8MP_CLK_PWM3_ROOT] = imx_clk_hw_gate4("pwm3_root_clk", "pwm3", ccm_base + 0x42a0, 0);
-	hws[IMX8MP_CLK_PWM4_ROOT] = imx_clk_hw_gate4("pwm4_root_clk", "pwm4", ccm_base + 0x42b0, 0);
-	hws[IMX8MP_CLK_QOS_ROOT] = imx_clk_hw_gate4("qos_root_clk", "ipg_root", ccm_base + 0x42c0, 0);
-	hws[IMX8MP_CLK_QOS_ENET_ROOT] = imx_clk_hw_gate4("qos_enet_root_clk", "ipg_root", ccm_base + 0x42e0, 0);
-	hws[IMX8MP_CLK_QSPI_ROOT] = imx_clk_hw_gate4("qspi_root_clk", "qspi", ccm_base + 0x42f0, 0);
-	hws[IMX8MP_CLK_NAND_ROOT] = imx_clk_hw_gate2_shared2("nand_root_clk", "nand", ccm_base + 0x4300, 0, &share_count_nand);
-	hws[IMX8MP_CLK_NAND_USDHC_BUS_RAWNAND_CLK] = imx_clk_hw_gate2_shared2("nand_usdhc_rawnand_clk", "nand_usdhc_bus", ccm_base + 0x4300, 0, &share_count_nand);
-	hws[IMX8MP_CLK_I2C5_ROOT] = imx_clk_hw_gate2("i2c5_root_clk", "i2c5", ccm_base + 0x4330, 0);
-	hws[IMX8MP_CLK_I2C6_ROOT] = imx_clk_hw_gate2("i2c6_root_clk", "i2c6", ccm_base + 0x4340, 0);
-	hws[IMX8MP_CLK_CAN1_ROOT] = imx_clk_hw_gate2("can1_root_clk", "can1", ccm_base + 0x4350, 0);
-	hws[IMX8MP_CLK_CAN2_ROOT] = imx_clk_hw_gate2("can2_root_clk", "can2", ccm_base + 0x4360, 0);
-	hws[IMX8MP_CLK_SDMA1_ROOT] = imx_clk_hw_gate4("sdma1_root_clk", "ipg_root", ccm_base + 0x43a0, 0);
-	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
-	hws[IMX8MP_CLK_ENET_QOS_ROOT] = imx_clk_hw_gate4("enet_qos_root_clk", "sim_enet_root_clk", ccm_base + 0x43b0, 0);
-	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
-	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
-	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
-	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
-	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
-	hws[IMX8MP_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", ccm_base + 0x44c0, 0);
-	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate2_shared2("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
-	hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
-	hws[IMX8MP_CLK_USB_PHY_ROOT] = imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", ccm_base + 0x44f0, 0);
-	hws[IMX8MP_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", ccm_base + 0x4510, 0);
-	hws[IMX8MP_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", ccm_base + 0x4520, 0);
-	hws[IMX8MP_CLK_WDOG1_ROOT] = imx_clk_hw_gate4("wdog1_root_clk", "wdog", ccm_base + 0x4530, 0);
-	hws[IMX8MP_CLK_WDOG2_ROOT] = imx_clk_hw_gate4("wdog2_root_clk", "wdog", ccm_base + 0x4540, 0);
-	hws[IMX8MP_CLK_WDOG3_ROOT] = imx_clk_hw_gate4("wdog3_root_clk", "wdog", ccm_base + 0x4550, 0);
-	hws[IMX8MP_CLK_VPU_G1_ROOT] = imx_clk_hw_gate4("vpu_g1_root_clk", "vpu_g1", ccm_base + 0x4560, 0);
-	hws[IMX8MP_CLK_GPU_ROOT] = imx_clk_hw_gate4("gpu_root_clk", "gpu_axi", ccm_base + 0x4570, 0);
-	hws[IMX8MP_CLK_VPU_VC8KE_ROOT] = imx_clk_hw_gate4("vpu_vc8ke_root_clk", "vpu_vc8000e", ccm_base + 0x4590, 0);
-	hws[IMX8MP_CLK_VPU_G2_ROOT] = imx_clk_hw_gate4("vpu_g2_root_clk", "vpu_g2", ccm_base + 0x45a0, 0);
-	hws[IMX8MP_CLK_NPU_ROOT] = imx_clk_hw_gate4("npu_root_clk", "ml_core", ccm_base + 0x45b0, 0);
-	hws[IMX8MP_CLK_HSIO_ROOT] = imx_clk_hw_gate4("hsio_root_clk", "ipg_root", ccm_base + 0x45c0, 0);
-	hws[IMX8MP_CLK_MEDIA_APB_ROOT] = imx_clk_hw_gate2_shared2("media_apb_root_clk", "media_apb", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_AXI_ROOT] = imx_clk_hw_gate2_shared2("media_axi_root_clk", "media_axi", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam1_pix_root_clk", "media_cam1_pix", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_LDB_ROOT] = imx_clk_hw_gate2_shared2("media_ldb_root_clk", "media_ldb", ccm_base + 0x45d0, 0, &share_count_media);
-	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
-
-	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
-	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
-	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
-	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
-
-	hws[IMX8MP_CLK_AUDIO_AHB_ROOT] = imx_clk_hw_gate2_shared2("audio_ahb_root", "audio_ahb", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_AUDIO_AXI_ROOT] = imx_clk_hw_gate2_shared2("audio_axi_root", "audio_axi", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI1_ROOT] = imx_clk_hw_gate2_shared2("sai1_root", "sai1", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI2_ROOT] = imx_clk_hw_gate2_shared2("sai2_root", "sai2", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI3_ROOT] = imx_clk_hw_gate2_shared2("sai3_root", "sai3", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI5_ROOT] = imx_clk_hw_gate2_shared2("sai5_root", "sai5", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root", "sai6", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_SAI7_ROOT] = imx_clk_hw_gate2_shared2("sai7_root", "sai7", ccm_base + 0x4650, 0, &share_count_audio);
-	hws[IMX8MP_CLK_PDM_ROOT] = imx_clk_hw_gate2_shared2("pdm_root", "pdm", ccm_base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_DRAM_CORE] = imx_clk_hw_mux2_flags("dram_core_clk", base + 0x9800, 24, 1, imx8mp_dram_core_sels, ARRAY_SIZE(imx8mp_dram_core_sels), CLK_IS_CRITICAL);
+
+	hws[IMX8MP_CLK_DRAM1_ROOT] = imx_clk_hw_gate4_flags("dram1_root_clk", "dram_core_clk", base + 0x4050, 0, CLK_IS_CRITICAL);
+	hws[IMX8MP_CLK_ECSPI1_ROOT] = imx_clk_hw_gate4("ecspi1_root_clk", "ecspi1", base + 0x4070, 0);
+	hws[IMX8MP_CLK_ECSPI2_ROOT] = imx_clk_hw_gate4("ecspi2_root_clk", "ecspi2", base + 0x4080, 0);
+	hws[IMX8MP_CLK_ECSPI3_ROOT] = imx_clk_hw_gate4("ecspi3_root_clk", "ecspi3", base + 0x4090, 0);
+	hws[IMX8MP_CLK_ENET1_ROOT] = imx_clk_hw_gate4("enet1_root_clk", "enet_axi", base + 0x40a0, 0);
+	hws[IMX8MP_CLK_GPIO1_ROOT] = imx_clk_hw_gate4("gpio1_root_clk", "ipg_root", base + 0x40b0, 0);
+	hws[IMX8MP_CLK_GPIO2_ROOT] = imx_clk_hw_gate4("gpio2_root_clk", "ipg_root", base + 0x40c0, 0);
+	hws[IMX8MP_CLK_GPIO3_ROOT] = imx_clk_hw_gate4("gpio3_root_clk", "ipg_root", base + 0x40d0, 0);
+	hws[IMX8MP_CLK_GPIO4_ROOT] = imx_clk_hw_gate4("gpio4_root_clk", "ipg_root", base + 0x40e0, 0);
+	hws[IMX8MP_CLK_GPIO5_ROOT] = imx_clk_hw_gate4("gpio5_root_clk", "ipg_root", base + 0x40f0, 0);
+	hws[IMX8MP_CLK_GPT1_ROOT] = imx_clk_hw_gate4("gpt1_root_clk", "gpt1", base + 0x4100, 0);
+	hws[IMX8MP_CLK_GPT2_ROOT] = imx_clk_hw_gate4("gpt2_root_clk", "gpt2", base + 0x4110, 0);
+	hws[IMX8MP_CLK_GPT3_ROOT] = imx_clk_hw_gate4("gpt3_root_clk", "gpt3", base + 0x4120, 0);
+	hws[IMX8MP_CLK_GPT4_ROOT] = imx_clk_hw_gate4("gpt4_root_clk", "gpt4", base + 0x4130, 0);
+	hws[IMX8MP_CLK_GPT5_ROOT] = imx_clk_hw_gate4("gpt5_root_clk", "gpt5", base + 0x4140, 0);
+	hws[IMX8MP_CLK_GPT6_ROOT] = imx_clk_hw_gate4("gpt6_root_clk", "gpt6", base + 0x4150, 0);
+	hws[IMX8MP_CLK_I2C1_ROOT] = imx_clk_hw_gate4("i2c1_root_clk", "i2c1", base + 0x4170, 0);
+	hws[IMX8MP_CLK_I2C2_ROOT] = imx_clk_hw_gate4("i2c2_root_clk", "i2c2", base + 0x4180, 0);
+	hws[IMX8MP_CLK_I2C3_ROOT] = imx_clk_hw_gate4("i2c3_root_clk", "i2c3", base + 0x4190, 0);
+	hws[IMX8MP_CLK_I2C4_ROOT] = imx_clk_hw_gate4("i2c4_root_clk", "i2c4", base + 0x41a0, 0);
+	hws[IMX8MP_CLK_MU_ROOT] = imx_clk_hw_gate4("mu_root_clk", "ipg_root", base + 0x4210, 0);
+	hws[IMX8MP_CLK_OCOTP_ROOT] = imx_clk_hw_gate4("ocotp_root_clk", "ipg_root", base + 0x4220, 0);
+	hws[IMX8MP_CLK_PCIE_ROOT] = imx_clk_hw_gate4("pcie_root_clk", "pcie_aux", base + 0x4250, 0);
+	hws[IMX8MP_CLK_PWM1_ROOT] = imx_clk_hw_gate4("pwm1_root_clk", "pwm1", base + 0x4280, 0);
+	hws[IMX8MP_CLK_PWM2_ROOT] = imx_clk_hw_gate4("pwm2_root_clk", "pwm2", base + 0x4290, 0);
+	hws[IMX8MP_CLK_PWM3_ROOT] = imx_clk_hw_gate4("pwm3_root_clk", "pwm3", base + 0x42a0, 0);
+	hws[IMX8MP_CLK_PWM4_ROOT] = imx_clk_hw_gate4("pwm4_root_clk", "pwm4", base + 0x42b0, 0);
+	hws[IMX8MP_CLK_QOS_ROOT] = imx_clk_hw_gate4("qos_root_clk", "ipg_root", base + 0x42c0, 0);
+	hws[IMX8MP_CLK_QOS_ENET_ROOT] = imx_clk_hw_gate4("qos_enet_root_clk", "ipg_root", base + 0x42e0, 0);
+	hws[IMX8MP_CLK_QSPI_ROOT] = imx_clk_hw_gate4("qspi_root_clk", "qspi", base + 0x42f0, 0);
+	hws[IMX8MP_CLK_NAND_ROOT] = imx_clk_hw_gate2_shared2("nand_root_clk", "nand", base + 0x4300, 0, &share_count_nand);
+	hws[IMX8MP_CLK_NAND_USDHC_BUS_RAWNAND_CLK] = imx_clk_hw_gate2_shared2("nand_usdhc_rawnand_clk", "nand_usdhc_bus", base + 0x4300, 0, &share_count_nand);
+	hws[IMX8MP_CLK_I2C5_ROOT] = imx_clk_hw_gate2("i2c5_root_clk", "i2c5", base + 0x4330, 0);
+	hws[IMX8MP_CLK_I2C6_ROOT] = imx_clk_hw_gate2("i2c6_root_clk", "i2c6", base + 0x4340, 0);
+	hws[IMX8MP_CLK_CAN1_ROOT] = imx_clk_hw_gate2("can1_root_clk", "can1", base + 0x4350, 0);
+	hws[IMX8MP_CLK_CAN2_ROOT] = imx_clk_hw_gate2("can2_root_clk", "can2", base + 0x4360, 0);
+	hws[IMX8MP_CLK_SDMA1_ROOT] = imx_clk_hw_gate4("sdma1_root_clk", "ipg_root", base + 0x43a0, 0);
+	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", base + 0x4400, 0);
+	hws[IMX8MP_CLK_ENET_QOS_ROOT] = imx_clk_hw_gate4("enet_qos_root_clk", "sim_enet_root_clk", base + 0x43b0, 0);
+	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", base + 0x4450, 0);
+	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", base + 0x4460, 0);
+	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
+	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
+	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
+	hws[IMX8MP_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", base + 0x44c0, 0);
+	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate2_shared2("usb_root_clk", "hsio_axi", base + 0x44d0, 0, &share_count_usb);
+	hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", base + 0x44d0, 0, &share_count_usb);
+	hws[IMX8MP_CLK_USB_PHY_ROOT] = imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", base + 0x44f0, 0);
+	hws[IMX8MP_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", base + 0x4510, 0);
+	hws[IMX8MP_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", base + 0x4520, 0);
+	hws[IMX8MP_CLK_WDOG1_ROOT] = imx_clk_hw_gate4("wdog1_root_clk", "wdog", base + 0x4530, 0);
+	hws[IMX8MP_CLK_WDOG2_ROOT] = imx_clk_hw_gate4("wdog2_root_clk", "wdog", base + 0x4540, 0);
+	hws[IMX8MP_CLK_WDOG3_ROOT] = imx_clk_hw_gate4("wdog3_root_clk", "wdog", base + 0x4550, 0);
+	hws[IMX8MP_CLK_VPU_G1_ROOT] = imx_clk_hw_gate4("vpu_g1_root_clk", "vpu_g1", base + 0x4560, 0);
+	hws[IMX8MP_CLK_GPU_ROOT] = imx_clk_hw_gate4("gpu_root_clk", "gpu_axi", base + 0x4570, 0);
+	hws[IMX8MP_CLK_VPU_VC8KE_ROOT] = imx_clk_hw_gate4("vpu_vc8ke_root_clk", "vpu_vc8000e", base + 0x4590, 0);
+	hws[IMX8MP_CLK_VPU_G2_ROOT] = imx_clk_hw_gate4("vpu_g2_root_clk", "vpu_g2", base + 0x45a0, 0);
+	hws[IMX8MP_CLK_NPU_ROOT] = imx_clk_hw_gate4("npu_root_clk", "ml_core", base + 0x45b0, 0);
+	hws[IMX8MP_CLK_HSIO_ROOT] = imx_clk_hw_gate4("hsio_root_clk", "ipg_root", base + 0x45c0, 0);
+	hws[IMX8MP_CLK_MEDIA_APB_ROOT] = imx_clk_hw_gate2_shared2("media_apb_root_clk", "media_apb", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_AXI_ROOT] = imx_clk_hw_gate2_shared2("media_axi_root_clk", "media_axi", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam1_pix_root_clk", "media_cam1_pix", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_LDB_ROOT] = imx_clk_hw_gate2_shared2("media_ldb_root_clk", "media_ldb", base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", base + 0x45d0, 0, &share_count_media);
+
+	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", base + 0x45e0, 0);
+	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", base + 0x45f0, 0);
+	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", base + 0x4620, 0);
+	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", base + 0x4630, 0);
+
+	hws[IMX8MP_CLK_AUDIO_AHB_ROOT] = imx_clk_hw_gate2_shared2("audio_ahb_root", "audio_ahb", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_AUDIO_AXI_ROOT] = imx_clk_hw_gate2_shared2("audio_axi_root", "audio_axi", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI1_ROOT] = imx_clk_hw_gate2_shared2("sai1_root", "sai1", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI2_ROOT] = imx_clk_hw_gate2_shared2("sai2_root", "sai2", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI3_ROOT] = imx_clk_hw_gate2_shared2("sai3_root", "sai3", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI5_ROOT] = imx_clk_hw_gate2_shared2("sai5_root", "sai5", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root", "sai6", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_SAI7_ROOT] = imx_clk_hw_gate2_shared2("sai7_root", "sai7", base + 0x4650, 0, &share_count_audio);
+	hws[IMX8MP_CLK_PDM_ROOT] = imx_clk_hw_gate2_shared2("pdm_root", "pdm", base + 0x4650, 0, &share_count_audio);
 
 	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
 					     hws[IMX8MP_CLK_A53_CORE]->clk,
-- 
2.43.0

