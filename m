Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3617F250BE9;
	Tue, 11 Feb 2025 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284445; cv=none; b=oVKQC7kxIlRqGf3nhQUT14TCqwjkEyujhIHcDfCWd9ZkRYDuhHE1LKT1o+VX6b7DOBMHr7ms+QHk30YjSRUmDd0m9wtEHmG14gGlomomjVdcRJOMKl8V4FteOx2mt2wfbera/yzrKIAS+XfV9pseYoA1h5GwV2qjGT8aUERPY08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284445; c=relaxed/simple;
	bh=gtNS9zeFbVWWS25/rs7jIWKTO8fa4yHcUJ9AMC8j2xQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RaJFMmZDg4i8XZpp4j0MceT05y2iO/BVn0d8slXmME+GoFlgkFb93IPUEW15iuo2f2eCTiqb3gjJtb/RvxE9oWcH/zLcaidW3xgY4WFo0EgGm6xzIIjRdsK9Iq6GAyBgb7hz7b1xeZgSCue0Ox9VgersJQfHVNaAgFJVPFptGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2LiQOve5; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2LiQOve5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284444; x=1770820444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gtNS9zeFbVWWS25/rs7jIWKTO8fa4yHcUJ9AMC8j2xQ=;
  b=2LiQOve5OwtL5AUzeNZR8jqoBSHaX7AKn0yfXKXWNcfpCNs3f9zcpBnG
   cqlBRedD+TtNEsEEyoTwYW7GlvKt53YvUv1aE7YNXxBdYG70Js+0OUfRz
   dirCDrxnf9UB+VQ6tUBLZB0pA+8NAD2vnijBRdcPYb3sWMGYjW3XCTsaY
   qRmdwjzkeTR1BxP6/oeD5uUy7bcFBSZxBKQwk0tSLE/KcUq6AkNx8rtl0
   8iEvGltmWnzPVQMQ9TvgXIL0X5+9b8NLj+I1hJTIaxLM7ipHAL7QInskS
   knM4sk4vvzI8L1Z7m6cSbfHpL3e68kbxTCQ+I4lc6Ede+kg2armSDp7yj
   A==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: tahRwJItTf2T0EBCEQdO2A==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535218"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:27 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:25 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add flexcom 10 node
Date: Tue, 11 Feb 2025 16:33:01 +0200
Message-ID: <20250211143302.4102-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143302.4102-1-mihai.sain@microchip.com>
References: <20250211143302.4102-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add flexcom 10 node and its i2c-controller subnode
for usage on the SAMA7D65 Curiosity board.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 854b30d15dcd..a38e04a86b6d 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -132,6 +132,27 @@ uart6: serial@200 {
 			};
 		};
 
+		flx10: flexcom@e2824000 {
+			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
+			reg = <0xe2824000 0x200>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0xe2824000 0x800>;
+			status = "disabled";
+
+			i2c10: i2c@600 {
+				compatible = "microchip,sama7d65-i2c", "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 44>;
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
+		};
+
 		gic: interrupt-controller@e8c11000 {
 			compatible = "arm,cortex-a7-gic";
 			reg = <0xe8c11000 0x1000>,
-- 
2.48.1

