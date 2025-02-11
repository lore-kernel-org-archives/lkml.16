Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8352505B8;
	Tue, 11 Feb 2025 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284444; cv=none; b=ZTdNGR4cPcZG4eve4b9azoX5qvQ7h2aITBL8llV/C2WFLb68onn4hSPWK8gqJV7R2krgmR2tEaoi6Rvs/UVlcGjN74YZiLM/Xo9OgFwZkg0SPDuf2emKWC5qs0BeDu0AMnvHvnAG1sp82l6BNmOomKfVhAMoIw2AGJ5EfPYefX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284444; c=relaxed/simple;
	bh=ju8fNtGm/9M0KfuQYUcyEL4d/QiET4gCUmWGNpIcfPE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h+XOJ71pNwb7FnevNUkUf5t+YpNPcxj/3FKDvNF/0uBfsgsa9kn3iHcl4ZYtyLrdXHmbQBRdOEAcFRd5ZqRFjvCwAP0rDg3KrqdNs1OPs1CUxjfkgJ+mJWD+BcOCLacmxmGPBc9r93Z6/0H/WyN47VCu33wRd1wVr6q36npR6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=A/1bo5oE; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="A/1bo5oE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284442; x=1770820442;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ju8fNtGm/9M0KfuQYUcyEL4d/QiET4gCUmWGNpIcfPE=;
  b=A/1bo5oEkXELi8eeJPgJ0ZLCSObepzGyc4Hv2caI4Qj8ff2nQFfnhjtQ
   MUYAZvrzQ9JVrJMm4pnZXH8Tfd4r4U6wRVYG5c/yCHPZRkMmLpamIGXuv
   YUvbZIaMf08i1MNxP4J9Vmxob5m7kqhLmTt1AD6EVKpEdu9RrVpz93eKD
   H9Gvt2lXMaiRYzaANHwMjKNHhuokAOIXwgMc0r+J1VYPV1okCBGlXLjge
   knPXJegXZU9mxEPGkw7poEo51YIoBG8enPOk7HxrG5irzouK/FNOZ7wU5
   B/Ulgw0Z2NKjMcDsiwAAitDOeBVhIxyzZvRJT7Q+qY4OKX037hd90B6Sh
   w==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: t5KqAL4RToiGYpnbPSX4+g==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:25 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:23 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add power monitor support on sama7d65-curiosity board
Date: Tue, 11 Feb 2025 16:33:00 +0200
Message-ID: <20250211143302.4102-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds power monitor support on Microchip SAMA7D65 Curiosity board.

[root@SAMA7D65 ~]$ lsiio
Device 001: pac1934
Device 000: e1000000.adc

[root@SAMA7D65 ~]$ awk -f pac1934.awk
VDD3V3   current: 146.173 mA, voltage: 3302.73 mV
VDDIODDR current: 62.1356 mA, voltage: 1353.96 mV
VDDCORE  current: 242.248 mA, voltage: 1204.36 mV
VDDCPU   current: 213.565 mA, voltage: 1303.05 mV

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add flexcom 10 node
  ARM: dts: microchip: sama7d65_curiosity: Add power monitor support

 .../dts/microchip/at91-sama7d65_curiosity.dts | 52 +++++++++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 21 ++++++++
 2 files changed, 73 insertions(+)


base-commit: febbc555cf0fff895546ddb8ba2c9a523692fb55
-- 
2.48.1
