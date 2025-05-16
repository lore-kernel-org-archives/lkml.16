Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D4318FDBD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405067; cv=none; b=LmQa234iaLoW355QiLj2vttXrqzizDQ+eEvAmxBXptwofjHbC3fZ/xUymKBc2GBie3jam6ooBEHkDx0xeRmqOkwAgcM6GwfxONjagEZjDEBPblp/zUo8SCEVhq33Evl2pYzn3IF38AX7WUjg99NwhvUJpnQwKFqN4hDKXofiuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405067; c=relaxed/simple;
	bh=Rv9YuN8PcxnH6qBRFisMj3kyT2NyDCuhQHnAabFr0wU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JO+LVrM/Y1VuipFFnB++tde8y00JfzFgrYjS3ynw/Ds/9UuTxVVvN7cULHSWVdIUco0C4C81YspMogkQtqdJvnN1tCm6ExTLe8HnHWJUEStvSFYWuw56/MW9RFhf+CAylNtZb3HkkbZrPBDYzVigISqztMwUpXMDHE1uQc8KX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p0rely7s; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p0rely7s"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54GEHOGX3751570;
	Fri, 16 May 2025 09:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747405044;
	bh=1PXDkf8DvBkrfNtvQAwfknII+pFLGvvQYZ5kAGobN48=;
	h=From:To:CC:Subject:Date;
	b=p0rely7sQz9icdrn165Qn2JoafU8RGB7ArHkokool6gpdotqTVl847mVO6Urux6Mx
	 uvVlM2SBAUtPtRzyB/jhVKYCx7iHx9XTeQ2L9P2iL6KrCv68JC7+NjmPl5We7QP4FH
	 zDoBc4/WlVBCneZzCca4naau8a7vF43QLrP36ajs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54GEHOIM016270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 16 May 2025 09:17:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 May 2025 09:17:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 May 2025 09:17:23 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54GEHNu4037368;
	Fri, 16 May 2025 09:17:23 -0500
From: Andrew Davis <afd@ti.com>
To: Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH RFC] regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ
Date: Fri, 16 May 2025 09:17:22 -0500
Message-ID: <20250516141722.13772-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

If either REGMAP_IRQ or REGMAP_MDIO are set then REGMAP is also set.
This then enables the selecting of IRQ_DOMAIN or MDIO_BUS from REGMAP
based on the above two symbols respectively. This makes it very easy
to end up with "circular dependencies".

Instead select the IRQ_DOMAIN or MDIO_BUS from the symbols that make
use of them. This is almost equivalent to before but makes it less
likely to end up with false circular dependency detections.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Sending as RFC as I haven't tested all the possible permutations
on config options right now to make sure this causes no changes,
but wanted to suggest this as a possible solution to the circular
dependency described here[0].

[0] https://www.spinics.net/lists/kernel/msg5686254.html

 drivers/base/regmap/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index b1affac70d5dc..ffb2ef4882981 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -6,8 +6,6 @@
 config REGMAP
 	bool
 	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI)
-	select IRQ_DOMAIN if REGMAP_IRQ
-	select MDIO_BUS if REGMAP_MDIO
 	help
 	  Enable support for the Register Map (regmap) access API.
 
@@ -58,12 +56,14 @@ config REGMAP_W1
 
 config REGMAP_MDIO
 	tristate
+	select MDIO_BUS
 
 config REGMAP_MMIO
 	tristate
 
 config REGMAP_IRQ
 	bool
+	select IRQ_DOMAIN
 
 config REGMAP_RAM
 	tristate
-- 
2.39.2

