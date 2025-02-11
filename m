Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7531E9B33;
	Tue, 11 Feb 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256796; cv=none; b=s0ZT9JDDYYO+AIQ2iJwYImiznTVrdBpNxKrIFx8RNxkWTXXYqBD0vnG76vI010KBOJpXLZ6ri2o8p5uV0YG2IVkCPuuPPltWHZK0R7bxJ9iuByoBFOonrV5Msri7qC7h8ct0PrZe7kK+0cx14BlS9fEG9xW2b4QLt1qOzdz+IbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256796; c=relaxed/simple;
	bh=rE7L1ARhYuOgF0kVNeX4hwMhJfIOtDWsfQqGVqOGvGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EZCs3k7Myv3eaApc/18yTZAjN4pgUyqsuavt/V8WjQLCuZmcB/3n84/bcwa+JUDhJjUdQ4fGBrW//whKRSqVhsPmnoeKuyeU5jUnwZ/ufVfpISM1EsqQa9NsjigDzRa/a/0tODgdF5emqTuCjK++OHEfWqAe3YGf82mp1jPRinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=YNAtyCCX; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="YNAtyCCX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE84C1487190;
	Tue, 11 Feb 2025 07:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bj/uk16+Hrn66Q2o4G0o90gz6ZpVpof9duaSUY2Gbv8=;
	b=YNAtyCCXg1vLyvrVQqozWuySt4vzLUl66EK6oatEYw1HPn3UGlnXwRZq3NHC/YdTU6/SHD
	UDYa0wFe52ZKgiK1+7LIuuMlRXqjPUzHLVCjTOdQK9aSuaGlz6aa55NN21km6ljY4P79CD
	e/UECLUtBSz+hFJXjZcs46tSut3UHgnPIRF+1mHHvm1T+CaWP7yqGZqpNQLZ7yGqAM6Btq
	2ujDMGC3LfuwNhElwVaxGc2BB/QuGt5QZ7r6nih1UGq4CizXCn77rglommIxkdUXeqbaAN
	+UIU8wsnRGQAjYT7BIIUJn2X0p7fGUVadrfXlhnK67pkBcvhI5cJ3kOut0L8lg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 16/16] nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
Date: Tue, 11 Feb 2025 07:53:04 +0100
Message-Id: <20250211065304.5019-4-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

For SAM9X60 the Product UID x Register containing the Unique Product ID
is part of the OTPC registers.  We have everything at hand here to just
create a trivial nvmem device for those.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Use dev_err_probe() for error reporting (thanks Claudiu)
    - Move required register definition over here from removed patch

 drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 2c524c163b7e2..8353a117769a8 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -25,10 +25,14 @@
 #define MCHP_OTPC_HR			(0x20)
 #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
 #define MCHP_OTPC_DR			(0x24)
+#define MCHP_OTPC_UID0R			(0x60)
 
 #define MCHP_OTPC_NAME			"mchp-otpc"
 #define MCHP_OTPC_SIZE			(11 * 1024)
 
+#define MCHP_OTPC_UID_NAME		"mchp-uid"
+#define MCHP_OTPC_UID_SIZE		16
+
 /**
  * struct mchp_otpc - OTPC private data structure
  * @base: base address
@@ -230,6 +234,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 	return 0;
 }
 
+static int mchp_otpc_uid_read(void *priv, unsigned int offset,
+			      void *val, size_t bytes)
+{
+	struct mchp_otpc *otpc = priv;
+
+	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);
+
+	return 0;
+}
+
 static struct nvmem_config mchp_nvmem_config = {
 	.name = MCHP_OTPC_NAME,
 	.type = NVMEM_TYPE_OTP,
@@ -239,6 +253,15 @@ static struct nvmem_config mchp_nvmem_config = {
 	.reg_read = mchp_otpc_read,
 };
 
+static struct nvmem_config mchp_otpc_uid_nvmem_config = {
+	.name = MCHP_OTPC_UID_NAME,
+	.read_only = true,
+	.word_size = 4,
+	.stride = 4,
+	.size = MCHP_OTPC_UID_SIZE,
+	.reg_read = mchp_otpc_uid_read,
+};
+
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
@@ -270,8 +293,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	mchp_nvmem_config.size = size;
 	mchp_nvmem_config.priv = otpc;
 	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering OTP as nvmem device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
+	mchp_otpc_uid_nvmem_config.priv = otpc;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering UIDxR as nvmem device\n");
+	}
+
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
-- 
2.39.5

