Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0B221726;
	Mon,  9 Jun 2025 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504679; cv=none; b=YmcIiO/SeZPHffw8TJlD/KR8+lRlAJGGSUEF6PEzPwYcOZPhEMNhYPGbWTiCcC2F/X968HRMn0PQ3ReZqbLW4Xq4FyTBqzjXlVIjghYI8BgXYGMYD6C/VNUmS7zO/05IdsqXw05V423KbK/ccqNrU8vO983knBmCpybC1n5dX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504679; c=relaxed/simple;
	bh=adVcvFQAO98qXYOyxqASBRwBadBn9tp/mRSFQhpO32M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQYj0UwNm0bXlB4FuOaTjNJOzMLrWHXVbq4wZsyarKTaSC5GHeoRcg3rW0gH3wt/odQir/VMGIocilYdHeOGrT0lzSL3Z1J2dDCime2bOHTa7xKyyx9RBmMl2u2f8Z9f6VFUnRtQ3in91Vgt1Io3Mkqizb9UTpoUh9YB6aooIvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=mPZAI9Fd; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="mPZAI9Fd"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id BF601C0019E2;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com BF601C0019E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504238;
	bh=adVcvFQAO98qXYOyxqASBRwBadBn9tp/mRSFQhpO32M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mPZAI9Fdeb9/EgKBHpCtWjKc3OoLaRsb/rLRLFFLq+cWDqiwsJNUFItSPmPEAfMaR
	 RSiYnWV+CyPcFLBYzhdTU2InOFo8k31OC3TGgemH927x8hsr9G7VMs2whXU/5CS1WN
	 ATXUyObwvOeCwlzqOUxW1C6h1HWvJNQKhy+9lwdU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 747551800051E;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 2/2] memory: brcmstb_memc: Simplify compatible matching
Date: Mon,  9 Jun 2025 14:23:56 -0700
Message-ID: <20250609212356.2264244-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
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

