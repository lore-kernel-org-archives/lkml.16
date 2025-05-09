Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819952701A4;
	Fri,  9 May 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782383; cv=none; b=IB81F+XcRX2JjaoAlRMvEOlx+XXz+2GgphAwDdEnZKnIH2RE0wi5C6kAF+slIo9NZgVunr1vkxFDZA+nsOVmzguk1hDuCn+7PddoBVITCbrRfBfErQ0+cfZJNd0kfRxHSh6Pgmk+RY97wwVFXNDbAzGqtymX1dTjKI8oOi/AgwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782383; c=relaxed/simple;
	bh=UizkFUOEbAm0SjFwBrBInUHXKXLpLmnbOykI8Wipru0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmFdQRLE3JxOpL6HV5MYrrEGmypu40y1c1PGfeKsNecbNmcR7PDbpUk4uloPsdC3qLtYO1UAnIbU7d4+UICJdbQWXWPQKbw8GE1C2m7/ypPGgwjRpE55c3sHauAPRvUZtaitwkwwNF4Le/tWcRaj7r07bODRVjoxVoqteWkP/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aIkOI6UF; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aIkOI6UF"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JV9r1360986
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 04:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746782371;
	bh=ep8qmI0zXfj+LtOdwloUGJBu5JebRS6+Bn3LdL4sFYM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aIkOI6UFMxkKpGMdY/6FIN+PxT6gzaE4ds0jtey6HvL0ftMmYJPI8rS2bl6T+pQ/K
	 SFePRq9oFAlOnhFz2x5pdGjBKHvnPTG7OOHpZkIjOcQ+x3zSqZj5qjFOgk+MjHHY/V
	 AO/RvQyFxbl1evCDhncT6RkxzWbH1mo1apGLW7TQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5499JVdK027928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 04:19:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 04:19:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 04:19:30 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5499JL7s070287;
	Fri, 9 May 2025 04:19:27 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v3 1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
Date: Fri, 9 May 2025 14:49:08 +0530
Message-ID: <20250509091911.2442934-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
References: <20250509091911.2442934-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add device tree nodes for two regulators on the J722S-EVM. VSYS_3V3 is the
output of LM5141-Q1, and it serves as an input to TPS22990 which produces
VSYS_3V3_EXP [1]. VSYS_3V3_EXP serves as vin-supply to CSI RPI Connectors.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>

[1]: https://www.ti.com/lit/zip/sprr495
---
Changelog:
Changes in v3:
- Change vcc_3v3_exp to vsys_3v3_exp as per schematics

 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 34b9d190800e..2213993acbc9 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -141,6 +141,17 @@ vsys_5v0: regulator-vsys5v0 {
 		regulator-boot-on;
 	};
 
+	vsys_3v3: regulator-vsys3v3 {
+		/* output of LM5141-Q1 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_mmc1: regulator-mmc1 {
 		/* TPS22918DBVR */
 		compatible = "regulator-fixed";
@@ -153,6 +164,17 @@ vdd_mmc1: regulator-mmc1 {
 		bootph-all;
 	};
 
+	vsys_3v3_exp: regulator-TPS22990 {
+		/* output of TPS22990 */
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_3v3_exp";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_3v3>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vdd_sd_dv: regulator-TLV71033 {
 		compatible = "regulator-gpio";
 		regulator-name = "tlv71033";
-- 
2.34.1

