Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE16274FFC;
	Tue,  1 Jul 2025 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382721; cv=none; b=n4opsRk80moRRpGBub/ne3VM2928WQNrTwocwRogWwLm7oGxMQibb8cvURi0Io0PPTntu+qRtgKWbeo6tVx9qkUomB6uwXGdZhKIcBB4o0L8bbLa9oNxQdxyTw2znE7X/YfN6f4M017Gh6l0SgXwZ40pMcZT8/C1Jouk4vohINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382721; c=relaxed/simple;
	bh=2sjI2nv7EsmNbdyc0263SSE5zjLb+Nwf++I7IE3w9Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiUNXWwE73NkrKTVdKc8HYsLtgRY+htVXrFueObADoNFwbR6JZiyAoMTdzZrD+6IWxJqrObuXzvOje36yyU95AgUaeNngHrzjEWEg/ui++CqtS0nwfAeDftcls67GqMgEZsVjUAxsSR6So6QH2vlJ4WocoFc3vwsu/hjSGRhGG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kjIRRtzY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kjIRRtzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751382717;
	bh=2sjI2nv7EsmNbdyc0263SSE5zjLb+Nwf++I7IE3w9Pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kjIRRtzY2tQtxrqxWKs1QaZmrl9HVSRfD+utS5t8Z4NDSkrhx+WxCfFCTOBc0yx6q
	 72k/8vM8yRbFO7bXPrm/3hsBe/7C0FlXHgb9k3xNPnurZJrf9aVoc0Z1lsZaQyjyPV
	 YluqLLmzhyd7MAXKHO1mOe9wA9BNZLElbBKIJiu9w7PC2ALVix+sSCaH38M2TB6b7c
	 XP8UCooJVe7VyGxdvSLFOHU9yGOekt87lHhRlF8w1ucuQBxChRWqlJswp5/IEhd9GT
	 IpGCLpRNhusaJ3Ey8oV6j6ozCkp/yimvT8e2tQxxwdIVABqsV333SgyxoJvZfK5tUR
	 BiHIeX5vURrgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 20CAA17E0921;
	Tue,  1 Jul 2025 17:11:56 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	m.wilczynski@samsung.com,
	nm@ti.com,
	khilman@baylibre.com,
	kabel@kernel.org,
	quic_hyiwei@quicinc.com,
	pjp@fedoraproject.org,
	tudor.ambarus@linaro.org,
	drew@pdp7.com,
	u.kleine-koenig@baylibre.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	laura.nao@collabora.com,
	kernel@collabora.com
Subject: [RFC PATCH 1/3] firmware: Move MediaTek ADSP IPC driver to mediatek folder
Date: Tue,  1 Jul 2025 17:11:47 +0200
Message-ID: <20250701151149.136365-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
References: <20250701151149.136365-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for adding more MediaTek firmware drivers, create a
new `mediatek` folder and move the mtk-adsp-ipc driver into it.

Also move the Kconfig and Makefile entries to the new ones in the
folder.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/Kconfig                       | 10 +---------
 drivers/firmware/Makefile                      |  2 +-
 drivers/firmware/mediatek/Kconfig              | 14 ++++++++++++++
 drivers/firmware/mediatek/Makefile             |  3 +++
 drivers/firmware/{ => mediatek}/mtk-adsp-ipc.c |  0
 5 files changed, 19 insertions(+), 10 deletions(-)
 create mode 100644 drivers/firmware/mediatek/Kconfig
 create mode 100644 drivers/firmware/mediatek/Makefile
 rename drivers/firmware/{ => mediatek}/mtk-adsp-ipc.c (100%)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..f35648686f91 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -169,15 +169,6 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
-config MTK_ADSP_IPC
-	tristate "MTK ADSP IPC Protocol driver"
-	depends on MTK_ADSP_MBOX
-	help
-	  Say yes here to add support for the MediaTek ADSP IPC
-	  between host AP (Linux) and the firmware running on ADSP.
-	  ADSP exists on some mtk processors.
-	  Client might use shared memory to exchange information with ADSP.
-
 config SYSFB
 	bool
 	select BOOT_VESA_SUPPORT
@@ -290,6 +281,7 @@ source "drivers/firmware/cirrus/Kconfig"
 source "drivers/firmware/google/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
+source "drivers/firmware/mediatek/Kconfig"
 source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/microchip/Kconfig"
 source "drivers/firmware/psci/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4ddec2820c96..5bb382344906 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
-obj-$(CONFIG_MTK_ADSP_IPC)	+= mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
@@ -27,6 +26,7 @@ obj-y				+= arm_ffa/
 obj-y				+= arm_scmi/
 obj-y				+= broadcom/
 obj-y				+= cirrus/
+obj-y				+= mediatek/
 obj-y				+= meson/
 obj-y				+= microchip/
 obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
diff --git a/drivers/firmware/mediatek/Kconfig b/drivers/firmware/mediatek/Kconfig
new file mode 100644
index 000000000000..f6f16e71fbda
--- /dev/null
+++ b/drivers/firmware/mediatek/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "MediaTek firmware drivers"
+
+config MTK_ADSP_IPC
+	tristate "MTK ADSP IPC Protocol driver"
+	depends on MTK_ADSP_MBOX
+	help
+	  Say yes here to add support for the MediaTek ADSP IPC
+	  between host AP (Linux) and the firmware running on ADSP.
+	  ADSP exists on some mtk processors.
+	  Client might use shared memory to exchange information with ADSP.
+
+endmenu
diff --git a/drivers/firmware/mediatek/Makefile b/drivers/firmware/mediatek/Makefile
new file mode 100644
index 000000000000..3c0d9d67d646
--- /dev/null
+++ b/drivers/firmware/mediatek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_MTK_ADSP_IPC)		+= mtk-adsp-ipc.o
diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mediatek/mtk-adsp-ipc.c
similarity index 100%
rename from drivers/firmware/mtk-adsp-ipc.c
rename to drivers/firmware/mediatek/mtk-adsp-ipc.c
-- 
2.49.0

