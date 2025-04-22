Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D527EC89;
	Tue, 22 Apr 2025 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323284; cv=none; b=bauO4xaJb/U0Pn4inDH4nyJ00Z3bwkfz2pSt76ZqSkUhe0C8xVX8v2b0FKxfr59ZoGhWI0VnKhnClxeIe32Xj8/4mB4YT4YBUrbbzjKSxSPce3gnhGTqwjfIR1Y22ueHBOyvtmQ0VE5/2Vi9DDY6Xt+qj+G1+uVNUALDlQiCHo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323284; c=relaxed/simple;
	bh=EfI6iWl4kk+h18e0h7LyYeek+KrQOjPZeXenhXFKxFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIlERnq4OOdmvGoNEUUdMGs2hcS1ABHfMsMpKVNZKsQ4EANsIE5QYmSUSlBFynNNqWOUxz2IgQADEl56uvR5JizykBMDnyeEvslpcXhSbT9pc/y1DJYFi5GqzMNM555jxdXR0Et5Yw8I901A68PZGBbMq9PadlIOIRDZLIg7pT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GBMtWlGv; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GBMtWlGv"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC19Gv1937162
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323270;
	bh=7TExw5H8oXvb6UOtGDcyhAUDh50yS7hE35EIrD6Viag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GBMtWlGvt1oeEb79th+tFvo+h7uIOPUf6/9iHFc4kZSuXE5j4zrUgWXoWbojF7Awg
	 lcnS1NPTy+/R3hrxViZfUrpsQnXR9Y8DJ+68bjWoGy2TTj6yrX9+XbMPpnVf+6/ZZo
	 dISKLxGEVs+PyAPmgM7SHP4EoPKTfshRuWv8fuq0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC196L128382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:01:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:01:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:01:09 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC0hW3094623;
	Tue, 22 Apr 2025 07:01:06 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 6/7] arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for PCIe0
Date: Tue, 22 Apr 2025 17:30:41 +0530
Message-ID: <20250422120042.3746004-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The PCIe0 instance of PCIe in J722S SoC supports:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

The default configuration is that of a 128 MB address region in the
32-bit address space. While this might be sufficient for most use-cases,
it is insufficient for supporting use-cases which require larger address
spaces. Therefore, switch to using the 64-bit address space with a 4 GB
address region.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Link to v1 patch:
https://lore.kernel.org/r/20250417120407.2646929-7-s-vadapalli@ti.com/
Changes since v1:
- Based on Udit's feedback and offline discussion as described at:
  https://lore.kernel.org/r/7f6ea98c-df6d-4c94-8f42-76cc8306b6c4@ti.com/
  the address region of 4 GB is split as:
  0. 4 KB ECAM
  1. 1 MB IO
  2. (4 GB - 1 MB - 4 KB) 32-bit Non-Prefetchable MEM
  instead of the previous split of:
  0. 4 KB ECAM
  1. 1 MB IO
  2. 128 MB 32-bit Non-Prefetchable MEM
  3. (4 GB - 129 MB - 4 KB) 64-bit Prefetchable MEM

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..da22988ff9db 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -98,10 +98,10 @@ pcie0_rc: pcie@f102000 {
 		reg = <0x00 0x0f102000 0x00 0x1000>,
 		      <0x00 0x0f100000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x68000000 0x00 0x00001000>;
+		      <0x06 0x00000000 0x00 0x00001000>; /* ECAM (4 KB) */
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
-		ranges = <0x01000000 0x00 0x68001000  0x00 0x68001000  0x00 0x0010000>,
-			 <0x02000000 0x00 0x68011000  0x00 0x68011000  0x00 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x06 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x06 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 99 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

