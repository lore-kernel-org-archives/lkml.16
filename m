Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5083A1624C9;
	Fri,  4 Apr 2025 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761571; cv=none; b=iPjWrgn+EJlp4yIiI0u7btTRI9WbuG/aWXT0uJHZbmLDmKTlp2tY34iHeIxUZA5SuusATDs4BciSZMRLDmmEm7svHA3FEG8Xr9jAn+IQV7ioTExU+VnBVrMmA/WWqEuZkx645GvYpVuKvepoLKq/A6fnMQqHOxNSl5e/riRdypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761571; c=relaxed/simple;
	bh=NxwVvZZDyOiRdG/tnZiX1ueoKdKHoYeMpk9LYgqApIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FVM0oxHjlU8TjmCJLTFrKd8fb2q3YktICruVinkgM1oVQmoz+Qor5RhQM7B9mYqyETmLJI/RGNZISviJOOh8yxYTit0jWBa+Q/dh98EQtGrtZhFgK44aep9VORIr8x196zhBPJwGDKix0eauoj0ed/fcdGMn66dEwOPakRqIu1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBGbEIDJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBGbEIDJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso13448995e9.0;
        Fri, 04 Apr 2025 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743761567; x=1744366367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnOAx1Z42gXuu4NUkGGkg//gH1o3Mdb+pyo1hDqScI=;
        b=CBGbEIDJSDgJJ5EGzfyDCibMT28v66AlJVmYWcKLKxUQxt7DHoroROCZao6mQ5GkcT
         vec38sCnq901vimlkiOsHrdOVHixMj1QSxc6jAOPh1qrF/lI1FV1rrGrXOl4h2m0O5ua
         pdiDFiST51yNwyAIQET/goZTa8XArbQcRfx905O0rYQ7XRG1IoA0eP0eJTDrWpBn507F
         it6avN2r7hnYo6I5P7npiGDkscfcc5BnHDT4zbVMJhMi0YzaHN0EB9hE+ydZ2e7HW7iZ
         GvAa9Ms0nnGs7uHo7FmKI24IhodSBVjTYUzK/3vhl4oXW2LwFsRlJ4/RNvGa470hdCD3
         0zFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761567; x=1744366367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrnOAx1Z42gXuu4NUkGGkg//gH1o3Mdb+pyo1hDqScI=;
        b=pt0Dk+SO6EjCU23I5QIXCvFieA8DtqXM3gVfsIdRP9Or7QSVkTydeOqE12NIEMlhZz
         yEs20wKofB633eeGfPn0dqCRHApLsCbdwSLeyYQbRtmEKuNZl0b9iXf25HMzvvcWQQnc
         tJrDHaWlctnVM3zMlf9aewRHV3bR6C9/h/xwbMAtzLYc1WYBBL5neuOisFzz0W6i+RyH
         SNzBS/k+AOhqAJ8QNeNzZUI9It8bta9iFeazYNm9Nk83GzkqIVHiJGrB/dIGgvPidBnX
         rM1fsgtZmMweWN+m5qtWp8WSUANCrQ6/nv6D9qsBpRlSMNzMUnjvnQ8vYeUnh+aL7lTq
         W2cA==
X-Forwarded-Encrypted: i=1; AJvYcCV0bqnBGvESpxKO6TsCrAQB4dAPPThw/HOJckgIimHjps3ACkAiIkXs3KjtzYN8bg8d4lykM2YUzoWVGezo@vger.kernel.org, AJvYcCXE8MCgVadtbcTNAkPEIZisiR/kElduyoI0Fa/a9kDegjFA4z8v7xUvLLSBQoDZ6ldP2Nf1FIDh5pJO@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHZK+8qgrqrBFKVSeVBFjF9LAWVBm67BR+wiNDHeue0r3fxGS
	T73efQKwhxTwqCM3HSAG1ShQdLYD/hbPC5sQLOwrHi9bh0JY+zyy
X-Gm-Gg: ASbGncuzm0gPpMLx3TZgO1kLTQQcHmBZcqp4yZwlGWFUmWomvJZGbcaqRwISAL+pGKl
	/N3aLyW/M/gAWa6lEkUkmJdwVkHXUKCsovNdzxj5GFmgX8d83Zf/uDIa/NpkwxUnzf9zfLRTlES
	DNRkjbUdbhSOjz9WCFmwmmyM65KTfaybpehl8Cp/PuqfUK+vauV+GxY9VvDe2sp9ptcnFeqjN7A
	Wo5g0wPpwEuo3Rfr/wMYGu0w+Uru7bEiDm4nWZ/RJJCZD6VjhqqVrMn0x505uM6uCKYC9ID5grJ
	oq2GCqpc+8PruXofngat8I6yqp+W5mWncGoXO2qfRvkOmIWf9nAm6HwI5kXW+T6/8pCNRJjrxss
	JPqH0RSdLwvEmwrDo
X-Google-Smtp-Source: AGHT+IGn5zQjckVMr5yj5RkLrkNmEYqXiyrId5H4BjH0hkHpDWBOU4XybvpfkaZInnb7fcnChm8sLg==
X-Received: by 2002:a05:600c:198b:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43ecf9fed70mr18873905e9.25.1743761567394;
        Fri, 04 Apr 2025 03:12:47 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm43732995e9.2.2025.04.04.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:12:46 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE outputs for PCIe interfaces
Date: Fri,  4 Apr 2025 12:12:34 +0200
Message-Id: <20250404101234.2671147-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parth Pancholi <parth.pancholi@toradex.com>

TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
from the SoC, which can be used to clock external PCIe endpoint devices.
Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock
buffer, with each buffer supporting two PADs to provide reference clocks
for two associated PCIe instances. The mappings are as follows:
        - PCIe0 -> ACSPCIE1 PAD0
        - PCIe1 -> ACSPCIE0 PAD0
        - PCIe2 -> ACSPCIE1 PAD1
        - PCIe3 -> ACSPCIE0 PAD1

This patch enables each ACSPCIE module and its corresponding PADs to ensure
that all PCIE_REFCLK outputs are functional.

This change have been tested on an AM69-based custom hardware platform,
where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
internal PCIE_REFCLK are utilized with various endpoint devices such as
a WiFi card, NVMe SSD, and PCIe-to-USB bridge.

Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1484211/am69-pcie-refclk-out-and-acspcie-mappings
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
This change depends on https://lore.kernel.org/all/20241209085157.1203168-1-s-vadapalli@ti.com/
v2: set ti,syscon-acspcie-proxy-ctrl mask to 0x3 for all PCIe instances to prevent unintended overrides.
v1: https://lore.kernel.org/all/20250320122259.525613-1-parth105105@gmail.com/
---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 +++++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi           | 10 ++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 591609f3194c..d82d5cb5607e 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -132,6 +132,11 @@ acspcie0_proxy_ctrl: clock-controller@1a090 {
 			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
 			reg = <0x1a090 0x4>;
 		};
+
+		acspcie1_proxy_ctrl: clock-controller@1a094 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a094 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -1067,11 +1072,12 @@ pcie0_rc: pcie@2900000 {
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
 		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 332 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 332 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -1111,7 +1117,7 @@ pcie1_rc: pcie@2910000 {
 		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
 			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
-		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..ebbc315649d0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -34,8 +34,8 @@ pcie2_rc: pcie@2920000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 334 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 334 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 334 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -45,6 +45,7 @@ pcie2_rc: pcie@2920000 {
 		dma-coherent;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		ti,syscon-pcie-ctrl = <&pcie2_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
@@ -63,8 +64,8 @@ pcie3_rc: pcie@2930000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 335 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 335 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 335 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -74,6 +75,7 @@ pcie3_rc: pcie@2930000 {
 		dma-coherent;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		ti,syscon-pcie-ctrl = <&pcie3_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
-- 
2.34.1

