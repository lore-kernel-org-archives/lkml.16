Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A02836A4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646778; cv=none; b=uivvdCap+0RBJw7enh4tBcTFTVaxBPJN6qfQhluTGciYqFZ0g/WR1RS7Tq2IgSBZtsYoAN25y+6KGutkSKP+f9ElPd48ILLu5QhPFpqlHohtvlC9Lb3R8dYX7Bz34ZWgA4rJSOl+Nje5Hg49jDCKsjM6tC7pNYzDycQSe5935jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646778; c=relaxed/simple;
	bh=IEX/J2M3ey3rn2zFNEOh92droBLT2UE1LPg1xMt9/e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCbZSCsytgqVYXe8Ixthhl9WInI/FtAbSDeyRCiqy4FFCbrOXJs0qGAPzKjaFjT95XWzjAmv/OScdgFhQZ3n1cOi/WIyqoHJc+LbnueJJOZ4o98dWItgHsjvaX8ab8lmEfaBGQKBUI48IaavXkcJY1qaIKsWRLZcq7qhmnZBBBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lTRfHecJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lTRfHecJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2349f096605so79093445ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646776; x=1750251576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=lTRfHecJUkMB8uoMD6ldh/GTRvUjMllY+Rlp8OrXqklCYynZ4Uqpr5fEzCHEwenTR6
         LLbprdYp7gyiTiT22iHeeQGHoIoJC3ESPty5n8LZP2oY1BDy49q36XAC1hLnMnxjcFBk
         sxqvCcq8XRtiyo3h/JL61L8UMD3wMDA8k5TN2E1aHUBiRiZIhPIK5o1vlTQ8BrNxKl1/
         DIu2ptgHA1vGDMuDSxfKBwBPSrUDNjAwJhXQZDOK2GK3jbVsnFRfqY1Ce5CzqZdkwldX
         wBHPZkxjn9AwL48lz2ZFoZlr0aFx+X+CPPvJdEQ4muLVAHPqPJbCAvx8lXyq/AfqxPdV
         dxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646776; x=1750251576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=wUPmwVA4CdaI3rktdxgbrYoZRWhiDKLsvAGWZ5sIa3S5YGb440QA0TpKgfO+K0PVKK
         Uc5nNKF3jcjwoBGDZEWnIHhEh5o2YODVqsk3/5j7ufMQxX00FcY8ISb5gA6sT5qi+c8n
         zU6Gw0EwjtnA7vdj6NdjJnSRTmCAeya3rLW5pSLxKf0ZEXbt7zoIQ+3mfkNUXtUSoSm+
         Xnb9e5OQGsxllKFYGMIxbtRV7CwEZdzMvsIxCrfGINp5ptEb2XIDmqhFwXKOHoL+eFaA
         VwXx2CcyQ4zuUNP4bisYToc05ZTAmw3D88ZAaqWUE95Yjj+uckXBuM5YEtjNq0Ro/yIP
         VOnw==
X-Forwarded-Encrypted: i=1; AJvYcCV09qwIN336gs9WQseKYgyB6Giajea/MqfSFRTe2RQR0ZeqGcs9D3ljjZZU+CgBxx8wjN3Kgw6t4zTb0rU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3sAiOPNtq2SkhKA4vw0yzkJq3c6YJmkXORPcUHN3Q5cYDX9Z4
	QzB4GyzqGrDeWEKFrRbRAZsDSp2LcrIsEAC1QRiTVgkjMutODAQQTr9fsSzgq7NFmis=
X-Gm-Gg: ASbGncsJrLJvwhYmctnfkm8SWmuYR1NDV3gMNsEA3fxGeq4ABk22QXWYgqrppoj8p6i
	kQgMyXwzzVwoiGX/73bOSzHsUd1bNWAe4FMbZwsmez161e+oEdHYAUWUED21mKV01uE/b4WS0PC
	AJamw5uKQw9ocuA4hrZW8komnQWkis7WfedE7b+cRq+S8YvYdNlru+rpOqwqDmjVnapERzGDXCn
	q1B+9YiTapXtqR2ZlBH4lB/zNX6FdyrzQnlu+QP2Yut+0IAedWNzExDD8FfmO8x+22TBlKRoHfT
	xnoJp6wqSS8dD4XevUoH2sNRHuaN970KCMA7Moq2o/VzqRwEIeLboe6HL8op04VuyRdLdGlbgoG
	osabfEONCgalOiZ+t/hbsXw==
X-Google-Smtp-Source: AGHT+IFwmOGY2tPNuPQv/TIROenh+j1fH/hIa0++yIAIoLEcfqCONIj2DYpz4kpbLhhFofJZJXqRvQ==
X-Received: by 2002:a17:902:cf0f:b0:234:986c:66d5 with SMTP id d9443c01a7336-23641a8ba0bmr41504395ad.5.1749646776539;
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
Date: Wed, 11 Jun 2025 20:57:17 +0800
Message-ID: <20250611125723.181711-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for retrieving and enabling an optional clock using
devm_clk_get_optional_enabled() during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d30..4a6dbf558237 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
+#include <linux/clk.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
+	struct clk *clk;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
+	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0

