Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE082874E5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729566; cv=none; b=o04DzJCJqChfnd6+alWJRAK9m67M0X2tjTYw3EzmvPh9CTK5IATg+ylioXLrVEd5m1KZVfTFhEQxDV7fSiJbKEHFTyjKNtMkNR3d3coFENWiQcS3fnozEeURCBrJggQQpqRXDlPFA55oow43RHsANO3qljE5/QWdZLy2yVOrrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729566; c=relaxed/simple;
	bh=Np+KzvnxNMm8BOqHv7WffUtm+ne1DIjG/00wHz+OJ0A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fYGWa7JWI4NwrmKtyswE3grsTn5YmGJ6jfyEhSjq3ZngnhKyNGw6LYPLylkSlPEQr/hKFzVA+f1WC9Kz0yS3KHWpw23ln72z5XAW/fyGnzc+HeAurv8tYRD7t8BaRKGkavF0oO+PLHHQNrGZ96ih0+ncGFKixkrdgXW4Rcnhv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=qSdAdYpD; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="qSdAdYpD"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 3659FA0780;
	Thu,  8 May 2025 20:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=6nb2cCPK5LUfQe9tE52LNNxXl3+TZ5aWJppwBidSKUA=; b=
	qSdAdYpDUUJNE/vqy7gs09hYUg+hlZLscu8jMLH6KwUNPl8489698KT8re2qw0fU
	PUYCSdbLf1oOPuYT3Sfnnw8TUrkymiPVgejF0lyLesiop5hN0yXyaNczzmBdxhLz
	DwpLsSmdEPIi/wnALPMQHJ+3sWpTQxbj/4afJvt6UMpWpR88+T72t/Qj/0feuuox
	GyiL3mBnguzFcn4yBHlVYN0VhE0JWo0aBtvHICfg9jk9BUrh3drYOaN0L+qc5+kB
	JsRSlF8APf3nAsdn6NVpIqghzRnGopKqGWN+3WUAeIi+QXZouAhbQx9l8nTBEis8
	0xsRlRYc6F8041gj6HDwEWZLPrvlxplUs/zPbum5J9Uug4Yl64gCUcE/WqkTEIOu
	CI2682NuBrzxBM6GYoGdblDOgB9O+f6UKDvavw2m3zf2hCwtVhhkmR0OYSH453oe
	8i2sEKZym2SobQEzFW9tdl2fEkQNigR5DklJkStMKlK5xKTefIDO6NI/Gm5j3oro
	7pBMB/ETbNu6ygRPSmRbKNIfOMkLdgovgzSa/iPvDXCAQnNX7HqLntZauxNPuxJB
	uV0a6RgEhJ3mPxa75Ck1MEqWkDEqAZPr3ZwgREOTXeXRUS8FQmsTjFj780YRPv6B
	1RQiQBOwlk+KhQOClGo+K74mczSnVGh5AWUpkX76MEc=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Michael
 Walle" <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2] mtd: Verify written data in paranoid mode
Date: Thu, 8 May 2025 20:37:34 +0200
Message-ID: <20250508183733.514124-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1746729557;VERSION=7990;MC=2616487500;ID=244882;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667D62

From: Csókás, Bence <csokas.bence@prolan.hu>

Add MTD_PARANOID config option for verifying all written data to prevent
silent bit errors being undetected, at the cost of some bandwidth overhead.

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * refactor to be in mtdcore instead of spi-nor core

 drivers/mtd/Kconfig   | 14 ++++++++++++
 drivers/mtd/mtdcore.c | 51 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 796a2eccbef0..e75f4a57df6a 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -206,6 +206,20 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_PARANOID
+	bool "Read back written data (paranoid mode)"
+	help
+	  This option makes the MTD core read back all data on a write and
+	  report an error if it doesn't match the written data. This can
+	  safeguard against silent bit errors resulting from a faulty Flash,
+	  controller oddities, bus noise etc.
+
+	  It is up to the layer above MTD (e.g. the filesystem) to handle
+	  this condition, for example by going read-only to prevent further
+	  data corruption, or to mark a certain region of Flash as bad.
+
+	  If you are unsure, select 'n'.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..139cbac51132 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1745,8 +1745,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 }
 EXPORT_SYMBOL_GPL(mtd_read_oob);
 
-int mtd_write_oob(struct mtd_info *mtd, loff_t to,
-				struct mtd_oob_ops *ops)
+static int _mtd_write_oob(struct mtd_info *mtd, loff_t to,
+			  struct mtd_oob_ops *ops)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
@@ -1771,6 +1771,53 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 
 	return mtd_write_oob_std(mtd, to, ops);
 }
+
+static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, const u8 *buf)
+{
+	struct device *dev = &mtd->dev;
+	u_char *verify_buf;
+	size_t r_retlen;
+	int ret;
+
+	verify_buf = devm_kmalloc(dev, len, GFP_KERNEL);
+	if (!verify_buf)
+		return -ENOMEM;
+
+	ret = mtd_read(mtd, to, len, &r_retlen, verify_buf);
+	if (ret < 0)
+		goto err;
+
+	if (len != r_retlen) {
+		/* We shouldn't see short reads */
+		dev_err(dev, "Verify failed, written %zd but only read %zd",
+			len, r_retlen);
+		ret = -EIO;
+		goto err;
+	}
+
+	if (memcmp(verify_buf, buf, len)) {
+		dev_err(dev, "Verify failed, compare mismatch!");
+		ret = -EIO;
+	}
+
+err:
+	devm_kfree(dev, verify_buf);
+	return ret;
+}
+
+int mtd_write_oob(struct mtd_info *mtd, loff_t to,
+		  struct mtd_oob_ops *ops)
+{
+	int ret = _mtd_write_oob(mtd, to, ops);
+
+#if IS_ENABLED(CONFIG_MTD_PARANOID)
+	if (ret < 0)
+		return ret;
+
+	ret = _mtd_verify(mtd, to, ops->retlen, ops->datbuf);
+#endif // CONFIG_MTD_PARANOID
+	return ret;
+}
 EXPORT_SYMBOL_GPL(mtd_write_oob);
 
 /**

base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
-- 
2.49.0


