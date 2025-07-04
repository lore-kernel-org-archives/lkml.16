Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694F1C6FE5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639019; cv=none; b=MXxIf0fYAHqfbC3V+PnyNLxgveOQbwhXBjfFD3Ty6bRAM8YTknyt0MjWpPylE3nFRBAOXonnelD8hE6+wT2LGuWDBfd4riyK5BvdPeiLylN+CO6mFr8AUanSuBBjgW9Vg3HcENrCXQBLRVWjPGW5fPJPwc2E6FcIP5NvIuA9zLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639019; c=relaxed/simple;
	bh=8sYhNaN38EHYkWe3bEuWzUjVjIIOeXzTqoc/06h5PwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=It8zs91aR+o7C1J3UWM1m7ZS+6vxwEm5yU3xknECl+FQWP7OLzlCJZCITmfnLy/TwwoI8g5BSz3dRLHMl4m3eFZ1MTqGUbFRiJ9eVA8tglMF0eQsAjHD4IB40s0+lMg2fo+CyuoUfEHnQMMyiDGIxFnY3li0Xbxbdi9RmK8PdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JZJF4BAX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JZJF4BAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639014;
	bh=8sYhNaN38EHYkWe3bEuWzUjVjIIOeXzTqoc/06h5PwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JZJF4BAXtj4R+gGhzEZ7dWadrqTRB+/66ebIzjlSJPPsUXaWW3JHqYmKCOs4uIo72
	 e8B4Am2vRlB88Z3KnYyKOt7Zs/RtF/zVKIZD+XqsoIE9V8j3WzvGThUYP3c574XJUh
	 Fx3z36bZvk8DRgcwLUPaVjsMzWhJoflZR7IePFOhA0z+LDloNwqeeyF6VivRRCdjSb
	 VgZqDFmKnNdezFJ/+GMwoqEZ/Zw8U6vC2gG36OumgF2QzhbhGArLEM3FgFyde5sAgJ
	 IbkwsZwastcLCLNHwZWH+4QxdJR2uEtPLOwkLEoA7MGhuVNPp+39HUOAL7YmuzL8k6
	 HuiM4HtqkTCUw==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 880E917E0EB8;
	Fri,  4 Jul 2025 16:23:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:25 +0300
Subject: [PATCH 4/5] drm/bridge: dw-hdmi-qp: Fixup timer base setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-4-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
value as initially found in vendor driver code supporting the RK3588
SoC.  As a matter of fact the value matches the rate of the HDMI TX
reference clock, which is roughly 428.57 MHz.

However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, and
the incorrect register configuration breaks CEC functionality.

Set the timer base according to the actual reference clock rate.  While
at it, also drop the unnecessary empty lines in dw_hdmi_qp_init_hw().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index cfe8171b2183874517f583f284f7728fe1613c91..5d252800168aa4f3c10f458631795de8912e29d4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -161,6 +161,7 @@ struct dw_hdmi_qp {
 		void *data;
 	} phy;
 
+	unsigned long ref_clk_rate;
 	struct regmap *regm;
 
 	unsigned long tmds_char_rate;
@@ -1222,13 +1223,11 @@ static void dw_hdmi_qp_init_hw(struct dw_hdmi_qp *hdmi)
 {
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_0_INT_MASK_N);
 	dw_hdmi_qp_write(hdmi, 0, MAINUNIT_1_INT_MASK_N);
-	dw_hdmi_qp_write(hdmi, 428571429, TIMER_BASE_CONFIG0);
+	dw_hdmi_qp_write(hdmi, hdmi->ref_clk_rate, TIMER_BASE_CONFIG0);
 
 	/* Software reset */
 	dw_hdmi_qp_write(hdmi, 0x01, I2CM_CONTROL0);
-
 	dw_hdmi_qp_write(hdmi, 0x085c085c, I2CM_FM_SCL_CONFIG0);
-
 	dw_hdmi_qp_mod(hdmi, 0, I2CM_FM_EN, I2CM_INTERFACE_CONTROL0);
 
 	/* Clear DONE and ERROR interrupts */
@@ -1254,6 +1253,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 		return ERR_PTR(-ENODEV);
 	}
 
+	if (!plat_data->ref_clk_rate) {
+		dev_err(dev, "Missing ref_clk rate\n");
+		return ERR_PTR(-ENODEV);
+	}
+
 	hdmi = devm_drm_bridge_alloc(dev, struct dw_hdmi_qp, bridge,
 				     &dw_hdmi_qp_bridge_funcs);
 	if (IS_ERR(hdmi))
@@ -1273,6 +1277,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 
 	hdmi->phy.ops = plat_data->phy_ops;
 	hdmi->phy.data = plat_data->phy_data;
+	hdmi->ref_clk_rate = plat_data->ref_clk_rate;
 
 	dw_hdmi_qp_init_hw(hdmi);
 

-- 
2.50.0

