Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB74B672
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039261; cv=none; b=RxXZQt5ysjiS7NCkgW77jtNjEV8HhOsXvCah+WqX3WycdO0vH2QsrOobcTJDy990zuHd0hKUn8gbsyImB9mgKXVGwYvQdPVtpWkI2oJ6ruEGsP26+hhkise0G2Plc7Pve24DA0BVWZPgxpGmeiojeceYK7U+Xw6DSQ901M97U0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039261; c=relaxed/simple;
	bh=5hBJ+yZ1skUVSBUyR+lDlhUcb1/3+BW11/OJj3soMEs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XxnAU0eHwh7CD45kG/E/UUkSboULYby4X1IjnAN89dNOJ4WNXv4S8M8f8LD00FYuJoR9Tcc3rXr2Xw58Jx6zDwbRWx6JvDQBHEoJIV9hGJqA9YC//yUWkmR5ReJ6WxETd7lxYtqU/FAAjFJGgnhWK3hlv3DAT1M+X7d0ybThFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=Zt//YHv+; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="Zt//YHv+"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 20063A02DE;
	Mon, 12 May 2025 10:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=ImjZYltpC8UtJ1XqLatuQGpmKeR3ofzGZdgoV3xDUmY=; b=
	Zt//YHv+3bK9+LYybw6czZWiVcQqV43oz+ZFM3nNO9vxkGIfUL+J52lXLmz8++Fk
	hvkKyEjWgA42JgQOzYaISirzmStssm9AnglwWtKqLoqO51LKkt5/MXdxM17Y9xOz
	xPk8ewm7Bch7mK29VQxoIlV7vVrsHn40xIsAovhhrr+t3xWnsUQ/Vyjgg4grdBi8
	qu40vxaKmYMyYx85rJ8cwwZfQPmwFGpW/QULoDRZv8ITyIrJyrTTsT/2+Oa+deWW
	kF7KtNmf2FQbLEtWSvPx6CPw5Xa1pewOVm0IkEk+OIatMnMc23nS0sGQFlf0w6oW
	5kPhAqTIyDYczk+ZCivvOiL3/NmvaPXj/aBkUJtaOR3LyRchdJeiiedCT+iAu7XD
	rvhD+Jb3XO3zHdgodz9HF+ntp1ePXkEdjA1Lm1PXmu9I4I0qDJpZqL+AhhxhzORc
	6uvtPLYyz6mAieKXalW5p0xHEqOD5fcZe1IkJbYNgsFXATGOfcOI37mcnLgg2ujW
	bWDVzkeShjZWAPsNoH6LroiF7+JqC78wpPXSO4bDXKsU9Y4jJ5+Tz7wYkmIZmZut
	Snoy88TYtdkrB2ZuUtZf2kxlUj3QqAcnmI+m9Q5DQtXNQ8ZrsMK/wH2St4Lsilfc
	R/EaIY4afiBeeg7Bgh0vDPqwYDralcSJPgWXzGTIm2M=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3] mtd: Verify written data in paranoid mode
Date: Mon, 12 May 2025 10:40:32 +0200
Message-ID: <20250512084033.69718-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1747039248;VERSION=7990;MC=3341281455;ID=271136;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853617466

Add MTD_PARANOID config option for verifying all written data to prevent
silent bit errors being undetected, at the cost of some bandwidth overhead.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
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
index 5ba9a741f5ac..3f9874cd4126 100644
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
+	if (ret < 0)
+		return ret;
+
+	if (IS_ENABLED(CONFIG_MTD_PARANOID))
+		ret = _mtd_verify(mtd, to, ops->retlen, ops->datbuf);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(mtd_write_oob);
 
 /**

base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
-- 
2.43.0


