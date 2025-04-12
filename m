Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727918DF86;
	Sat, 12 Apr 2025 05:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744435658; cv=none; b=ttKjcCKyACbszxEPWJdophTpOE71k+KIWKdscOafwIV3/idJRtNSiW2h/k5rBj6+WrJd72mAE3Cb+NZca5xdxQga+ci0y5Ut0rBmF4fqlfY0dfA5XdrmYBhoVYp8vgl5hfhuwZHsz0cI2r68sLoMInyGxSQWJpuELup9zhHnCP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744435658; c=relaxed/simple;
	bh=UbNAdcJkPJR1yLoSvYG2KAcD0rE5t6Mp5K7FwIsl1zo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2xjhThD30AglNx7UmuznaMnFoMM9UhR/QSmB+QHzv0tK5Uj8bGmYQIoEikF1Gwq4V0HmZ7gSsX7M9nRj4eFpMFEqnPlW2A+BXyhuWDos3V0WF31AuqzPY1G0TxJ41TkSF82cmGp1WfRMQUT8CuOFn2e4RTWaPQgcI+EvPi4cZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JS8U7cNv; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JS8U7cNv"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5ROvr1725208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744435644;
	bh=4iQXfyalqbVzM2bdCPJ05L1KZPH9N7iukdGOBcfEl0U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JS8U7cNvnCPtElZzaRzdyeaVyZWVG+sIC5NhTlox62iaoXeNirK2b4TlwW64XEOhZ
	 /sNCZusz3O6MEky63ooW7qHT+5wFWqTLVEz3T6R8+rtJ88zP9KbvAT2p2SYHf/Qmw1
	 oLlSv17kOBV7r/MrkJihrG9eWJVSDxJH4XQqPZh0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5ROku006758
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:27:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:27:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:27:24 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5RCVT121011;
	Sat, 12 Apr 2025 00:27:20 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: drop redundant status within serdes0/serdes1
Date: Sat, 12 Apr 2025 10:57:12 +0530
Message-ID: <20250412052712.927626-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250412052712.927626-1-s-vadapalli@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Since serdes0 and serdes1 are now enabled by default within the SoC
file, it is no longer necessary to enable them in the board file.

Hence, remove the redundant 'status = "okay"' within the serdes0 and
serdes1 device-tree nodes.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch depends on the following series:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
as indicated in the cover-letter.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 0bf2e1821662..34b9d190800e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -848,7 +848,6 @@ &serdes_wiz0 {
 };
 
 &serdes0 {
-	status = "okay";
 	serdes0_usb_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
@@ -863,7 +862,6 @@ &serdes_wiz1 {
 };
 
 &serdes1 {
-	status = "okay";
 	serdes1_pcie_link: phy@0 {
 		reg = <0>;
 		cdns,num-lanes = <1>;
-- 
2.34.1

