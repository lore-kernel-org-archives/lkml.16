Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAA5290DB2;
	Fri, 23 May 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026238; cv=none; b=YYa9iIsCtHJ0lRaFoyWR9gEx/y7LRRL9lnhxLD9JxD22/tyrWD/2K/cy1ynuTGuUN46KQKMBKVi//GJSzvet1M4bgb6XZP9ru9PfZSvbkxNSql6VazRgyXP+EvTpA3IZXCKG6bwqb4AD3CHSyJdQE6fYDSuU5gZAY2xrqM6TjwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026238; c=relaxed/simple;
	bh=0r9gkCW0yRQt1gnBJzDmjX7k23tGsj45UqKcrz56EBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jae+JykJtcSjECqEj7b3PIVVhP/rliUuk5qohl0g5dXypNc8SILcbWaSiHQzGWTewgF7J6H8GSMexxDA+F/jNhrWMDaRA+ljAsEakP4dJuLT4kRzL1Oyvh+2sSuW0Om7eacWadeHTO+lPaQ5LbmrvuCxzTzxSFvG9UbvMc7J9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MK/ygYe5; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MK/ygYe5"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 69EA2C0000E9;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 69EA2C0000E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748025837;
	bh=0r9gkCW0yRQt1gnBJzDmjX7k23tGsj45UqKcrz56EBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MK/ygYe5WajchT5AUNHigM6mfw558fmeml2oAUIhvCXZPtOzcgfzi5DEknQmAbsza
	 QQQ24fFLXujWnQlIC1tMXMmgT9qpNyAOBTaqAffEl1pwn6UzANZcN6Xx9AnRE9DcS6
	 5nTEO8F7p8qgsHYRjUIZvVBinlw7BFV4dEkkbZ/A=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 4810618000853;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: justin.chen@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
Date: Fri, 23 May 2025 11:43:54 -0700
Message-ID: <20250523184354.1249577-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
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
 drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
 1 file changed, 3 insertions(+), 55 deletions(-)

diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
index c87b37e2c1f0..ec4c198ddc49 100644
--- a/drivers/memory/brcmstb_memc.c
+++ b/drivers/memory/brcmstb_memc.c
@@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
 		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
 	},
 	{
-		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
+		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
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

