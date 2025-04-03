Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B7245017
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671970; cv=none; b=RjXxUQ/blc2UK44XYXucxZ1tAA8BnJYR47F2Y1FoF9xl+T6oE78/Qynwl5+HJdn6jHeMy0AdXT9gPonEqBnt07wY+K7yFGMzU6uT6/mw/76HsrLLoIQGELt+RtS5HoNt0UvmLeX8SlpeovYXARFfJOO4NzjaUfmwlfqR0dXsetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671970; c=relaxed/simple;
	bh=NBeJ/JVUV4QjbMBnUi/35u2iDDK5W0wB2M5P2qtbB10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDM3bz8n5mFBjloEN7ZG37Y03Ejqh8tsJCPP39rzHo8dHh6SkYqhimmkbi0JjpvLeCbiuw1Ref+7DCDy3qruanag4nZmPKkJvtt6xAQFSp71aM7t39S4uPk3YKPfD/K1brMNlKukFfsPnP+xO8uXMX2hV6y8Gfc19CHOngXM7T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R0JcOjVu; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R0JcOjVu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E005E4320C;
	Thu,  3 Apr 2025 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YI9j+ftEjhjLP0MmkNGvbT2AUTqL13f3bD/bPmrRDWI=;
	b=R0JcOjVukolnjEver+G/aWoUS1fBXV5VeIg+2rSOgsvlsFnuYLwrwfI2+GXJ6KPLtNbaLs
	qfH6+NXrHQ31+Ea22IO4lyfcg2fnjS1xqQ96x+9nC7RAi9ywDU3OuklFzSuTs+yFZuRNcH
	5Dvih606jrkKoN4KYFydN/Uveejwuo+Lq3BEFxmPhQGR5Q1370AAkucuNdbQbRBARj2ova
	L3PIvtyKyRsj0bbmPjQm2ptvvVzTQ/+jgX7MWRq8a8bxNUvRuN61PnwpYLp1D8WzG54jpk
	lIU5dKMMe5ksrFWH6ErnEn+u5hPwuNhApUM795rq8B8cYSEl4EzMYVVP1n9F8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:14 +0200
Subject: [PATCH v2 04/19] mtd: spinand: Use more specific naming for the
 get/set feature ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-4-7846bd88fe83@bootlin.com>
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgus
 ehnohgurdgrthdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshdqkheisehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

SPI operations have been initially described through macros implicitly
implying the use of a single SPI SDR bus. Macros for supporting dual and
quad I/O transfers have been added on top, generally inspired by vendor
naming, followed by DTR operations. Soon we might see octal
and even octal DTR operations as well (including the opcode byte).

Let's clarify what the macro really mean by describing the expected bus
topology in the get/set feature macro names.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c       | 6 +++---
 drivers/mtd/nand/spi/gigadevice.c | 4 ++--
 drivers/mtd/nand/spi/micron.c     | 2 +-
 drivers/mtd/nand/spi/toshiba.c    | 2 +-
 drivers/mtd/nand/spi/winbond.c    | 2 +-
 include/linux/mtd/spinand.h       | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index cde7f0f08c1e45106ebba3b027b620fb8bb7cc51..b6c0993206ebab1dcee715ea6de33efe7d5af3a2 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -22,7 +22,7 @@
 
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(reg,
 						      spinand->scratchbuf);
 	int ret;
 
@@ -36,7 +36,7 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 
 int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
+	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(reg,
 						      spinand->scratchbuf);
 
 	*spinand->scratchbuf = val;
@@ -539,7 +539,7 @@ static int spinand_wait(struct spinand_device *spinand,
 			unsigned long poll_delay_us,
 			u8 *s)
 {
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(REG_STATUS,
 						      spinand->scratchbuf);
 	u8 status;
 	int ret;
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index d620bb02a20a0df04e8d0af187ee277d6ef430f2..73a483227831518a480dc34de17efdaa398b5627 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -185,7 +185,7 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
 						      spinand->scratchbuf);
 	int ret;
 
@@ -228,7 +228,7 @@ static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
 						      spinand->scratchbuf);
 	int ret;
 
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index ad0bb9755a099dc668e4a0b0a56928f968fba824..6ec20fad837bc534cfa0bc7cc629622a7dfab5da 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -131,7 +131,7 @@ static const struct mtd_ooblayout_ops micron_4_ooblayout = {
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(MICRON_DIE_SELECT_REG,
+	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(MICRON_DIE_SELECT_REG,
 						      spinand->scratchbuf);
 
 	if (target > 1)
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 2e2106b2705f0852aa5b13263d29d8916c1a6e7d..a600aa771519fa04a1caafb8c8e636eab10359c4 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -73,7 +73,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 8394a1b1fb0c125ddb614269069d107463e905a3..5816b489b57b0070ddeda745cf17c04efc5080cd 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -146,7 +146,7 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 47c8c148a019396134ddd2aa3f5c6ddd039a4af6..a9e2500d941ecd68891c5dd324944fc8950f1dba 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -38,13 +38,13 @@
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
-#define SPINAND_SET_FEATURE_OP(reg, valptr)				\
+#define SPINAND_SET_FEATURE_1S_1S_1S_OP(reg, valptr)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x1f, 1),				\
 		   SPI_MEM_OP_ADDR(1, reg, 1),				\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, valptr, 1))
 
-#define SPINAND_GET_FEATURE_OP(reg, valptr)				\
+#define SPINAND_GET_FEATURE_1S_1S_1S_OP(reg, valptr)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0f, 1),				\
 		   SPI_MEM_OP_ADDR(1, reg, 1),				\
 		   SPI_MEM_OP_NO_DUMMY,					\

-- 
2.48.1

