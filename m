Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A003205AB8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782789; cv=none; b=fnXzfj2lHtM8PYbH1FMxyY/forPJ4jmjeAHmWEpZvmhL63AbOH+f2I9tC1ek591xYbtJKv6waZW3JOh+SxM3ikN5CdOynj2PU2+Ijb+A9MDG17AxnXyAwl4+C4Kgpdv3+5wjlBBuLH9I/o4YDHPwOfxdmAR75r2rgGUxQ+KrMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782789; c=relaxed/simple;
	bh=tmKlWkoxyVVoBftC1tqR72Fa3nMd+vjFUErcYQ3Ogz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9Rv/DgW3NR51406niv/a2KvZCWTvUlLoOVWSsq9A3ADJR3AMDlsF/yEvKOptmrbOhooIkUkVThAHtWF5taq6nm4xOIBNwL6pe8+aqkrNW79aQL2NcIXtqEXN/Fsxb9Jg82N9+alR1ZMI1Mc0uXoxf+o2463GhWJRBXNCKVcGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=f/6li2LR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="f/6li2LR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso3611325ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782786; x=1739387586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2SP8UN+7O3+LtijH955HifaeFHXMbD1xCtBylyCBjw=;
        b=f/6li2LRa/J3WFAPNqmbqk+D1JoF7B/SQOUf3vMHrbmfS1efayd0oAfSdDyfP5e83Q
         ygsXUXWtvhF7lvpm5mDmg8tmdpT/SY+lqE/YtCi+Ips05BmM7hCyPeHURDgO9/2QPlxM
         2Xv7SCmRE1pfOcrCCtyN1xUUB6UyHkgjQjd5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782786; x=1739387586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2SP8UN+7O3+LtijH955HifaeFHXMbD1xCtBylyCBjw=;
        b=CRjZm6KZyv8vET61lCprC0c3yTEOoKC33uM1rylPl1kR7dC2gg8eiFuY9Eu2m/ifmK
         A8XSrzcyVATEQoykQUMCv7rOz67RxtCGPc4Z7u0Dzp5IuIQ8rcPbNETQNelN7p8eU5k9
         lJvAbSjxpqHWLclzsNQHqDIiFJ8wMdPVjSJrOVANwuY9SfKcRYhNfF3z8spoJdC3rlZg
         0lmJHXR2MWw/ljGbsCOSlGy7jMLztaH5XMgK0Q56qBqtCkxFd4+sZgWUb2Gsnrs2e/zp
         Txjf6Rj2cXPJ6G0Gn6yr4t8oLruLymQh8JVZaTE0SdGv8E6l97G4TfMubNzAeOcif30Z
         sgpw==
X-Forwarded-Encrypted: i=1; AJvYcCVvXAGr8+rgMa9IHhhQTV6Fa8eWm6AMeascDnjM35Q36XuUflFYp0edFfvjlSOZMdz2oZ2xWfkX4+8AA7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6EJNHQ1HLvORm5jZvfT8+4eJaLrUuqglX2XY2R+zgaumx17UQ
	SmquV0GYbylxufR0ZcUi9LzNsu3TI/T+XcM4AVH8R4b7oyHu0PE9uERMO+kYtw==
X-Gm-Gg: ASbGncvW7qjoufw/G6W6E5ODosu6luvjJdh+hjC4BFWwSWbQ41nY94dFJWgIXlQ1HPq
	PLPhkMa/+W/EW+3hxiivpcJ/PFoGt6cKIyl8XuK/k4Amb4YcLLiPs5TjCmJsEM/AvgxBHWX/PpY
	zZKr9CwFeJpvKraeA2ppnQn9a0u2F/4mdl3+tFzq2M/lb24CwdvwcG+PJiJ8HsCowwxBJg7pg5A
	NXcYIVJI1kc/pfJxMPvckyfX5MExCX7x4Mu+lj24o0ES4nTTbl2wFoYgRRuoP10Qz/4o1QyFvh6
	l7U6+oQhe4H6dC43gRODalTpsJdPQ4nerEmUJyiYHWV6gqucRZn+C9fEHgSjJScULBythpQ=
X-Google-Smtp-Source: AGHT+IFWf34gqo2Cq3GC10EE4JpvnnXxd/baqFQ4/rfJGOY8K+FfkhKwIxsYtkyKK3/Ky0Uqi5YYwA==
X-Received: by 2002:a05:6a00:2908:b0:72d:8fa2:9998 with SMTP id d2e1a72fcca58-7303513ac4amr6540559b3a.14.1738782756542;
        Wed, 05 Feb 2025 11:12:36 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:36 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 4/6] PCI: brcmstb: Use same constant table for config space access
Date: Wed,  5 Feb 2025 14:12:04 -0500
Message-ID: <20250205191213.29202-5-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
map_bus methods used these constants, the other used different
constants.  Fortunately there was no problem because the SoCs that used
the latter map_bus method all had the same register constants.

Remove the redundant constants and adjust the code to use them.
In addition, update EXT_CFG_DATA to use the 4k-page based config
space access system, which is what the second map_bus method was
already using.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 4f5d751cbdd7..2d1969d7fd30 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -151,9 +151,6 @@
 #define  MSI_INT_MASK_SET		0x10
 #define  MSI_INT_MASK_CLR		0x14
 
-#define PCIE_EXT_CFG_DATA				0x8000
-#define PCIE_EXT_CFG_INDEX				0x9000
-
 #define  PCIE_RGR1_SW_INIT_1_PERST_MASK			0x1
 #define  PCIE_RGR1_SW_INIT_1_PERST_SHIFT		0x0
 
@@ -728,8 +725,8 @@ static void __iomem *brcm_pcie_map_bus(struct pci_bus *bus,
 
 	/* For devices, write to the config space index register */
 	idx = PCIE_ECAM_OFFSET(bus->number, devfn, 0);
-	writel(idx, pcie->base + PCIE_EXT_CFG_INDEX);
-	return base + PCIE_EXT_CFG_DATA + PCIE_ECAM_REG(where);
+	writel(idx, base + IDX_ADDR(pcie));
+	return base + DATA_ADDR(pcie) + PCIE_ECAM_REG(where);
 }
 
 static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
@@ -1712,7 +1709,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 static const int pcie_offsets[] = {
 	[RGR1_SW_INIT_1]	= 0x9210,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1720,7 +1717,7 @@ static const int pcie_offsets[] = {
 static const int pcie_offsets_bcm7278[] = {
 	[RGR1_SW_INIT_1]	= 0xc010,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4204,
 	[PCIE_INTR2_CPU_BASE]	= 0x4300,
 };
@@ -1734,8 +1731,9 @@ static const int pcie_offsets_bcm7425[] = {
 };
 
 static const int pcie_offsets_bcm7712[] = {
+	[RGR1_SW_INIT_1]	= 0x9210,
 	[EXT_CFG_INDEX]		= 0x9000,
-	[EXT_CFG_DATA]		= 0x9004,
+	[EXT_CFG_DATA]		= 0x8000,
 	[PCIE_HARD_DEBUG]	= 0x4304,
 	[PCIE_INTR2_CPU_BASE]	= 0x4400,
 };
-- 
2.43.0

