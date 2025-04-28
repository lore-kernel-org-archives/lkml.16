Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4D94A35;
	Mon, 28 Apr 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838592; cv=none; b=rs+3AHVSS0Ab5ixkpXCfe8XjX8eHfu7kkztDz1NaG4ezc0MAJe9NpdL7P1+8rZTSNMSQcrUDCy+hkfeTo3Mh6molmCD2IjNdM9kbgNk9uxD5cXTjIKbBhzM/3zmTB/ygkpZp6Kpsli0T4kUZF5q7o4RCWx+7nZ1YnIlr9KU3FwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838592; c=relaxed/simple;
	bh=y24uRzFU5TqG69Qv9C1yif8Ncu1TZDD8zo88AVA6kCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ktNUhJatwpDd354jUuv0pCkdsAI7Cyeu10orRN92KqnOgijYLBYTuqOQ3IhndBUeDqaG19HmncviaqdM8MjAzspsg13JXE6tZgbAZJWDO/y6CgTIbkWp0E3NAEPzSHXq/ECcPUdNalVJ1l+ut8w2umPYFVNHtBSEREbJQClyatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=CeeZF/Sc; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="CeeZF/Sc"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6jub7031219;
	Mon, 28 Apr 2025 12:09:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=M
	H6bPYoo4cZ9V8Hs+HVXYfPub7iuTgeIKQrhXVlSMHI=; b=CeeZF/Sc5uSFZyinV
	4FnOA6dJIgdPVi46bkXbOrv3Sc8XEO3USQC3azJjlEmFKxyBTInpxHYb1+kZ15QD
	0+kKJE8PEIgI4uiuoqG1NKfe775+kvlSb3oEFqHpLBe5CkehHrsXHvghB7dFx/Is
	xIzDle2z15YJyYn7cBrldD92YYAXcY7tucczmCjeMg+kaURzGrwJ1LdC44Z8S1bf
	l3lhSFHchpPZnEM5lEFLP1FfmXN5plkb3RMRx3Qw5WXwC4BE7BOQo+tnWK1pz1fb
	h++hhH1Rl0wnK74ccCH18YPmt24/CLry3wiz2QjFISsZ/h6fqj/2w8m+Ljhgi/S3
	hv8vw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4694618xrx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Apr 2025 12:09:25 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.2.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 28 Apr 2025 12:09:23 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 28 Apr 2025 12:07:14 +0100
Subject: [PATCH v4 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250428-bxs-4-64-dts-v4-1-eddafb4ae19f@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=y24uRzFU5TqG69Qv9C1yif8Ncu1TZDD8zo88AVA6kCg=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTwJz7ecsvj86LsFXczJae63p78U8/uS1RMZVjwgofzJ
 b/Nj/P911HKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQATeTyHkeHSBOWQC0nqylJJ
 BuuVlwZmv+JQl9dKemtUvvN9pM/+8q+MDC9DnmfKvP6fvW/i0xeKxw+7dK9/JTZ/m3p/PocGX9T
 3RnYA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=WoMrMcfv c=1 sm=1 tr=0 ts=680f61e5 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=OXfeAiaCWNgA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=PTNHAAa5d5l9TNYsNX4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: MlitGlhfDN3AIHP9jRls8SSplDuq_gIT
X-Proofpoint-ORIG-GUID: MlitGlhfDN3AIHP9jRls8SSplDuq_gIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA5MiBTYWx0ZWRfX13m9LOxMqxGO FMwt1ognqElScitfM7IJRRDFg6wz4G4CfovwjvQx1tx0+I3RscjSH01OWvjkG2ulnO73Hwhz2sx 58MgBxvdbPbmbya8yu6+zbQpPuHq1xTYxrdW6HL6wePBljY14C7ujwSORNLpZxLMQFpZv70XHDx
 W8uyouAXYJQj8BmcBnXzW6bOTJluyJjPs6pWX3nUb8YzARX6KU+eUtLgOwaLWrmlcJWc8fq+hKZ Unpt55Vmub1aUdfrrRW95Cv4F0K1W/+1NiYDm61LDZGd311N7dScuhUbjAM8j3afXQU6RP6AyqX uie9S0Sg3sEAwhDzRWDjAXBqvEYAw5Dbrhi5wRAnsuWWuANveLKhgetxOkX4oCAvVma8ORnrhx8
 hys/PyYRp4ewhY8zRelnXAcpDowMCy0YOuu4nfX7h9ljE2czMPmAl3LTLvu4V6MSnmiRqW6S

Use the new compatible string and power domain name as introduced in
commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
enhancements").

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v4:
- Remove lore link to previous commit
- Link to v3: https://lore.kernel.org/r/20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-1-9f8c09233114@imgtec.com
Changes in v2:
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-1-f7d3fa06625d@imgtec.com

This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com

There was discussion regarding the forward/backward compatibility of the
changes in commit 2c01d9099859 referenced above, see:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com
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

