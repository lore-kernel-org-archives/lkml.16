Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDE1957FC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639016; cv=none; b=ENd2XBPazUiRzCwVHwWBKKIRKeGzMrCyBn/CkgWNQrSVaGMnZ+13CJobH1Dwi18/2O3mzBvxqhLSq5DRZ8u0+67IZbz45BRnqKaM6KTobeqXicjRoH9sJKCgp6apUzg6ZcvtrJ0V8aonuEGIRmIE/Es1V7/C0Ejk2ikjq9cDSmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639016; c=relaxed/simple;
	bh=ldghlCA/gMRJSmgWfHfOpqHHla57kEBIADI+qzIkLJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnB3Q9bHuX8pHqVC4pG2Tr0hgjZly3mB1xrNxfLx4DgMlWh25tUdDU7Qd0lZXQ8g+HaaM0x49qb5qNTJwpVcJ8Uh9Lgb4Dvt+NLjUM71J6cC/9grTqQAVqpFxscjmeWFroJ0mG8bEfkog0IBJkQRe5TViAjFYRGB+AmCtpjHNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j0OSfDCF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j0OSfDCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751639012;
	bh=ldghlCA/gMRJSmgWfHfOpqHHla57kEBIADI+qzIkLJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j0OSfDCFH8OfiJOhvUn9D6WUpQJvvU4qXHErh4TQF0dt4QlncVUY7xgM7zYF32CGe
	 mfHoZ8eiivxE2b/t3EDAaHeJUjaLpCVjCSUCExJypkk19O5QSBfY9d91nqPjsQ8gvE
	 jyih9f9bX3SHlnoIZkl+KLy0qTotzF4ZOI9uswffr2YhjkWxIZEpNRIpjfarVGz/lW
	 x8EkNZeZR4fGWPJ2kAM/RuxGhh1pHKxsIJwRYKRg6ZJ/76kYx8m8chW0ChJc5UzTJa
	 ZJjolJHfLo9uVPSYX5kfwLG51cJ85x6EioqsO6eLm63jQfz8818VaJEUGwQdXtaVI1
	 B6uTSDgXViuUQ==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2C9D917E090E;
	Fri,  4 Jul 2025 16:23:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 17:23:22 +0300
Subject: [PATCH 1/5] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
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

In preparation to support the CEC interface of the DesignWare HDMI QP IP
block, extend the platform data to provide the required IRQ number.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 include/drm/bridge/dw_hdmi_qp.h                | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..126e556025961e8645f3567b4d7a1c73cc2f2e7f 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -539,6 +539,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.main_irq < 0)
 		return plat_data.main_irq;
 
+	plat_data.cec_irq = platform_get_irq_byname(pdev, "cec");
+	if (plat_data.cec_irq < 0)
+		return plat_data.cec_irq;
+
 	irq = platform_get_irq_byname(pdev, "hpd");
 	if (irq < 0)
 		return irq;
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index e9be6d507ad9cdc55f5c7d6d3ef37eba41f1ce74..b4a9b739734ec7b67013b683fe6017551aa19172 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -23,6 +23,7 @@ struct dw_hdmi_qp_plat_data {
 	const struct dw_hdmi_qp_phy_ops *phy_ops;
 	void *phy_data;
 	int main_irq;
+	int cec_irq;
 };
 
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,

-- 
2.50.0

