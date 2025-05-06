Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1E4A1D;
	Tue,  6 May 2025 20:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746561931; cv=none; b=aYxlzvr36qMFC2MFXtiSvlHGUue2axxnSkCFSQADf43UVemJQZW0VT0MrEKXrVSOlhcFn/z+dN0e6cnFgzravHfL52agkNdoJTdceeeRN04z2ZMyN4O7MeFEpq8h/FcVabQOwIos71LmyAVLa6sl/I2OVRzDfLF6xEf0So6wTuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746561931; c=relaxed/simple;
	bh=Pl1pOocrht3vmgtnFTJ9B4+etkXCe7HNZzSd09+Zpjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZvmfwhRNBBb4jWSPjq38/8TjsDwAhdM8Wus4ufOpi/BOJA9zfz3taYs889qn6JTU3NkoRNcAt7Km88cq0CL75rlqZDvZ7/sPJrzbQdP0kEXGRRvHp8JXGjVbVE+v2A6JpJv3q0szphcemVNkdmKQJE1+H9+dC3oMfPnR2qRC/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vwcd/nDF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vwcd/nDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746561930; x=1778097930;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pl1pOocrht3vmgtnFTJ9B4+etkXCe7HNZzSd09+Zpjs=;
  b=vwcd/nDFOA+FgaF7VoCfZlO7OSTyMkU4Fw4le8g2sgze/3Kmw9J1Mwil
   JwWCn8AApawd9f7sryA/OMKDVALPqhMrMb+fq7BouAyaLzn0udJx2EZZN
   mQHeSwqfX+UJzI0PApr2z43JrXFAje42wfQsCey885BIPVw3cY5B4P74R
   yqtwR82W1p8CpOIXlj43wTeNzeYa4bTk/CzRLj75yPI1TAcrmbi0QVSak
   cJHFy3W5h+FuNzp6HvGuhEjsMBuC1HufNRiGfv4ZbClc/yWdaXms/0NX4
   NX8gnniBpPZoAehinX8G47AHA6TZLQP6R7dwWNnOcKEx/RuPQWkBL+mLr
   Q==;
X-CSE-ConnectionGUID: lZtvjl0vTEGjDKUcareavA==
X-CSE-MsgGUID: X8leMnIES+qi7n9W3zbrQw==
X-IronPort-AV: E=Sophos;i="6.15,267,1739862000"; 
   d="scan'208";a="41792571"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2025 13:05:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 6 May 2025 13:05:12 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 6 May 2025 13:05:12 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v3 0/4] AT91 SAMA7 SoC Clock Adjustments
Date: Tue, 6 May 2025 13:04:55 -0700
Message-ID: <cover.1746561722.git.Ryan.Wanner@microchip.com>
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

The first is to adjust the slow clock driver to account for the updated
DT node-naming for clocks and xtals and ensuring the driver is still
backwards compatible.

The second and third are adding a missing clk_hw struct that are not added into
parent_data struct causing a incorrect parent for main_osc for both
sama7d65 and sama7g54 SoCs.

The last patch updates the device tree phandle formatting for the
sama7g54 SoC.

Changes v1 -> v2:
- Add clk_hw struct to parent_data adjustment for the sama7g5.c driver.
- Add correction to sama7g54 dtsi main xtal phandles.

Changes v2 -> v3:
- Removed the empty line after the fixes tag.
- Correct commit messages to better explain the issue that this is
  fixing.
- Initialize parent_data index to 0.

Ryan Wanner (4):
  clk: at91: sckc: Fix parent_data struct for slow osc
  clk: at91: sama7d65: Add missing clk_hw to parent_data
  clk: at91: sama7g5: Add missing clk_hw to parent_data
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  4 ++--
 drivers/clk/at91/sama7d65.c                    |  3 ++-
 drivers/clk/at91/sama7g5.c                     |  3 ++-
 drivers/clk/at91/sckc.c                        | 12 ++++++------
 5 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.43.0

