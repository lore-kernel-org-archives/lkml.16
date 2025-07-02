Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BB30AAA1;
	Wed,  2 Jul 2025 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468006; cv=none; b=pp+42aE+/ZXIEsqHbCzfMYyZ6zfdq9qiQT4UYw9Val5X0ByvXc4WiWJZ1mEciNJJDniiORa+Yz7o8R6hQGMfzR3UUdfuHfGDLg78jve8cQtY+ZM+QYx3AnGCVrXv6Wa2zwqcvyxKwKDgJA3RHpOHiBVQo/v7OovbXLNPI+DsnuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468006; c=relaxed/simple;
	bh=Gq/LYYRF9JuFonhdLhqKO9+lm/YO9Plq5eHUax98lc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D1hN128okjOKqq3jQdMGPu9xM4TdUbS6FGplVXTHsJ++EL+zlsjA4KuT1gSUWwCr3hALJY/8z65HVMh2b/1DN2qcF3USQ0yiq6j3uBrW7HpOOt9pdBRYS7OBYIuNCmwDLIeyk4MvXGOf9pCLndqfRd41CTSjAtAWZwtWsovqEd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=S88bvCmZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S88bvCmZ"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 562ErGLe3265092;
	Wed, 2 Jul 2025 09:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751467996;
	bh=2AF5EGj2qKzyf78LkwWbxJULTyLQiIdC4tmSHWVSetw=;
	h=From:To:CC:Subject:Date;
	b=S88bvCmZCoQkQIQ/eKSEQ5wbYz/HSld3j1dZRXMBH0Q80NMN6zZuzZOiuRtKbaVSQ
	 BDqQusU9xeKQSCoUmMrvRVOUDQnMr9LIf4GH84M+6tLNbbabMu8OxARSBzdvfpYDRY
	 ThsKCTY9x4aYeEk60HWHgJQeO/NlJkYBHBfp8S+4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 562ErFPs1372673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 2 Jul 2025 09:53:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 2
 Jul 2025 09:53:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 2 Jul 2025 09:53:15 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.22.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 562ErFHm3616815;
	Wed, 2 Jul 2025 09:53:15 -0500
From: Andrew Davis <afd@ti.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] arm64: dts: ti: Enable overlays for all DTB files
Date: Wed, 2 Jul 2025 09:53:14 -0500
Message-ID: <20250702145314.71996-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Allow overlays to be applied to any DTB without manually enabling it
for each file. This adds around ~10% to the total size of the DTB files
on average.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Note that Broadcom's DTS already do this, so there is precedent for this.
And we do this unconditionally in our Yocto Distros[0] already, this just
moves this so everyone gets overlay support for all boards.

[0] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc#n5

 arch/arm64/boot/dts/ti/Makefile | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 743e7b945af3b..93fb2c5c3bbda 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -348,24 +348,4 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
 # Enable support for device-tree overlays
-DTC_FLAGS_k3-am625-beagleplay += -@
-DTC_FLAGS_k3-am625-phyboard-lyra-rdk += -@
-DTC_FLAGS_k3-am62a7-phyboard-lyra-rdk += -@
-DTC_FLAGS_k3-am625-sk += -@
-DTC_FLAGS_k3-am62-lp-sk += -@
-DTC_FLAGS_k3-am62a7-sk += -@
-DTC_FLAGS_k3-am62p5-sk += -@
-DTC_FLAGS_k3-am642-evm += -@
-DTC_FLAGS_k3-am642-phyboard-electra-rdk += -@
-DTC_FLAGS_k3-am642-tqma64xxl-mbax4xxl += -@
-DTC_FLAGS_k3-am6548-iot2050-advanced-m2 += -@
-DTC_FLAGS_k3-am68-sk-base-board += -@
-DTC_FLAGS_k3-am69-sk += -@
-DTC_FLAGS_k3-j7200-common-proc-board += -@
-DTC_FLAGS_k3-j721e-common-proc-board += -@
-DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
-DTC_FLAGS_k3-j721e-sk += -@
-DTC_FLAGS_k3-j721s2-common-proc-board += -@
-DTC_FLAGS_k3-j722s-evm += -@
-DTC_FLAGS_k3-j784s4-evm += -@
-DTC_FLAGS_k3-j742s2-evm += -@
+DTC_FLAGS := -@
-- 
2.39.2

