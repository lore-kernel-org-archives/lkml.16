Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7621018A;
	Tue, 17 Jun 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176530; cv=none; b=stkuhnEj873+fR1W/Tljx0Nfmvq/R1gYza70BwvzEKVWoKgBBWp34nVq1tAjVvX+YFEVxeHvqmrZF/mOqm4t0n/9i8EDfE7Y0OsYrvinHQxQU3xl8yysYRcFxXKXhCqYp1Wyh2Pa28khgixvb6znIIRrPTFGWQBoisp5eGKLmXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176530; c=relaxed/simple;
	bh=7PYbB5ciYDFQ/YiUR7wUJVLYeeg/6IgVHNbv1sYOFLg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CFxDnZZuYFyRt5x7xRLLtWgYgHYoW6gfvfSwGZLW0r3fi3L6KkfNwdWFgQkYEXgfzvHoGt0ZFoLearRaDRljYwu/ahUr5tctj5N5iRgV91k8VUF3MIKSTEvrWEH2eJ/6vKlKewys0vukgFrzrJqmGCq7C422pHqmg0cHLoRokhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=VUAF6Tz9; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VUAF6Tz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750176528; x=1781712528;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7PYbB5ciYDFQ/YiUR7wUJVLYeeg/6IgVHNbv1sYOFLg=;
  b=VUAF6Tz9/0eZwT9AuGwTMSv5sQJJmjR37LxH7jHZlpcKdl4i1F9U2UAB
   tu14RkRaS+PSuMrhzeaTLaLcpQm6GuIaxOJ7ndRzJQzERBV4U2yypmrRr
   g0cwKK91x6UNO5nOdzgCtHfwo4zvp2DEhTnsrG2ylffTYV69RLlaYTfOk
   5YP4jT0mOdTWvacJrXfnP3Ssf8YLhO6GkD0G9j3wEorctc5ScM9uPWtdU
   2AdKfISnuJwtKPr9jaqzgVWHXUdIqfYz3ymM71AjGHZ74oDJlpotDXG7P
   R3e3MdfA6C8LePnZlo3+SBCjXXEdCFaDkp+e69ByVdINrig1RI7yWv+Ki
   Q==;
X-CSE-ConnectionGUID: nTbCTdliQ7eOQ0UC/OTqRA==
X-CSE-MsgGUID: Zlp5949DT86pliXPpTbf+g==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210388665"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 09:08:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 09:08:24 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 17 Jun 2025 09:08:24 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 0/3] AT91 SAMA7 SoC Clock Adjustments
Date: Tue, 17 Jun 2025 09:08:39 -0700
Message-ID: <cover.1750175453.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This set has clock system adjustments for the AT91 clock system for
sama7 SoC family.

The patch set updates the device tree phandle formatting for the
sama7g54 SoC. This also adds names to the xtals so the driver can
correclty find and name them in the clock tree.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Changes v2 -> v3:
- Removed the empty line after the fixes tag.
- Correct commit messages to better explain the issue that this is
  fixing.
- Initialize parent_data index to 0.

Changes v3 -> v4:
- Add clock-output-names to the xtal nodes.
- Remove the clock driver changes since those are not needed for this
  set.
- Adjust cover letter message to reflect the changes in the v4.

Changes v4 -> v5:
- Correct alphabetical issues.
- Add adjustment USB_CLK name to fit the formatting.
- Add clock names to SAM9X75 SoC.

Ryan Wanner (3):
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
  ARM: dts: microchip: sama7d65: Add clock name property
  ARM: dts: microchip: sam9x7: Add clock name property

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sam9x7.dtsi        |  2 ++
 arch/arm/boot/dts/microchip/sama7d65.dtsi      |  2 ++
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  9 ++++++---
 4 files changed, 18 insertions(+), 13 deletions(-)

-- 
2.43.0

