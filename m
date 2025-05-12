Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BD1386B4;
	Mon, 12 May 2025 06:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031506; cv=none; b=YfRXx2KyIwf7vJ7qEAhpBZr1nrdzh6MVyGFukMI3+kdQ7BE+7K7ZFZako7ST2JulG1YhLFdZLNV81hpdcyD7Wth+VF1i/DIgn2RG0SaFl5endiIJuZYj5yYT3nnjWyhy91pdvtxuNz9s/wCfwf20XI2L5uMV7QW4h5l/AKvWTSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031506; c=relaxed/simple;
	bh=NbEFvg9dLGtiqs/SelfDs3q6eBNx1+H8EBVQj2Y4W6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rUW7tnotFgXLv3B1mrZuH/N2XLdGcW4Pt4oyAn3iKEYyMFmSQlD0uqbq6XZ5mTBrOeGQiLaQ7Bm5khhgfMD0g6yyGCAWLzby2ZukuFmdHw/qksINX2rl7NQx5p1H6fXp+qMhDD/Ip66g3A4UpvuF0O6jMRNoqJRTtv+kaZAbrPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xOWSFzNI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xOWSFzNI"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BJsMWJ001292;
	Mon, 12 May 2025 08:31:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Vg7MudUzuSNAF8XJo8HjvSHWTc1TT8rzULJVq4AkvS4=; b=xOWSFzNIJNGFiEys
	AxscxEHFXiThKNN4FCidW5FiESZPUva+8VhUeigjU2F80TAmZYTIAbi1WdjQnnDe
	ULuhn40iDRNDrfsKiI2LBDk6n13lQslRp5890PIUmsEcFadyFu4IeQ2E79Io1HfN
	ECSIZiA9LOwBCZNk1MKDSh8MoTPzhDPuJzG21HjW5HG1AyMGmHeLqWDG8MDZrg6m
	1erGcgi0fj457aqUxbkt4kTPzS/Fh1Kyh/yczeYzngWqmcLygtZs/Ywb1gOxEuRH
	GgA5fkOuPaZla1amnCPXF4wTnBFJP/yicmm3X7jmwGsW2+APKNcoY0h8wUDeG+bH
	4tueng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxa5cxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 08:31:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4066B4005A;
	Mon, 12 May 2025 08:30:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6C5AA4B60D;
	Mon, 12 May 2025 08:29:39 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 08:29:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 12 May 2025 08:29:32 +0200
Subject: [PATCH v10 2/3] arm64: dts: st: Add ospi port1 pinctrl entries in
 stm32mp25-pinctrl.dtsi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250512-upstream_omm_ospi_dts-v10-2-fca0fbe6d10a@foss.st.com>
References: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
In-Reply-To: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01

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

