Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF928E8;
	Tue, 22 Apr 2025 00:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280541; cv=none; b=XIES1pooul/jlhuDtEl9FQVHUWBTaMiHBZ6fmwVU+9TvUe8TUdDqG33A0i0yB0ilYMrbStq67dxB5+DAQJgCfRkZL0Bfq/rnr0vtFkF0owHeaWUILG6yq5ovd1/6KBBubKtQRqvq8Qug+Y//3DgfQ67T8SF3Nav7NFvLInWJwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280541; c=relaxed/simple;
	bh=r0WeCafkn0N6JQq6GB7snU/CxMyGN8maaDkjFfFd71o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMMJ3khXZHExSMQJzoZWLAnRQPwWw4OzgzVdHMZhV3F1hvt6j3eyu9+6/+AWqGRT/ZRYVdjo+RCjDXp5Pbp8AeXV8dW4S5pYtRWaoqTjA/sBJ+XRo+cy1LzkP+PWLN/ecyIZRntm67aRAvmMhvYMXwWeoXzEddxV8ov72z8of38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WSdLi1se; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WSdLi1se"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08qDO1715195
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 19:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745280532;
	bh=dtlE8n852ESlBd0Jmsf8siXOlSR5oed0ZYISsStED1w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WSdLi1seRiEqJoSO6rWoxwrAcgwnJ2uuDIS9li7G/xtYDUOxP7Ra1tV6r9/W4cz6R
	 00X4vqxZB1xaqUBeoOt829oCIxm5CtWWmcjTRiL/JLXk/Vj6jnJa9OUonVEoChWgWF
	 yXMNCJCI6z3+KeaNly0OnXjShUN5iy8Xb4lM1eaw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53M08q62079762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 19:08:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 19:08:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 19:08:51 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53M08pDG065170;
	Mon, 21 Apr 2025 19:08:52 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7-sk: Enable PWM
Date: Mon, 21 Apr 2025 19:08:50 -0500
Message-ID: <20250422000851.4118545-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
References: <20250422000851.4118545-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

PWM signals can be routed to the user expansion header on am62a7
SK. Enable eCAP0, eCAP1, eHRPWM1, and route the output PWM signals
to pins on J3 header.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c839..a9557ee73b831 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -383,6 +383,25 @@ vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 			AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO0_31 */
 		>;
 	};
+
+	main_ecap0_pins_default: main-ecap0-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x01b8, PIN_OUTPUT, 3) /* (C16) SPI0_CS1.ECAP0_IN_APWM_OUT */
+		>;
+	};
+
+	main_ecap2_pins_default: main-ecap2-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x01a4, PIN_OUTPUT, 2) /* (A19) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	main_epwm1_pins_default: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62AX_IOPAD(0x019c, PIN_OUTPUT, 6) /* (B18) MCASP0_AXR1.EHRPWM1_A */
+			AM62AX_IOPAD(0x01a0, PIN_OUTPUT, 6) /* (B20) MCASP0_AXR0.EHRPWM1_B */
+		>;
+	};
 };
 
 &mcu_pmx0 {
@@ -741,3 +760,24 @@ dpi1_out: endpoint {
 		};
 	};
 };
+
+&ecap0 {
+	/* P26 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap0_pins_default>;
+	status = "okay";
+};
+
+&ecap2 {
+	/* P11 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_ecap2_pins_default>;
+	status = "okay";
+};
+
+&epwm1 {
+	/* P36/P33 of J3 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_epwm1_pins_default>;
+	status = "okay";
+};
-- 
2.49.0

