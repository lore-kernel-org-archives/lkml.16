Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816A24BC05;
	Thu, 17 Apr 2025 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891479; cv=none; b=JJLjMh/pMDnLKvBqpND3q2uMPVjnDRuyvofBn+Tg0sATSisi/+HOWNC9FS3qYx75fbbCcM9+lD1qmkKuFyH1Yu5JAdwzdfw/FBBH7SA1kc720+5N/mB8SuETWJ/RXDl24IHULRdhi5qdVZS1QS8Z7W95gBGN/aUQYB4SiZVdzuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891479; c=relaxed/simple;
	bh=RcYd2XYg1t+Q3zZQ3kl48hL5nCg8QcS7kQhRR2G3lGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E77EvcC3lEpk7VerI5TBeAAhNLA4PTWYRJ73uwuU0pmHnnBPnZE4A4JvcmB3jM6gLIgrHgnp9Gwmten/M3h+H/bkziMx5gnsplIIKq8LsoXg2lbFAZYiOX4udbcYEpqCdnqRwi8RJalD0OujE7L5orbT34xy3Xn6317EFWVib6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SH1TouV8; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SH1TouV8"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4WYg621241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744891472;
	bh=FI3B3WQgXAFTHBDb2zrpVAJeU5+h4ni72DFYOqAZgpA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SH1TouV8bBT9DSLODHvlHv6K/L9mUygxVwJIIg3i2Ia+pRIqgz9FI6e15Lc/O5vIT
	 24xAXEbTkDxx38gCoHNf2rMv7d5xGui0kCTW3e1Op81CnTtjYXZFsqDCXASaJvaUqk
	 5IoaxO6JOeG+3Uw/hoHTn24VT8b0SydR8xeGa9r0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4Wr2083642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:04:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:04:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:04:31 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HC47VO004789;
	Thu, 17 Apr 2025 07:04:29 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 6/7] arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for PCIe0
Date: Thu, 17 Apr 2025 17:34:06 +0530
Message-ID: <20250417120407.2646929-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417120407.2646929-1-s-vadapalli@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
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
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..a3928fe63ae4 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -98,10 +98,11 @@ pcie0_rc: pcie@f102000 {
 		reg = <0x00 0x0f102000 0x00 0x1000>,
 		      <0x00 0x0f100000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x68000000 0x00 0x00001000>;
+		      <0x06 0x00000000 0x00 0x00001000>;
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
-		ranges = <0x01000000 0x00 0x68001000  0x00 0x68001000  0x00 0x0010000>,
-			 <0x02000000 0x00 0x68011000  0x00 0x68011000  0x00 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x06 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x06 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
+			 <0x43000000 0x06 0x08101000 0x06 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 99 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

