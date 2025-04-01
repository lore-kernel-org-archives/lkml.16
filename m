Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568C1FCFE5;
	Tue,  1 Apr 2025 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507699; cv=none; b=L0LanWW53H7R7+zIM5x+maCZKhi89WXM1RqSPEovCCO48VdGeN1rh0sqNPxnYsdBd3TU34RNojga+JXv/RPjNwW22kDadyUTC8GQespbJIR0M7UiXLwVYY6C8eJRQTIYrjU0OQL/wBbv/l9MRYAuHUXfuAaiIMmUVAG8x9bWXVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507699; c=relaxed/simple;
	bh=eDCIllHqggDieIJ/yeHSZWBR69HgD+FZzbnsZsolEnM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwSSo/ex13Y82MO6JTgFAsViQNJH+FekzDCCFwbTFdjJZdqK1Xsk3CkgZ8bLTj3ue159Jfv9NPM7V6ik8/x0D4h5oHPVtZv1CrWzsqfK0EJX59zoq2xQRz0N5WqAJE72r9ayS+cuWuhlltR0QgwpBj1HF22ls33Z7Wf3TnWDa0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PO0wv3nz; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PO0wv3nz"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfDLk2944050
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 06:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743507673;
	bh=quPP6tKWJM6CODzpaWhoH6LLEMm9iSJQyY37qq/ovWY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PO0wv3nzsSvk/QnnTTbmVyrhzD8vjIX0eZJ5dGFoTMrp0lvHshoYIL0nZ1v7BjJ9M
	 J0PM0r5bmfvi8Kz4dNBw6NiadsudWDg9ervQCxGQ59qbymEVf+qituwSanHwLvneVM
	 iGXKZ7unUKrye8+KyuKzVuALSDoBcr0iKKYoJgZ4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531BfDdA037745
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 06:41:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 06:41:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 06:41:12 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531Bevm2099961;
	Tue, 1 Apr 2025 06:41:09 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH 2/5] arm64: dts: ti: am68-sk: Fix power regulator hierarchy
Date: Tue, 1 Apr 2025 17:10:50 +0530
Message-ID: <20250401114053.229534-3-y-abhilashchandra@ti.com>
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

Add a fixed regulator node for the LM61460 5V supply on the AM68 SK and
fix the vin-supply for the TLV71033 regulator on AM68-SK by updating it
from vsys_3v3 to vsys_5v0 to match the schematics.

AM68-SK schematics: https://www.ti.com/lit/zip/sprr463
Fixes: a266c180b398 ("arm64: dts: ti: k3-am68-sk: Add support for AM68 SK base board")
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
index 11522b36e0ce..5fa70a874d7b 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
@@ -44,6 +44,17 @@ vusb_main: regulator-vusb-main5v0 {
 		regulator-boot-on;
 	};
 
+	vsys_5v0: regulator-vsys5v0 {
+		/* Output of LM61460 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vusb_main>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vsys_3v3: regulator-vsys3v3 {
 		/* Output of LM5141 */
 		compatible = "regulator-fixed";
@@ -76,7 +87,7 @@ vdd_sd_dv: regulator-tlv71033 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
-		vin-supply = <&vsys_3v3>;
+		vin-supply = <&vsys_5v0>;
 		gpios = <&main_gpio0 49 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
-- 
2.34.1

