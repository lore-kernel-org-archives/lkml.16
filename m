Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119719CD17
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740302; cv=none; b=ZDn2VGMgPc1YVjoLm/lCzYINNHvdjJjJHQcvNv/tDIdhpO9cAZoCKM3C7rLy8y8itEYyhJ0UpmhdplVdkp4r7ZBtapkPjApgdZlJEg2enFBlHIqAWR80nTG3hSP/Q+kdsHNnMjdLmXHP+QyqOi9Wl7hkyfWmV1MS2cysSJRAS3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740302; c=relaxed/simple;
	bh=E1rWl2YoYmsGcXl8Vm+E/bjBaHOcGMh8w3W/dKHDJJU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=icrqFKuQof2Lld0dY+o3kmjAPkut+LTmgs5WZ4UR/dTJ7C79ZQcH//2zneeUl/cticmWDecNI2TU1Ly5IfcSV7o0irrKLqXqi7UV1JJSaXUu5jksvva7ik1Mp+i8Ia81fB+GX7hKM46HFDxRM4ZW1KTVu6VB7jUNVIXzgM/jdso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=jhjgINil; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="jhjgINil"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BD2EEA033A;
	Tue, 15 Apr 2025 20:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=sPS8nj2wBTS7IxcXsWDBnWC5IdTmxtmClDTDfzz4lXs=; b=
	jhjgINil9atXgMLsXfj/xug9qfrTEqP4k8IuuvkmvwH6R03Hc8XLh0p1BAIMjQ/l
	Ey2x2bH8GAkvakXDj7Q69lNuYI04D+V1HB36pmzyFY6MMHVcllJkiw+ppwBzpA2A
	JmOuWYgSj99eIk7n26pE8KUDR+Jhz2qbw4/K2NFf2r7nErYLlARbx3A5A0n+Akh6
	mFrcDGuCf3VZqfDUaYR5h62zl00Ef49r/JuMSy7n46LDXj4rU+mu0exwwoyPSFlz
	oqEMc78RE8N7e4QrGZ7Qsm/JOSmXT5mb6F0F1EXT3ET+g33lM+YuDXZX/eLiHjDT
	D5+MBOW+gh9Y2DylR9biM+dIZNyGtjZ2cc9Z1ZlDgYtMUUbFsIoqYYmOp0wWM4mw
	TlDj92NF63S+anebINtZUpexrGB9O8clFfqQws8viNtbgspdfok1OdXifYXoPn9e
	Zg5xwf7W5rPWKoY2VVgHu1or7cU20RcK887/TI80nlX9nFW2gtPxWVcUUy3GimDc
	BcmHOcxSpG2yesN49mfWLq90YgrHZu2FOglM1ItPS1HcAljgUG2VwQGSrBSTq3MA
	NpAUWvhrGNDDcZJZAaNitflvdRwJ6b694dyEpgFLskzPsRjQuYGTNQUDZHk+vaFF
	t5l8oFJ97Wpfo7c3aZidUBqRgigbOVKEbWDMGapnK9w=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] spi-nor: Verify written data in paranoid mode
Date: Tue, 15 Apr 2025 20:04:32 +0200
Message-ID: <20250415180434.513405-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1744740288;VERSION=7989;MC=1442698083;ID=77153;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647662

From: Csókás, Bence <csokas.bence@prolan.hu>

Add MTD_SPI_NOR_PARANOID config option for verifying all written data to
prevent silent bit errors to be undetected, at the cost of halving SPI
bandwidth.

Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/mtd/spi-nor/Kconfig | 10 ++++++++++
 drivers/mtd/spi-nor/core.c  | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 24cd25de2b8b..425ea9a22424 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -68,6 +68,16 @@ config MTD_SPI_NOR_SWP_KEEP
 
 endchoice
 
+config MTD_SPI_NOR_PARANOID
+	bool "Read back written data (paranoid mode)"
+	help
+	  This option makes the SPI NOR core read back all data on a write
+	  and report an error if it doesn't match the written data. This can
+	  safeguard against silent bit errors resulting from a faulty Flash,
+	  controller oddities, bus noise etc.
+
+	  If you are unsure, select 'n'.
+
 source "drivers/mtd/spi-nor/controllers/Kconfig"
 
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..ca05a6ec8afe 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2063,6 +2063,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	u_char *verify_buf = NULL;
 	size_t i;
 	ssize_t ret;
 	u32 page_size = nor->params->page_size;
@@ -2073,6 +2074,14 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
+#if IS_ENABLED(CONFIG_MTD_SPI_NOR_PARANOID)
+	verify_buf = devm_kmalloc(nor->dev, page_size, GFP_KERNEL);
+	if (!verify_buf) {
+		ret = -ENOMEM;
+		goto write_err;
+	}
+#endif
+
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
@@ -2099,11 +2108,35 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		ret = spi_nor_wait_till_ready(nor);
 		if (ret)
 			goto write_err;
+
+#if IS_ENABLED(CONFIG_MTD_SPI_NOR_PARANOID)
+		/* read back to make sure it's correct */
+		ret = spi_nor_read_data(nor, addr, written, verify_buf);
+		if (ret < 0)
+			goto write_err;
+		if (ret != written) {
+			/* We shouldn't see short reads */
+			dev_err(nor->dev, "Verify failed, written %zd but only read %zd",
+				written, ret);
+			ret = -EIO;
+			goto write_err;
+		}
+
+		if (memcmp(verify_buf, buf + i, written)) {
+			dev_err(nor->dev, "Verify failed, compare mismatch!");
+			ret = -EIO;
+			goto write_err;
+		}
+#endif
+
+		ret = 0;
+
 		*retlen += written;
 		i += written;
 	}
 
 write_err:
+	devm_kfree(nor->dev, verify_buf);
 	spi_nor_unlock_and_unprep_pe(nor, to, len);
 
 	return ret;

base-commit: 834a4a689699090a406d1662b03affa8b155d025
-- 
2.49.0


