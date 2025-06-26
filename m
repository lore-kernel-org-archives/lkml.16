Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBFB28CF45
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970513; cv=pass; b=dQ5fORXT+YQPFfU9JMlOJkVU/h7q83w4UILZ1epU4AA9resVYkTeo4Ve1h11oXOy1Io0NMLn02nwIObtu83Sch0IKNvZFORwbE9r3S0h6k2SbWZwxXNUfRGuQPD39NYNI/0ng5OXVeDNQUDwHgXMIPzNc4v318mtdmkaSbm/DhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970513; c=relaxed/simple;
	bh=2OY8QbAt62MpG85IRsPpbfEEQZNinMH1pF7azZrtxQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qTByHGS0tEtV3uga27/S4Q8u4VIdeZHFJ/NOudY6Tpm2DHQ/oUmav7A2IN932rkq/y6hOa+jzHfJjCgYLPsqywd9ZcE/p0f7XgFpGiLByFEPnPqgmABZCZRr/iMj/iNR2tI+RcDl28zGdyzWGtEaShx0TGVE/AsZSOXalCVBHtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=a8VAvy4U; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="a8VAvy4U"
ARC-Seal: i=1; a=rsa-sha256; t=1750970492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xzuv5RIGJbAVtnPxiaF9JBXuk3JuHEIA512h8aWZ6kjfjB1WsIe3/cJ8IVmpNBFTjyGBSWDFTNvESEKRSXOVKHNodapUmg/3a0+vGJNMc/Ux0FJdiNaj40ffrxCZwSYgpSoYUeFP4VurFtquyspaUEZTba+dfp9xcEWBMvfZQJw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750970492; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dkvlEaVeP24Afh8UAYlk8YS7UckDMj2JtAwIeCxutOA=; 
	b=jntwHK50ZZRME1c42JClO/uA2ru7WBxeFi1mgEl0k+KfRI/HC27xjCLn8tGUlEUoqxMH+IhcXc2msu1+tQ4zE63wxjJ44QS8nXVw27ySszSXWHw3Q+B/WNymm/4/BRT609Jy6EQO/jVfqi2tginAPnOuORkqMfBaUbLOsriIZWM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750970492;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=dkvlEaVeP24Afh8UAYlk8YS7UckDMj2JtAwIeCxutOA=;
	b=a8VAvy4UjAVxhsR9otGCvjC585gT6fWSrFuPTIik2klmIicNuSdas/2kkoVhUDci
	A4/TNyi2qEmtRrD29OGcwHbdNA+3dycLB468F4kUCfzO33rXBtI2e8yQaYY3GXQ+uWQ
	WNwfiOw749nJ16eMQ30dpAByi5mNGkZRGmMzpGQ0=
Received: by mx.zohomail.com with SMTPS id 175097049056113.876333104436412;
	Thu, 26 Jun 2025 13:41:30 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 26 Jun 2025 22:41:18 +0200
Subject: [PATCH v2] arm64: defconfig: enable further Rockchip platform
 drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
X-B4-Tracking: v=1; b=H4sIAG6wXWgC/3WOQQ6CMBBFr0JmbQ0tFJCV9zAsSplCI7TaVoIh3
 N0KcenyTfLenxU8Oo0e6mQFh7P22poI7JSAHITpkeguMrCU8bRgBXH3jFcV6VBJa5TuSUk5ZqX
 qOM8lRO3hUOllT96agx0+X7EcjiO0wiORdpp0qBODSyC/OnyFQftg3Xt/aaa78X99poSS7CLoR
 eRU0opepR1H0VonznECmm3bPittv47lAAAA
X-Change-ID: 20250626-rk3588-defconfig-715e37fd554c
To: Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Enable the rockchip-dfi driver as a module, which is used on RK3588 as
well as RK3568 and RK3399 to measure memory bandwidth. For this, we also
enable PM_DEVFREQ_EVENT, which is a requirement for this driver.

Also enable the rockchip-rga driver as a module, which is used on
various Rockchip SoCs, including RK3588 and RK3399, to provide 2d
accelerated image transformations through a V4L2 interface.

Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Drop explicit Rockchip Hantro enablement, as this should already be
  autoselected as the Kconfig option's default if Hantro is enabled.
- Also enable PM_DEVFREQ_EVENT, which is a prerequisite to rockchip-dfi.
- Order the defconfig options at the correct locations, as per
  `savedefconfig`.
- Link to v1: https://lore.kernel.org/r/20250626-rk3588-defconfig-v1-1-39a19a41c181@collabora.com
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607dbfd8e00b915b27999949ee0fc88..904b8a332f8cebd2f5ee0fe24d0aaf8b1860bfc6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -867,6 +867,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
@@ -1520,6 +1521,8 @@ CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_ARM_IMX_BUS_DEVFREQ=y
 CONFIG_ARM_IMX8M_DDRC_DEVFREQ=m
 CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=m
+CONFIG_PM_DEVFREQ_EVENT=y
+CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=m
 CONFIG_EXTCON_PTN5150=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y

---
base-commit: 7e5ee158886bb7c244a34623de6a410b62023d60
change-id: 20250626-rk3588-defconfig-715e37fd554c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

