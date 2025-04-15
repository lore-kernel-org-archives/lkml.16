Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919727A939;
	Tue, 15 Apr 2025 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734064; cv=none; b=YG7/zzWEYSqP7KqUsI42bjFWeSjg4gb5zTv81WRpwBZFNeFYvhfx8s8+ShmS5gHrSgDkXjIpuX4PeWu2KlpT0te88oWdutBMmiYPfMSYOCfvZvuLKNzyXoe0vN0aPN2uxLL8qBMSQEqv4utdqxWLP9WxaMOUpZ5pIxs4jeT26z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734064; c=relaxed/simple;
	bh=9rvDUkc9AzEzDs7Y0UJm5bGH0Ey49R/ShQQjp1GriZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bIAc5UMumb5mROiKfpLV4Gh259sCxSQtSVJrje6dzWsP9INBmBIf71KHZlnJCS07mHgICKKgY7odlwHEF/lXRxTcKc9HumjEJNCDWzNjPKzawyYQfYrEPcI0bnn6DiIIRC9gjnDoGXdPXSoJ85d6v++xsDxUAfCI9749oH3/AUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Oc+37UzU; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Oc+37UzU"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F72bDe005506;
	Tue, 15 Apr 2025 17:20:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=r
	BrCGBHOdEE0m6TcePtZyZoT/zN5bKmKoNH8Un1rSoA=; b=Oc+37UzU0+d7TwPVb
	lDq9eQgffmX+HKTG9OOb6VkATUzvA31TrdFKSdbQPuAJokJNUSXvKkDC/JdSo5il
	vVGcVO5mDhHK3SkZWNsDoSpIk+qeVjUKJZjJk1mW8RuvXqQbNDSBr4W1+XV8peZN
	IgVU0IAu3ZKyG19DwQQ0Prsw0SyRjFwLd0zOwO8FG0xNuR5DrYYAJGfypeZgPJTe
	stsTaZhzIjwCO29YN2jVuhaeFpKjHyGya2n/90AEnFZQhHSGrYRwWGF6dzUV7Uza
	gVEEMMkWtSAxJlrBV7dEKnK+xkGox5tRBndCupEEGcvFwNZF+dWagSpvQ0W/1did
	s0ZOQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45yeeua1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Apr 2025 17:20:37 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.134) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 15 Apr 2025 17:20:35 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Tue, 15 Apr 2025 17:20:25 +0100
Subject: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=9rvDUkc9AzEzDs7Y0UJm5bGH0Ey49R/ShQQjp1GriZA=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaT/aw88X9e7MCXGwOXJlrOPV+1SSgt2+dA78/zUXefyG
 Mr3Xnn6t6OUhUGMg0FWTJFlxwrLFWp/1LQkbvwqhpnDygQyhIGLUwAmsjSY4X+Q86J1i9iP8PtM
 9dg5KWjX+yeTL0eEb3rCUv+uWHyvryoPwz/VrdU59x6s2/mlPvVPeeW+lu9dEquY5zH/f/317Lb
 7ReycAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=Ga0XnRXL c=1 sm=1 tr=0 ts=67fe8755 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=UtEzwyU9vMAA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=Ff_bzIi4o_8fsuxLidAA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: SC8cNNLZAnouocO4QdwxtxPvt4vZ51hh
X-Proofpoint-ORIG-GUID: SC8cNNLZAnouocO4QdwxtxPvt4vZ51hh

The J721S2 binding is based on the TI downstream binding in commit
54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
but with updated compatible strings.

The clock[2] and power[3] indices were verified from docs, but the
source of the interrupt index remains elusive.

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
[2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
[3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
This patch was previously sent as [DO NOT MERGE]:
https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
 		/* reserved for MAIN_R5F1_1 */
 		status = "reserved";
 	};
+
+	gpu: gpu@4e20000000 {
+		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
+		reg = <0x4e 0x20000000 0x00 0x80000>;
+		clocks = <&k3_clks 130 1>;
+		clock-names = "core";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
+				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
+		power-domain-names = "a", "b";
+		dma-coherent;
+	};
 };

-- 
2.49.0

