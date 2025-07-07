Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B428B511;
	Mon,  7 Jul 2025 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879172; cv=none; b=praQgSDwzoCWLtxOObMd47LYhAwBLtWdNuDSRJHBfgPYkRLlbxidjGkhszkkk3Y42yBElbMVUpQuE+Rs+jXX0n05PLv04xPaawgWUNm9kZf2Fd6blm7dRwv34AKS/hSJUfKDqcADK4bNOWWUMblkPz6a2KiggqBIeILQCW8P8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879172; c=relaxed/simple;
	bh=qk6AFaouc956CSAvxZJyCinyntTHr5dXIoYc9dCfJrg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=haDW4SVNEK/Cm7oSbgSnfaIRk0CQAmaPmGSaZHRlL0RuR7vrbm8JUO/p2a7gHLSmXktFM7ZP/2s391EFfouvCVmHzcRh1SoCFFp2WiXCkOITS41JziKMLQcusThFHxKwOEumpn6iVtg1/A9xDMK1XdQnt99JixrlxfsLEKSUUXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NPrJRWXz; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NPrJRWXz"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56795iag817152;
	Mon, 7 Jul 2025 04:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751879144;
	bh=w8PTfQBhZTHmoOcNsBY2FL7mzH3JijfsAWMnMuG1KUI=;
	h=From:To:CC:Subject:Date;
	b=NPrJRWXzA70HtT7+HHDJEncLjdLonQdHBcZAfChT5exFzl4ilXyxW3kVDQAdAUwha
	 EITz68DGd1tMEMK3x1nv69OclAyqN1cbRSfrZa2v4eBtn9gRhyEbtaP/Xck6nUR1px
	 ZH65Rx3FLOvvNvq4PLka27njEIoAfO3O6+LANImQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56795ioX282160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 04:05:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 04:05:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 04:05:43 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56795c8o3787182;
	Mon, 7 Jul 2025 04:05:38 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>, <navada@ti.com>,
        <13916275206@139.com>, <v-hampiholi@ti.com>, <v-po@ti.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Fix calibration data parser issue
Date: Mon, 7 Jul 2025 17:05:13 +0800
Message-ID: <20250707090513.1462-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

We will copy calibration data from position behind to front.
We has created a variable (tmp_val) point on top of calibration data
buffer, and tmp_val[1] is max of node number in original calibration
data structure, it will be overwritten after first data copy,
so can't be used as max node number check in for loop.
So we create a new variable to save max of node number (tmp_val[1]),
used to check if max node number was reached in for loop.
And a point need to be increased to point at calibration data in node.
Data saved position also need to be increased one byte.

Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
Change in v2:
 - Add more description about this fix.
---
 sound/pci/hda/tas2781_hda.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda.c b/sound/pci/hda/tas2781_hda.c
index 5f1d4b3e9688..34217ce9f28e 100644
--- a/sound/pci/hda/tas2781_hda.c
+++ b/sound/pci/hda/tas2781_hda.c
@@ -44,7 +44,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x13, 0x70),
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
-	unsigned int crc, oft;
+	unsigned int crc, oft, node_num;
 	unsigned char *buf;
 	int i, j, k, l;
 
@@ -80,8 +80,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 			dev_err(p->dev, "%s: CRC error\n", __func__);
 			return;
 		}
+		node_num = tmp_val[1];
 
-		for (j = 0, k = 0; j < tmp_val[1]; j++) {
+		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
@@ -99,8 +100,9 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 				}
 
 				data[l] = k;
+				oft++;
 				for (i = 0; i < TASDEV_CALIB_N * 4; i++)
-					data[l + i] = data[4 * oft + i];
+					data[l + i + 1] = data[4 * oft + i];
 				k++;
 			}
 		}
-- 
2.43.0

