Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA98201249;
	Tue,  1 Apr 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510254; cv=none; b=Jxfu0ih2KRoUZdL8+UunFOr5esHHoIdE/bRB7dZccAu9p6oI5sXzRnuEtABPOkO0XiuFZSE9xdPxM8W+UbqQGrz2W/kDFNsofmqF/dCrrlKOn35PEbgQ7LcTg9aAArVccRSoPKfG1rS0ncfoOMzcuUkWeQNzZTI3Ihcj9KBeJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510254; c=relaxed/simple;
	bh=NbEFvg9dLGtiqs/SelfDs3q6eBNx1+H8EBVQj2Y4W6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fFD64/Rf71Si7uFPZz+DzMf6shpdB9D+yIvxGl1yEs/mC1OQ26QTekXWgedSyxV51Wqf0aif0H8zBAzqgE5L1xLP7wK83pL9357t6sahvs4jMb32h6W2npb79Ygja+Pj2WpgZWureWh5PLvbBSQ6OxKFwzaiux6nDfiWdaNdvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y4KhPdlg; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y4KhPdlg"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531AWBuw018089;
	Tue, 1 Apr 2025 14:23:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Vg7MudUzuSNAF8XJo8HjvSHWTc1TT8rzULJVq4AkvS4=; b=Y4KhPdlgPtZN9jbp
	//zKroY+DrPw0V1RZGsW6yOWFkfBei0jSSnvrcrZKH5UvqFylWdhe159osFwoaK+
	s5M4XbXn2+gSkd9PbGwt6q15x0XigfKVnQV4MhufCDyVkyeGn4R17f2zJ7/sY4Ec
	dcbEzeMs6XukXVf4sEjw5+/LgpDm1B62POncnNo2aPTZoVt/SBXvf1XeeAfadATw
	xueuyGu1fDV0hu8GCjzkNAFqoWRnSWlQg7Rm9MP3DIvn3Rr+B7twVL7bYbpfRogV
	ehbv0/Bq7jtqxaQXIZPWbRPil0wFvrWPzbXr4x4kjNcO81hPDKSPwbZRPIipeSku
	pd501A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75q5k16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7E89040060;
	Tue,  1 Apr 2025 14:22:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C31D08A0878;
	Tue,  1 Apr 2025 14:21:51 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:51 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 1 Apr 2025 14:21:49 +0200
Subject: [PATCH v7 5/7] arm64: dts: st: Add ospi port1 pinctrl entries in
 stm32mp25-pinctrl.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250401-upstream_ospi_v6-v7-5-0ef28513ed81@foss.st.com>
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
In-Reply-To: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01

Add pinctrl entry related to OSPI's port1 in stm32mp25-pinctrl.dtsi

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 8fdd5f020425d53eefa724de9c23ec0ca211ab7f..cf5be316de2613e7d7050374c9a57fd95020d715 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -101,6 +101,57 @@ pins2 {
 		};
 	};
 
+	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	ospi_port1_clk_sleep_pins_a: ospi-port1-clk-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, ANALOG)>; /* OSPI1_CLK */
+		};
+	};
+
+	ospi_port1_cs0_pins_a: ospi-port1-cs0-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, AF10)>; /* OSPI_NCS0 */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	ospi_port1_cs0_sleep_pins_a: ospi-port1-cs0-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, ANALOG)>; /* OSPI_NCS0 */
+		};
+	};
+
+	ospi_port1_io03_pins_a: ospi-port1-io03-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF10)>, /* OSPI_IO0 */
+				 <STM32_PINMUX('D', 5, AF10)>, /* OSPI_IO1 */
+				 <STM32_PINMUX('D', 6, AF10)>, /* OSPI_IO2 */
+				 <STM32_PINMUX('D', 7, AF10)>; /* OSPI_IO3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	ospi_port1_io03_sleep_pins_a: ospi-port1-io03-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* OSPI_IO0 */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* OSPI_IO1 */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* OSPI_IO2 */
+				 <STM32_PINMUX('D', 7, ANALOG)>; /* OSPI_IO3 */
+		};
+	};
+
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */

-- 
2.25.1

