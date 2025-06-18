Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5492EE276
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257216; cv=none; b=UY0E/gzTnA0oCTCOFh/4rjAppfZ7Eb8vGd6qC3jB/kxBCoeSgGLsfYy0cEB98PuKPEmX2zpt5OquZsBUF4LpdeiuSjtAmdKN7zkJEHx7QuBM0c2vYp4iygJprdw8h4S/zOthZ2uusxw1J5nL7Vs963adp/03Cw2nJ6FZBUvGPXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257216; c=relaxed/simple;
	bh=Q85xp91wI2inr8+WDuEameiNkz82ALjbfCr+2Lxkxp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/nSfvjueKGHIZafKb+mkDzWsNDHW2JGs44sGfM3ORmEwT4uMwnE83UYbVMBvSDxMdBrKEKwVRTM19p66gKD4PDuAF2YLR+PvRn8AWIBqR3HGLzPZA/R2WIyT8p88ZnY4U6wo4qOClMvMiNeYgQjArYEeviS1dlRothVunXw8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBeBGNG5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBeBGNG5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade6ef7e72fso104932266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257210; x=1750862010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2opTb6yLZkFbd2RdPCFbOWTCnxieTWZuLqpEyRBvhr0=;
        b=fBeBGNG58g1pXwoBsx0ka3OM5Neb2d2kHR/5ubBwDKwOEkYAtnhGkUzYVQfQoqDF1s
         IopUw4LfbBm97Qs93tO7VQACMED6z1hIWTiC6ciBSiGI73qrHAVeX/WiUyZVK7a/1Njx
         fcNeur1/2EJGu3oN/YGGhseNSxSQTlN4gO0vk23guvjH703PvJxugFfbX6llgJBxbgmw
         4hAjw++GEeUz0ziVEdaBvh7/KDVm18BlMqUlGa7VHdLfR13I40MC5UNEpUYxe+hwXlUT
         MYHidELT3A8HPsxSkoQO2wWFnMlZ7hUXgS7fFgajEWpyZGVl/pHpkhqdvLCdUH3l0rqL
         1mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257210; x=1750862010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2opTb6yLZkFbd2RdPCFbOWTCnxieTWZuLqpEyRBvhr0=;
        b=rxU5ocfmZjjPrB4GMzli832VhjSteR/2ffHtvYGtSQkzUXi0citmoiP0l6CXQiOr5B
         eXl2Ze5GPZP0W57Y24CPF41RJSvSkF/pEkOFE3afLNUgkhx9R+aRuoaKoDEgBb784YBv
         9/NlKI0p8pOzZjaxe46TdxYPB2EdK769LX1cTzCdmchC/0Hv/QkpU/3kzf227Ik1AwcB
         24/TbncoO2xNb5Dwc3nTe+gLVEFNzGhUbmctBGCEpMhXMvabFhMhpnsJYsUd1x2J9J3a
         pDOqtt11UK/9xtHjo9ZUHR7gK/+f5wJByhc7BhHOp4f7gwWXZIiSQT0XRr/BsIgeKF9i
         cHew==
X-Forwarded-Encrypted: i=1; AJvYcCXD2uPR1FQBga9f/T9S17lwdwKIGCFZTr0nUWa6aSgwHMnWez6JUtHwkaCt0bqQ1ZBpByP4iTJg38yp09o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeYXisz0JCGLzXb7n+uTpuDTVIqM70N3MVbvQd5iFPwxCf/9U
	G2+oRM0nFJRo7iVnntP2S0SbXDki84hCs8njlFFKg2zEn69h8nj+k65f4gnvWhinxCU=
X-Gm-Gg: ASbGncslPdjvUk6+/bZ7L5l8h7Ak7VdQFH0KbG+iFK9UHU7Ft1tcM1gWjybosRmnPmc
	JGQoMMJ9hYNGt0TnbOPq5lhaW0qbl7x16h1wZlkCXyMqYTyNc/vqn4NSoepdQ7+UWQdkDPJda8q
	DNFuGMkdO87HnjNdtkVh5EEboWk5lYyDINDMCJtxk/OYkpoAVjpd/o3rAZ2FYgc5f+tP9RPqtFg
	ywZgz2l93WzHxrJuzjuZUidH5HuZ/tAU7tKHJDR1CwkHYVc8PzBMRrDq5D4WmRFDD7QGhh89ZN3
	7yGqoMOUZz/uGoedAZsDU2SM4oU+4siTk9j4j1GiIhKfVfinDnwUDEXUbiHS7y+cWBjpsxmy1Uh
	0hc2uR6s=
X-Google-Smtp-Source: AGHT+IFYaSefk15JOEyjxr5iIvrUNKdw/7Ynr0R+jV7CeFd67D+s3f8zmbFZdHfw8jcxc/mo7ubrlA==
X-Received: by 2002:a17:907:97ce:b0:ad8:9207:b436 with SMTP id a640c23a62f3a-adffad16db6mr284539166b.5.1750257209711;
        Wed, 18 Jun 2025 07:33:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:36 +0200
Subject: [PATCH v7 07/13] drm/msm/dsi: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-7-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7327;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Q85xp91wI2inr8+WDuEameiNkz82ALjbfCr+2Lxkxp0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4fQR/u43KztTnfoDmqvE2xDMbBUERVrDArv
 oQCbMsZQf+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHwAKCRDBN2bmhouD
 19RTEACIGA2NDrR+OLSllRVNyPhxA/rjQwZj9qrh2v1LyvJ7CaU86Q6ZRmiRz61UZAUH7b+R9FA
 xNB3fsULxjTgd+DxoOs6hY4QdBcstQ6VBsbGN96FzApCi70ljQdqBDrBOrGdOGpoWSYweqh1cpb
 u64mvMOTBMQltlwe8d2qw4CHUXx2qb7wKqx8MdB8mBLCcxoLuRAKeLgBK9RXgt+kpOnLOOI2o9m
 IVa9Sgb+ywi2gy8611D547xytxhES4Pl2tilJeLEiFEutAZJm98TZlG5YkHlNjEkBI6tW+o0yQE
 lBkbYXoavDWJUyG1zvr73bd0/3xFY3/qfnX1D5DakEOM158AWBE2sc6DATyCuyA2cGkEPfAjRIO
 xIf+JGNRf2U5sJzoF3AAJnJP4dsBmtZ+G96eB7LJKLDXvYsc3iXFfhLJLdUtwkjH3mAKP+TjW87
 4V9K/FBP7/w/E6zN4NypBPb1NLi/6ZF44YwNkLTi8IUMljmrGnwdSrJ4e9tVks6eAMettsYuhhe
 +xUK0OaiCJXkrosHfpSigcfNXhe0LaKyZwXyQ/BNnkJolCzwmVO832LpIHbzuMFK3kgh7oQ44Qs
 DVN7/QRS+IVANlSImXoYy9g/Lg1wN7q7ewnkaT17Jgy8FS0dT9Qqnu7yvTlr6miAePKxdrLMNFE
 lz7PZ/nzKGs723Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for DSI on Qualcomm SM8750 SoC with notable difference:

DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
parents before DSI PHY is configured, the PLLs are prepared and their
initial rate is set.  Therefore assigned-clock-parents are not working
here and driver is responsible for reparenting clocks with proper
procedure: see dsi_clk_init_6g_v2_9().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

