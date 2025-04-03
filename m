Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A124339C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671968; cv=none; b=N0JnbN/bDCD2+irjYaNuLG2Z0q1SqgjcHZmk13oHELuYPW1QjtyrqYZ0zQDHDfDzhlBxAZ8z8kBvjilgmKhDLDJWYLDcxs5ZWxAaFrmNB7pfhYqrt8cpmHZtsb9mcSVvskzA7f7/BHfcZIeE3rY2+Czod4xAoyaoF/JwV4rOt9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671968; c=relaxed/simple;
	bh=6Zhe0I2iQgt6PlnRBjQcmFf1X5c4D+JcK/hYTI0doQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvhhK8lVP5RksDMFoEUpGvAa3cCvwJFzPhqNOMXFGfDIL6FWUTFtu+LmQbCJS/hCuwTdH8d68wlsawouaC8RFBOs21VhxyT/Tw/epWfWMQWk/HaiQFNvLu8PElSqiP/Intr4rcS9N0j8+0m/hqfvksMX2WK2wb/93YlHzNlO9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hYGsM1cL; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hYGsM1cL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7595543230;
	Thu,  3 Apr 2025 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgbyTBEil3THxolEwGq86sbK1ICKDQIFcTImL0o1a7c=;
	b=hYGsM1cL3jBqyCg8AGga4H/uHGCcNVx/RvMOv1iijTh6PAHH4Ryp2p5on+fNW8Z5KOthSy
	nn2r8+L4KUqw8Gxak9T/445FxAObiOs0Qf2jVA+DnWIc0alvFcqFM4QstJkqv7oYnwa2+p
	RbiEp4mQqwBAV8qEnHNUpVHsySk8KSEMxQg4Kg9LYYbimfA5DQldBnt6s3OqnlYmzSWHTD
	UMonCAtWHFMQ4rg9cK7MfhfVv5sEkQq8mXPs1WA7Y9Y8sj2o1CPaXGEyHhDLflE6eaE1H+
	oJgCcNVLL6nsB+F2egYRcHaLoMVcxtd3DyCA4m6JeYMOzhSz9+vOvtSz3aDyPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:13 +0200
Subject: [PATCH v2 03/19] mtd: spinand: Use more specific naming for the
 read ID op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-3-7846bd88fe83@bootlin.com>
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
topology in the read ID macro name.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index bbf0048104aac86e90b0706793db8503c8fc2a3b..cde7f0f08c1e45106ebba3b027b620fb8bb7cc51 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -573,7 +573,7 @@ static int spinand_wait(struct spinand_device *spinand,
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
-	struct spi_mem_op op = SPINAND_READID_OP(
+	struct spi_mem_op op = SPINAND_READID_1S_1S_1S_OP(
 		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index a69feaec711b585b1fd95d8a699be9230c13c324..47c8c148a019396134ddd2aa3f5c6ddd039a4af6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -32,7 +32,7 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_READID_OP(naddr, ndummy, buf, len)			\
+#define SPINAND_READID_1S_1S_1S_OP(naddr, ndummy, buf, len)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x9f, 1),				\
 		   SPI_MEM_OP_ADDR(naddr, 0, 1),			\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\

-- 
2.48.1

