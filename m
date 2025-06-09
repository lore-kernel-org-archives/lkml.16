Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88247221289;
	Mon,  9 Jun 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504225; cv=none; b=b2HKRoYCOKhPd+Bv1XcMos+QYTpR0kb37LjHi6LwFgRLZFSFHUENoPb7tRN2NB2F9uv1K+U3SeFPV1SNdwK1Qi5vP/d5scD7FqXOuGMEnJvbeU8/Uo5f1E1ja4qspI8fOCP0oy5fWEnT7fg9JkaZ6K5WXVhApdLSaWvtFSlVzH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504225; c=relaxed/simple;
	bh=adVcvFQAO98qXYOyxqASBRwBadBn9tp/mRSFQhpO32M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i40pPPLiHa+HQxt50mttOUotNer2kHYYsF4YzV7w5cLQVCL/CosOLEQLKBmE6lyRzGBuWPWDr0T5IueDkGs3CgXE5xdhTKoZbjg8g1ly8W37iijXwSfieuBIdSyPusz6MZAyoKdPgLpgdtUhmt1+fcoyYivjZ7c1UGQfjp5L+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XWE9xPNI; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XWE9xPNI"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BD614C0008E3;
	Mon,  9 Jun 2025 14:23:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BD614C0008E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504223;
	bh=adVcvFQAO98qXYOyxqASBRwBadBn9tp/mRSFQhpO32M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWE9xPNIibnoRTv7jCm0NH4W9QTINnQ4qK0Po1PdT6VDMOrOY/aTbp9tbnvGDWxQ0
	 PlNfE5pPs7YquFR2Q/ZRzmotsE8A8D/VUcWxoezJnSnaJe8m0NTH2XPsJ3hVCRl5Pa
	 uyOW16KR6GGwwGbD0VxECY8pbvmT266Sh8jxi82I=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 99BF01800051E;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.orgg
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 2/2] memory: brcmstb_memc: Simplify compatible matching
Date: Mon,  9 Jun 2025 14:23:11 -0700
Message-ID: <20250609212311.2264108-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
References: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
has been defined, we can greatly simplify the matching within the driver
to only look for that compatible string and nothing else.

The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
register layout since that is the most common nowadays.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/memory/brcmstb_memc.c | 56 ++---------------------------------
 1 file changed, 2 insertions(+), 54 deletions(-)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index c87b37e2c1f0..ba73470b1b13 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -184,62 +184,10 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
 		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
 		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
 	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.2",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.3",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.5",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.6",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.7",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.8",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.3.0",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.3.1",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.0",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.1",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.2",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.3",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-c.1.4",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
-	},
-	/* default to the original offset */
+	/* default to the V21 offset */
 	{
 		.compatible = "brcm,brcmstb-memc-ddr",
-		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V1X]
+		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
 	},
 	{}
 };
-- 
2.43.0

