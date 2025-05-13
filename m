Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67C18DB3D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170018; cv=none; b=N0lPNHh7oNs1+TRpIX+iL1RJHasWiyjJU7IEgSvlysKtrqV4Ng3rxiz1Suu/7kwhBApMdRydrdR0st/pgGj1im5J3iVqZud2oJG6e36pEqqyrIxwYQNOM8B1DgBqWbXMPYdMEHIeb+ymTL71NxLhP6QPGC6OSSMJdxJUlieoFFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170018; c=relaxed/simple;
	bh=uXBKfrEHx7TPq4q2YOZY45n4LHW3AiqO1stybgZlRFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CL3+P0zXnGi5egttTFFCE6Iqu7phijT3lO3vyL1nrT0a+EhhRUP4SIB9WFhA2/Qg8zL//buwMfoXbG5LMjgIX36LbyIOotn/S3fcDGV1YksMJNQ3yyJRYotaTAbsQCLLHLetWBoFuN3WNnktRPsTEuYzk1BE/s0HCF3Xj+gbukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=doln9mqq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="doln9mqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747170014;
	bh=uXBKfrEHx7TPq4q2YOZY45n4LHW3AiqO1stybgZlRFw=;
	h=From:Date:Subject:To:Cc:From;
	b=doln9mqquK6hbJ3KKO3U21/pJNa5dzcIc3wNJugbujtmikJj5ghJ6UMdGMdjwWYly
	 4r+lj37zE2TPlwBOsnp9/9jgEw6y+D4h2GGH22jIaO8bxmrQiySnO5jLpE3w2aDHBr
	 sb50YxPfQ+/DJcrMMtMq2sifoSs+bFGbNyBWRC478I9jQLwth+DJcsFD2NPzCXXNQw
	 zLRKvuFhhR3SitGmWKGCeUfEdnb+yHC/bZDDoRs7t/1a9eDMFt/XZK7WSdUfpRwim3
	 7tFdwCMdKYiuyh0RNAzZJjunzle6Cvbi0BV7SJXWDs93wldKH3WfTU5A7sxE+RHrdp
	 4v5OO9ZZxH/cQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E48CF17E0509;
	Tue, 13 May 2025 23:00:12 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 13 May 2025 16:59:41 -0400
Subject: [PATCH] arm64: defconfig: Enable configs for MediaTek Genio EVK
 boards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
X-B4-Tracking: v=1; b=H4sIALyyI2gC/x3MQQqAIBBA0avErBuwTIuuEi3CGW02GgoRSHdPW
 r7F/xUKZ+ECa1ch8y1FUmwY+g7cecTAKNQMoxqNMoPGwFESEnuXopeAsyVr/GInTQStujJ7ef7
 jtr/vBygLiT5hAAAA
X-Change-ID: 20250513-genio-defconfig-76d65f8643dd
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Enable the missing configs to get all devices on the MediaTek Genio
1200, 700, 510 and 350 EVK boards probing, as indicated by the DT
kselftest.

This includes support for:

Genio 1200/700/510/350:
* MT6359/MT6357 PMICs Auxiliary ADC

Genio 1200/700/510:
* MDP3 (video scaling and color space conversion IP block)
* ITE IT5205 Type-C USB Alternate Mode Passive MUX
* Himax HX8279 controller based KD070FHFID078 DSI panel

Genio 700/510:
* Richtek RT1715 USB Type-C PD Controller

Genio 1200:
* MediaTek PCIe PHY
* Mediatek MT6360 USB Type-C Port Controller

Genio 350:
* STARTEK KD070FHFID015 DSI panel
* MediaTek UART DMA controller (APDMA)

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Depends on [1].

[1] "[PATCH v4] arm64: defconfig: mediatek: enable PHY drivers"
https://lore.kernel.org/all/20250512131933.1247830-1-vignesh.raman@collabora.com/
---
 arch/arm64/configs/defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb3eacd6406c3a508ce9ee5f4b5c9cd6a429ed3a..cb47d7bea02025d6034093ec3dd2f9f1c6ad4bc8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -846,6 +846,7 @@ CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m
+CONFIG_VIDEO_MEDIATEK_MDP3=m
 CONFIG_VIDEO_IMX7_CSI=m
 CONFIG_VIDEO_IMX_MIPI_CSIS=m
 CONFIG_VIDEO_IMX8_ISI=m
@@ -912,6 +913,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_PANEL_EDP=m
+CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
@@ -919,6 +921,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
@@ -1152,6 +1155,8 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_RT1711H=m
+CONFIG_TYPEC_MT6360=m
 CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
@@ -1162,6 +1167,7 @@ CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
+CONFIG_TYPEC_MUX_IT5205=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
 CONFIG_TYPEC_MUX_PS883X=m
 CONFIG_TYPEC_MUX_WCD939X_USBSS=m
@@ -1271,6 +1277,7 @@ CONFIG_PL330_DMA=y
 CONFIG_TEGRA186_GPC_DMA=y
 CONFIG_TEGRA20_APB_DMA=y
 CONFIG_TEGRA210_ADMA=m
+CONFIG_MTK_UART_APDMA=m
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_QCOM_GPI_DMA=m
 CONFIG_QCOM_HIDMA_MGMT=y
@@ -1515,6 +1522,7 @@ CONFIG_EXYNOS_ADC=y
 CONFIG_IMX8QXP_ADC=m
 CONFIG_IMX93_ADC=m
 CONFIG_MAX9611=m
+CONFIG_MEDIATEK_MT6359_AUXADC=m
 CONFIG_MEDIATEK_MT6577_AUXADC=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
@@ -1578,6 +1586,7 @@ CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_PHY_MTK_PCIE=m
 CONFIG_PHY_MTK_TPHY=y
 CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_MTK_MIPI_DSI=m

---
base-commit: 0c6d548cd52870702eb4150c420d00e9289a79d2
change-id: 20250513-genio-defconfig-76d65f8643dd

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

