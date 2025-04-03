Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378B24503B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671971; cv=none; b=WmI/qp/1waihGqMxiurBb/rd2EDYjLnwEgQ0IkM3rstK0yByefTWXxqwOVLoU0V+Da1e8ElFtFpbggIPPcRbB3W2kbsZ48v60PfKdfdJ0QxqJCFqycsjxlHCPEl85MHrNVeNyo5QKe7ySOv9+uLoFbq4LbVimJY4M7P5uw0/tNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671971; c=relaxed/simple;
	bh=I7YVCLQ23ahjblB/aT+agncYGkwKeWoXWho9lG8Z2+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzxW9H1PqAjTK9gYNNjlKlJ5263Mr+Mx9LnW4bMFaGlhgi89D4BDw8s5y3GFjd3vT/tG05JxXdohoVnXPSeotFLNEKDGwSXLJoMKYO5p4INPtjlQ+V7zjw8J+Xe85y7oy3CZImy+hwyZEheG3SsNZ16WEWWSq79HHhJZjQuuv4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pu/Tya8I; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pu/Tya8I"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8851B43229;
	Thu,  3 Apr 2025 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6F19xsrfcjvm1+Kgpchw0zwnGPEmUts0SlL1DoOvE8=;
	b=pu/Tya8ILhoHkxd9Zqsc/L/6AfOAHS4LvxdjmcT+MBWnBFBPoOvBq6bbwtq7LbvQLehxKe
	Mv/aYZ4/EvmXDlCu4M/tpN2MogrgIRmASFFXdXX3499YAFFrsIHqc5EJXBXkLpJlXciEzo
	b6yG06K292iGZavWKpL+FsSLxTFo6nnul4PUHr/2+OaIRo0h3pGpfihiolE8B0ox9+Z9zl
	y6XPzCmWdVfU+m+n9On/s2rm5oe1yJxC1OUrNEnzTXm0E02XqiZInEaO2TpAe9DaGFEDiX
	rzu6bNCpK9LzmdGWNhF98gUwBmYJ0FYk+wMa9H6lJxolu8FRuoZ0/cWsLOZdUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:15 +0200
Subject: [PATCH v2 05/19] mtd: spinand: Use more specific naming for the
 erase op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-5-7846bd88fe83@bootlin.com>
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

Let's clarify what the macro really means by describing the expected bus
topology in the erase macro name.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b6c0993206ebab1dcee715ea6de33efe7d5af3a2..1959e8d9c64be004c71a0d6ac6454fde08e708fa 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -529,7 +529,7 @@ static int spinand_erase_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, pos);
-	struct spi_mem_op op = SPINAND_BLK_ERASE_OP(row);
+	struct spi_mem_op op = SPINAND_BLK_ERASE_1S_1S_0_OP(row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a9e2500d941ecd68891c5dd324944fc8950f1dba..09f374d2a27c30a2b1334c2ef2c56a93f6726c56 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -50,7 +50,7 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_IN(1, valptr, 1))
 
-#define SPINAND_BLK_ERASE_OP(addr)					\
+#define SPINAND_BLK_ERASE_1S_1S_0_OP(addr)				\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0xd8, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
 		   SPI_MEM_OP_NO_DUMMY,					\

-- 
2.48.1

