Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E82C2D3A8C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564396; cv=none; b=o9InLHyhbJ+OCYla2haiwS7oWcG3fVLscO/K9pFhfU2wHU8v/FAWHiJ3xAbMgijYxQygZ0VbmbO6BqU6z08WQiQRhuEfaLtXk1GCr/fa0qcldFGRzcfkgtKNzZdPz0L4J/dNf6Vxx3TQ1zdCdgfWP2k23XiDQXrqKW/Kue7v26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564396; c=relaxed/simple;
	bh=RVRVpDpk5e02GBpHtLhC0zusFHyQp8dYyvMNvbXaCMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E8HN7j1YnsWmx/i+3to6QYG0LxWy0f73p4RSzyGV+pW3+j0eJW4VCNZv1v8gbaeZQtgkg2j+Ng01+yKCxkulgsF/vLWzFkKTxwnZ2S3oSP2XLubgIV4lo6coWc4/NXkOt0x3JrL7jfwoPrC+/1mFCuTmRZa2GhAfOu4M9zAKLRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YoP3byUl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YoP3byUl"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso482471f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564393; x=1750169193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7Xnhdm6O067a6DKPfqxzqYdx8kufZxaDc0SclDxluo=;
        b=YoP3byUlZhmSyyIFNFKGjlwQgdNR1QIrOBtVL3vJQMDRSwA4oxfbCgYwqftUAE0uGW
         mhJrzPx1jUPH2FmPDaHXW21NPUGf0sf8BPTZqjcmCtZF/0yxbnNeOFv+8cfXaLRMzSkq
         H+ciiNSOtMGvT0SQZe03yTpN+n5RBOYEA60+CM+vHwdJBhcaEBfRs/1WxQ3PGZPI6isa
         aXAMGipzdkvurvJLKO7QtgaqTyVc9YBR2HwRr4X5bPzlX9AxHXkk+4ntkTbXEQZAhQSb
         vSnuKxtLWJN05lGvYfgrrLnfinIIaEPfHmmuRUHvVvQKE0Orr1Al23hv3r08id8JEb4B
         40eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564393; x=1750169193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7Xnhdm6O067a6DKPfqxzqYdx8kufZxaDc0SclDxluo=;
        b=r1T0iOBmvrEtwBr1fZRDA0JFzqeXWjsMf5Pyh0pBSK/CB27S7oFTrpGiK9ifkQ3WYp
         +WTWPx3gsJ7Q7NAkC0mekLeA5uYqCszs1vDkKvEl4EnEWZ+DxGI3hcVshRRjXol3BNsE
         i615K7bBulNBRddefBStwzXbuukVWPZjjXdO6e0RMYB7etUUV4OfOW5Q8iaCSZRnXfZw
         0+rBWxvwc1syzs2SJ42nZcpHUs8TVR529Doo5SAAIdQhP76rYtf9h81pwz+rcpp/rCaj
         kuYQEAmBa0Qbg8FVw/9JIP0CSz0PXwEV9xfQq9/NdjMoe+Ea+AotnoLxD1+JyFgGrudC
         CRWA==
X-Forwarded-Encrypted: i=1; AJvYcCX8BHZUGfdpQ9QSZI8PCoFIh58/PHrnC88rbQYfFYSOfeKbwBLAkp6hi+246YkeXN8iBThm0pODvspZ++E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBvInQTPag9aKd3RlZbzvFVX+fZdHFwT7pJ1Fb9YybA1iq6mU
	imLDFskd/+B4GLcTswlLU6k5Z0zugtmXQN+dakMu8TW5WW85s0NyzdhHFwxotws1tTY=
X-Gm-Gg: ASbGncuvkiHuUurO0/fPCh1TLkQuZocEGPqGtDrVdeMrnp1J1dJTZkjVrW+K2Ouxviu
	LZPBrGjT/8roUJGK6xpfHo484lJrLs9qqoWqSQP9GjBlci15lmXUeUTe8hOkpp8c7xA8fAZ2q9c
	tWD+GEbKQvP2Lkm0m1v6F3zBvR+CPAyzP/fcgxhq6V6HVuk+ndf+yHl/LPHEoti7beXI/D36OC5
	s0nwy6mY+vlSD2bBGAAAMBAi5v/U1aUVK8GIwMuLlzJfqcmd62nkxK9ZHzeOs5uoprga28ycJRc
	USS/AGxT69K0YA0h5B47grbxz9IkamMXz++NIwoTte5tMaaA4v59hTlCommI2GSjMzALRfitxbB
	4NjMfnQ==
X-Google-Smtp-Source: AGHT+IGOYy6gNJvwDYDuWTcTmfKk+w0ICVA8j4N6n4/MeNFl8oHxLLgNUbYgeuEtyugbX6DHbnBWOg==
X-Received: by 2002:a05:6000:4284:b0:3a3:6a3f:bc61 with SMTP id ffacd0b85a97d-3a533169e7bmr4838341f8f.7.1749564392604;
        Tue, 10 Jun 2025 07:06:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:49 +0200
Subject: [PATCH v6 11/17] drm/msm/dsi: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-11-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7262;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVRVpDpk5e02GBpHtLhC0zusFHyQp8dYyvMNvbXaCMM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvIDUbJ5ORF7joqZD6O3hJp706AO4TzyryqB
 Qv3Jjc6uAeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7yAAKCRDBN2bmhouD
 16wDD/9s8xESUj9eoTpTjqRpca/XfYi7KbfOZtPrPIeYYQ1YnnFV+zuM5K7ewyqr+G8XfEzZXTb
 zSHXvou4p0civOltuE1swZk5662u1xGLHHlGxjyoJkQsUrnqiqrTVclnENvnyMgi9fZDjAmMV9I
 WV+OtZRCCTodmNM+toiRT84FF1PUkZY+16rztGcqTWCQge9UndUk3OEyevR4l/JTNHSjLDbB0FO
 4w3kvULr8KJxOC9zrp/VutF5AnkrkQWkDaJkCpUMRs2h4QNtwm+97aE4a+L2nA5xmgImzkcebjI
 O9sufazjN8voiYDZiEh5GsMLzPD/t+hh7khpZRhCZRE+q6WXJwoPYS1ZPJ8saEe1rU3pCQlzL9+
 73bIU9XySDDIcf87HbAl5a68uC+JM/+v/MunYVUuNzE9bV+RIrErO7uLC3bNKJMPF0Emo3kbPaj
 oeWj8b2Y2ir5SUhRXwZY/3aH6rj9UUSSu3JHIML7D+KyqsLnBgh/Pd5baYlnYpqYzCGRQrarmtb
 lG+XPBXXFTD0XbMx5Q9YL1sBjWqZdx1MPqoMIYkaDSQNPHiRBWH5RR+zHWeEvQqmwdzJ2rDPXFk
 QPp6iQpO4PXKzPCF0XQi03+0EiPpvddddvEZRzp/aj3B22WVO1ou0LmzDmR4Se+vLEXCfNqrcNE
 mBeGqf57qzHnytw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for DSI on Qualcomm SM8750 SoC with notable difference:

DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
parents before DSI PHY is configured, the PLLs are prepared and their
initial rate is set.  Therefore assigned-clock-parents are not working
here and driver is responsible for reparenting clocks with proper
procedure: see dsi_clk_init_6g_v2_9().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
1. Drop redundant parent clock enable, because this was fixed in the
   DISP CC clock controller driver.

Changes in v5:
1. Only reparent byte and pixel clocks while PLLs is prepared. Setting
   rate works fine with earlier DISP CC patch for enabling their parents
   during rate change.

Changes in v3:
1. Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 14 +++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 61 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
 int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
 int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
@@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
 int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7675558ae2e5293ff2f239e8b19154f2a5c86957..fed8e9b67011cac1f766a5bc47bd5117304ab0fd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -273,6 +273,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
 	.calc_clk_rate = dsi_calc_clk_rate_6g,
 };
 
+static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
+	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
+	.link_clk_enable = dsi_link_clk_enable_6g,
+	.link_clk_disable = dsi_link_clk_disable_6g,
+	.clk_init_ver = dsi_clk_init_6g_v2_9,
+	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
+	.tx_buf_get = dsi_tx_buf_get_6g,
+	.tx_buf_put = dsi_tx_buf_put_6g,
+	.dma_base_get = dsi_dma_base_get_6g,
+	.calc_clk_rate = dsi_calc_clk_rate_6g,
+};
+
 static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
@@ -318,6 +330,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 65b0705fac0eeb1b7d7b001576215b8578c67e25..38f303f2ed04c37916c9aca148ccb569e816e35f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -31,6 +31,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
+#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d75529c0e858160761f5eb55db65e5d7565c27b..6400f72a66f0af2ffd8900a9cc3c8fa3f79b626c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -119,6 +119,15 @@ struct msm_dsi_host {
 	struct clk *pixel_clk;
 	struct clk *byte_intf_clk;
 
+	/*
+	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
+	 * PLL:
+	 */
+	struct clk *byte_src_clk;
+	struct clk *pixel_src_clk;
+	struct clk *dsi_pll_byte_clk;
+	struct clk *dsi_pll_pixel_clk;
+
 	unsigned long byte_clk_rate;
 	unsigned long byte_intf_clk_rate;
 	unsigned long pixel_clk_rate;
@@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
 	return ret;
 }
 
+int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	ret = dsi_clk_init_6g_v2(msm_host);
+	if (ret)
+		return ret;
+
+	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
+	if (IS_ERR(msm_host->byte_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
+				     "can't get byte_src clock\n");
+
+	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
+	if (IS_ERR(msm_host->dsi_pll_byte_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
+				     "can't get dsi_pll_byte clock\n");
+
+	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
+	if (IS_ERR(msm_host->pixel_src_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
+				     "can't get pixel_src clock\n");
+
+	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
+	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
+		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
+				     "can't get dsi_pll_pixel clock\n");
+
+	return 0;
+}
+
 static int dsi_clk_init(struct msm_dsi_host *msm_host)
 {
 	struct platform_device *pdev = msm_host->pdev;
@@ -370,6 +411,26 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	/*
+	 * DSI PHY PLLs have to be enabled to allow reparenting to them, so
+	 * cannot use assigned-clock-parents.
+	 */
+	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
+
+	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
+
+	return dsi_link_clk_set_rate_6g(msm_host);
+}
+
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;

-- 
2.45.2

