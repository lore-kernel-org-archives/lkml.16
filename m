Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18D253353;
	Mon,  7 Apr 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032587; cv=none; b=UcjJwZLf+HYshUCMqsQFIj3D01dKKUIZwRr37qWuXLcIpn2Dr/B75YEf3tB27Y45VAvZIOtAf6IIkVTvJVf9tej4N60YFsetSUMxfVdREZCN8p+eJyO8cI242Cm+pM6iIE4pHEORWF5l63ZcuiO+Otwia2P1PMDZsqtW3PlXbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032587; c=relaxed/simple;
	bh=Gcds0uGVhApI2OBDfQK2o4mQTitj8FZo+k89iEOc5ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ahztTi5UgL0rjFndblrry/JGFn7ldSJf+aHNpDgSJxoMiQG9Wb63/uIcVz4mBdwjLHTsfLcpDOrRaCzzgIIn6n58YdqoKqilFc7MIseeKNKNazY4x7bAr2NWDTnYyeTQog0ttFbz8HyvNnIAmXI0L94QKBy3jTXOyWRCvPicfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vblfh73x; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vblfh73x"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CPqBY020473;
	Mon, 7 Apr 2025 15:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sUoE004pjadBnoyOzbjhr4dsGQzt+uhGUkn+RUm/jfg=; b=vblfh73xQqEBnvXK
	1EfmoRrNw5JfLaoipt3xkDJ7bN2SXQdXHJw5hbHO/TSMJaiXvnoUP61XXQrYcxi5
	NBDC6X8GzDq4tAfTYfr9Vo2AjVVmP1FVAdJCTBXUEIaYVe7FeutV656DdWZNWei8
	dFWQ5SnuSIW4onM37KYBAIRQgRvEFFlvXWFIA7dGSj6v20cmyKipbjhkSNvoLf+a
	3TZb0d67ALawXJIjUVFnt2tok2plhN56lVir2qWBMQj5YqghV+xs/kYQ0w1oY1ha
	KXAg5qGS9Boyyn+eDPn5afGEmIgpJZXcfV7pH+vnqBNNIrtD3CPhYS9uo6qOPLDz
	adC1Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8p82kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:29:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B11FB40058;
	Mon,  7 Apr 2025 15:28:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D13619400F3;
	Mon,  7 Apr 2025 15:27:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:27:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 7 Apr 2025 15:27:37 +0200
Subject: [PATCH v8 6/7] arm64: dts: st: Add SPI NOR flash support on
 stm32mp257f-ev1 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-upstream_ospi_v6-v8-6-7b7716c1c1f6@foss.st.com>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
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
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01

Add SPI NOR flash nor support on stm32mp257f-ev1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1f837770654eee6c970208fef6edc..9d1a1155e36ccc283cb73e51b91f3200ee54a4aa 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -80,6 +80,11 @@ fw@80000000 {
 			reg = <0x0 0x80000000 0x0 0x4000000>;
 			no-map;
 		};
+
+		mm_ospi1: mm-ospi@60000000 {
+			reg = <0x0 0x60000000 0x0 0x10000000>;
+			no-map;
+		};
 	};
 };
 
@@ -190,6 +195,33 @@ &i2c8 {
 	status = "disabled";
 };
 
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	spi@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		memory-region = <&mm_ospi1>;
+		status = "okay";
+
+		flash0: flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-rx-bus-width = <4>;
+			spi-tx-bus-width = <4>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.25.1

