Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9B283CAA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646795; cv=none; b=j67+vRYtKuEhAAqtogCv0Emow92DYEB+RXgikrgMW1k8O+wW6RwfoUu24UkGUf9Q3c405CqFPZ/TCOV2e9r6fA22wm9St8LzZGuqlRwokXl1qBshyuVbFcqKBfl3PqsvYsrioFlz5co5m1DJWQNNMeSuPpGdRjYXkDbp7ANxbp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646795; c=relaxed/simple;
	bh=w3tQqbAHCuIlmTn7bB97ckFjqMR0odxo/xEDlJG2tEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujTjT4XcdZE8CxWTLh6UkyofNt+nk+p9qyJEdZPtZrpFHek2KhjKn9xCIz0rZ7oLxMxzJBKaghB+V7lEU6TmlWnH6LO+GKdTc+8vkOQZtVo2BEVikdANp6yiq/8Wxu+j68u/ZEA2bzuILO6mZGauExj68GDIlkhun8e9QCggzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=kCiWSF46; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="kCiWSF46"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234c5b57557so62586665ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646791; x=1750251591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=kCiWSF46Pjz/6TAZmn0K0JgMhTH6SCSjTVn+NCUT8ACm1eY6unJAgMzpZCW26iH7V2
         +/1NOtnj+4Y52szSohkiAN8156HtI5rel5FMnjKOnHnmaf+x2xW9wmKHloS+5ZCPjILt
         s/QWJA5KciHgLhcLGcI0kFAA58xF66RqbLMeWAeHgCxekbTcOPqkX+K8gvst8G9GB4hX
         V4p8KFyWAzOfkwWQHq5qw80zTNyvBweOkAkiWumMd6+e44ccawVDr9qXyLJnrma+YwJI
         m/7GyX2hPLaVbRqG699OHVdHSFAyV5y5AMY63xrDu0aBGrVw08ijZa57i42HGZ6OaTms
         NZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646791; x=1750251591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o24DxeXgIvRNvf36TN4y++evYbOInZZuq385XvrXzk=;
        b=pTp5OrMJxAQSrvvMIQU3GHdCZjZOVwNI5xhdr2gTusMHBBTyxwFLVrFqEYS340BANH
         xt0KbeHS17gObOFN6aOZIrTfE+hzDybAAZ2gVXbE4aHctkhRCuVMvjgmTL39bdL6PLTd
         6sIaDDWGcIQB4Yftf7MISpE3xLxyUbD3/y+ngPJ8BNDJoXjqWJCua52akfIngpyG6qRB
         LkTSHVHgCMjIuxi4iufKCPb6tR29MYNEp8mvfpv7wQdBDVltO3PcCiWtfCDq40NCNsRD
         KblZ2we8kdJlfiqW9rigeVzxgGbsPFgUFXaB7Du6s2HnP1rnVe7F8G+wbBmzQqc2H4OQ
         GT3A==
X-Forwarded-Encrypted: i=1; AJvYcCU2CuhPbwwQTkrJcrKGKk/0ESCLURFJFtP4tiNEhOeNVaJmSBTiheN+Y/nyxofK31cgihQoyUCJQy8nSfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPt8+6s8OBfSP0em/Gc7W2NLwXlQ9ELwgwqqZipy2llW8IQ8b6
	T2lf9fJQwqMIyUCzDpevd1Ch5xjV9LpOT9F+1VGrgLKqWqSNO+YjCjPjBpmhFbNLxSY=
X-Gm-Gg: ASbGnctme/jR+5HVPkJ9wVk2s0qSH1TnXJwXXNRt1wIyWfmznJLm85bs0p04cgZEs3B
	ngpPi8madjBvZUDIZEP6fASB9I0SWiG1BFK6+wiVGR0n3oEAM6BlaRiTOniScqPiSduUVp/jrG7
	yfXzj47sEvT0wFjrW7C5zJEhHq3Dgx9qUh7ua8ahR6buCVrmzvq8iYVc0+xf6/k00e5iAt4C8lD
	CwaJQcKbreicp4VMnPZsP9SjhxIW0uNsfLv0Ek9P7g+OS49dPtb+UC5q3s4/3DezvIT0iowMz6Y
	ITvg0kpm4m96QVwZrLlxhQnHskE0Jy3Qpe8FqxR38uTWgFwqkh6aAy4YmRT6aI2EcrgiJ3S5BwS
	KTPfgTjwxDT2hr8b1+09h2185EzYMM5bS
X-Google-Smtp-Source: AGHT+IH7USNXfR5sNsfQYnJhCwki/U4RwupJq6yD1CeMplQGSscMAoiL9MAMbLTMCcEmy+9woSzN4g==
X-Received: by 2002:a17:902:f70f:b0:234:a139:1203 with SMTP id d9443c01a7336-23642683ebfmr42207415ad.32.1749646791610;
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:51 -0700 (PDT)
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
Subject: [PATCH 3/8] dma: mmp_pdma: Add optional reset controller support
Date: Wed, 11 Jun 2025 20:57:18 +0800
Message-ID: <20250611125723.181711-4-guodong@riscstar.com>
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

Add support for hardware reset control in the MMP PDMA driver using the
devm_reset_control_get_optional_exclusive_deasserted() API.

The reset controller is retrieved without a specific reset name,
allowing platforms to define a single default reset line for the
PDMA controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf558237..fe627efeaff0 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0

