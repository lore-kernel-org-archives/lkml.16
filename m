Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED4A923
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403630; cv=none; b=mfQV69lordg3LgdS6lisSGaFKjXM/aPiPOTc5TAVNYK7pT1xiEC1JFjUe+XvTdq7wK5rs9kg55rtNp1nFUl59wTZv/TYv9Z1EDWp8UviibQ11AklqSqh5L9hLKiLyZBv1BG7aFiE5FkApe83Oz4Jz7RkmWxkMXz3BVoqiDH0Jhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403630; c=relaxed/simple;
	bh=ukQlFVbcX3h33vRusMn0u9y9gVxLT2zG4hpbLqghLhQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NFuRxjztK8Y1jZhQ4md17dO7hYB1IvFXXYUagfpzzCVg8fAh8ZNqmnsx+cDo7GcTg+5Z4HLXg36LaRvhtppAlcJ7nM0joRN57h0vKb3sfgZo+/BAFio8T9KNCErtgnVC3P6cvu5FkHsLW8wo4H9lqIKgenYIP9lfkGZh6XLB9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vTen+s1C; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vTen+s1C"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55K7DTPv83420616, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1750403609; bh=Sc61VNUPMIaeNDpQ7qNuVnKqnJw0KCMEt5Qcx+rNo28=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=vTen+s1Cki9hFPfg8ppQXCYf4XtIbCxav475IHZ4x1nswclEC+COWZojyHlADF4GF
	 MADG8GITBGPmkJPpezHhWYQn/UnCqPEbqnrG3NoBwX4bp9gddyT5Yp0gyhs3QtfbZj
	 irC0V0NZ5xbHzXVaJ9Y8s+7aqUqvks6SOGzPEHhnGj/0JatiWo/gVOcuVECqHovswR
	 IpKaAMjq5Rm3Lnz9vxtcW6uXxU1QQXf0lgFpXync3psV0eEB6B4WwPd4ObAmMcBkLc
	 VJh/eYhxnMnISHOQapY//zAhUtZ6wiUTAnlSESxaEXQkxbF2ZkIc0GwG6TQiTtNfVq
	 If/VtjBzgzHQQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55K7DTPv83420616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 15:13:29 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Jun 2025 15:13:38 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 20 Jun 2025 15:13:37 +0800
Received: from localhost (172.22.144.1) by RTEXH36506.realtek.com.tw
 (172.21.6.27) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Jun 2025 15:13:37 +0800
From: Ricky Wu <ricky_wu@realtek.com>
To: <linux-kernel@vger.kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <ricky_wu@realtek.com>,
        <bhelgaas@google.com>, <viro@zeniv.linux.org.uk>
Subject: [PATCH] misc: rtsx: Add support for RTS5264 Version B and optimize init flow
Date: Fri, 20 Jun 2025 15:13:25 +0800
Message-ID: <20250620071325.1887017-1-ricky_wu@realtek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS03.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

This patch adds support for the Realtek RTS5264 Version B
card reader controller.
To support this chip revision, the driver introduces specific
initialization logic to handle the hardware requirements of
Version B. The probe flow is updated to detect this version
and apply the necessary register configurations.
Additionally, the initialization sequence for Version B has
been optimized to improve robustness and ensure proper device
setup during power-on.
These changes ensure correct operation and compatibility with
systems using RTS5264 Version B.

Signed-off-by: Ricky Wu <ricky_wu@realtek.com>
---
 drivers/misc/cardreader/rts5264.c  | 63 ++++++++++++++++++++++++++++--
 drivers/misc/cardreader/rts5264.h  |  6 +++
 drivers/misc/cardreader/rtsx_pcr.c |  2 +-
 3 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/cardreader/rts5264.c b/drivers/misc/cardreader/rts5264.c
index 06d7a8a95fd6..d050c9fff7ac 100644
--- a/drivers/misc/cardreader/rts5264.c
+++ b/drivers/misc/cardreader/rts5264.c
@@ -413,8 +413,8 @@ static void rts5264_init_from_hw(struct rtsx_pcr *pcr)
 {
 	struct pci_dev *pdev = pcr->pci;
 	u32 lval1, lval2, i;
-	u16 setting_reg1, setting_reg2;
-	u8 valid, efuse_valid, tmp;
+	u16 setting_reg1, setting_reg2, phy_val;
+	u8 valid, efuse_valid, tmp, efuse_len;
 
 	rtsx_pci_write_register(pcr, RTS5264_REG_PME_FORCE_CTL,
 		REG_EFUSE_POR | REG_EFUSE_POWER_MASK,
@@ -433,6 +433,8 @@ static void rts5264_init_from_hw(struct rtsx_pcr *pcr)
 			break;
 	}
 	rtsx_pci_read_register(pcr, RTS5264_EFUSE_READ_DATA, &tmp);
+	efuse_len = ((tmp & 0x70) >> 4);
+	pcr_dbg(pcr, "Load efuse len: 0x%x\n", efuse_len);
 	efuse_valid = ((tmp & 0x0C) >> 2);
 	pcr_dbg(pcr, "Load efuse valid: 0x%x\n", efuse_valid);
 
@@ -445,6 +447,58 @@ static void rts5264_init_from_hw(struct rtsx_pcr *pcr)
 		REG_EFUSE_POR, 0);
 	pcr_dbg(pcr, "Disable efuse por!\n");
 
+	if (is_version(pcr, PID_5264, RTS5264_IC_VER_B)) {
+		pci_write_config_dword(pdev, 0x718, 0x0007C000);
+		rtsx_pci_write_register(pcr, AUTOLOAD_CFG_BASE, 0xFF, 0x88);
+		rtsx_pci_read_phy_register(pcr, _PHY_REV0, &phy_val);
+		phy_val &= 0xFFFD;
+
+		if (efuse_len == 0) {
+			rtsx_pci_write_register(pcr, RTS5264_FW_CFG_INFO2, 0x0F, 0x0F);
+			rtsx_pci_write_register(pcr, 0xFF14, 0xFF, 0x79);
+			rtsx_pci_write_register(pcr, 0xFF15, 0xFF, 0xFF);
+			rtsx_pci_write_register(pcr, 0xFF16, 0xFF, 0x3D);
+			rtsx_pci_write_register(pcr, 0xFF17, 0xFF, 0xFE);
+
+			rtsx_pci_write_register(pcr, 0xFF18, 0xFF, 0x5B);
+			rtsx_pci_write_register(pcr, 0xFF19, 0xFF, 0xFF);
+			rtsx_pci_write_register(pcr, 0xFF1A, 0xFF, 0x3E);
+			rtsx_pci_write_register(pcr, 0xFF1B, 0xFF, 0xFE);
+
+			rtsx_pci_write_register(pcr, 0xFF1C, 0xFF, 0x00);
+			rtsx_pci_write_register(pcr, 0xFF1D, 0xFF, 0xFF);
+			rtsx_pci_write_register(pcr, 0xFF1E, 0xFF, 0x3F);
+			rtsx_pci_write_register(pcr, 0xFF1F, 0xFF, 0xFE);
+
+			rtsx_pci_write_register(pcr, 0xFF20, 0xFF, 0x81);
+			rtsx_pci_write_register(pcr, 0xFF21, 0xFF, 0xFF);
+			rtsx_pci_write_register(pcr, 0xFF22, 0xFF, 0x3C);
+			rtsx_pci_write_register(pcr, 0xFF23, 0xFF, 0xFE);
+		}
+
+		rtsx_pci_write_register(pcr, 0xFF24, 0xFF, 0x79);
+		rtsx_pci_write_register(pcr, 0xFF25, 0xFF, 0x5B);
+		rtsx_pci_write_register(pcr, 0xFF26, 0xFF, 0x00);
+		rtsx_pci_write_register(pcr, 0xFF27, 0xFF, 0x40);
+
+		rtsx_pci_write_register(pcr, 0xFF28, 0xFF, (u8)phy_val);
+		rtsx_pci_write_register(pcr, 0xFF29, 0xFF, (u8)(phy_val >> 8));
+		rtsx_pci_write_register(pcr, 0xFF2A, 0xFF, 0x19);
+		rtsx_pci_write_register(pcr, 0xFF2B, 0xFF, 0x40);
+
+		rtsx_pci_write_register(pcr, 0xFF2C, 0xFF, 0x20);
+		rtsx_pci_write_register(pcr, 0xFF2D, 0xFF, 0xDA);
+		rtsx_pci_write_register(pcr, 0xFF2E, 0xFF, 0x0A);
+		rtsx_pci_write_register(pcr, 0xFF2F, 0xFF, 0x40);
+
+		rtsx_pci_write_register(pcr, 0xFF30, 0xFF, 0x20);
+		rtsx_pci_write_register(pcr, 0xFF31, 0xFF, 0xD2);
+		rtsx_pci_write_register(pcr, 0xFF32, 0xFF, 0x0A);
+		rtsx_pci_write_register(pcr, 0xFF33, 0xFF, 0x40);
+	} else {
+		rtsx_pci_write_register(pcr, AUTOLOAD_CFG_BASE, 0x80, 0x80);
+	}
+
 	if (efuse_valid == 2 || efuse_valid == 3) {
 		if (valid == 3) {
 			/* Bypass efuse */
@@ -618,6 +672,9 @@ static int rts5264_optimize_phy(struct rtsx_pcr *pcr)
 			rtsx_pci_update_phy(pcr, _PHY_REV0, 0x1FF, 0x3800);
 	}
 
+	if (is_version(pcr, PID_5264, RTS5264_IC_VER_B))
+		rtsx_pci_write_phy_register(pcr, 0x00, 0x5B79);
+
 	return 0;
 }
 
@@ -820,7 +877,7 @@ int rts5264_pci_switch_clock(struct rtsx_pcr *pcr, unsigned int card_clock,
 			SSC_DEPTH_MASK, ssc_depth);
 	rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, SSC_DIV_N_0, 0xFF, n);
 
-	if (is_version(pcr, 0x5264, IC_VER_A)) {
+	if (is_version(pcr, PID_5264, RTS5264_IC_VER_A)) {
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, SSC_CTL1, SSC_RSTB, 0);
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, RTS5264_CARD_CLK_SRC2,
 			RTS5264_REG_BIG_KVCO_A, 0);
diff --git a/drivers/misc/cardreader/rts5264.h b/drivers/misc/cardreader/rts5264.h
index e3cbbf2fe1a4..f3e81daa708d 100644
--- a/drivers/misc/cardreader/rts5264.h
+++ b/drivers/misc/cardreader/rts5264.h
@@ -61,6 +61,8 @@
 /* DMACTL 0xFE2C */
 #define RTS5264_DMA_PACK_SIZE_MASK	0x70
 
+#define RTS5264_FW_CFG_INFO2	0xFF52
+
 #define RTS5264_FW_CFG1			0xFF55
 #define RTS5264_SYS_CLK_SEL_MCU_CLK	(0x01<<7)
 #define RTS5264_CRC_CLK_SEL_MCU_CLK	(0x01<<6)
@@ -272,6 +274,10 @@
 #define SD_LUN			1
 #define SD_EXPRESS_LUN		2
 
+#define RTS5264_IC_VER_A		0
+#define RTS5264_IC_VER_B		2
+#define RTS5264_IC_VER_C		3
+
 int rts5264_pci_switch_clock(struct rtsx_pcr *pcr, unsigned int card_clock,
 		u8 ssc_depth, bool initial_mode, bool double_clk, bool vpclk);
 
diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index a7b066c48740..f9952d76d6ed 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -1236,7 +1236,7 @@ static int rtsx_pci_init_hw(struct rtsx_pcr *pcr)
 	else if (PCI_PID(pcr) == PID_5228)
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, SSC_CTL2, 0xFF,
 			RTS5228_SSC_DEPTH_2M);
-	else if (is_version(pcr, 0x5264, IC_VER_A))
+	else if (is_version(pcr, PID_5264, RTS5264_IC_VER_A))
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, SSC_CTL1, SSC_RSTB, 0);
 	else if (PCI_PID(pcr) == PID_5264)
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, SSC_CTL2, 0xFF,
-- 
2.25.1

