Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E74428B4EC;
	Tue, 22 Apr 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335639; cv=none; b=rB9NuI5w8aljpleG8QbxstNjIcBZf7lM7MVtkq1/FtNmgsZBAYtNgDMu8l+KBLz212cFqWx0hcPUE12JsnsAFKkLVpEepYD5qsmFLiB5oQY2phtseOZxkND+P1j0AD1QzghG6Pl6iyw6GFyCeS0dEywwel9ESW2X7a+eFGV2+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335639; c=relaxed/simple;
	bh=P7IIgBL2DEBvjkm96hBWzGVttjPfHoYpgW7BhMP5XtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PKo9y3J1syoOWHGoYaAqf6w/jT5jFx74ekcjKL9WX8SVyEeQ6HkpmOu+HkLBNSdAcIx4TsPFpmCq8hoOGSgjtnSR462rnZUFeGO6ame8BD2AMmvQaj37hhOgllVZc4bXkTbOfTDy5ikABed/Z4AtU31NHyf0MSl2yPVBMjkwdTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=KSTTiAMy; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="KSTTiAMy"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M6JMlC025210;
	Tue, 22 Apr 2025 16:26:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=B
	SGEQwMZjYIpuTN5ro8M8TjOKKvoSv9pOa+hAkQBQT0=; b=KSTTiAMyeovDtZ63C
	o41FpqT8JDXqWO1yp0xe4Xs5yEEofBYvLNeYvOWQX1m2WvACOuLORkveMQ+j8wqC
	xD4yRreQELAEFy6nAyW3CVuC6PZ4jRCW3dR819RWO9fUagSE/APKn/FFHahbIpSs
	SOPvcFuJwTW8vuo7Jt8BCc91LO/R8EbtDMWL3XTbQ5Rh1W7Ev0MWMByyJ8SIicWx
	UKM5cb+Dpf6uMoz09/vOu5xcmAp9HvyVZbF+qcK9HFvgqWkYrzoAQv8mn5mVrta3
	gvbDTCpZtcLW3HCJFSn6MCGs1nBizE0KfxgE5US0YliX0dM6gSDzekkMc4TxrWpR
	hW1vw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4643ww22a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Apr 2025 16:26:51 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.98) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 22 Apr 2025 16:26:50 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 22 Apr 2025 16:26:41 +0100
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=P7IIgBL2DEBvjkm96hBWzGVttjPfHoYpgW7BhMP5XtM=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWSwb7W8EF8+teSl1pu7U39NMTYRm+e/tOnrkRtlx3IDz
 8VtU3Z60VHKwiDGwSArpsiyY4XlCrU/aloSN34Vw8xhZQIZwsDFKQAT8WpjZHh/U+dv9t7F/PJ7
 K13FDD4aMahePhHvpLzvVcIno33GQt2MDOs//7oSEnfy/tu/Gju7Ze/I27NcnphT87JU6m5f0du
 uKewA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDExNyBTYWx0ZWRfX4O+2/RR6iD+9 8r1/rsAfM1EUbp5CxHVBZbrAVGYwFBlgRLMTxgSAEEEhVOcPdrOaZGMmFZIA+y3+W8s2B6kKSnf 2q4vwBE5On+vVczWAX+lD8bL6jMlke2Q2PwaAVc7bsUdw5uEMdcm5l7QJVeCq4GNVBSxqzWO1Xv
 F8D43LnHMyRL2R8FHx54qCPpA5Ck47C+fOPYqGuBG6N7iJZ+J7UIqNcmZcmLnRvIgtQgMnsiD+k 5VHZjsp9WQ+6g1BBDn6KklT1cu0pXL8DwXaOMlBLWcEnux9xyLFRHEZtn2uZFVVB5VbD8boA4WH TYHyrIwzaAgreJOPKo2lwiIhOTstJWU7VArxYelUxaXPJ2epcTrqOwNMzRUArOR94K3ns2RZSMi
 rquIX6FgNngk+EI4csg92w4qDWjsCRifA+UAYRbU12Gr4sWEhLVoSmxc8QpxigHVtx7RrDUW
X-Authority-Analysis: v=2.4 cv=ApTu3P9P c=1 sm=1 tr=0 ts=6807b53b cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=PTNHAAa5d5l9TNYsNX4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: TUJ0X56Mq9jR5OjvRPC2TtTCyBLUHZzV
X-Proofpoint-ORIG-GUID: TUJ0X56Mq9jR5OjvRPC2TtTCyBLUHZzV

Use the new compatible string and power domain name as introduced in
commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
enhancements")[1].

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v3:
- None
- Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-1-9f8c09233114@imgtec.com
Changes in v2:
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-1-f7d3fa06625d@imgtec.com

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

