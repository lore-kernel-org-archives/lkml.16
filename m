Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AA03FE4;
	Wed,  4 Jun 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749034030; cv=none; b=qmax+B/cX5TgABX8dvC46z1Zn/cBvDk+PTwMgs3rXoCvpY8MhcF8VE6rt2YhX0OUvkBucRwwMXJvjzJMmDsHkC0J/f/NJja2DDtGSyXtD+C8YmX1snEMTlM4BB9YIkE41UPzP0jHejlwzERLgakyDnqT6ulTkc/bXiE3pzhWxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749034030; c=relaxed/simple;
	bh=fcBWWL1rS4f5Sk+veiqqjg2rTPrlh664bDCvpXlsWx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWrxl3Utf1LdVf7U57ewdlXz2j1K986/XqRGKunAyP88NlalgTVvVRpx9JqHSF8J1w0jeYM7WUnh0pwo5qlIOiikbBCa8vmo9+MsONTuXb7i8HPpAV6qR4v0bgrlekLppIKwV8A+6r3gpUb/WkBLtBFNI4Ykd2LdrYPVuRG9RcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hIkqJzEK; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hIkqJzEK"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554Al12Q3789918;
	Wed, 4 Jun 2025 05:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749034021;
	bh=URUAuGhJ6oVpvppDA506Q+cOUcLV4A0Cy2nR7TJqxBA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hIkqJzEKREQcoCXDqFEQCNQ/nmNIeRUyJSWlOTg/9qKw+4smOxu/evYrSiuzmBtCz
	 G7CouK0O7ebdwhwdghsB49tYbz7w8QCqu+XQo+Pr7Ek/ANPwQYYwdFy4KEoYIl08mH
	 IiqwTSy5T95qR1snHUb83a8N96wWUcFz1PlJD5Fg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554Al1PE1977638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 05:47:01 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 05:47:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 05:47:00 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554Al0OL1830865;
	Wed, 4 Jun 2025 05:47:00 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-donadkar@ti.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH 2/3] arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
Date: Wed, 4 Jun 2025 16:16:55 +0530
Message-ID: <20250604104656.38752-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On J721S2 SoC, the AUDIO_REFCLK1 can be used as input to external
peripherals when configured through CTRL_MMR.
Add audio_refclk1 node which would be used as system clock for
audio codec PCM3168A.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 6dee0c573980..e21f6092b3f0 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -74,6 +74,15 @@ ehrpwm_tbclk: clock-controller@140 {
 			reg = <0x140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		audio_refclk1: clock-controller@42e4 {
+			compatible = "ti,am62-audio-refclk";
+			reg = <0x42e4 0x4>;
+			clocks = <&k3_clks 157 299>;
+			assigned-clocks = <&k3_clks 157 299>;
+			assigned-clock-parents = <&k3_clks 157 328>;
+			#clock-cells = <0>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
-- 
2.34.1

