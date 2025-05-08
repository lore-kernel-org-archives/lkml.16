Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DDD4B1E6E;
	Thu,  8 May 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719551; cv=none; b=n/q0bRptBJv0XShMs5foG53FJ6g5abeS1ygIJNg4ArM6p6AqKOM8r8uDZoXsy2pifTT2htAbayciyBd6zMHHs3dxIwKh3ZMiniP1t6bvJlmaeu8nSU58zSI5paUJ2c8jjBfJ76lr/JkNj/I1s+6WZy50QCgM5WbZe6jiBl2ibKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719551; c=relaxed/simple;
	bh=MfwWOk6Tx/TEqv605hM8mog1v0i46hFLimGEGpLYuUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJrbcWRFI1sums8Aym+kRDsyU22ayn3jNDhKjNtwX+JHYjvosFmW8lU468eS/UwAKY8MZOmB4F7m4KsjvrRwG4Lz2o+CNog4ESAsdgFyEPf71Bwb7RPjQxXT1cSBlVf5zc7Qcf8ZD4UNzJs/zCIOzuho+PT6SBZb9Gbfu0i72cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YHwFXXnr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YHwFXXnr"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqDse1703887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719533;
	bh=zkRgnerI36b6HY4HkOyt64j/523Zu+/FuRNnOX/SiVU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YHwFXXnr4fOELaKYHk/U08lGuFNTXHVKouN4qlQWfFLD3HTEGnQA+SxmgR4YArG0a
	 NkgYTuc+qxstuKAAN+Xhu1PCKmvgu9z2Kd8LFwZtrdPlBYa/aQFmGi2RGkt02lqJMG
	 kInUO9MijHRiyPJq6fnPAZLl6qnGFMei5Zgwa6Jc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqD6x027835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:13 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:12 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oL050794;
	Thu, 8 May 2025 10:52:09 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 1/4] arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
Date: Thu, 8 May 2025 21:21:31 +0530
Message-ID: <20250508155134.2026300-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
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

[1]: https://www.ti.com/lit/zip/sprr495
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 34b9d190800e..0f18fe710929 100644
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
 
+	vcc_3v3_exp: regulator-TPS22990 {
+		/* output of TPS22990 */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_exp";
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

