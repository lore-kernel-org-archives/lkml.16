Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968A22338;
	Fri, 23 May 2025 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748031866; cv=none; b=t9DVaFodaxjDIQJw9xXvpxNQ/YaELA6uZujohW1WYO6+rM2L/uONEJdA6Ws/bU0ghfhkkydBcNuLZet8Yw6I55nQbJnbmBgTFUCbekyVxuNC3lNGZvNHexdLhQ/nNy5XLKXso7YkbAJLMJwmTO4SnlqSowHf1F35Gk+t6qOoAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748031866; c=relaxed/simple;
	bh=2F6xMBFuRrBPNxJsv+wvLS8JyNsreiW7TLaLUVv078Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bvBIiMWUYqeHfzTUmlvzF4b9beQXV2FhULy9VEQ4zQCCiiIhqQ4EdcCB2VWH97mYbP5IkKjwPTo7TQXuQds8Faz85WCyOXTnFwQaz3XkO0Ua35EVIE2d2cL/+yuJlTRl882w8tQzJw0a7yC44uit9lLDfwjl3rGoQeApbIWBtYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=pALtpo0s; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="pALtpo0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748031864; x=1779567864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2F6xMBFuRrBPNxJsv+wvLS8JyNsreiW7TLaLUVv078Y=;
  b=pALtpo0sdsHbF2d6o5QRM9V7WMERVi0wV7a4GuGXF8tJlAYONhlqCytq
   niNW7392wvxetxiTpCFm590JlN1QdXfvOS88pAeKu3h6ZbzYGtyyFedz3
   1p3TXYQtwlGYrO9Sbs5IEeQpGhlx50CxKkROQRd98sxTf3cyoYGb0JtIi
   Viuh9KMOt47DJHAljbgsFJdwPknIKbgftwa52zBQ4xKz9Bir4+p7ihi2J
   4eNNvldu29m2XmfWj1h8rEnB6noi4LzLnPf15ikvTo+hwaYNbjdgUbJow
   yWzZVXj/zqhDaqnrGugOYeb483w4Az4y9V+r8pAsRWB4o2sYw/mmCNe+z
   w==;
X-CSE-ConnectionGUID: KBUIaMEtQL+E9GaMz9Liiw==
X-CSE-MsgGUID: SOO35i9VTWOb/MEN5NYIWw==
X-IronPort-AV: E=Sophos;i="6.15,309,1739862000"; 
   d="scan'208";a="46850857"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2025 13:24:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 23 May 2025 13:23:57 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Fri, 23 May 2025 13:23:57 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 0/2] AT91 SAMA7 SoC Clock Adjustments
Date: Fri, 23 May 2025 13:24:29 -0700
Message-ID: <cover.1748030737.git.Ryan.Wanner@microchip.com>
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

Ryan Wanner (2):
  ARM: dts: microchip: sama7g5: Adjust clock xtal phandle
  ARM: dts: microchip: sama7d65: Add clock name property

 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 18 ++++++++----------
 arch/arm/boot/dts/microchip/sama7d65.dtsi      |  2 ++
 arch/arm/boot/dts/microchip/sama7g5.dtsi       |  6 ++++--
 3 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.43.0

