Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C412DFA36;
	Tue, 15 Apr 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734063; cv=none; b=IGrRRBBClB3P1ZqG+TAAhvDYD/7JFRcdrYmW83ES62sC5Kgy3WV7cUbH4y6bdxUf35YCXhgHrCPX3Jd3QHTJGxMwcL2th4kQ9n/PNd4z6wYgjb2YdG7xvsKNMmaADWwBLx1VYx1kD1rmiV2BMQNfTGuDedWLgUeMPJNiksstQHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734063; c=relaxed/simple;
	bh=UMbkWLjVpM4JT09LlFH8z1SMQTIyLtQrK71Qmod4xAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ha+LvfogX7JijlEOCYKIgjT6sXGQVsWHZCta44YhJX5kDwlZIc/pt5os3l9ApN3Ue5ldauNv3+oSYhSd6hlJXCy2VPbtWHI2aSpwDu2e7/Zta5kJY9SFUUjSW8Sy5ase0T98ldwQhzKWpS4sfXDBPSGIUL+1tY73v6fjMOv/OJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Ua+85bSQ; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Ua+85bSQ"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7w6Y7029858;
	Tue, 15 Apr 2025 17:20:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=m
	sJu9aDSg4Nys42NrDcCA+RAYwx5Hvds5cH5ptXXg6s=; b=Ua+85bSQJ/ohmDRX/
	vf2f4cC5oOJKxsnwk670yns6bp5Vj9uKJ/V6WY0DC3P+26I43as8I45eLQSoDpDI
	/1jz8bvGjjUCZwL6LkhLusZxYjFLyxuaV95wlByW5O9zq95AoQ5VI0Ox5PZybZ8n
	RPed9vldpaVEinwgDRGKr7hvfGNJyRDsTq0aGUxDIFPAFnBE+3YSM9J6GaK5rXBN
	OyKTQoZ0zxK09utDR/yVcGFzR0Dwon6QdcOUM7IlRPA/VLIJLA84ntITLFlwdA1W
	d1/1hgvhKkclmVDfotMRxI1Z4QhK3/yPBu3qcKKnZhEQocw1T+3EUIXJ8MStpYji
	pFX7g==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeua1mv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 17:20:36 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 15 Apr 2025 17:20:35 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 15 Apr 2025 17:20:24 +0100
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250415-bxs-4-64-dts-v1-1-f7d3fa06625d@imgtec.com>
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
In-Reply-To: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
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
        Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=UMbkWLjVpM4JT09LlFH8z1SMQTIyLtQrK71Qmod4xAI=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaT/aw9MOSoqU/JtnYjX2zX77bhnxBwP6LS8fapgS47WN
 aasK+/OdZSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEYvkY/hl6pxz5N/udWGKX
 Ut92/+uCMX6zzD20jpfvF/cxvM6ZycnwT3Xt9g9aTD+6Y9/2HdE7H1mQI/9Jy+R0lPpTtaU9fae
 XsAMA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fe8754 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=PTNHAAa5d5l9TNYsNX4A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: VhpVIdBKSQ1zSxmWgdsS2wjHNfppdnk3
X-Proofpoint-ORIG-GUID: VhpVIdBKSQ1zSxmWgdsS2wjHNfppdnk3

Use the new compatible string and power domain name as introduced in
commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
enhancements")[1].

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 7d355aa73ea2116723735f70b9351cefcd8bc118..d17b25cae196b08d24adbe7c913ccaba7eed37eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -691,12 +691,14 @@ ospi0: spi@fc40000 {
 	};
 
 	gpu: gpu@fd00000 {
-		compatible = "ti,am62-gpu", "img,img-axe";
+		compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-axe",
+			     "img,img-rogue";
 		reg = <0x00 0x0fd00000 0x00 0x20000>;
 		clocks = <&k3_clks 187 0>;
 		clock-names = "core";
 		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a";
 	};
 
 	cpsw3g: ethernet@8000000 {

-- 
2.49.0

