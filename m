Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA62459EA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671975; cv=none; b=Mj+xayZuQG+9b+EajjDro0SMSndWYyaXu4ywn5fghnv2dhg7SkKTWbePnnXdzP1j7MB+1RjwsFIJVF8GPzisogzA9uzhyoQArN4nNKrRawGykS4GvMD1YYU8P5ZMnx9gfMEKFQ4z8zPScQ6Ig+Gzduu7YyWrLS7qJYzAfyPYXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671975; c=relaxed/simple;
	bh=ZqNm6LlFMSuue6+qf04ZTKSMmR4Z7WInGTpCur/fUEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkekiOfk3jtcC29RO5iTH6v+0LfN4lOpwF/WfRqPivsqiVTFx1bonpJshmKCzcXN6LX/f91vBbzUYdBT76+ie7gubaHfE1rnfVdVnvniJ7SmmIHzDGAyA+/uTRPJM+wUVL/Y2/p9fXatu0UFl+IbTXYBuSXczogO6/0gvN/v9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ixzbSkcx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ixzbSkcx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5273443220;
	Thu,  3 Apr 2025 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IwpnC4TstPZu6yrTnVGMgRypfL717iTyvVdjIXQCZ+g=;
	b=ixzbSkcxEe+JyILN/+7Ujv+ggK6xhDL5QR0zDy7vwrXt8qpHttORWF+TGxkhmzV8lS/yLZ
	VIdRqWTG3QSb9NNSo6RxTPj4eGiPitMbLjbxV3GSL1MJO/Tkk7MtdtXD9lfDf0fTl/0SPr
	OU7oEP36kHDg7TaNNTL3chmaHgv181fRIk6gXGDJzrry1HK4THaxZJm7nFATPfwEyDmgUD
	RVbxULDvPvRU1xpAupEyPJmawho2TLY7iHNxvqQuXJPnLmzDX/ZIXzDf/8oE1zYTy2OKjy
	p8ZTI7izvWjtKn79vvpFwZOziOxr2UQrdLaHLfQqkfF34H2eDUhQ2XmQqqQ++w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:17 +0200
Subject: [PATCH v2 07/19] mtd: spinand: Use more specific naming for the
 (single) read from cache ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-7-7846bd88fe83@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgus
 ehnohgurdgrthdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshdqkheisehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

SPI operations have been initially described through macros implicitly
implying the use of a single SPI SDR bus. Macros for supporting dual and
quad I/O transfers have been added on top, generally inspired by vendor
naming, followed by DTR operations. Soon we might see octal
and even octal DTR operations as well (including the opcode byte).

Let's clarify what the macro really mean by describing the expected bus
topology in the (single) read from cache macro names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/alliancememory.c |  4 ++--
 drivers/mtd/nand/spi/ato.c            |  4 ++--
 drivers/mtd/nand/spi/esmt.c           |  4 ++--
 drivers/mtd/nand/spi/foresee.c        |  4 ++--
 drivers/mtd/nand/spi/gigadevice.c     | 16 ++++++++--------
 drivers/mtd/nand/spi/macronix.c       |  4 ++--
 drivers/mtd/nand/spi/micron.c         |  8 ++++----
 drivers/mtd/nand/spi/paragon.c        |  4 ++--
 drivers/mtd/nand/spi/skyhigh.c        |  4 ++--
 drivers/mtd/nand/spi/toshiba.c        |  4 ++--
 drivers/mtd/nand/spi/winbond.c        | 10 +++++-----
 drivers/mtd/nand/spi/xtx.c            |  4 ++--
 include/linux/mtd/spinand.h           | 12 ++++++------
 13 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
index 6046c73f8424e9fb338ec3a1d35dc6fe30a2e1bc..723c740308d26e901fd3d9a402ddd48e8e69060f 100644
--- a/drivers/mtd/nand/spi/alliancememory.c
+++ b/drivers/mtd/nand/spi/alliancememory.c
@@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
index bb5298911137f08c1793d244b33dddf1971e2fed..9026a14aca07ce011af151eb6dfe56797e0e70c0 100644
--- a/drivers/mtd/nand/spi/ato.c
+++ b/drivers/mtd/nand/spi/ato.c
@@ -15,8 +15,8 @@
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 323a20901fc9fcc252b8317d9434aabf5e30a495..aad751f95269b3f501aff01753c4bf0ff9484fbe 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -15,8 +15,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
index ecd5f6bffa33423abddf750b34b823a640fa2c23..8a9725ea29bac5901d67304db95ed5573bd7fa40 100644
--- a/drivers/mtd/nand/spi/foresee.c
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -14,8 +14,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 73a483227831518a480dc34de17efdaa398b5627..76856f1de8fefc6404345e363b2c873cc3c02e52 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -28,32 +28,32 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_f,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(0, 0, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(0, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_1gq5,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 4, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3dc4d63d6832d0213387f335fd233f1c4306bfff..59bd476a29f03967a3f5a814872f9a6039b0a585 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -28,8 +28,8 @@ struct macronix_priv {
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 6ec20fad837bc534cfa0bc7cc629622a7dfab5da..d7dbd22db1a3f8457c8947f4044dd8442dc475cb 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -33,8 +33,8 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x4_write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
@@ -48,8 +48,8 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 static SPINAND_OP_VARIANTS(x4_read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-			   SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+			   SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x1_write_cache_variants,
 			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
index 6e7cc6995380c00ae40fe362f711a490ff463130..ae3527d6d5fa358be482eb8cf0ba4e1e2304e441 100644
--- a/drivers/mtd/nand/spi/paragon.c
+++ b/drivers/mtd/nand/spi/paragon.c
@@ -26,8 +26,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index 961df0d74984a8dc8484ac5d7323d172012058e5..ffbedb8d92f659967f6aa0c80d5b0aa7d088929c 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -21,8 +21,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index a600aa771519fa04a1caafb8c8e636eab10359c4..bc5adadf6084f48ff482d6846be1c6d2e9157e85 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -17,8 +17,8 @@
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 5816b489b57b0070ddeda745cf17c04efc5080cd..8379a1d12dd563e573c6d37cf099759088176da4 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -32,17 +32,17 @@ static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X2_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(0, 2, NULL, 0, 80 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 54 * HZ_PER_MHZ));
 
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 3f539ca0de861c082217701607f96c2a6b7c5378..a0003f52ae8f52ab00374fedc457476136a78568 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -27,8 +27,8 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(0, 1, NULL, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 10b2c1279c0e2e0e3ddec3b4ce93e7fe25402c9f..868d983b4544d88965f9bd52830e39e8c8c34346 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -62,32 +62,32 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_PAGE_READ_FROM_CACHE_OP(addr, ndummy, buf, len, ...) \
+#define SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(addr, ndummy, buf, len, ...) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
 		   SPI_MEM_OP_MAX_FREQ(__VA_ARGS__ + 0))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP(addr, ndummy, buf, len) \
-	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),			\
+#define SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
 			 SPI_MEM_OP_ADDR(2, addr, 1),			\
 			 SPI_MEM_OP_DUMMY(ndummy, 1),			\
 			 SPI_MEM_OP_DATA_IN(len, buf, 1))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(addr, ndummy, buf, len) \
+#define SPINAND_PAGE_READ_FROM_CACHE_3A_1S_1S_1S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_FAST_OP_3A(addr, ndummy, buf, len) \
+#define SPINAND_PAGE_READ_FROM_CACHE_FAST_3A_1S_1S_1S_OP(addr, ndummy, buf, len) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
 		   SPI_MEM_OP_ADDR(3, addr, 1),				\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
-#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(addr, ndummy, buf, len, freq) \
+#define SPINAND_PAGE_READ_FROM_CACHE_1S_1D_1D_OP(addr, ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),				\
 		   SPI_MEM_DTR_OP_ADDR(2, addr, 1),			\
 		   SPI_MEM_DTR_OP_DUMMY(ndummy, 1),			\

-- 
2.48.1

