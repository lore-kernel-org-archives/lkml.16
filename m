Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9392853EA;
	Tue, 22 Apr 2025 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325159; cv=none; b=t5KdyHZlPPzzLwFeJGGxIMDLr8X72vW+KFAzz+s2ZTPIoUkBp7LN5KEXCtmv+t75R+7qQ88c4aZJdXaBfhQIWBeeqpNn13z90MVFpywBHat+j5PqT+sxPQv9tw63Dyrk8VB4dni0Is+eREo2rNBAg8n4HS5Dz8uc271ClnINARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325159; c=relaxed/simple;
	bh=sfiOkDVYW8b3fyO6+ZbCuewBk5+8hC5AKLyBwtvH290=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFtlPvyD7yKWWAejOZOVRzGrEwILOgv7End46pctpAdO9RF7BRMHQjiB5oyYBgWWgyXqnsPTqSwF3Pv9mZ1wAWd8wngWnJwOzIRJwFsrqiAlNGbGrY1U0R7nBpzXc/s2qyaAlrbvqTgVEFQncdKkngXlHNAsy2ojEkSikFPHFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aZpozZsf; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aZpozZsf"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWSAe1209456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745325148;
	bh=wgYXgaEaXMDKqGIqrSUF5MgVxHZmBbmXcS2Rs4S2afw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aZpozZsftmVHZGlTecInRFU0QxNZvnNXDVvfnXg/hUTRfY4z9q8WWoMmkPEYBgK3N
	 PPzCWlRd3A57FGcQErMd01DxsNrLr/MlHtAnbgx5K0ghL4QLeS3IH6ZWvzjck+qA+s
	 xhme2DpopX9pXGMabrAGRhiMoh7a4L379F4GtfJE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MCWS08018099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:32:28 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:32:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:32:27 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MCWIKu117965;
	Tue, 22 Apr 2025 07:32:23 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <parth105105@gmail.com>, <parth.pancholi@toradex.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-j784s4-j742s2-main-common: add ACSPCIE0 node
Date: Tue, 22 Apr 2025 18:02:17 +0530
Message-ID: <20250422123218.3788223-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422123218.3788223-1-s-vadapalli@ti.com>
References: <20250422123218.3788223-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The ACSPCIE0 module on TI's J784S4 SoC is capable of driving the
reference clock required by the PCIe Endpoint device. It is an
alternative to on-board and external reference clock generators.
Add the device-tree node for the same.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

The previous versions of this series were a single patch. Based on the
feedback received on previous versions, the SoC and Board support has
been split in order to allow reuse for other Boards based on the same
SoC.

v2 patch:
https://lore.kernel.org/r/20250411121307.793646-1-s-vadapalli@ti.com/
Changes since v2 patch:
- The SoC and board changes have been split across:
  k3-j784s4-j742s2-main-common.dtsi and k3-j784s4-j742s2-evm-common.dtsi
  respectively.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..f03b2b6d5d03 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -126,6 +126,11 @@ audio_refclk1: clock@82e4 {
 			assigned-clock-parents = <&k3_clks 157 63>;
 			#clock-cells = <0>;
 		};
+
+		acspcie0_proxy_ctrl: clock-controller@1a090 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1

