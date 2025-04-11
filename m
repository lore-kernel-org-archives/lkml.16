Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6F29CB5F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370599; cv=none; b=HGIPfD6YzFuxfwySezngspPpo6sSWMlg45V3mV/GYyAIzmTgBUf3w0UWsOK+RI7u5uYLP73g/1TolInK7Fsy79HQ2D7iECtK3HR73cJHmVPcY1DCr85+wrodlcM1r4imP2Our5gZXJjMfPtfph9FcA/bW7F7J8LyIN1I//BKalk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370599; c=relaxed/simple;
	bh=3H31W12zPv2ha7Gz50I9LBwKnbP6kIyb2rBbsonHNsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mCzg/QbrYW0qFygVsKWMNJPqUkkRYsvsd1Sxk2OtkUtgtTS5eagjRe9xkpBezU5PyM55GNIcvEIs/GAzFQw8YvrqaPymevI+UIo2W32QBfwenzcmxwObxeX7SOYJbHlsR136bCOcaEy4sbGlT/AFZUZVK9n86vNVKkVjGLKvc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhmpXHh5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhmpXHh5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1024026f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370596; x=1744975396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6jcAZ2+oS8/yz0rFFcTHKsuoW+XOedg0QBvOhLol5s=;
        b=dhmpXHh5MbWSl2I8kGQDQJV6k8dRAJRepHbR+JpR3GRWqRnXjLvKjlwMSFgUpgtt0F
         zX8a4Q1keEjnICzbDXrew7XGf6wRZakEXmlrjW3/bpNyIrARzbTtPmcnPw7j8JM2zXcE
         G9w5q90+2HSi43THQ8mctYc05tvqS+uzbLZCXGhz/ZW3v1iXGCsvqdklFN90f9EhL51s
         SkuB/bKq58lgY+pGymRde3Pnrat/ZNWAzwHNwCuetPPug1duX7koCDOgh2+FYN/0p7vr
         Dl3r+GkT5AD5zv/f6uIchpyptNRqlhJpqTXTDamH44QkgQjeziXJIJw10BUpxyz8MvOY
         g0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370596; x=1744975396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6jcAZ2+oS8/yz0rFFcTHKsuoW+XOedg0QBvOhLol5s=;
        b=lIpUcJR+EzViMBf3Yd7iOEG0QgpKh/Vl8lIOFGg9OyWCa+3X6mYYa8I1nmpKOOAw35
         g4LIIy+t4zIQZ+J3fZNBN8sCvz7TAcaKfHz1fJ6+jxaM6NDGlR24ozwqZscTtbq4NsnN
         Zvv+TRZPhdxNfBuRGEcfGz9/l8H+hcFCEoqkJawDgk1Ky5wHbwbv138IqZhEnxOrlbDx
         LIFkaHJm09yyymRDR/gDhkRhXuMTaBMWDjsY9tgDcAFZ/TXmfmlnpMgYwdF3HWGiV9nv
         r55qELlOnuJv4Sj5wDeGYv3zlMBWsOiIAN28SUOzKsggwWcxLak060MF16jueVbWmzeR
         JcYw==
X-Gm-Message-State: AOJu0YzMA1b80o7rYDwbi7mkauZfCc7C4vOl6kSe6ACyqK2hRTEYyK9W
	jnmAEkVOig2E0EQg+ajptnlKFwZIDvW3W5uo9FzHdgvXLoBQ559ZNyhtM7GGrj4=
X-Gm-Gg: ASbGnctLIzoeEs3LbnX75XMAo8lpXvjPfW4RJUM0W1qlHSyXrEB0XnFof+hDA/5a+UK
	XXXJdhiHkdueBHa3FKMtkl8v+Hux7gpoJlEDq0sLXPyI45/vd2BdyPaDO21BpRvBTwc1GFt13Py
	7rfT2mJY1grNEkqsq3aov9iKMUq1BpPAOsjZ7gtL5MvRgCbhGP5ugxuj9/QWsINV6KqWd2UjlXC
	xm9gN6M0R7JQe9yu10muGl3QcnBjqrnq2uuEljG/2gtCn43m2hFWO91m5LURttSTZ6VDw1ROyx+
	mLeshNKnkJ/uyGWJwinkuEktNs6IH5zT7odrsD8YXWwAX3fZqlK//o3ncqX3jkkStJMTzSrywCo
	p
X-Google-Smtp-Source: AGHT+IGpz4UN57he+f473YtDdn4RKZg9kIem3KQELkYdacNwA/StsxqiiZYNLiGedX2ahfGRD5IKIQ==
X-Received: by 2002:a05:6000:40dd:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39eaaea8457mr1593728f8f.30.1744370595584;
        Fri, 11 Apr 2025 04:23:15 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:14 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 11/13] nvmem: qfprom: switch to 4-byte aligned reads
Date: Fri, 11 Apr 2025 12:22:49 +0100
Message-Id: <20250411112251.68002-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

