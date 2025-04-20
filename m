Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7FE15CD74
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745161066; cv=none; b=iFZ5QNbsqBk7XWQzeUoozoZst9gOrHu4XdzyX2PjSE/+kPMznDhbI9k90C1cdL+8QVIE2/393mqLid+q9syqyOaoMeetTvoKHpbj4VobFgV7y5OuHf0fHG81oWP3Ax0A1Rk+YPToFpxxNy3+8XoQJVcB1zF8NQ34zVvd3R39wBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745161066; c=relaxed/simple;
	bh=AGiai40zWvo7HBmJs/nM8/DEK2i6Svtaq3lA5Msj1BE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8JhFxCKsBGySxEdj90KP/KgtUk+GoZmT0otViSq5GS7Ogfu92b7YhYzih+Gg+FONl99J1x8pKLWbGT+IH0E2qdFF+QBx2UHzaunXWBCxcRRv6MuUWF1kGK0sHUnNRw/L2ZADJU2kj39natKarLmciBUWpJMfo+RxaFDQHynLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=RUAK36Yg; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RUAK36Yg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=nCJuTErfoD404VEFv24FFd42vP+TJEphZMa7lv0QHsI=; b=RUAK36Yg8irb4Nqr
	d0+MRtJprtzjWIQ7BrF0eISxip0F+Q8Qqm5afqCCCnRp86iUwwspZ6QfZLoWLcRyek7vRgJ/RfrKj
	E+yyT1WA4tCRv1Mt3kJgfA7aH6BaSG8ksENknPUy0DE3YIgn8M4/CPn1rmQGdDRTDgcz3yBm2Y+ll
	40hKPfM1za966AZXIlVrSudRbbJENaOm/reCNcZaBh9RwT35Fld6Ewrk+4RRQRf5FH9z/OwC/TEw4
	UM0QE6gRnaXnAgmoRVTwcAJo0b4pVz1ozHHWg2Pw17V+vbAEPEWO+mGZQa6jGCBaykTfDrcNKSYfF
	3xEdtHmyJThfB16Sag==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6W71-00Cilv-2n;
	Sun, 20 Apr 2025 14:57:39 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] misc: rtsx: Remove deadcode
Date: Sun, 20 Apr 2025 15:57:39 +0100
Message-ID: <20250420145739.58337-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last uses of rtsx_ms_power_off_card3v3() and
rtsx_sd_power_off_card3v3() were removed by 2019's
commit bede03a579b3 ("misc: rtsx: Enable OCP for rts522a rts524a rts525a
rts5260")

The last use of rtsx_pci_transfer_data() was removed by 2024's
commit d0f459259c13 ("memstick: rtsx_pci_ms: Remove Realtek PCI memstick
driver")

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/cardreader/rtsx_pcr.c | 46 ------------------------------
 drivers/misc/cardreader/rtsx_pcr.h |  2 --
 include/linux/rtsx_pci.h           |  2 --
 3 files changed, 50 deletions(-)

diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index be3d4e0e50cc..a7b066c48740 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -420,25 +420,6 @@ static void rtsx_pci_add_sg_tbl(struct rtsx_pcr *pcr,
 	pcr->sgi++;
 }
 
-int rtsx_pci_transfer_data(struct rtsx_pcr *pcr, struct scatterlist *sglist,
-		int num_sg, bool read, int timeout)
-{
-	int err = 0, count;
-
-	pcr_dbg(pcr, "--> %s: num_sg = %d\n", __func__, num_sg);
-	count = rtsx_pci_dma_map_sg(pcr, sglist, num_sg, read);
-	if (count < 1)
-		return -EINVAL;
-	pcr_dbg(pcr, "DMA mapping count: %d\n", count);
-
-	err = rtsx_pci_dma_transfer(pcr, sglist, count, read, timeout);
-
-	rtsx_pci_dma_unmap_sg(pcr, sglist, num_sg, read);
-
-	return err;
-}
-EXPORT_SYMBOL_GPL(rtsx_pci_transfer_data);
-
 int rtsx_pci_dma_map_sg(struct rtsx_pcr *pcr, struct scatterlist *sglist,
 		int num_sg, bool read)
 {
@@ -1197,33 +1178,6 @@ void rtsx_pci_disable_oobs_polling(struct rtsx_pcr *pcr)
 
 }
 
-int rtsx_sd_power_off_card3v3(struct rtsx_pcr *pcr)
-{
-	rtsx_pci_write_register(pcr, CARD_CLK_EN, SD_CLK_EN |
-		MS_CLK_EN | SD40_CLK_EN, 0);
-	rtsx_pci_write_register(pcr, CARD_OE, SD_OUTPUT_EN, 0);
-	rtsx_pci_card_power_off(pcr, RTSX_SD_CARD);
-
-	msleep(50);
-
-	rtsx_pci_card_pull_ctl_disable(pcr, RTSX_SD_CARD);
-
-	return 0;
-}
-
-int rtsx_ms_power_off_card3v3(struct rtsx_pcr *pcr)
-{
-	rtsx_pci_write_register(pcr, CARD_CLK_EN, SD_CLK_EN |
-		MS_CLK_EN | SD40_CLK_EN, 0);
-
-	rtsx_pci_card_pull_ctl_disable(pcr, RTSX_MS_CARD);
-
-	rtsx_pci_write_register(pcr, CARD_OE, MS_OUTPUT_EN, 0);
-	rtsx_pci_card_power_off(pcr, RTSX_MS_CARD);
-
-	return 0;
-}
-
 static int rtsx_pci_init_hw(struct rtsx_pcr *pcr)
 {
 	struct pci_dev *pdev = pcr->pci;
diff --git a/drivers/misc/cardreader/rtsx_pcr.h b/drivers/misc/cardreader/rtsx_pcr.h
index 9215d66de00c..8e5951b61143 100644
--- a/drivers/misc/cardreader/rtsx_pcr.h
+++ b/drivers/misc/cardreader/rtsx_pcr.h
@@ -127,7 +127,5 @@ int rtsx_pci_get_ocpstat(struct rtsx_pcr *pcr, u8 *val);
 void rtsx_pci_clear_ocpstat(struct rtsx_pcr *pcr);
 void rtsx_pci_enable_oobs_polling(struct rtsx_pcr *pcr);
 void rtsx_pci_disable_oobs_polling(struct rtsx_pcr *pcr);
-int rtsx_sd_power_off_card3v3(struct rtsx_pcr *pcr);
-int rtsx_ms_power_off_card3v3(struct rtsx_pcr *pcr);
 
 #endif
diff --git a/include/linux/rtsx_pci.h b/include/linux/rtsx_pci.h
index 4612ef09a0c7..3b4c36705a9b 100644
--- a/include/linux/rtsx_pci.h
+++ b/include/linux/rtsx_pci.h
@@ -1312,8 +1312,6 @@ void rtsx_pci_add_cmd(struct rtsx_pcr *pcr,
 		u8 cmd_type, u16 reg_addr, u8 mask, u8 data);
 void rtsx_pci_send_cmd_no_wait(struct rtsx_pcr *pcr);
 int rtsx_pci_send_cmd(struct rtsx_pcr *pcr, int timeout);
-int rtsx_pci_transfer_data(struct rtsx_pcr *pcr, struct scatterlist *sglist,
-		int num_sg, bool read, int timeout);
 int rtsx_pci_dma_map_sg(struct rtsx_pcr *pcr, struct scatterlist *sglist,
 		int num_sg, bool read);
 void rtsx_pci_dma_unmap_sg(struct rtsx_pcr *pcr, struct scatterlist *sglist,
-- 
2.49.0

