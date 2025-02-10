Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41725E444
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227078; cv=none; b=h7idXS4K3GrFl6p47WOaKRTVEYREvwgUoXhlBMNYvNYCBUhUKopp7ikbz3Mq3iWH+P0CuC32pGuXLwMLEFk3JJrKg25suZOJPyv65S7bE5D56bIZPKRf/+SIdB9I+4DVI7w61sD7XRXgeb5xAgs27HLwl6z7OojI8QTiwCeVYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227078; c=relaxed/simple;
	bh=mlCF+3bzZOAa8f3gAfZzRMJclFUXFMrrk4oBZGG7YHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cilaZ4WDgwxaxfwVhsuQ9MdMBLh3PZ+o07ikxLYopzZaDBaMTM3RKuQm9p/QCXNDtE3uKN0Y0XmbtGoNbOcDZ8SODybO2TBrZP5VDs3gWvbnJ8VybT5JzhK99hiaMTQbeLPXOPEvQVL49eA539pvkBaYeswXblLF1pi78E5pQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lfUekzGa; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lfUekzGa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739227074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Brim4R+j1jrxpbFoMdiijr4HsKQ5qnKt7XsTd8hfjR4=;
	b=lfUekzGaOH4UnYI5HuG/u7a1EDH//PP0nnR5JYxDOv9IJ9GV0zwbuVjg/tHNQDkJZfZl1N
	3YVrT0AEpM3nxHU2U5H74uC3UmXkSx4U1Tuxnl3hTh1u9Vc6VTk1uZw/fDopCGrEdMxez+
	ncTcrrHHQzObidJ07SQQ3v/BnY/+rnw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Chen Ridong <chenridong@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: bcm - set memory to zero only once
Date: Mon, 10 Feb 2025 23:36:44 +0100
Message-ID: <20250210223647.362921-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use kmalloc_array() instead of kcalloc() because sg_init_table() already
sets the memory to zero. This avoids zeroing the memory twice.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/bcm/cipher.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/bcm/cipher.c b/drivers/crypto/bcm/cipher.c
index 9e6798efbfb7..d4da2b5b595f 100644
--- a/drivers/crypto/bcm/cipher.c
+++ b/drivers/crypto/bcm/cipher.c
@@ -140,8 +140,8 @@ spu_skcipher_rx_sg_create(struct brcm_message *mssg,
 	struct iproc_ctx_s *ctx = rctx->ctx;
 	u32 datalen;		/* Number of bytes of response data expected */
 
-	mssg->spu.dst = kcalloc(rx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.dst = kmalloc_array(rx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (!mssg->spu.dst)
 		return -ENOMEM;
 
@@ -204,8 +204,8 @@ spu_skcipher_tx_sg_create(struct brcm_message *mssg,
 	u32 datalen;		/* Number of bytes of response data expected */
 	u32 stat_len;
 
-	mssg->spu.src = kcalloc(tx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.src = kmalloc_array(tx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (unlikely(!mssg->spu.src))
 		return -ENOMEM;
 
@@ -531,8 +531,8 @@ spu_ahash_rx_sg_create(struct brcm_message *mssg,
 	struct scatterlist *sg;	/* used to build sgs in mbox message */
 	struct iproc_ctx_s *ctx = rctx->ctx;
 
-	mssg->spu.dst = kcalloc(rx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.dst = kmalloc_array(rx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (!mssg->spu.dst)
 		return -ENOMEM;
 
@@ -586,8 +586,8 @@ spu_ahash_tx_sg_create(struct brcm_message *mssg,
 	u32 datalen;		/* Number of bytes of response data expected */
 	u32 stat_len;
 
-	mssg->spu.src = kcalloc(tx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.src = kmalloc_array(tx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (!mssg->spu.src)
 		return -ENOMEM;
 
@@ -1076,8 +1076,8 @@ static int spu_aead_rx_sg_create(struct brcm_message *mssg,
 		/* have to catch gcm pad in separate buffer */
 		rx_frag_num++;
 
-	mssg->spu.dst = kcalloc(rx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.dst = kmalloc_array(rx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (!mssg->spu.dst)
 		return -ENOMEM;
 
@@ -1178,8 +1178,8 @@ static int spu_aead_tx_sg_create(struct brcm_message *mssg,
 	u32 assoc_offset = 0;
 	u32 stat_len;
 
-	mssg->spu.src = kcalloc(tx_frag_num, sizeof(struct scatterlist),
-				rctx->gfp);
+	mssg->spu.src = kmalloc_array(tx_frag_num, sizeof(struct scatterlist),
+				      rctx->gfp);
 	if (!mssg->spu.src)
 		return -ENOMEM;
 
-- 
2.48.1

