Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5F31E9B17;
	Tue, 11 Feb 2025 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256793; cv=none; b=lWYrkHDvnNTfteFdcdCcLFf68ntWkxXV+itMUDbLTAhyXeKvAo4BWDhzDE5YimeWA5Zw3juC5EjCx6XuM2vGFFUbnj4B5sqAElYBtzObvfgOA3aI98FpVYR15ZgFUzQjIMqIioEXFL5qv+xLCL63BoF/cLDJUOykbPaULUC3cUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256793; c=relaxed/simple;
	bh=IB7avKqpVovtyYt3B+xnMLSza+KzVisN0RPkQRbQuS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sTkwHOQ38r0h0jjM0ICuoCjbPByUn0Vrs8cUEAKO0sPYHNcQSrVPB2GTLVL0nyO9XV05ulK9l0bSZ4AKSZXdmFve5xBBQBpcuzBrE3Iu/HXxOG7TTSMKDItUvbZDcuOE6TnCGjWt7JR2y5yafNeR8Mi1LnACtpkG39pIbEUxKFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=NIe33w8+; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="NIe33w8+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DA1E1480388;
	Tue, 11 Feb 2025 07:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpKbxzsb7RKOzJwg1Uq2SN9OBeCYnqQPSZz6F1//cF8=;
	b=NIe33w8+6L1Z4pJRrUOakrYKPKkAMwv0sWpdx5l+3bIRD1REV744LKrimk8dzE67GmIIz0
	gDLYzeMDCtZ4aGIWUuk8FGpnTFiNXzh41xY4HcwIjk+FOdoOSJ6D+6fph9X3EoS1hXIYvW
	9GnU9C6nZtk8HgoaiwcU6MH8klqK+1HmD0wv7T+WeUmksq/NoDYpGs2bbL9qfdw5+yrMz/
	gPstDeXz04Hb8YHPcYhQeNIzSCygeKKy4ro1py8nEropB22myO/5p/y0XuUBC8qmy4lxA3
	NwWa2506ksdgOsW6dW/JjKTDqBbK5tx3tmIl6bV4aaI6ixPuti/fnG/LfB25yg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 13/16] ARM: dts: microchip: sam9x60: Add OTPC node
Date: Tue, 11 Feb 2025 07:53:01 +0100
Message-Id: <20250211065304.5019-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
interface between the system and the OTP memory.  It also features the
Unique Product ID (UID) registers containing a unique serial number.

See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
Controller (OTPC)" for reference.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - squashed with patch adding the clock properties

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 1724b79967a17..af859f0b83a0f 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
 #include <dt-bindings/mfd/at91-usart.h>
 #include <dt-bindings/mfd/atmel-flexcom.h>
+#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
 / {
 	#address-cells = <1>;
@@ -157,6 +158,15 @@ sdmmc1: sdio-host@90000000 {
 			status = "disabled";
 		};
 
+		otpc: efuse@eff00000 {
+			compatible = "microchip,sam9x60-otpc", "syscon";
+			reg = <0xeff00000 0xec>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+			clock-names = "main_rc_osc", "otpc_clk";
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.39.5

