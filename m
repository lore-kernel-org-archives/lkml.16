Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52C1C1F0D;
	Mon, 28 Apr 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838593; cv=none; b=F6xsij7suCdZn1l+98g829pUQInl37962Cza090rT4QDh+uBsUWLr+CIFPWdYWKrdWGT+48kTX8fBdAJ9sLv8chxJbs6j6GwOoXrmHNe6NaZt7S2uMETTT5xMZRe3C0ZUzTzTFwhQlhsc8guVf/9g3ZFMELKf0EADw3b/Tv6Oec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838593; c=relaxed/simple;
	bh=IeXXgzKgQ8kwF0+F01gM2sNmOCQIR4xlPk8JwmdDjm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gRuc0OqAi3Q3CzAGOMV9dB4XKAvrhSb9Wc8z3VFFGNJFUaOFQ5VJbJz64xNzCiVCS1MtGYxrOAb6iTIVrbgz4u4TigIc9ETNTz7xWLCbe0ghQmUQEJwAXWp0qKM3Ije1EeSDg/o3KvWeeVAu8rTheLcxpd03Mq24FHAW/OZpB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=c1s9jZjn; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="c1s9jZjn"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6jub8031219;
	Mon, 28 Apr 2025 12:09:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=j
	a1nnYiYVVPOxqkZvfptQISEEK1d3OniR8WGUf28Bq0=; b=c1s9jZjnX1qiq2pfV
	nky5gp9a0dNhS7DjoEefMAvoYONlBTy7uBkoZgj01ijZ20+guc8ikl21JMEYfDp/
	NgVbibNFc6bElQiA6Q77/fbg4UTCXFIyMqyUvBosPdS64XGAkK3tLSldD0J/p4wa
	4HgYTI6yvjT3M7AA5v02Xf3SlR+3+TFJ9VX+sOPs2a/Synf1EKmuOE/3XQCCvzpn
	4RdMnmAHcTNbpnqadhnNDidS3H3b4MxLIowVqOvz+5QBvSkmJ/rGcs6pHowoxaHm
	PeYlIRXJ9J6XNcBxJHao3P2V0XhGnKl00mmbqJmHBPj4th6o/Yp1J/yulriWzaMt
	pxraw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4694618xrx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Apr 2025 12:09:26 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.2.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 12:09:24 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 28 Apr 2025 12:07:15 +0100
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-bxs-4-64-dts-v4-2-eddafb4ae19f@imgtec.com>
References: <20250428-bxs-4-64-dts-v4-0-eddafb4ae19f@imgtec.com>
In-Reply-To: <20250428-bxs-4-64-dts-v4-0-eddafb4ae19f@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=IeXXgzKgQ8kwF0+F01gM2sNmOCQIR4xlPk8JwmdDjm8=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTwJz4Wfh7ZzninLOGznY/fkeXFrBP+PNu/s+2CWEDAl
 5eOEl3+HaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRi+yMDHcyHAq4RPavMgkJ
 zHw2vT5v7aq/5WLzk98HCt1jNEgJXM/IcEVt/+8N+Xe6RSZ8SZKt/rrysvAOJtPOoker73DWm9n
 z8wAA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=WoMrMcfv c=1 sm=1 tr=0 ts=680f61e6 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=KjGJ_YhaLPe-tYgPVq4A:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: vaxiKJJFniPvml___2t2S2s1DCfpFwlG
X-Proofpoint-ORIG-GUID: vaxiKJJFniPvml___2t2S2s1DCfpFwlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5MiBTYWx0ZWRfXx+mtO/Gv5Iuf CJe5917eWgHlSDP3JvBZf4l4n3hTfNJrlf2Aaap1WPfiJ2dNGnxOQ9K2d4EsGb9aNIZrryo/Mlx 1iHBDRUJ0D3zvJ6slLFRHaYP1dNjrbPHCS454Fyd8cSMI+HpohHUzkKsDcHk/QXBHdBEDZVy93n
 HRg1lWAkYsUhPvuQEryw1O5ZfiN7tnbmXVYyU7zXjNqzhLZP73fXYFd0aLbu4Kt5sEqUijd+Vym ZdglEMtjyizN5wghEC5P2lW64Pz0w3rx5kejjhGe9iAk106NiaOFAPZKaokVE/k8/YLVNNywmdc S2kNZ+yUpDMMJGXhjvl7u0ZtwbI2RJP9Py/MOwnyQwgUwiYu8/jhdpKxagdok1Djeb8dhOjlApO
 eWEEhTON9OARS7E2n8ZIZBucBcIrL/lL7z3haJbn7JrrqAGz1vgEdOXhLer7jqdGdCKC02b4

The J721S2 binding is based on the TI downstream binding in commit
54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
but with updated compatible strings.

The clock[2] and power[3] indices were verified from HTML docs, while
the interrupt index comes from the TRM[4] (appendix
"J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
"GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
[4]: https://www.ti.com/lit/zip/spruj28 (revision E)

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- Fix typo in commit message (intterupt -> interrupt)
- Link to v3: https://lore.kernel.org/r/20250422-bxs-4-64-dts-v3-2-ec6657bde135@imgtec.com
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

