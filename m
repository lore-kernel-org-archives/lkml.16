Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8252248890
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671981; cv=none; b=Vsqt0RH7EozSYGzWBht1/a5sBBOEa2+f4NpUZUJKJDkVjmU3PZmbPXiD6unOMPAkHJe7UWWF6adRpCFw1znTaqGqNEoMOGK5/zbqwK7ljL+2bjEf0yU5gpAu0DaaOqVFmDV5Ytgp0f/4jGGJ9hfASkOfmcNzGAElcSROJegE6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671981; c=relaxed/simple;
	bh=CWvgtEhnjN6RdmTgjEIy1jVeplPknWJ9QtaAevQQGW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tm+JeIzo6PgHLXn1JsnZh0AOSpA7P2I+spr+wZ54Y3zOrhinVtke70zGutDVGh6zuXbi7HZpituS+HxutXk7aOfy9ochbE6Jjn1EUzKA5tn0WMWLV6VHgeAPqVaWA5g4nckV+ycI+E2G1Z00L4gMn5rkmFXnbK2kra2YHqE+s+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J5mXtP6Q; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J5mXtP6Q"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD72B43231;
	Thu,  3 Apr 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aIx0bmmAqRksWx5mJw8we6mCFVWTHAoVOhSll28KhOI=;
	b=J5mXtP6QL8L5ZSZ6On19I4JQuXoHP86oq5bed5ccFyd98grAh032lh0i5wR75lfIVb3od0
	xpOGnARQzLIzup6siySWQylc0oUlAexnq+oMPs3z7dwpNwuLtcW/WRXXbG2ocvPI1QuVfP
	LdltcSp/rsTEfT+pYYiecVGvh8hIXcgtHqAWtb8XXWgIpDg22fJSB8Sc6qLLFnrBFYHgVk
	a6alpqrhVWb3qvn8tKMfwrwMyFFreWczmXEL3A9FPSXzmD+WVv6wIDSvEdF/f5Dlm5dSGe
	rf8jlUVkNLgYRgTFM2XiyzG+AaM9tRLUO/5x2R4ufKjXfbhYQWpAHsom0MumTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:22 +0200
Subject: [PATCH v2 12/19] mtd: spinand: Use more specific naming for the
 program execution op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-12-7846bd88fe83@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgus
 ehnohgurdgrthdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshdqkheisehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

SPI operations have been initially described through macros implicitly
implying the use of a single SPI SDR bus. Macros for supporting dual and
quad I/O transfers have been added on top, generally inspired by vendor
naming, followed by DTR operations. Soon we might see octal
and even octal DTR operations as well (including the opcode byte).

Let's clarify what the macro really means by describing the expected bus
topology in the program execution macro name.

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 2ebc802299068ef69068422d1ef6585f63365832..854d56f87de5ba2c61bba52a7573d8e2d465bc20 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -519,7 +519,7 @@ static int spinand_program_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_PROG_EXEC_OP(row);
+	struct spi_mem_op op = SPINAND_PROG_EXEC_1S_1S_0_OP(row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index d47fb920416db822b9e5e156a577fb61d56db8c5..1bdb195d3e1f05b46201da39441afbe7ffa8173d 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -170,7 +170,7 @@
 		   SPI_MEM_DTR_OP_DATA_IN(len, buf, 4),			\
 		   SPI_MEM_OP_MAX_FREQ(freq))
 
-#define SPINAND_PROG_EXEC_OP(addr)					\
+#define SPINAND_PROG_EXEC_1S_1S_0_OP(addr)				\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
 		   SPI_MEM_OP_NO_DUMMY,					\

-- 
2.48.1

