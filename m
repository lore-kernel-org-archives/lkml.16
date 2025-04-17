Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69593225A3E;
	Thu, 17 Apr 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881034; cv=none; b=NmrSozU+dMovKCPbbCatSyeBtXgs2ot7Qjf54ecqqwbwZ4vdDvp9Us9mx/apy+CIliLY2Q65CrlHkeiOAAXT9uKJtVE3Dmd1eH5rXN84qI+AtFRHA8AGeHaQLiaG2GNi6v4sNo9ffpUm8G7rujuHNrVCCY1xJM40avwvlsbZYuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881034; c=relaxed/simple;
	bh=epqyuI3DQyygM6mV3YXhwwbA6yUu0pXFY8MTDFxg8s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UMrFd2PdP/GB/q4qwjy+2J08umjByHUtFeZ480BIT0KwDt1beQ7sE30zb0aanu+XhsdaEpoRpP3MliOriEsgpE/FSPIEWImmzfDW1bmZpEVcBAku3FHl3Ht7WLrBa044YljjFhtnsqORlulNGhThWRKs7xIiE/76RNF3T0aeh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=N3HnwOcJ; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="N3HnwOcJ"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H503lL018418;
	Thu, 17 Apr 2025 10:10:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=s
	4lUq4QP/mULXqetmOHgz7na8g0BDkjUVC/tFT/LXig=; b=N3HnwOcJTklvsv3jy
	yChAsXJHm9joMR1dtWI9jbh+OADXcWA2RgmeJ1TZj1c4P13zYbq5g2YaR7crg2Sr
	DrnXqznea+O2WQEAOyyyo80qBJ/GAdBE3avSYcoKkjy7gl2iOO8OP0a7JmpUTxCy
	J/pMo5bXZ1Ci8h6oNdFkJ7SeOSImrlxqA8o+oR1qaSMAPAV23I3YBzCFSskGikto
	rHGnhDK7aGgETAkqtH76VYUZrVg1/IYKH/N7Dj7tsrmLxdxTp6Jh+fdCQoPEa2+k
	qpti9NsJyHtHpsizxEpwqINoHeEJkG+AKKnH0YNWPJwEnE0OIJpOZ6QS03VkriTL
	QpDww==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mh4tg-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Apr 2025 10:10:17 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 10:10:16 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 17 Apr 2025 10:10:03 +0100
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
In-Reply-To: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=epqyuI3DQyygM6mV3YXhwwbA6yUu0pXFY8MTDFxg8s0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQwHC1/K/fLX7GfPfbh102+RRnW7FM/uP2ICQrsezZ/z
 weZXezJHaUsDGIcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjCRxLOMDJMn+n4XWMny+9f1
 Lwu/7fe42REoLmk6MaQj3brMzr5/Uy4jQ6NB4/6WNa8fPTnuxd7+4fU3uf07dz7ge536p7aX627
 hBH4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=6800c579 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=Ff_bzIi4o_8fsuxLidAA:9 a=QEXdDO2ut3YA:10 a=S-JV1fTmrHgA:10 a=j2-svP0xy3wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: T5O5va56PNOO4qYhBwZnCAj8j75CCx2r
X-Proofpoint-ORIG-GUID: T5O5va56PNOO4qYhBwZnCAj8j75CCx2r

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
Changes in v2:
- Add interrupt reference details
- Add Randolph's Rb
- Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com

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

