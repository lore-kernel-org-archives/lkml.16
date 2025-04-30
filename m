Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55D27A442
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018114; cv=none; b=UECLnpDwAPacmdsg8D4tdfgAOVuGqItQuFLyfQiCqagth6kMX+aSl3pVJOOmAmC/dBrZLv6P3HWKAC+nol2AWjlVladWIlaOJDpwY8QE87IxGt130Cv+vIc1qzwl0WugH/YmtZ+Fz3dKQDGuxzG2twP0xx2udZ3/tyb63e1vXIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018114; c=relaxed/simple;
	bh=LWKvFKR9QlB4OTW+91EARrqtQWYR6dhCSgt/uY9otco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Be2VCOML+qoxPpe/8mOh98tOCEPim4+ErSwuSFv21OaWDN8NFZcv/1rp3IfpyhAbq3wN+zwxnocLbsHXYmhMb62G1c+J+Rgv4fNTHzQFxDj8OrGiPHaTGZ/hSctlbNYpEPWiLUk9cn6QKdoqxxXfzVz7TL3wsJRF/szdIchf6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RervcQFC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RervcQFC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391324ef4a0so401880f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018110; x=1746622910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//xy9QvnyX1PGlT+X1puTcYwWLZzXpvuw0D5LtNENts=;
        b=RervcQFCQYRgKSbZe9tnMkvzW9fX3RNWtArc4hUxuQuMo2cdiDHJJebVhgR/cAsuHk
         ndALg3kUWBLAru2znul3AqsTTO489VrcZi39mly0akxUxi0Clhvi931WG2mGPiGDu/hz
         ax71geoRaDWHK/w4QhQq/rjThrz95KTkdnPAiHNdY8hhyYIhuEOdCiqjEz0pbKq6ZeTf
         f2HagGIQCjsgsQwdt0uUPKyZHo17r+cFKqTyLCsutNa4nSejawIw8BzJ9XXglFZ87M7F
         eQJEk0tSfjgOs3EePRDFPkTtIszfiA4dMcF1BWSIJm7OBDcOQqLS3t6tE4dKe8I10ZmS
         gL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018110; x=1746622910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//xy9QvnyX1PGlT+X1puTcYwWLZzXpvuw0D5LtNENts=;
        b=EhnITMHRrFdLE95QUQl8m/W2DA1S8Y+dQx0bu+ul1XTh/csH6gT5FVJ1L1rCvEZAzH
         ZeViokcU9zsQtbEhti05ydcVwBff3pnSAaIANZAyZfMTKk9nT5Qh6inVVe7yoP3LrbHB
         mIlz5prkKh3xltE1NemFWLCZQtCB//PqTRHYl2oW97YBUJZMZ3DWOl63fTlZo8jFB9St
         vfuJIjjffJT5urM8p3+zvknccLcrwunvL2TeKHG+aVQBZOl2N9v53WxCU+/TFKRixIzi
         8bIX/64ojPnK5CP0bxHB86QHTAFMRcnMQb11Dvza2ZxR1mQUEwN9BpTsyXV0OgAunfcz
         VhfA==
X-Forwarded-Encrypted: i=1; AJvYcCWkWI4yG3rspLAJyI1o7sEK2/jgXDHWtxGCibrKBnIqoQLBWrCPF6rdCCJo05SdgXGi5rTu6jncSzhUFFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlCEog9DJYeucTtJ8HKK/+AUgH+3aAmeDpXW73gYj7f2ma+1w3
	4GgLTsHtqkLqSlq2VyxXXf+mfaQHW5SruqiGIvBTvJCCcypz2dzZfMV+RSk+tHw=
X-Gm-Gg: ASbGnctWFzNZf1yrjlO9ONvPg43YcCl2w+FexPBL/CTOu1HMX9L9nnKZvL2pKS7l19g
	SM7z4Uhk6V7sBycPY5QKe9rVcrit/693/4H7kIAsRpblhzf/bwmEiqi4xYVa81qHTn5h//8mUOE
	77gZVZ4qyqjJ/rOJAkz1kRjNDchgR0Zdp+ep3WE1ZWfn0uuBKeRAZYANv7aIZEwCCkCOT9EVpgx
	H490ndNOyG29J6QEVUOz51NxbH7pjreHwbxLH6OT8KHjJd4yZFRRWBoa37EgYQTgBioHw0O3Up3
	NxCMi6qboTeYngcETZ+9js021EJlz0a7xVZIvfjatv11XykHG3JtYTSNEGo=
X-Google-Smtp-Source: AGHT+IH8+72FvP1/XPS4IvjSawq2CiOZfJ5maP6pKNlkLjVD403H+B6cWb7fwPAzTvHtCjOIQ+FPkA==
X-Received: by 2002:a5d:64e2:0:b0:3a0:7e4a:f13a with SMTP id ffacd0b85a97d-3a091b56802mr123221f8f.6.1746018109373;
        Wed, 30 Apr 2025 06:01:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:49 +0200
Subject: [PATCH v5 19/24] drm/msm/dsi: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-19-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7864;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LWKvFKR9QlB4OTW+91EARrqtQWYR6dhCSgt/uY9otco=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8JqjCa0FC+DMNBUp4CJXo2eN0CyVUqdUjT/
 n5cLnaSGTGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfCQAKCRDBN2bmhouD
 18e2D/9QFJpWj/iQGjt7z2MYXmLMZmy2GW93XQ04QuxBKRZWuuI2zOuFNXChRCZmDayusFyQl6b
 F6OAanEoie6Id4cuxb7D5JGCC4qVpwZn+FfY71BYOuYPwHKRQt0YcK8HJrqHy075JVjaZ4BvIg1
 5kLBAcjHZeCObu/2/zVPZMLqKU5jhzjooNMG993IsMjWd80anBZux6wtLlGyztSLjN2ZdnPSv+j
 2UMcgwaCzkpcOpQAASar3o/wUTpB76/G9Lhn9TOBq6vF51znTUbRtQH3xL7b0qWBo2ljGFzklta
 yKhbk/JsqNr9XDYAL3tQ7tnm8JlT6kAMrfK15rH2meBWwR4dK5Z2CWaj8JOaqboopdtFAFYZr6D
 eKAh3jVWRS63XyN5kDzpS2nbUVqeGym8wQ1YsNKNPe7tnjv8KQqSHoo/8F6hAHQ5Aznr6q0gYWR
 p6Au4bHfyOfQytIgARC3FUvhHarbnCbO+qygIzETb455eUDJhVpPEGoHdgK1ze/zKg/94qb3StI
 nLZ/vPqL99UMhgN6FENnV0U+9G49Vqzo+HAytsf37dQafQ0aTCXbrMMYuGHSA0oCdswDrscSN1y
 GBktGdpj+P5ariBvxGOZBjBj+ZHEe0A3hdUZAsJTgrINMT8GG1XuQspBgm3BzwE2Kkq9fZPeKfs
 RGZPmiwQw9zJQ9w==
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

Changes in v5:
1. Only reparent byte and pixel clocks while PLLs is prepared. Setting
   rate works fine with earlier DISP CC patch for enabling their parents
   during rate change.

Changes in v3:
1. Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.

SM8750 DSI PHY also needs Dmitry's patch:
https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
(or some other way of correct early setting of the DSI PHY PLL rate)
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 14 +++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 81 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)

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
index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..7f8a8de0897a579a525b466fd01bbcd95454c614 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -257,6 +257,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
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
@@ -300,6 +312,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -30,6 +30,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
+#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4d75529c0e858160761f5eb55db65e5d7565c27b..694ed95897d49c477726a2b0bec1099e75a3ce21 100644
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
@@ -370,6 +411,46 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
+int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	int ret;
+
+	/*
+	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
+	 * setting the rates of pixel/byte clocks.
+	 */
+	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
+		goto out_disable_byte_clk;
+	}
+
+	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
+
+	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
+	if (ret)
+		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
+
+	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
+	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
+
+	return dsi_link_clk_set_rate_6g(msm_host);
+
+out_disable_byte_clk:
+	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
+
+	return ret;
+}
+
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;

-- 
2.45.2

