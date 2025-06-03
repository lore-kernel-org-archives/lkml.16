Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A87284B20;
	Tue,  3 Jun 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944586; cv=none; b=edPVEye6PpOqqxTNIGHbWNDw3ToM4ZQN4SgOvyj2+AxKVKjIEPAJwJkAZHclKoTQJPb6yJGXsbhCo5JMXwcAaEhSLX+5L4Q3SdOQsMKYuYvUdwxpy11T2IYrIU+cpWOg8DmNARPURJ9s232C3/2m89/GAtf8zFeHXTIjA64l7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944586; c=relaxed/simple;
	bh=sQMQbxO/iqkyuSVUovXMX/tsQ/QzM5QoPhQr0XI5eEk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzYgnn5arpyafXG+2uBE4gsko3ZTxCyo0lLE7YTJvIN8Qt5U5e/OgRfPTYgt21RcH3V+pm+0zSOOtgv1hQJ1i9/cJWv+d98e05R1VbjF4kt1H5kQXp7rdcJVfLtXxzl4U15c7C4IqgfGXuUdktE6yiASI4vNL3dycjQgnd5SLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jUJ4wmAq; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jUJ4wmAq"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539uHaG3473624;
	Tue, 3 Jun 2025 04:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748944577;
	bh=wjFksz4giACDkWbdmrY3vhdVzo+lQqMzUrTjqZlWHFA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jUJ4wmAqaMs4xXK3lMSZKPbN3GZRLZVrla9g9OrN9O2W26Nzz7SHssEJ+ypKv92XM
	 viG6eeYlFf/ZAUjofsnb/5xmokatNMXWojGklL+Coe6dRFMnnuHrh4uI6sy38Li1tQ
	 q0Z5fET3aShrksOKN9JHwC4mcDpFMmj5+co0pbGw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539uHOQ3661775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:56:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:56:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:56:16 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539uFGq254860;
	Tue, 3 Jun 2025 04:56:16 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <j-choudhary@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j784s4-j742s2-main-common: Remove "reg" from "scm_conf"
Date: Tue, 3 Jun 2025 15:26:09 +0530
Message-ID: <20250603095609.33569-5-j-choudhary@ti.com>
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

Remove "reg" property from "scm_conf" node as it is not needed by
"simple-bus".

Fixes: 7287d423f138 ("arm64: dts: ti: k3-j784s4-main: Add system controller and SERDES lane mux")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 363d68fec387..9fcfa403824b 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -47,7 +47,6 @@ l3cache-sram@200000 {
 
 	scm_conf: bus@100000 {
 		compatible = "simple-bus";
-		reg = <0x00 0x00100000 0x00 0x1c000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x00 0x00 0x00100000 0x1c000>;
-- 
2.34.1

