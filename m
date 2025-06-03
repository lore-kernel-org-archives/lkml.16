Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4A27FD5D;
	Tue,  3 Jun 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944579; cv=none; b=O9rDrwyq1yzErAOHcPTClZACYFkHZno7G4EAIdyw5ZLCpVWFhAGaNx9iFPxLkcnEC+pxMB5E6fl6IC526rK+NMnaas0kHVuyxcZQHjfQSl8F3lIGaz0IhLM9696Xd1tQZHJO+W4EOE9ynzaXHqV7PX0mTa+i+9I4ov+k9UvLDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944579; c=relaxed/simple;
	bh=jP6qyH6kaw5fRtCYORlf1HWatz80GR1sF0hAMhL0JPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rabElyMSo6+YklcC+t5G49V0FaKyYeSJFu2hKaie1T1pkQcAIFmfxz9LeWED0W0dn8tJT7p54PjAszxFDYnCkpIid3cmbH6rNlwLFwZEnRw8x7RXh5XKhwxvi/KN6Bhu0x+NNTDvPVir1Sv0jU4imVTVZt+IYhAZkcjT3eDYQto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qyVdNFyY; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qyVdNFyY"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uCv7432800;
	Tue, 3 Jun 2025 04:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944572;
	bh=jYWtWFEmKq2Yx9UsNl2p+/Em17/141cqEXY03gfpnRY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qyVdNFyYpJz2psiS+ZiHYSK4ZsvNpI5wSfT0DGHO80u7yF1fueX0/6/IyGk/3d7IG
	 jxt4D73VZwdNsuALhTtLWzciYNs6DPKabJj7GMcaI+aze75mifQXWotmvVMDNMD4Ge
	 nFni7S62XRCzxo1U7Fb2YVvlblo6mqjOyJnb63oY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uCuU3447461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:12 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uB4v254810;
	Tue, 3 Jun 2025 04:56:11 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf" node a "simple-bus"
Date: Tue, 3 Jun 2025 15:26:06 +0530
Message-ID: <20250603095609.33569-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603095609.33569-1-j-choudhary@ti.com>
References: <20250603095609.33569-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
"scm_conf" node to "simple-bus".
Also remove "reg" property as it is not needed by "simple-bus".

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5bd0d36bf33e..4e01c1265ae9 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -37,9 +37,8 @@ atf-sram@0 {
 		};
 	};
 
-	scm_conf: scm-conf@100000 {
-		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
-		reg = <0 0x00100000 0 0x1c000>; /* excludes pinctrl region */
+	scm_conf: bus@100000 {
+		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x00100000 0x1c000>;
-- 
2.34.1

