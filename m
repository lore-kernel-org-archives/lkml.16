Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A31207A14
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660629; cv=none; b=ER59T+7wociD4qyy90Qb8BszNGuRv0PDOXLi71KgLuTRCGEg9Ccr7UDw1QpJEwbT8/eDkQSow71zkbej/4p+wuoxHR7JetEF1WtEmlIF3usVpAhSjq/BhUlC8kqHBZb26+dv4HFdye5F3+IneXbOwREzko5jdM8ArORofbvDI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660629; c=relaxed/simple;
	bh=KaaXi7jBeslj8uzUn1WZyt0PmaZYa9IShPOp11fzkf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOCk8buLeGwpiRaGE+WFTGl54SI4FjFN8oYfsBll11tjiTUOluhA9HrsjdiCSNu/+V//Wai4qSbDIRbFnXUj27P1TnBGaQaHre6qDveEa7w/If9VUNH9o5kSPkkm5Ltrhn9mchAjsU42Sxu23zkM475Ig9HdJyJYQxEj0USmEtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Feb
 2025 17:17:02 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Feb 2025 17:17:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <alexandre.belloni@bootlin.com>, <pgaj@cadence.com>,
	<miquel.raynal@bootlin.com>, <conor.culhane@silvaco.com>,
	<aniketmaurya@google.com>, <billy_tsai@aspeedtech.com>,
	<Shyam-sundar.S-k@amd.com>, <jarkko.nikula@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>, <xiaopei01@kylinos.cn>,
	<Guruvendra.Punugupati@amd.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
Date: Tue, 4 Feb 2025 17:17:02 +0800
Message-ID: <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
the I3C-specific API.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index a408feac3e9e..4f3738beb0f2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -382,14 +382,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < nxfers; i++) {
-		xfer[i].data = i2c_xfers[i].buf;
+		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
 		xfer[i].data_len = i2c_xfers[i].len;
 		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
 		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
 		xfer[i].cmd_desc[0] |= CMD_0_ROC;
-		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
-		if (ret)
-			goto out;
 	}
 	last = i - 1;
 	xfer[last].cmd_desc[0] |= CMD_0_TOC;
@@ -412,7 +409,8 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
 
 out:
 	for (i = 0; i < nxfers; i++)
-		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
+		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
+					 ret ? false : true);
 
 	hci_free_xfer(xfer, nxfers);
 	return ret;
-- 
2.25.1

