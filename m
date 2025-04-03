Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048D25178D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691536; cv=none; b=ZIR4VRd8iPnvkgHi9VVtmIhPIut94Di5LKTUi5ApIjTBtR0usg+wVo7vFBcbLjwQ3cOvN3zSyXxXQMY8Lq58EQXSxUcNjvD58xxplTmcO60aDAkFk6uRY9IRM613czB/eLri2RFceFV7iogLzVMa9ZLPdG0yeSfjKHgquTYcOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691536; c=relaxed/simple;
	bh=3H31W12zPv2ha7Gz50I9LBwKnbP6kIyb2rBbsonHNsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=toUcEfqFoi1VVKLq5sVrL/GcEqNUSb2CzzIxNS9Q5icVpTYV7gYdWPStsizmYZmG8kuDw2mTctAoWse/2a9nf3EVM+P+0UMlBKuKMYdZEhk1ojQKHsTIRwWPb3m+Ik9xgLlGxlK4u5xTFAaJwEBZTtCwcZnVXNa6+U1XLGevFME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHhNTZfz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHhNTZfz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so674680f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691533; x=1744296333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6jcAZ2+oS8/yz0rFFcTHKsuoW+XOedg0QBvOhLol5s=;
        b=oHhNTZfzK5J6+yuCavZjrvEXIQvR1HUx1h4vyFKtblOcdgHe/iFAnj+c8M8D0K7RGk
         J9psGcmDktuKzINW/q+CEKKx7gW8JBQ+n3TxOE60q7K6hBSPmEBtOJxXmoTT7c2KMEeM
         Dud6OV7bp8hRSCR54VOSch5EYFlEWpnKfhHrZhiAiJcGCxlvlgUZ6NzGHnezyY0z1tLr
         VFktX61/I+dCoVkHX5jAo93geoVWczcc0MG8kDDH2cLsJdpGSS22INj+cbqAP3XdVnTv
         E+2iP98KEry114ELE25//ErojfXTmA+Z31etwQN8sF7w3zfp8mB5Y4HLXNlzVMO2hsaH
         M1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691533; x=1744296333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6jcAZ2+oS8/yz0rFFcTHKsuoW+XOedg0QBvOhLol5s=;
        b=bf18kZkUUsXjGFulzgq13Tz/zPsgGOoxk13pqQz6LIzm2rxmrAB1JdoolJds1BgEfw
         OYxkdpC/9cAtd2TSzzdWZr9ppTtnAd6zCSUcfJJugUoN6BcZCZ88fIRZUIrcVdwe8X5U
         CndWi5O8+WWt4r/HLXa4jGSPizZ5rDwIg2EuTbyn73+saCmDJDK52RNI1AJdjTduzVue
         8bfpVOdZUhEIzT0BD+FBSkm++cJc3XPFnh5wHPsEGlUVLVmeQzeSygmcFW2sVbv1/1xZ
         TdltXwcsTQ1OJCRZDpGcrrmnZufzo91UjHOiZLKdvzP8gB95hLexGffq5KPSnN8cnqlB
         aSzQ==
X-Gm-Message-State: AOJu0YyHbRDAj+xH1ie2qeDd+ouLXPnevioQTGH3HYFt9nPMsQdsFMv6
	rMPUD/5GekauwwNhT+Ae1zw3zmQuIMoTBfOCt2+HqTtBWTHsgXvS5wei40rmUtA=
X-Gm-Gg: ASbGncuzZwe5EPKZDX6VPVRzlPu7NzycwE9DAaZy4luhNJYgNX7J52soNX42bH7IUj0
	Sk7scDPXUTUL256z1nmbIRmbPJDOQsvhVzU+cg4B7CykSsJOzNKVluKG8eyUcQyoHM+iSAE2GFu
	T7MF+rhP7BcdZRa0OibOm94DfZEf9j5lgZ8wihq/SoTJpYV4Ryt0JIytr5xuxXgIa6rltGzOr+2
	EMPhEIpXJ5Bx2UwboxYjfBbewH/5htuKcJYkhKqTEIFGAm8SOjFC52vftZAPSehsLSoF+3AGzVv
	MeFqX/FTX1pw+uBcRsRR/JRWCRolSuq0TtkPkZNM3LiQ0jcZXl92AgxeVJ+J7PsunYQcYg==
X-Google-Smtp-Source: AGHT+IFat3ygpgKhAkO0c0X2mTl0VFvT3wBxLPKr7JIuCyDIUvgK0NKUn/4HKa9g6CxMh8181+X/zg==
X-Received: by 2002:a5d:6d81:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39c29737e82mr6393647f8f.2.1743691532756;
        Thu, 03 Apr 2025 07:45:32 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:31 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 11/13] nvmem: qfprom: switch to 4-byte aligned reads
Date: Thu,  3 Apr 2025 15:44:59 +0100
Message-Id: <20250403144501.202742-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=JJiFhfRmHwPniUxF2lMkh5d/tp9H/TdB0Jvtor5rjlc=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7jUasBH7hrcLPZhwfh2HNMT1jUIAJKxwHVL 90k/z9bwgSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4wAKCRB6of1ZxzRV N0WIB/9LLKVJPYdPQljfkXOpXnetzkruRAcIXdAW7DjAuOWyrBnX4N7GIV3f6mE+BOO1axvE2NL MRC8FpacIHtoQMs81dGCnND0Y/4hxmlP68vLAyY3LpKZgRnpfT7HcoACjL+SSNnghMe5jbeMWn8 iK9KPp4jKk/HafC2z1LDreJC/RvTqRV2mjggEvc13KgrGERfuWbPvIiIk7SZQ9oysXYfmhhetsO uuhd9+e+yCk7PDmxKWN3vCvHGa91Eekm08yQZDpGBPPLwM9ZiymF0AoW0jPo2zKAWvIHtsRNHaj IkdUs4aKNDi8RZoYtTnnviwsRspUoRvxOM50FN/OoT/9eYwK
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All platforms since Snapdragon 8 Gen1 (SM8450) require using 4-byte
reads to access QFPROM data. While older platforms were more than happy
with 1-byte reads, change the qfprom driver to use 4-byte reads for all
the platforms. Specify stride and word size of 4 bytes. To retain
compatibility with the existing DT and to simplify porting data from
vendor kernels, use fixup_dt_cell_info in order to bump alignment
requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/qfprom.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 116a39e804c7..a872c640b8c5 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -321,19 +321,32 @@ static int qfprom_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
 	struct qfprom_priv *priv = context;
-	u8 *val = _val;
-	int i = 0, words = bytes;
+	u32 *val = _val;
 	void __iomem *base = priv->qfpcorrected;
+	int words = DIV_ROUND_UP(bytes, sizeof(u32));
+	int i;
 
 	if (read_raw_data && priv->qfpraw)
 		base = priv->qfpraw;
 
-	while (words--)
-		*val++ = readb(base + reg + i++);
+	for (i = 0; i < words; i++)
+		*val++ = readl(base + reg + i * sizeof(u32));
 
 	return 0;
 }
 
+/* Align reads to word boundary */
+static void qfprom_fixup_dt_cell_info(struct nvmem_device *nvmem,
+				      struct nvmem_cell_info *cell)
+{
+	unsigned int byte_offset = cell->offset % sizeof(u32);
+
+	cell->bit_offset += byte_offset * BITS_PER_BYTE;
+	cell->offset -= byte_offset;
+	if (byte_offset && !cell->nbits)
+		cell->nbits = cell->bytes * BITS_PER_BYTE;
+}
+
 static void qfprom_runtime_disable(void *data)
 {
 	pm_runtime_disable(data);
@@ -358,10 +371,11 @@ static int qfprom_probe(struct platform_device *pdev)
 	struct nvmem_config econfig = {
 		.name = "qfprom",
 		.add_legacy_fixed_of_cells = true,
-		.stride = 1,
-		.word_size = 1,
+		.stride = 4,
+		.word_size = 4,
 		.id = NVMEM_DEVID_AUTO,
 		.reg_read = qfprom_reg_read,
+		.fixup_dt_cell_info = qfprom_fixup_dt_cell_info,
 	};
 	struct device *dev = &pdev->dev;
 	struct resource *res;
-- 
2.25.1

