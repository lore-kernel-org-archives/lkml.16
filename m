Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4422DF9A;
	Thu, 29 May 2025 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525729; cv=none; b=q+YOlI1hNndqFbURtVMYrRZC5IXPjyYV2xcJG95sZkTiJpiuxKGp5bHa34NZhZV/rd3L1PE6SPSifRmQEJR6sVhWNUYciB8PsYUj7zrTq0kCZIIvW79N0EMH9JAdC+kr378uVUhOPt1J0p3ximVh35h3xZPPjmpOf8nKFl67LvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525729; c=relaxed/simple;
	bh=VRMKEb+gVfJ7YJqldJG5FV1DeSjqSvVupB/Jh+4GKbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+suw9q6jHDN8hlvgmKNgsy9FIJ7qiunUxsZCnwFcvQEddPGxDIpSkA5yO1VqA++sIX/nFW/Eju0cC+xWDHYEWYlPXCOJqKHvduwQ0eSunZvjSHyQON2l1ZYrn6x1KIw4sZEpPsSk44Ai5LWsus34H7v01UZ+mtJ4Bli0ug8Zhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hpkAQuZ8; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hpkAQuZ8"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDZCd13591393;
	Thu, 29 May 2025 08:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525712;
	bh=uOC+4F+xI+7Hfd/sfb4gzyY83VeimMV87ws6zdQWNRQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hpkAQuZ8HaRC4VAzlaf4blmdL1lboNzH5kfJEsVvBqt8/o6eBJp0mrLrxayYPM4Dx
	 SZUgzQQrh21sl8nxOBoP2/OGEDP04mK69enGpiKGCyg7b1Cmxk3CJlnVCbggvCL+CB
	 ljCMkjbic9EMIr6wZZirNj/QN0OECDH4DJPuGXbk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDZCEj2202068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:35:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:35:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:35:11 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8n1650971;
	Thu, 29 May 2025 08:35:09 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 07/13] arm64: dts: ti: iot2050-common: Remove redundant "mcu_cpsw" node status
Date: Thu, 29 May 2025 19:04:37 +0530
Message-ID: <20250529133443.1252293-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529133443.1252293-1-s-vadapalli@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Now that the SoC file "k3-am65-mcu.dtsi" disables the "mcu_cpsw" node by
default, following the existing convention of disabling nodes in the SoC
file, remove the redundant section for disabling the "mcu_cpsw" node.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index e5136ed94765..48e740eb0088 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -475,10 +475,6 @@ &main_i2c3 {
 	#size-cells = <0>;
 };
 
-&mcu_cpsw {
-	status = "disabled";
-};
-
 &sdhci1 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.34.1

