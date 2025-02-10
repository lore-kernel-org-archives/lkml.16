Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A125291D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198670; cv=none; b=gZOLVmBEzVuEy2Cd9WJ7sKXNvq+dHoMwZUW5j7BA7esJ84y/gPQEV/0icQNR2AOZ3P3VKc2YX4xJM54a2NVA/P3etRlMLVVuan7+1gjdFEDFduBWz2b3Ud6mOfyub5yww41/7U3dhRKDmPX8tjE6/cPRUa9cal+g5JeSq+fppC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198670; c=relaxed/simple;
	bh=ppMbnCRWPsfQbJrEQKyqp8woC+/d4djc4c6CY0GQa0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDrmf8y0J7MrW9Zc9aD1eSAcZ2dqap3xqU09mTJb8NXk7qBzHRYjrRS43mZQYL9tnTlhf5PjfnXOB/sn00mcrSIJHF81znq2oLwRJ44yauhofiZ6UZg/LltuHka6qT8B7EPFkRRVfzJ0bvNUk8O0B3+MI9jU23Fnx+juZ5pwdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=f5Gk/fkc; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="f5Gk/fkc"
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E7F0512000A;
	Mon, 10 Feb 2025 17:34:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E7F0512000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198081;
	bh=gliwmRdogZU9sIlqZabr1bwcTTR24V3Y3ITQxHOj+S0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=f5Gk/fkcs9Jj/SPL1SvHIN/wbz3MqMocd/s4MSBfYdNI2/YhPjeGn4KnvPIKKqLV6
	 0n/KYf6UWNqYkl0N0v1QLuKm1CuiA8h0gpslbOFCEApg+d3AIm9ywbnHsMs6ZoTfCO
	 ReF17lpfzoxozfpdu9hQgHEjKuFJ4D8AcTFkKUuoffCUeCScSaOE3nrgE5h8SRxmRn
	 +ajwv0snAfKXhH+z95rM3hy38bQkDKxK0aiNbfV1oQjFDShDURQQpo2+7tLan+SQYd
	 eDZNci98KPSSVrdnf60jj4/SbHm983N/ZYHa8DmUqR99n0zxnl8/S6huysvVpQ+jvR
	 diwgNj8C/98Ng==
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
Subject: [PATCH v5 6/6] mtd: spinand: esmt: OTP access for F50{L,D}1G41LB
Date: Mon, 10 Feb 2025 17:34:18 +0300
Message-ID: <20250210143429.286803-7-mmkurbanov@salutedevices.com>
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
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped

Support for OTP area access on ESMT F50L1G41LB and F50D1G41LB chips.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/esmt.c | 90 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 323a20901fc9..a164d821464d 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -8,10 +8,15 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
+#include <linux/spi/spi-mem.h>
 
 /* ESMT uses GigaDevice 0xc8 JECDEC ID on some SPI NANDs */
 #define SPINAND_MFR_ESMT_C8			0xc8
 
+#define ESMT_F50L1G41LB_CFG_OTP_PROTECT		BIT(7)
+#define ESMT_F50L1G41LB_CFG_OTP_LOCK		\
+	(CFG_OTP_ENABLE | ESMT_F50L1G41LB_CFG_OTP_PROTECT)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
@@ -102,6 +107,83 @@ static const struct mtd_ooblayout_ops f50l1g41lb_ooblayout = {
 	.free = f50l1g41lb_ooblayout_free,
 };
 
+static int f50l1g41lb_otp_info(struct spinand_device *spinand, size_t len,
+			       struct otp_info *buf, size_t *retlen, bool user)
+{
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	buf->locked = 0;
+	buf->start = 0;
+	buf->length = user ? spinand_user_otp_size(spinand) :
+			     spinand_fact_otp_size(spinand);
+
+	*retlen = sizeof(*buf);
+	return 0;
+}
+
+static int f50l1g41lb_fact_otp_info(struct spinand_device *spinand, size_t len,
+				    struct otp_info *buf, size_t *retlen)
+{
+	return f50l1g41lb_otp_info(spinand, len, buf, retlen, false);
+}
+
+static int f50l1g41lb_user_otp_info(struct spinand_device *spinand, size_t len,
+				    struct otp_info *buf, size_t *retlen)
+{
+	return f50l1g41lb_otp_info(spinand, len, buf, retlen, true);
+}
+
+static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
+			       size_t len)
+{
+	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_OP(0);
+	u8 status;
+	int ret;
+
+	ret = spinand_upd_cfg(spinand, ESMT_F50L1G41LB_CFG_OTP_LOCK,
+			      ESMT_F50L1G41LB_CFG_OTP_LOCK);
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
+	if (spinand_upd_cfg(spinand, ESMT_F50L1G41LB_CFG_OTP_LOCK, 0)) {
+		dev_warn(&spinand_to_mtd(spinand)->dev,
+			 "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct spinand_user_otp_ops f50l1g41lb_user_otp_ops = {
+	.info = f50l1g41lb_user_otp_info,
+	.lock = f50l1g41lb_otp_lock,
+	.read = spinand_user_otp_read,
+	.write = spinand_user_otp_write,
+};
+
+static const struct spinand_fact_otp_ops f50l1g41lb_fact_otp_ops = {
+	.info = f50l1g41lb_fact_otp_info,
+	.read = spinand_fact_otp_read,
+};
+
 static const struct spinand_info esmt_c8_spinand_table[] = {
 	SPINAND_INFO("F50L1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01, 0x7f,
@@ -112,7 +194,9 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL),
+		     SPINAND_USER_OTP_INFO(28, 2, &f50l1g41lb_user_otp_ops),
+		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
 	SPINAND_INFO("F50D1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
 				0x7f, 0x7f),
@@ -122,7 +206,9 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL),
+		     SPINAND_USER_OTP_INFO(28, 2, &f50l1g41lb_user_otp_ops),
+		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
 	SPINAND_INFO("F50D2G41KA",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51, 0x7f,
 				0x7f, 0x7f),
-- 
2.43.0

