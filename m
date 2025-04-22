Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DE28936D;
	Tue, 22 Apr 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335639; cv=none; b=o2uPECxH95oAYtRn+DtkHiofqAneY5ZZ2cHW13xWtK+tuXAJH7ge6KGjP2LFPN5kVRcDQH4NJglTNtE7lEAE2ukQVfeNc3r/F2M0QW6yCPSDKYl8U8cVAloh2ZtetswpcTYQtzeJScmwAJiZ4M08Sm/9vcy1HbvEJjvD871F/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335639; c=relaxed/simple;
	bh=mXB1POJe6HuTvqTx1N0QPtvkf3Ravu1KC3w1Y+Ekgk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PdvEMc5Fw0nifxQZTopJZ8tXy87okKNInjz49FblaN0udHEPlDwoqKHxucqvBOb1+PgJumwdt5GLyGk+Ps1pxN/7fcCiipr37vDgSVOvOxH7FLN6GzMHkYudmkuNAbdivW6Y2m2bJ6V8+Q8S9aTC36PvnI6wA9DCrni9YbT/0Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=uwGsrZXY; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="uwGsrZXY"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6JMlD025210;
	Tue, 22 Apr 2025 16:26:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=T
	+8Dbi8Dp/XcgVzvDsUkk0RdPIiusdPwHu4nNqKQNjw=; b=uwGsrZXY02oLjlZTm
	H6PKnOy1+UiGPSL0/bT9CgYqUGVNlk295bP2p+eZ4d7BNTxpgZry08uxHsMmbdOr
	IOJeels+2qpjhPuIhx0qwIvF1+vd17KYlfDmMxwVrq8yLSAJk/u0Zhkdtebli85O
	cJrWC/TSX/jN0VZxLzaVUSVw53qUW0dira6Bmq9Jc8FrCWrhtU7PnZ/Yp3Xbi0t8
	iQaKnK+UIFBkSnlFGPgQ0L1CUZ46FS1KmPItogB7g16b0daijbmuh2ACdZghQoeX
	WppNPMrZFNldrkY3tyUMzE7B7Xz3n1y889wMZcNo/Hs9QWlywH7UoWc8Tug8Mlor
	6j6iw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4643ww22a3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Apr 2025 16:26:52 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.98) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 22 Apr 2025 16:26:51 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 22 Apr 2025 16:26:42 +0100
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250422-bxs-4-64-dts-v3-2-ec6657bde135@imgtec.com>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
In-Reply-To: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns <frank.binns@imgtec.com>,
        "Alessio Belle" <alessio.belle@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Matt Coster
	<matt.coster@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=mXB1POJe6HuTvqTx1N0QPtvkf3Ravu1KC3w1Y+Ekgk4=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSwb7VUnH9dPdf864vKwpbYd5tkP59m/HFq0uqg7W9OT
 ZxRv3F2QUcpC4MYB4OsmCLLjhWWK9T+qGlJ3PhVDDOHlQlkCAMXpwBM5O8Whv9F015djdG9W31i
 T+PXq9MqbvPO+KT216b7cbrsxRlOqs27GRn+fryUdvT027bdlvnzvj561iba+1Dj4ctbmh7NL2T
 a/99jAQA=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDExNyBTYWx0ZWRfX3rWUZOaXWHkx 0wTfY4be60nNiUfCWFNoe6YMCFgSdhcJna+2z/t++Hs03KjZlvU7rUR6TxgKnkFOieKhubKK6g4 NEow7qXFvLK4d5EwOMXwy9yLM6AdZEpoicklvwqEAKOMD7MzWF8SO/FOpdktXBLlOAkRsEpjyT7
 vkUQbMOTTpJ/p3y4NEdgviK8ZQHQ3QXJNETOh46Fho8U+vs4uk92dwNPRmc70JQqO4sSbpE4iU9 G5VDWpoc8npbF4Cu79asxT8K+C2zC8AvwgWxQcQORF5ENiBPLQpoC+E1dF8/doKaTraiYICoj6v e1i4HZieotYiERZO0isGdG1c98VuxhSHCWJq/YI0new8MVwXxYYcSlFMT9Tza3ovkInvP+uIy/U
 pQoL/yeyCSjrd1mshsg5vGGjdXjJ/zZAmS+bRLRLqddQ051YvqoCdAiWHkCDsvSp4rruJDqh
X-Authority-Analysis: v=2.4 cv=ApTu3P9P c=1 sm=1 tr=0 ts=6807b53c cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=KjGJ_YhaLPe-tYgPVq4A:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: Qf6AAKGH_HyWb1uWf-E221Ro5JHQIyNQ
X-Proofpoint-ORIG-GUID: Qf6AAKGH_HyWb1uWf-E221Ro5JHQIyNQ

The J721S2 binding is based on the TI downstream binding in commit
54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
but with updated compatible strings.

The clock[2] and power[3] indices were verified from HTML docs, while
the intterupt index comes from the TRM[4] (appendix
"J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
"GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
[4]: https://www.ti.com/lit/zip/spruj28 (revision E)

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- Use assigned-clocks to pre-load the frequency of the core clock
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com
Changes in v2:
- Add interrupt reference details
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com

This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..9e36cbbe0ea2fefceedcc95b78068ded7ef395f0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2048,4 +2048,18 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		assigned-clocks = <&k3_clks 130 1>;
+		assigned-clock-rates = <800000000>;
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.49.0

