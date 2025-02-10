Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3225290C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198087; cv=none; b=lQBVOg5VdmjSblMKvMsQBLDrLhTTQdZairHIdoLyQ5xIZac/00gUMKCQxGLWlGeDmuJ1W1t/x6r/X/AsQolxugFpTOvS1jLLCALXf39NkuBNU12/OGy/URJm02+Rt2GJW+Kdo8mxtlikfAV12gFnBzNxI8kbiY6jcriVHioARtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198087; c=relaxed/simple;
	bh=/60RgTYHxQgFgzBx/BM1nFoMhTCYC+jCH5b2PW/CPVc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Va0iKilh8eXqf9hw4GHka54DOiwVuaypIVPsrXexlH4bVOHaI5xMUZFmkBsJQBOHrX/n496zooj0YvB1KTdCXrK3TG64bLRx29C9bYv6fjmNnKNVc2g+oARW+mUSNRyh8ri4DP9tUt0SCgqOYio6Fpvh2VjxPULipqfWc2ASRDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=mBBT2gBe; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="mBBT2gBe"
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9A599100011;
	Mon, 10 Feb 2025 17:34:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9A599100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198081;
	bh=8Npi5ICtdHGE59yU+1lXTbebyRWbRHkSKnFbUDAOh08=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mBBT2gBei2W6I3zRNno/mZVCSYuh6GDD9F4cMsxP8/Y2FYeXwAdzHsqjTJgReVtTH
	 VWbfxwEuRGI/pvzJFyMRi4NElrU06IP3p181PUM07ObUYSUke7NE7/Pd29I1aQlpDS
	 oZqYraYBNbGq52WdvCnzIucwHZMp9f4vaCcTpnrX163x13amxanTpHJYL62RAVId/K
	 07DXUI/nBRmm8Bme0Cx0DJyR6J/NrhCbe/aP0VFUmJiS+ZQJF5e5va9o9Tb1IVZos6
	 41yLHADjEhyaHJiapwIODXae4wJojT7DZ6RMWcRPcQ7tQwpBsbCeKrOiBPo9Evltsl
	 WkFwDmGJz0KXw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 17:34:41 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v5 5/6] mtd: spinand: micron: OTP access for MT29F2G01ABAGD
Date: Mon, 10 Feb 2025 17:34:17 +0300
Message-ID: <20250210143429.286803-6-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
References: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190904 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped

Support for OTP area access on Micron MT29F2G01ABAGD chip.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/micron.c | 135 +++++++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index ad0bb9755a09..691f8a2e0791 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -9,6 +9,8 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/string.h>
 
 #define SPINAND_MFR_MICRON		0x2c
 
@@ -28,6 +30,10 @@
 
 #define MICRON_SELECT_DIE(x)	((x) << 6)
 
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_STATE		BIT(7)
+#define MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK		\
+	(CFG_OTP_ENABLE | MICRON_MT29F2G01ABAGD_CFG_OTP_STATE)
+
 static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -168,6 +174,131 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int mt29f2g01abagd_otp_is_locked(struct spinand_device *spinand)
+{
+	size_t bufsize = spinand_otp_page_size(spinand);
+	size_t retlen;
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_STATE);
+	if (ret)
+		goto free_buf;
+
+	ret = spinand_user_otp_read(spinand, 0, bufsize, &retlen, buf);
+
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			    0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	if (ret)
+		goto free_buf;
+
+	/* If all zeros, then the OTP area is locked. */
+	if (mem_is_zero(buf, bufsize))
+		ret = 1;
+
+free_buf:
+	kfree(buf);
+	return ret;
+}
+
+static int mt29f2g01abagd_otp_info(struct spinand_device *spinand, size_t len,
+				   struct otp_info *buf, size_t *retlen,
+				   bool user)
+{
+	int locked;
+
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	locked = mt29f2g01abagd_otp_is_locked(spinand);
+	if (locked < 0)
+		return locked;
+
+	buf->locked = locked;
+	buf->start = 0;
+	buf->length = user ? spinand_user_otp_size(spinand) :
+			     spinand_fact_otp_size(spinand);
+
+	*retlen = sizeof(*buf);
+	return 0;
+}
+
+static int mt29f2g01abagd_fact_otp_info(struct spinand_device *spinand,
+					size_t len, struct otp_info *buf,
+					size_t *retlen)
+{
+	return mt29f2g01abagd_otp_info(spinand, len, buf, retlen, false);
+}
+
+static int mt29f2g01abagd_user_otp_info(struct spinand_device *spinand,
+					size_t len, struct otp_info *buf,
+					size_t *retlen)
+{
+	return mt29f2g01abagd_otp_info(spinand, len, buf, retlen, true);
+}
+
+static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
+				   size_t len)
+{
+	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_OP(0);
+	u8 status;
+	int ret;
+
+	ret = spinand_upd_cfg(spinand,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK,
+			      MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK);
+	if (!ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &write_op);
+	if (!ret)
+		goto out;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (!ret)
+		goto out;
+
+	ret = spinand_wait(spinand,
+			   SPINAND_WRITE_INITIAL_DELAY_US,
+			   SPINAND_WRITE_POLL_DELAY_US,
+			   &status);
+	if (!ret && (status & STATUS_PROG_FAILED))
+		ret = -EIO;
+
+out:
+	if (spinand_upd_cfg(spinand, MICRON_MT29F2G01ABAGD_CFG_OTP_LOCK, 0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct spinand_user_otp_ops mt29f2g01abagd_user_otp_ops = {
+	.info = mt29f2g01abagd_user_otp_info,
+	.lock = mt29f2g01abagd_otp_lock,
+	.read = spinand_user_otp_read,
+	.write = spinand_user_otp_write,
+};
+
+static const struct spinand_fact_otp_ops mt29f2g01abagd_fact_otp_ops = {
+	.info = mt29f2g01abagd_fact_otp_info,
+	.read = spinand_fact_otp_read,
+};
+
 static const struct spinand_info micron_spinand_table[] = {
 	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD",
@@ -179,7 +310,9 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &x4_update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
-				     micron_8_ecc_get_status)),
+				     micron_8_ecc_get_status),
+		     SPINAND_USER_OTP_INFO(12, 2, &mt29f2g01abagd_user_otp_ops),
+		     SPINAND_FACT_OTP_INFO(2, 0, &mt29f2g01abagd_fact_otp_ops)),
 	/* M79A 2Gb 1.8V */
 	SPINAND_INFO("MT29F2G01ABBGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
-- 
2.43.0

