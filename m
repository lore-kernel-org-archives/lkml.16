Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980B33987;
	Thu, 30 Jan 2025 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218364; cv=none; b=oi8kKMUi9akJc2WoyOcDySiWU49qd3+9sAhDiP6LTGhHF4u2X5ys8WzA21nnr99F0p/2wNO4i8d3odpJ6U+hIQ+y1JcCSbLJZVzfQv6JEXlveOMpi+k6gLD0AuHy7jrRGl9U5hneKeVeiGBmajDI8AYqYYfPmk5auchBpNkv9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218364; c=relaxed/simple;
	bh=t9W5Rb4CAondW0sIAfb1RvObmqkMqHYRqubNjilGmX4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I+tLLWJgKwXzIAfB1ulkJksxWmUP6mKoJq0disdQbob5+jAqyr3uWsrzq1s6TjKVHeVOzxkdPUVJVFnY3qRm//hK4wtfShCrQ5M6UxzRgxO12OVDxwRpmhGW+RmQJ55IBx/CX0yYizPzniq42utZA+WoFx25dbv4dAn2Wh7TEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bVJ2BkhD; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bVJ2BkhD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6Ptsu1441923
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jan 2025 00:25:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738218355;
	bh=ihx14smJnL/Il3tLb/TsQL5FZnlYpLOLra15ZzIet8g=;
	h=From:To:CC:Subject:Date;
	b=bVJ2BkhDSr2axwIPzSld6I0Q1Yah7xayiyhxpum1VpQHt/+Q+2KXSXJLJuHuPJmwv
	 XI75vODXrrEpfEMeYT1ytCVI8mYDDls+r2s/LTeMAN62eO1fT9csrevYbDAs1Uv/jU
	 4Y09WOYFwe4Ypx87Euz9fSifPLuvptIQ6QjYu7Qs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6Ptp3089159;
	Thu, 30 Jan 2025 00:25:55 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 00:25:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 00:25:54 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6Poxp038116;
	Thu, 30 Jan 2025 00:25:51 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62p5-sk: Support SoC wakeup using USB1 wakeup
Date: Thu, 30 Jan 2025 11:55:47 +0530
Message-ID: <20250130062550.1554651-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup
the SoC based on USB events triggered by USB devices. This requires that
the pin corresponding to the Type-A connector remains pulled up even after
the SoC has entered the Deep Sleep mode. Hence, enable Deep Sleep pullup /
pulldown selection for the USB1_DRVBUS pin and set its Deep Sleep state to
PULL_UP.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250130.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ad71d2f27f53..c14a60243756 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -310,7 +310,7 @@ AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x0258, PIN_INPUT, 0) /* (G21) USB1_DRVVBUS */
+			AM62PX_IOPAD(0x0258, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (G21) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.43.0

