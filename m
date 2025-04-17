Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695FB225A47;
	Thu, 17 Apr 2025 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881034; cv=none; b=VpWLCVtQR2CRRGk7NZqXd7y54/6+nwxQC4oRdGjqhUV57LgbrTsOuY7IZ+V5di78Iry8vpxNvup64f7pvtrHwnT4mCizxtpW5h4UQo0txBRuRdnS4Wdpve5Kggf4MqZ168paADO3IO3RTtGJD8zCoWoMXZTEPakE/uisoBg/bUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881034; c=relaxed/simple;
	bh=3r7y3b8Luv0eeOkRRzaZ75c+tHSjaJh1LrOYZ2uktyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aI00igdPrfq0iosxeOCdsbjl5fMO97sD3rEfuUyowwtThZFOm55mo1ICu+Nr6M5L5EX8haLNKFVLgSLPsPmUFRguYtxffVUEUwa59l0YFdX+Ml90HqwJn1hUQQtPK1WiZcEnk+fu7XT/EZQsWymw/K2s7mOGtqhRQN3UJk9Gxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=MOAqAk0U; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="MOAqAk0U"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H503lK018418;
	Thu, 17 Apr 2025 10:10:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=E
	Le99BKXENcZ9wZk2F+L28C/1qfBK7p9NsOPyMp2prs=; b=MOAqAk0UKud02hI1e
	8OZsOGjJ+X4v9I3tWEfarWdqXchsbqJEUCWlO1U9c6rzg6o+o7A3MN432bSRENaZ
	AetGuAqSg6typ+XTbQH22LnVOHl8PuEvLM53p4VtbuGQyd8VhqX/bcgcnBgYz5Rv
	r0MbZua3e+2GFKaLox4ZdhAKpR1kBJCgJFgKObysxpLllrM4rsBclIX9CGdh0oAQ
	2d/hmHkzB3Z6bjB5svFWTR/Hb5HStY/pFbQSF0jc8ZpNgShQE7mv1wi/2bTepcbR
	lkf6OOObEkHT5Qao4MFv15ozByTFMEV0TSh1pJFj/gAO7gat6GYYDujpL2ZZH7lx
	hxirA==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 461y2mh4tg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Apr 2025 10:10:17 +0100 (BST)
Received: from Matts-MacBook-Pro.local (172.25.7.98) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 10:10:15 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 17 Apr 2025 10:10:02 +0100
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-bxs-4-64-dts-v2-1-9f8c09233114@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=3r7y3b8Luv0eeOkRRzaZ75c+tHSjaJh1LrOYZ2uktyE=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWQwHC37virhgzOPNesCbZZGdWUvbaH0emY/tralClftp
 2R01BzqKGVhEONgkBVTZNmxwnKF2h81LYkbv4ph5rAygQxh4OIUgIlY6zD8T9u/rnvlrlt2UQem
 mEz7mpo+5Yu46b/kpiKJrlclIXbxXxkZ3ot8rJgjX8D3uT7YVlzRwloz69O7JFmvrEyD0sqzZlN
 ZAA==
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=LbU86ifi c=1 sm=1 tr=0 ts=6800c579 cx=c_pps a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17 a=6pm0VhuFVbIA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=sozttTNsAAAA:8
 a=PTNHAAa5d5l9TNYsNX4A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: LNR63gzqXsreji4_y9QwzcMq42PoZCP4
X-Proofpoint-ORIG-GUID: LNR63gzqXsreji4_y9QwzcMq42PoZCP4

Use the new compatible string and power domain name as introduced in
commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
enhancements")[1].

[1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com

Reviewed-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
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

