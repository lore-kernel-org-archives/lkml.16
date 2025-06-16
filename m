Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE2626C3BD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062058; cv=none; b=Hn9O0M+Mcb7j5DCARxfjOlv6TQOWu4wdC3ugJJI1L1gvJiFfpYLoqrF18cA1kbzd0Fc3EPOv/cGz0lO17cJnczGH7FrDfxz9ntbpR43Gjwsbr3EuC94CIKDvNTh0g7n69DJelhIuy0GOOQWGzmpNpBMhbCL/TB7+4MVFeWIAA3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062058; c=relaxed/simple;
	bh=k30UU6IRlFLXfvARXtpb8clrwel5tCwEsK+1p0C1Sk8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KeKk1oH+6xhzb+9lpKD8uIBNNEj04qsZm2Tw1KR2SrbXkGWWprPmUioTrtuj/gn/Af/wbfOL11tzv7IF7KooaekTTX9UKhTgOisgMVsPHnw0DOmRy9DqTav3H7BmL6fOFmled0fvuYy+s94b95mCUBNgaLZgN3yhyZ1LmWFEPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tLsKef2u; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tLsKef2u"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G8Kgp32533500;
	Mon, 16 Jun 2025 03:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750062042;
	bh=tNH63t35u4I0dlC3FK6Wrb8dYUs2Ue9mmUePLWGqdVE=;
	h=From:To:CC:Subject:Date;
	b=tLsKef2uODLZaTXlEip+fkUfdfRQqwwKyR1rJ9fJOmQLxgSI9pe2hUzKv2Ip41uE5
	 oWjE1jAsOUSDgrPJ/ey6W8cgXT3Usbn1wnf53AUjtRSA5oKdsrWQHsZUQFIoEquS0b
	 n4y+Jt2cDTlWGh6j+uzhOh/hRHm47L9Ceyl46hHU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G8KgbN631837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 03:20:42 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 03:20:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 03:20:41 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G8Kc073930015;
	Mon, 16 Jun 2025 03:20:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <linux@armlinux.org.uk>, <arnd@arndb.de>
CC: <krzk@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
        <b-padhi@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm: multi_v7_defconfig: Enable more OMAP related configs
Date: Mon, 16 Jun 2025 13:50:38 +0530
Message-ID: <20250616082038.3241346-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Sinthu Raja <sinthu.raja@ti.com>

This allows us to enable various peripherals in the TI OMAP family
platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
AM57XX-EVM using the multi_v7_defconfig, instead of only with the
OMAP specific defconfigs.

IWLWIFI:
Intel Wireless Next-Gen WiFi adapters for AM57XX platforms.

SND_SOC_OMAP_HDMI:
Enable HDMI audio to work with OMAPDSS HDMI for AM57XX platforms.

RTC_DRV_OMAP:
Enable Real Time Clock support, needed by AMX3_PM config for Power
Management.

WKUP_M3_{RPROC/IPC}:
Enable Remoteproc/IPC support on AM335X platform. Needed by AMX3_PM
config.

TI_EMIF_SRAM:
Enable EMIF module needed by AMX3_PM config for Power Management.

AMX3_PM:
Enable Power Management for AM335X platform.

EXTCON_PALMAS:
Enable support for USB peripheral detection by external connector palmas
USB on AM57XX platforms.

CRYPTO_XCBC:
Enable XCBC-MAC (Extended Cipher Block Chaining MAC) mode
to provide authentication mechanisms for IPsec Encapsulating
Security Payload (ESP) and the Authentication Header (AH)
protocols.

CRYPTO_DEV_OMAP*:
Add support to enable the OMAP AES, DES, SHAM hardware engine for AM57XX
platforms.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
Krzysztof:
1. Updated commit message to call out which (and why) upstream boards
need these configs to be enabled.
2. Used savedefconfig to correct the order of configs in the defconfig.

Link to v1:
https://lore.kernel.org/all/20250611074925.1155547-1-b-padhi@ti.com/

 arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c79495e113c8..fe1c4d7801ef 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -310,6 +310,7 @@ CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
 CONFIG_WCN36XX=m
 CONFIG_BRCMFMAC=m
+CONFIG_IWLWIFI=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_RT2X00=m
@@ -838,6 +839,7 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=m
 CONFIG_SND_SOC_TEGRA_ALC5632=m
 CONFIG_SND_SOC_TEGRA_MAX98090=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
+CONFIG_SND_SOC_OMAP_HDMI=m
 CONFIG_SND_SOC_AC97_CODEC=m
 CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_CPCAP=m
@@ -1010,6 +1012,7 @@ CONFIG_RTC_DRV_S5M=m
 CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=m
 CONFIG_RTC_DRV_DIGICOLOR=m
+CONFIG_RTC_DRV_OMAP=m
 CONFIG_RTC_DRV_S3C=m
 CONFIG_RTC_DRV_SA1100=m
 CONFIG_RTC_DRV_SH=m
@@ -1097,6 +1100,7 @@ CONFIG_QCOM_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_OMAP_REMOTEPROC=m
 CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
+CONFIG_WKUP_M3_RPROC=m
 CONFIG_KEYSTONE_REMOTEPROC=m
 CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_SYSMON=m
@@ -1129,6 +1133,8 @@ CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
+CONFIG_AMX3_PM=m
+CONFIG_WKUP_M3_IPC=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_CPR=y
 CONFIG_QCOM_RPMHPD=y
@@ -1141,8 +1147,10 @@ CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
 CONFIG_EXTCON_MAX14577=m
 CONFIG_EXTCON_MAX77693=m
 CONFIG_EXTCON_MAX8997=m
+CONFIG_EXTCON_PALMAS=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_TI_AEMIF=y
+CONFIG_TI_EMIF_SRAM=m
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
@@ -1275,6 +1283,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_USER=m
+CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
@@ -1289,6 +1298,10 @@ CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
+CONFIG_CRYPTO_DEV_OMAP=m
+CONFIG_CRYPTO_DEV_OMAP_SHAM=m
+CONFIG_CRYPTO_DEV_OMAP_AES=m
+CONFIG_CRYPTO_DEV_OMAP_DES=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
 CONFIG_CRYPTO_DEV_S5P=m
 CONFIG_CRYPTO_DEV_ATMEL_AES=m
-- 
2.34.1

