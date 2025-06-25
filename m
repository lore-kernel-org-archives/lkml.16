Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BE1FBCB2;
	Wed, 25 Jun 2025 06:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834215; cv=none; b=OUK7zh7jbcNnfqHKKkIhF7pZpd0YkTqWckloa+gzpnyqLkY6qsCppb3Je8mQ3N9PCnkfDEhRPsZZhZC76NCk/Atx6w6S/KZpgvHRgRdL1s307GDUg1U57NTqH3Zb9erX4EhNmRQnX/plsvKc0LWWPv5CMIPA0XHOC9mxJvvJRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834215; c=relaxed/simple;
	bh=Ari4l4DdMYDHywUQJMzpAojTPk4J50E+stnCgXSLvZI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H/V/x3OLwEMiJO4eitxh42HW87xC5Pli8P33CPnvxAdjyylzivE5M0r8TtIFLVDD4i3jUjQC8G35s7mQsD+rAbvAdusRoc0ne/av6jN+W6+8og0WW4mTwc2WQTxn+QBtBw9eXN3DZ07fjR076cDScfxqPNcIeZ38kgKuiURcd7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YNk/+ZKY; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YNk/+ZKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834214; x=1782370214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ari4l4DdMYDHywUQJMzpAojTPk4J50E+stnCgXSLvZI=;
  b=YNk/+ZKYZUyGC6FHYPohKJNInshszMXHsWGRvxaoov/qgSWhWoWZJYEY
   oiiQ8vnYBE3iHJPi3sjWEF62pHoH5RKjQQUMvCzZmwrz06qS1GWiCeFkK
   bp2lTkX/Bns4bmqUQTXf2gCr1PjnlUo9elRs/XZA99SuQW+HthuK7RLiz
   +6eOn8Myy/5WNfuL/vujdgNxyQsgWwlgza83QluSRAnwGOkCeKo7K7fjc
   J1Ld2dstYKDKviYhHyPx3Pi9rm/7nWhO38Ttn2D7LiMAib3Gxth2hpVb7
   c93qS+3l9rj09yzVQMbm23c0ItHahLe0esclEJgv/IVqtwQb8MzRVdbSy
   A==;
X-CSE-ConnectionGUID: I6q3k54CR/y9OS0wbbtBHw==
X-CSE-MsgGUID: 1mc1J/PLTleWv4ujWqG+AQ==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43193030"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:48 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/3] Update the cache configuration for Microchip SAMA5D MPUs
Date: Wed, 25 Jun 2025 09:49:31 +0300
Message-ID: <20250625064934.4828-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series updates the cache configuration Microchip SAMA5D MPUs.
The cache configuration is described in block diagram from datasheet.

Mihai Sain (3):
  ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
  ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
  ARM: dts: microchip: sama5d4: Update the cache configuration for CPU

 arch/arm/boot/dts/microchip/sama5d2.dtsi | 3 +++
 arch/arm/boot/dts/microchip/sama5d3.dtsi | 2 ++
 arch/arm/boot/dts/microchip/sama5d4.dtsi | 3 +++
 3 files changed, 8 insertions(+)


base-commit: 7595b66ae9de667bf35a8c99e8f1bfc4792e207e
-- 
2.50.0

