Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED520371A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660627; cv=none; b=RP+RLicQj01LBAyuijnB01EYAeJF3MvIHD4yYMJKKQLPJRNyC9PwAWE0qGhvuh037hWhSYTSZhmrP+IHjZRKYopnAjBHF9WflPSenEM15sPm93qNHXM9P2h7J0n0UJt7u/HdwWHVXLP9owIU3SvsstD3qT2Fn2+An+CSs/alO1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660627; c=relaxed/simple;
	bh=BAyQM8yTu34BvR4X/1EfMyzdhNCFZA53yLIxmZ2iCm0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lsb1hmK9j0xsU+eWF4f0xvPSS5Xgc2n5pxy8okuhWP9FfHpPQNeHPWkQCY99zTAmSPleRGgFuxE00fERMviQk2IlT4JqhhbRzg+PqwPr+IEeJHQpmRUSmEtNmHHN4ZPYBl0tuRp8z8pmWpz89GSWeTqhg2OgDi4qM4SqdrbcpiY=
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
Subject: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg pointer in i2c_xfers API
Date: Tue, 4 Feb 2025 17:17:01 +0800
Message-ID: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The change is necessary to enable the use of the
`i2c_get_dma_safe_msg_buf()` API, which requires a non-const
`struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
ensures safe handling of I2C messages when using DMA, making it essential
for scenarios where DMA transfers are involved. By removing the `const`
qualifier, this patch allows drivers to prepare and manage DMA-safe
buffers directly.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/i3c/master/dw-i3c-master.c     | 2 +-
 drivers/i3c/master/i3c-master-cdns.c   | 2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
 drivers/i3c/master/svc-i3c-master.c    | 2 +-
 include/linux/i3c/master.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d09ea5b6467c..54c7d86997d5 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1079,7 +1079,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
 }
 
 static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				   const struct i2c_msg *i2c_xfers,
+				   struct i2c_msg *i2c_xfers,
 				   int i2c_nxfers)
 {
 	struct dw_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8d69a34986d9..c9e4c129454c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -813,7 +813,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				     const struct i2c_msg *xfers, int nxfers)
+				     struct i2c_msg *xfers, int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index e6e482a259b4..a408feac3e9e 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -367,7 +367,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
-			     const struct i2c_msg *i2c_xfers, int nxfers)
+			     struct i2c_msg *i2c_xfers, int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index c1ee3828e7ee..24bd701b5de0 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1584,7 +1584,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 }
 
 static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
-				    const struct i2c_msg *xfers,
+				    struct i2c_msg *xfers,
 				    int nxfers)
 {
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 12d532b012c5..c67922ece617 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -475,7 +475,7 @@ struct i3c_master_controller_ops {
 	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,
-			 const struct i2c_msg *xfers, int nxfers);
+			 struct i2c_msg *xfers, int nxfers);
 	int (*request_ibi)(struct i3c_dev_desc *dev,
 			   const struct i3c_ibi_setup *req);
 	void (*free_ibi)(struct i3c_dev_desc *dev);
-- 
2.25.1

