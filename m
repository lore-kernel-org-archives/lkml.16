Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DD1F03EC;
	Tue,  1 Apr 2025 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507696; cv=none; b=LWadZXxVBLBWbTwe+hbP78hpx1iVw4pNPFEHtompU3msU4cf5ExtGyEJoT3LEpv7VrvlAbcCnvh/G6R0H879gP+yWqBtsvqkaHCr7+1Fc2TRadeQ6rY/3kzgqgp63gtB6pFB8Pvg8IIhKf/d4vmMKZ7Xx1H/XbquOm3Ft4mxJbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507696; c=relaxed/simple;
	bh=RV+iGshMrC+9r6SHrOspLyrg1Voc/w7g/UMEUB6KjPo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Un+zo0mDPYr3dZMG9vOGwhCDQvQOyDPa6Jydp7TCAoFVokA19mG2imbQK8AdlWLV5DFsk9KNe9pF/9CWU4FCBW4jKvAnfcF9pMSBXpNumvO9cnpIH3gq4CSjO/D4YgIW132KSGg6BTLld2GSvDhLVm3SxbqFgp0cYVxgk86d/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TosWkRj0; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TosWkRj0"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfSQZ3089036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 06:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507688;
	bh=+S/aKlsk2mdQepb+fp2vmnEhnrrpJ4ouwj54dR6kpRc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TosWkRj0VO4ZmxraBxatGXQhw9yoRZGvr1NajN98NnxlWfWKgVtEJt9a/wMq/5CHL
	 HFEwkUZKlzreNi238og3PXEP/48vQ3PwyjgKuGWY9DvQxAGMssY8zRzb5YKg6bu9fx
	 HBp7rHz+DbsqS6su05in44puFeB/b97LUTEMRh3k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfSsC037825
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 06:41:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:27 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm5099961;
	Tue, 1 Apr 2025 06:41:24 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 5/5] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640 overlay
Date: Tue, 1 Apr 2025 17:10:53 +0530
Message-ID: <20250401114053.229534-6-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401114053.229534-1-y-abhilashchandra@ti.com>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The OV5640 device tree overlay incorrectly defined an I2C switch instead
of an I2C mux. According to the DT bindings, the correct terminology and
node definition should use "i2c-mux" instead of "i2c-switch". Hence,
update the same to avoid dtbs_check warnings.

Fixes: 635ed9715194 ("arm64: dts: ti: k3-am62x: Add overlays for OV5640")
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso      | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
index ccc7f5e43184..7fc7c95f5cd5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
@@ -22,7 +22,7 @@ &main_i2c2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9543";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
index 4eaf9d757dd0..b6bfdfbbdd98 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
@@ -22,7 +22,7 @@ &main_i2c2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	i2c-switch@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9543";
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.34.1

