Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78223202F67;
	Tue,  1 Apr 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510255; cv=none; b=bfOVi8VOu5dVEKb6PFc252vRQFCuptQs/1c1bWNcdqAw8YKnSojzHJXewo8uhhHdX3JTldc0PK6NuIjzlbbdXbvGgCq0xSdybxg2M5+X8CeB1xJ2NMhlYJXADdZ2ywvLvnnrA44aXWjinX5ZAekINYA3qyKUrCnrg1lPtVRvUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510255; c=relaxed/simple;
	bh=Sooo/Ep7QsBZgr+mYF05cRDBchuTPvc0045v6Wynp4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JmZrfABlgbjRUVWK6BOgqO+8GchLHwz958rjkV3sKcuDxKKLfpKKgQDVw+iGRPkXWuFHUvhYb8Ae2fxOwxRDWkSvIl8vch89KrIdI87OGakWzmK/oKbMcmwRQhuBc4kHa8EuRgovFPuzwSXcivkX7qUcenLByiRUthZF11JddpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bj1wPKmY; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bj1wPKmY"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5319GZoE017666;
	Tue, 1 Apr 2025 14:23:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	e2/Ty/VBdhidNs0ktJpFl7iwQ9B9FTOM5IiwfYE2ixI=; b=bj1wPKmYT9E5V5A7
	ug4ZBHFwYQhdMibXraLnjSvamJtKLrFlhyBhVY/wNNm5oWPd4iqL9/FwXK39c+7r
	AWC0Q1mFMRvyL55rm6GntEse1nmgj3FYYxU1Bfn7HliuTerXKNMiOUG3Y57vTuRm
	yj3q1r2gSMleyA9Fc9XRO9+ZCSvxGqk5vmNFPmK/OVJByx1ox0LusZwMqbuDXvXw
	qtNv5oUWgeo0wW6eyrAX3bJRw9uNnT9uvDW9DX96muVQOwaDrUj60DOZpMFIpMdP
	dl4pAGX7evBe+JLm7dBgQunJ8YuvrHz3md6ej+nn1Y2zFlEJTNf00zJZVkrwGAlA
	RrGn4g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p935w9k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 14:23:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6DAA940058;
	Tue,  1 Apr 2025 14:22:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 135AF8A0869;
	Tue,  1 Apr 2025 14:21:51 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 14:21:50 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 1 Apr 2025 14:21:48 +0200
Subject: [PATCH v7 4/7] arm64: dts: st: Add OMM node on stm32mp251
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250401-upstream_ospi_v6-v7-4-0ef28513ed81@foss.st.com>
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

Add Octo Memory Manager (OMM) entry on stm32mp251 and its two
OSPI instance.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008c5b736ba75f5210d0eddb5b43489..73b573ff7f638f75800bc87a7eed480eda259b15 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -768,6 +768,60 @@ rng: rng@42020000 {
 				status = "disabled";
 			};
 
+			ommanager: ommanager@40500000 {
+				compatible = "st,stm32mp25-omm";
+				reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+				reg-names = "regs", "memory_map";
+				ranges = <0 0 0x40430000 0x400>,
+					 <1 0 0x40440000 0x400>;
+				clocks = <&rcc CK_BUS_OSPIIOM>,
+					 <&scmi_clk CK_SCMI_OSPI1>,
+					 <&scmi_clk CK_SCMI_OSPI2>;
+				clock-names = "omm", "ospi1", "ospi2";
+				resets = <&rcc OSPIIOM_R>,
+					 <&scmi_reset RST_SCMI_OSPI1>,
+					 <&scmi_reset RST_SCMI_OSPI2>;
+				reset-names = "omm", "ospi1", "ospi2";
+				access-controllers = <&rifsc 111>;
+				power-domains = <&CLUSTER_PD>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+				status = "disabled";
+
+				ospi1: spi@0 {
+					compatible = "st,stm32mp25-ospi";
+					reg = <0 0 0x400>;
+					interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&hpdma 2 0x62 0x00003121>,
+					       <&hpdma 2 0x42 0x00003112>;
+					dma-names = "tx", "rx";
+					clocks = <&scmi_clk CK_SCMI_OSPI1>;
+					resets = <&scmi_reset RST_SCMI_OSPI1>,
+						 <&scmi_reset RST_SCMI_OSPI1DLL>;
+					access-controllers = <&rifsc 74>;
+					power-domains = <&CLUSTER_PD>;
+					st,syscfg-dlyb = <&syscfg 0x1000>;
+					status = "disabled";
+				};
+
+				ospi2: spi@1 {
+					compatible = "st,stm32mp25-ospi";
+					reg = <1 0 0x400>;
+					interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&hpdma 3 0x62 0x00003121>,
+					       <&hpdma 3 0x42 0x00003112>;
+					dma-names = "tx", "rx";
+					clocks = <&scmi_clk CK_SCMI_OSPI2>;
+					resets = <&scmi_reset RST_SCMI_OSPI2>,
+						 <&scmi_reset RST_SCMI_OSPI2DLL>;
+					access-controllers = <&rifsc 75>;
+					power-domains = <&CLUSTER_PD>;
+					st,syscfg-dlyb = <&syscfg 0x1400>;
+					status = "disabled";
+				};
+			};
+
 			spi8: spi@46020000 {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.25.1

