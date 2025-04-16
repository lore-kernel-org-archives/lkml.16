Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B48227B81
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744768751; cv=none; b=fXnCh8gpACYBLELi3kcNZkrGw/lDQSH4M9HMzD2YpJF/FqjeM477Ppn9xuvSvGTB2CJQetMF80DLWuZ9VWG9b9OpFlTpEQgL5RE9wZ4mttbreP0E5V/+RHtRhZKfZm05hiJuw+mye93BCZG8nXM3PKb2yFuaXKi/nVI5s8je5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744768751; c=relaxed/simple;
	bh=cCgFpxiwJ0gCPdeUMaKHrmAET+N2uNHpi4SiNW037bI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SXv9RYDSV9sWyJLq8fhyOMSg5u2O7dTZAA2DJ7iP1HBAxT7wVcy6hdrbpVq1lLb/DXgqvNHogAE1s6uNvUXAcYX6KA6ExA89uhe3HstwiH5WIgzuAiOpaA4v0poitoryIULk1wysuHdUxA5YBOitgfJnygDP6AuveZr0s4r9buU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=bMYlXTot; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="bMYlXTot"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c3407a87aso2084785ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744768748; x=1745373548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e82Zj2e4FwI3zvSpsxcQPHmRy7+tI4Kl1Q4Ap45I6sg=;
        b=bMYlXTotE6hDi6j3SdG3PUqI8e3rTKsB+hGofqJl63fdBK4aLbA1C8ewXyQHHF4hlc
         Ulmy/4qk35QXB7Geg7wIX2D5AxzbSFaFIwRkETba58nCeFVl98ScuAD+uWHWtS5f2fmA
         I+yZbVnxP7TqP0fek/40fb1pC35lGrpb2FbL7sKjeC+xeoGiHacls4XXCI7MiBUiYXK2
         QwWHuAalt7D5zBcQrobtlG7Eh07W3epVm9VTlgw0A3tlOL3CYRmjo22VKeKHOp2C4w89
         1/Cj7UrzaCIXs/Idyws/334eVHxSossn5z2ZwsKdMfVMmE7l2BcVHcSNHp+/Q5FJkrDF
         eG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744768748; x=1745373548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e82Zj2e4FwI3zvSpsxcQPHmRy7+tI4Kl1Q4Ap45I6sg=;
        b=r5bIfzr/8FeAZGKVwvp/J5+Z8Sp6QdzhP24ci8PKMK14plUuI0kdODXqsz0grCPBV7
         HW4PPty7A4vA7DpzBVsRdncWofgYpplelvccfRPBtdFCOvW+rTBMJAh93fFq+1pe5D6j
         RMcb1scBmJcGYap/8EGo2DAvJpR04vNgw6GU99JIFLBeQ3GPM5rnj8o8/yUep7I+3yQY
         yUQIc5lcA78FHy8Qq95Gi2zdDx9oHCNYKsxf3OZ7HVnL9P9w9zJfgL0Zd46Dwc0KgR2y
         GO64A5NnlrRlMaTJxM0oS6hpL29FDVz+3kNcFi7/hOANpJ/0Q9GAo91PJ4AX+K2msxv7
         HoLA==
X-Forwarded-Encrypted: i=1; AJvYcCWu37wofp3Vm951GizLVzZR1L5dPKTrbNOeVoPRIx/DtYod2wXmx5nUowc4nT6a2WKcLmmTODt7Ywr75SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvaNPTVYXUsEvnK/c/xj53ueoezKq4gl3pT0QyikIUNaGhy+g9
	ZH9yyqhjuOMG2DJZz2n0lbxvalVeXKQD1mBDTPtjkoi1TiEhPhxxuHYwD5cyaWg=
X-Gm-Gg: ASbGncvsyevq4EqoYKF2VP0MNq4STBcts2eO1yBJJkzTZxLwV4sPKUDqMQgIenXXH91
	tVSAiUjQv5fmxDTMeTcjk1bbiw3GaTJWRwRqr3fYjSXre7LslHppd3y15mH6sG+vxgp+rWRFuLP
	f8j2H+4kZF4RQG23aFPvmOchT4aOhUnI+L7cTYxXyFeRyjubP70ROl8G+Y6s3dHPU+quWnPNA9k
	QWC0D1UWj1PBxlxHlsTLDVcws7cKf9NhrZrZvSDjRcfeIsg2kfXMA/hakn7E7Q5gt0u87mKRvMC
	u+YaBVoG99i571/8qf8wXJHoaJhukEKJQZxZmRDPrTDYy5Z3vHq8f/O+P3nlrtZ0l/coGMaFQYF
	1WmzgYXRV4nv/IWe7be4IMinFONI=
X-Google-Smtp-Source: AGHT+IEbUxLXqkmN9eB9Y2TwjT0iKR4gtJC2qNjvOo3KGkymZjh0chvXTjMdxbdfvQ9cGDKgkpZyGA==
X-Received: by 2002:a17:903:2c9:b0:224:194c:6942 with SMTP id d9443c01a7336-22c35973f06mr387275ad.34.1744768748194;
        Tue, 15 Apr 2025 18:59:08 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33feb116sm2279845ad.253.2025.04.15.18.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:59:07 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] arm64: dts: nuvoton: Add pinctrl
Date: Tue, 15 Apr 2025 18:59:02 -0700
Message-ID: <20250416015902.2091251-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is critical to support multifunction pins shared between devices as
well as generic GPIOs.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index b2595f5c146b..dd1351698e77 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -207,4 +207,69 @@ watchdog2: watchdog@a01c {
 			};
 		};
 	};
+
+	pinctrl: pinctrl@f0010000 {
+		compatible = "nuvoton,npcm845-pinctrl";
+		ranges = <0x0 0x0 0xf0010000 0x8000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nuvoton,sysgcr = <&gcr>;
+		status = "okay";
+		gpio0: gpio@f0010000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x0 0xB0>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 0 32>;
+		};
+		gpio1: gpio@f0011000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x1000 0xB0>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 32 32>;
+		};
+		gpio2: gpio@f0012000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x2000 0xB0>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 64 32>;
+		};
+		gpio3: gpio@f0013000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x3000 0xB0>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 96 32>;
+		};
+		gpio4: gpio@f0014000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x4000 0xB0>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 128 32>;
+		};
+		gpio5: gpio@f0015000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x5000 0xB0>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 160 32>;
+		};
+		gpio6: gpio@f0016000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x6000 0xB0>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 192 32>;
+		};
+		gpio7: gpio@f0017000 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0x7000 0xB0>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&pinctrl 0 224 32>;
+		};
+	};
 };
-- 
2.49.0.604.gff1f9ca942-goog

