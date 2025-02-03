Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982302063F9;
	Mon,  3 Feb 2025 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585163; cv=none; b=bOYQsK2mseTofiQSI1BJrOn+VCqqkDVpPgEkVG7oy0P6A7nasUUjs+9Bp6iMPsToJlHUVGJXh7eo2gFPSerYeBm/vcnKSJNXkK7gpiV10TkSFHV4eDYMZAyQPzVqJqB48yw4xGstRpteePs5Ro/lOwdUPl4N3Y3e6pU6d2NHDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585163; c=relaxed/simple;
	bh=0OQd5eoqOX7Yd6YFRQ2FHixr7/KYe1esYbohrOiZJwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZMHQtCmOb/Xh1C7kULeilL+6OIJ2GyOD9vxmYNC1PjRH+QOfMOELOKmPzQ+JWsGKGHsn5caqVhT0edYNlCmxDw4x8IRdkQBdL/GUOr2JHAZRGphqKzTqmQnF/izFeN2a+kTYwQuQH97dBtqyvOeaWx2QdciscUAUvkqg38dfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M18F2dkj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M18F2dkj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso98337125ad.0;
        Mon, 03 Feb 2025 04:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585160; x=1739189960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ex/i6wvC6t7WMY907oE3+emhuO3IprrOBZGPoXIfhI=;
        b=M18F2dkj/5Pca1BVwQYaSlucafL63ghOuRVHh2vb+i9OvqfikNNf1JAK+lo3kyC/Qk
         4TfLaBf7g3WQh6hE7LJ7NPCkjyWp4hUnBL/xXl3yuJRCxkyPmSj4ZcHKFDKRRPEuaSz0
         ZXmNmFYXefpo1LSoCuhCaSHMpYlJteRaLENejNOi6J1FDbkwgvBW8c9DxPS6Epeubq51
         fJuEgntvZ8P5wIWeC6Mns35YhD3N9Y2JaOJzrqRhr9M0Np8E/H3YIkNPJwN3qs3NWdxT
         qepq6XT+v8n3pMbJ5O8dSJ4mTVBT+Yp66JR9MY5QF7HXtXwZEbUo7Kc8ZT9wc7j+VkVr
         dkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585160; x=1739189960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ex/i6wvC6t7WMY907oE3+emhuO3IprrOBZGPoXIfhI=;
        b=S8QhtMVvq/fneJ96gQ4qXfb4uLcqZUGA4GZXT4ny6LTCqt0A9aHqm/LEv7Jq/ksi9i
         vfwkmxiLT6VSTg7tyTvQTmoudAX7l1Ur6jD5R0PGKhcUZ6jndg2SDerTysaQGCmvAFZz
         ExK9jMXYfGqj5h8/WkA4eoVhgJh1MlzMjWpFOseaf8f7JHflec9d+Plf3Qxgkvdlm406
         /6Eg9KYcx8H2EBMrKdk6nzTPexvmIpM10XjvgUCA5a+d/sCQQRWpx1hkz7V0skEArAPp
         HR0TvzPcvIJrVm/2lOEiiwCoukQWBbqpFFzu7ujgh2rXRO/6SeV22n49kjWo5KFcjgkA
         oZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5dqJZp9HGeQ2Vwgi7zgcKvOEkt4lVw+3Omy9zgbKcwm+Kxt4/FwhUOUH6RTUPRxbLtxumPuYBk0Lc0a1i@vger.kernel.org, AJvYcCWid5SUZzoCcj1c5CI1KDoAgG19Dw9yR3ETgqDJ+8ybr1yW9+wft91h3Iv0/67OF5xSzNgyBGEZCFDc@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIQpXV76BPhRecALWtRBqawm34MqBe3vnciwTGcPMa2HZuuOj
	cxC6A7znA4SZA8GaRgk+cfBRgN/0WTf1N/+xaM7XI5MfS+ZWwnr8
X-Gm-Gg: ASbGncta4uAtfIt2oO1Zi23KFwcxiyQSAvk21IXZPRRyrTq7lAO1G2aJPXLqtJW5Qmc
	0391u50gBF/BRqv+J/LB/9qiJaMzX7LklRoHbNoDJEG2AgIOL23DvYkMZxRchUmMKKeDvRSGMcw
	2rwXQOZ+991xmqQ2UsuHIzDYI3t6o2G4YWyjQ2mKSmmY2R+SW3z4u7B6Jw3reQYX1Ab9+USRdcy
	U0A8JSBUshGXcsr5ebybQRqaHRjn5ejXrKHOVb8iRAljyBIrXXMaEjlhanc5drtP7ccbR4snXvE
	qMOfWNqRMPUhcflK
X-Google-Smtp-Source: AGHT+IGKMY13N7c6YizQ5E9vzMGOjIBfCpFz+5EI4LglCrrlenJgndUnfyCXsOoHdaqCYvVBE9BnxQ==
X-Received: by 2002:a17:903:1c7:b0:216:7cde:51a with SMTP id d9443c01a7336-21dd7d74a51mr363475905ad.28.1738585159559;
        Mon, 03 Feb 2025 04:19:19 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:19:19 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 RESEND 07/11] arm64: dts: apple: s8001: Add PMGR nodes
Date: Mon,  3 Feb 2025 20:15:51 +0800
Message-ID: <20250203121831.36053-8-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the two PMGR nodes and all known power state subnodes. Since there
are a large number of them, put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 6 files changed, 873 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/s8001-common.dtsi b/arch/arm64/boot/dts/apple/s8001-common.dtsi
index e94d0e77653a..91b06e113894 100644
--- a/arch/arm64/boot/dts/apple/s8001-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001-common.dtsi
@@ -24,6 +24,7 @@ chosen {
 		framebuffer0: framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
+			power-domains = <&ps_disp0 &ps_dp0>;
 			/* Format properties will be added by loader */
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
new file mode 100644
index 000000000000..e66a4c1c138f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Apple iPad Pro (12.9-inch)
+ *
+ * This file contains parts common to iPad Pro (12.9-inch).
+ *
+ * target-type: J98a, J99a
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+&ps_dcs4 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs5 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs6 {
+	apple,always-on; /* LPDDR4 interface */
+};
+
+&ps_dcs7 {
+	apple,always-on; /* LPDDR4 interface */
+};
diff --git a/arch/arm64/boot/dts/apple/s8001-j98a.dts b/arch/arm64/boot/dts/apple/s8001-j98a.dts
index 6d6b841e7ab0..162eca05c2d9 100644
--- a/arch/arm64/boot/dts/apple/s8001-j98a.dts
+++ b/arch/arm64/boot/dts/apple/s8001-j98a.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s8001-pro.dtsi"
+#include "s8001-j98a-j99a.dtsi"
 
 / {
 	compatible = "apple,j98a", "apple,s8001", "apple,arm-platform";
diff --git a/arch/arm64/boot/dts/apple/s8001-j99a.dts b/arch/arm64/boot/dts/apple/s8001-j99a.dts
index d20194b1cae7..7b765820c69e 100644
--- a/arch/arm64/boot/dts/apple/s8001-j99a.dts
+++ b/arch/arm64/boot/dts/apple/s8001-j99a.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s8001-pro.dtsi"
+#include "s8001-j98a-j99a.dtsi"
 
 / {
 	compatible = "apple,j99a", "apple,s8001", "apple,arm-platform";
diff --git a/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi b/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
new file mode 100644
index 000000000000..859ab77ae92b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
@@ -0,0 +1,822 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple S8001 "A9X" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80148 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80150 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dwi: power-controller@80110 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@80118 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pcie_ref: power-controller@80140 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_mca0: power-controller@80160 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80168 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80170 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80178 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80180 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@80188 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@80190 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@80198 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801a0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801b0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@801d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@801d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@801e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@801e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@801f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart5: power-controller@801f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80158 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@80128 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_isp_sens0: power-controller@80130 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80138 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_pms: power-controller@80120 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_usb: power-controller@80278 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80280 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@80288 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@80298 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host2: power-controller@802a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_rtmux: power-controller@802d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "rtmux";
+		apple,always-on; /* Core device */
+	};
+
+	ps_disp1mux: power-controller@802e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1mux";
+	};
+
+	ps_disp0: power-controller@802d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_disp1: power-controller@802f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp1";
+		power-domains = <&ps_disp1mux>;
+	};
+
+	ps_uart6: power-controller@80200 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@80208 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@80210 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_aes0: power-controller@80218 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80230 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80238 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80240 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80248 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80250 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs4: power-controller@80258 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs4";
+	};
+
+	ps_dcs5: power-controller@80260 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs5";
+	};
+
+	ps_dcs6: power-controller@80268 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs6";
+	};
+
+	ps_dcs7: power-controller@80270 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs7";
+	};
+
+	ps_usb2host0_ohci: power-controller@80290 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usbotg: power-controller@802b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@802c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_dp0: power-controller@802e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp0";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_dp1: power-controller@802f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp1";
+		power-domains = <&ps_disp1>;
+	};
+
+	ps_dpa0: power-controller@80220 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa0";
+	};
+
+	ps_dpa1: power-controller@80228 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80228 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dpa1";
+	};
+
+	ps_media: power-controller@80308 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@80300 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80300 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_msr: power-controller@80318 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@80310 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_venc: power-controller@80340 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80340 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@80348 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80348 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_srs: power-controller@80390 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80390 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "srs";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie_aux: power-controller@80350 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80350 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_pcie_link0: power-controller@80358 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80358 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link0";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link1: power-controller@80360 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80360 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link1";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link2: power-controller@80368 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80368 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link2";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link3: power-controller@80370 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80370 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link3";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link4: power-controller@80378 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80378 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link4";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link5: power-controller@80380 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80380 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link5";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_vdec: power-controller@80330 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80330 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_gfx: power-controller@80388 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80388 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_pmp: power-controller@80320 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pms_sram: power-controller@80328 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on*/
+	};
+
+	ps_venc_pipe: power-controller@88000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me0: power-controller@88008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_aop: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop";
+		power-domains = <&ps_aop_cpu &ps_aop_filter &ps_aop_busif>;
+		apple,always-on; /* Always on processor */
+	};
+
+	ps_debug: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_aop_gpio: power-controller@80010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_gpio";
+	};
+
+	ps_aop_cpu: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_cpu";
+	};
+
+	ps_aop_filter: power-controller@80048 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_filter";
+	};
+
+	ps_aop_busif: power-controller@80050 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_busif";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..3963c6d8ca5e 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -61,19 +61,30 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,s8000-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -95,6 +106,7 @@ pinctrl_ap: pinctrl@20f100000 {
 		pinctrl_aop: pinctrl@2100f0000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x100f0000 0x0 0x100000>;
+			power-domains = <&ps_aop_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -113,6 +125,14 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@210200000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x10200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2102b0000 {
 			compatible = "apple,s8000-wdt", "apple,wdt";
 			reg = <0x2 0x102b0000 0x0 0x4000>;
@@ -131,3 +151,5 @@ timer {
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
+
+#include "s8001-pmgr.dtsi"
-- 
2.48.1

