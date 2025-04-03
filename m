Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB824A05B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671983; cv=none; b=XF+qWr4HVQeLdIep3Wyy/mt4+Jn/xoRg9q7jbUhTLzEHAw9Gvn7Y3y+qNJx+SVsbgDMYJkEyNfPYE+ocejVdFuHOGb9rNqg19kRRIfU3HLdY95PHULIcO/ax+vnjmkGL6I7+PVwXMyfpIsWFP90lScGljPSNtHPeYTJibRmz8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671983; c=relaxed/simple;
	bh=X7y5tWKzeak5DjLkmPE0IdKEKZzZTw7MhThw503WzmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olfkXYTuhiLC4dUGxvfsLcTN78kAeIoucLvJM2HPOmNjeM6OG4V+w58J7f8P8rgvS2rimt1ZTV1DnSLphOZa+hpPsl6W0vW94KVE5XZsSS29uSA6fe7izQKMJS02fPHYGa/aJNzxDzSG+i7DNU6ebOtMJMbYHEsln6I69V1SqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LOlnI7+h; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LOlnI7+h"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B8E94419B;
	Thu,  3 Apr 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R3KdgN9ZnkCYhqkwmt6Y4zO6RGiUSPMVFHiDA1RDvk8=;
	b=LOlnI7+hqev4pymLnWgnX6BCZNcRXkN28gswD2e48pDe9ZH9vHuryMUKxq58qGeNSdyLhU
	rLIcOASPkVT/oPZVTR88+Tna0D9fNRF9pciEQ3OHU63EQ6Je8CQ5GCeQHuj/Nh36suaiVl
	f8YJy/flbjh14xPCuM18UyzOHpq8AcYzlPYPe7LrumFufxlWOwUyFDfgfdk4qLYjQJAz+b
	d9bETrInhC+go1PQJy5UoxNsq4i4WAMllc71HOtM31lh4rygwuDqAGD1j00eVY83kJ4wP6
	kr1ZiCOUw7qMJmtR0bFboO+Pbq4gD2rrgEP524iFp3jIW1d7h/USa1/RbIHp+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:23 +0200
Subject: [PATCH v2 13/19] mtd: spinand: Use more specific naming for the
 (single) program load op
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-13-7846bd88fe83@bootlin.com>
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
topology in the (single) program load macro name.

While at modifying it, better add the missing_ OP suffix to align with
all the other macros of the same kind.

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/alliancememory.c | 4 ++--
 drivers/mtd/nand/spi/ato.c            | 4 ++--
 drivers/mtd/nand/spi/esmt.c           | 4 ++--
 drivers/mtd/nand/spi/foresee.c        | 4 ++--
 drivers/mtd/nand/spi/gigadevice.c     | 4 ++--
 drivers/mtd/nand/spi/macronix.c       | 4 ++--
 drivers/mtd/nand/spi/micron.c         | 8 ++++----
 drivers/mtd/nand/spi/paragon.c        | 4 ++--
 drivers/mtd/nand/spi/skyhigh.c        | 4 ++--
 drivers/mtd/nand/spi/toshiba.c        | 8 ++++----
 drivers/mtd/nand/spi/winbond.c        | 4 ++--
 drivers/mtd/nand/spi/xtx.c            | 4 ++--
 include/linux/mtd/spinand.h           | 2 +-
 13 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/spi/alliancememory.c b/drivers/mtd/nand/spi/alliancememory.c
index 0f9522009843bc11750de87be000d209cbf1ca5c..437e935aefab57f80876e0eb84a9c37d11211864 100644
--- a/drivers/mtd/nand/spi/alliancememory.c
+++ b/drivers/mtd/nand/spi/alliancememory.c
@@ -26,11 +26,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 			   SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int am_get_eccsize(struct mtd_info *mtd)
 {
diff --git a/drivers/mtd/nand/spi/ato.c b/drivers/mtd/nand/spi/ato.c
index 88dc51308e1b84dd8abb3fd32297c9fd43a131f5..cf51cc6ae66d3d35a4e912472fef80f7a8e3eeb9 100644
--- a/drivers/mtd/nand/spi/ato.c
+++ b/drivers/mtd/nand/spi/ato.c
@@ -20,11 +20,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 
 static int ato25d1ga_ooblayout_ecc(struct mtd_info *mtd, int section,
diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 8b409a418b1c16914cfd6ba1c588f58d76388d59..64dd54181c8feb48a531a203e1b6437db490363a 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -20,11 +20,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 			   SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 			   SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 /*
  * OOB spare area map (64 bytes)
diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
index 21ad44032286ffb7c98f1944624fe9ecb507d6ce..dba8ea5142eef8a109d66f3262f264b8a16680b2 100644
--- a/drivers/mtd/nand/spi/foresee.c
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -19,11 +19,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int f35sqa002g_ooblayout_ecc(struct mtd_info *mtd, int section,
 				    struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 2e87c89a86d61944c6b18653c3ab3b5b49d29529..44ef38cddc900e86c1a7a52a7c7fb68c42d82a43 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -57,11 +57,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants_2gq5,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int gd5fxgq4xa_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index aaee30b64abe6061c0a83525ff3de1307278581c..577437107ec5fc1d8771dc7899731c88bd3e55b6 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -33,11 +33,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int mx35lfxge4ab_ooblayout_ecc(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5af50c13bd372a86d8883e2f15dbbb0fc5e0799c..56bbd7e7843faeb34cc8fb3ec16aa2dc98196ebb 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -38,11 +38,11 @@ static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 
 static SPINAND_OP_VARIANTS(x4_write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 /* Micron  MT29F2G01AAAED Device */
 static SPINAND_OP_VARIANTS(x4_read_cache_variants,
@@ -52,10 +52,10 @@ static SPINAND_OP_VARIANTS(x4_read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x1_write_cache_variants,
-			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(x1_update_cache_variants,
-			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
index b5ea248618036d2b4d5758ec752e29c2088a6750..eaddb12d6e9a15365470c1a695a55c009794daca 100644
--- a/drivers/mtd/nand/spi/paragon.c
+++ b/drivers/mtd/nand/spi/paragon.c
@@ -31,11 +31,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 
 static int pn26g0xa_ooblayout_ecc(struct mtd_info *mtd, int section,
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index ac73f43e9365c7922cb531e8edb95f763480d50e..3b9b83d499a2f86c0bd9387d1d94bedd0eccc108 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -26,11 +26,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int skyhigh_spinand_ooblayout_ecc(struct mtd_info *mtd, int section,
 					 struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 8bba0d4011ce239c8fa6f1fc453bc0b610c76f9c..cb1157fb34e3c9365d0cb47e1f37d8b745aa975e 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -22,21 +22,21 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_x4_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 /*
  * Backward compatibility for 1st generation Serial NAND devices
  * which don't support Quad Program Load operation.
  */
 static SPINAND_OP_VARIANTS(write_cache_variants,
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int tx58cxgxsxraix_ooblayout_ecc(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index dd0bc95a723e4f4d67d0247cbb3f869f823b9001..adc20b4f28adb339ce81c5c1de5d28cfa3c36b31 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -46,11 +46,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int w25m02gv_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index abbbcd594c2c1fcaf68ca5244ed89508348244a3..931b85e82ac5811dc2ce668270157a73ab9b5474 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -32,11 +32,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static int xt26g0xa_ooblayout_ecc(struct mtd_info *mtd, int section,
 				   struct mtd_oob_region *region)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 1bdb195d3e1f05b46201da39441afbe7ffa8173d..3a917bfa8b00d770ee864796d305a3e597eea70e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -176,7 +176,7 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_PROG_LOAD(reset, addr, buf, len)			\
+#define SPINAND_PROG_LOAD_1S_1S_1S_OP(reset, addr, buf, len)		\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0x02 : 0x84, 1),		\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
 		   SPI_MEM_OP_NO_DUMMY,					\

-- 
2.48.1

