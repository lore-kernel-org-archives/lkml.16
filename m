Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633D2D5414
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628190; cv=none; b=L+YB7+cJn8VQcZxYOgTsaZa9h6hZKSM+arz4+/0gRBQBkmY7qaboDlgfP5oSvDqzpvNQTH+65uaGygLmnJdY8XZUqBiNK5Uru8jcjcrpG2lhBl0ME8hIiBmG/0vVCy4S5ieI4DWLDna3dix9PNYmYpnFkwSILL33AcJxS8ZQBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628190; c=relaxed/simple;
	bh=QZT70GC5I9mlIFag5hRXLgSUn7fmfZNdPIQMr2qW4Dk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pBvrNivBUmIAuKg7cV+DzDMr5LYTmsHMrZ13v/Gv5Z/M7FwDbyW1tX3gBB3KmHF49p77GYa2fh5hX7JjdWi34dE+hsIwSaKY03gAjAqc8dA+58DAuyfIhI7yaPnUim2B0bOX/Cciy/PUeJhirQWXNXgAfWcOynboCSuD4GSijDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F1G177fN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F1G177fN"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B7nUUR1299187;
	Wed, 11 Jun 2025 02:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749628170;
	bh=lbGHHnVwBehGkxTMcxdJuAMvUgSY4beokWSC20sKtlM=;
	h=From:To:CC:Subject:Date;
	b=F1G177fNzXyE/IhRuZhSvMNzZjR94OR/1XPL6KQfhQGVQixZpUaH/kjsI2D6bWYPa
	 yZmp54zkG+YyCst/TR+zpUWaUDLKmErlDiwdM1Um+aLMh6Y6aKtujpYAkLPqBhnYZW
	 dCY7I6Qz0v3G8WCIhYPW6MRC7fCGenYMlcM7WDXU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B7nUu11555801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 02:49:30 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 02:49:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 02:49:29 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B7nQCo158481;
	Wed, 11 Jun 2025 02:49:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <linux@armlinux.org.uk>, <arnd@arndb.de>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>, <b-padhi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
Date: Wed, 11 Jun 2025 13:19:25 +0530
Message-ID: <20250611074925.1155547-1-b-padhi@ti.com>
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

This allows us to use various peripherals in the TI OMAP family devices
using the multi-v7 config, instead of only with the OMAP specific
defconfigs.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c79495e113c8..10ad7026bb4d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -166,6 +166,7 @@ CONFIG_BT_MRVL_SDIO=m
 CONFIG_BT_QCOMSMD=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
+CONFIG_IWLWIFI=m
 CONFIG_RFKILL=y
 CONFIG_RFKILL_INPUT=y
 CONFIG_RFKILL_GPIO=y
@@ -788,6 +789,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=m
 CONFIG_SND=m
+CONFIG_SND_SOC_OMAP_HDMI=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_INPUT_BEEP=y
 CONFIG_SND_HDA_PATCH_LOADER=y
@@ -1095,6 +1097,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_EXYNOS_IOMMU=y
 CONFIG_QCOM_IOMMU=y
 CONFIG_REMOTEPROC=y
+CONFIG_WKUP_M3_RPROC=m
 CONFIG_OMAP_REMOTEPROC=m
 CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
 CONFIG_KEYSTONE_REMOTEPROC=m
@@ -1102,6 +1105,7 @@ CONFIG_QCOM_Q6V5_MSS=m
 CONFIG_QCOM_SYSMON=m
 CONFIG_QCOM_WCNSS_PIL=m
 CONFIG_ST_REMOTEPROC=m
+CONFIG_OMAP_REMOTEPROC=m
 CONFIG_RPMSG_CHAR=m
 CONFIG_RPMSG_CTRL=m
 CONFIG_RPMSG_QCOM_SMD=y
@@ -1127,6 +1131,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
+CONFIG_AMX3_PM=m
+CONFIG_WKUP_M3_IPC=m
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
 CONFIG_RASPBERRYPI_POWER=y
@@ -1138,11 +1144,13 @@ CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
 CONFIG_ARM_TEGRA_DEVFREQ=m
 CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
+CONFIG_EXTCON_PALMAS=m
 CONFIG_EXTCON_MAX14577=m
 CONFIG_EXTCON_MAX77693=m
 CONFIG_EXTCON_MAX8997=m
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_TI_AEMIF=y
+CONFIG_TI_EMIF_SRAM=m
 CONFIG_STM32_FMC2_EBI=y
 CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
@@ -1287,6 +1295,7 @@ CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
+CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
@@ -1300,6 +1309,10 @@ CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m
+CONFIG_CRYPTO_DEV_OMAP=m
+CONFIG_CRYPTO_DEV_OMAP_SHAM=m
+CONFIG_CRYPTO_DEV_OMAP_AES=m
+CONFIG_CRYPTO_DEV_OMAP_DES=m
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
@@ -1307,3 +1320,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
+CONFIG_CAN_C_CAN=m
+CONFIG_CAN_C_CAN_PLATFORM=m
-- 
2.34.1

