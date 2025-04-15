Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C12D8DB9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744759532; cv=none; b=lTTFa8Tn1id3W3LZnyaIkfSuBcZoYMpy/3ItSuCW1VgsS4n3tiKLrTQVE/yAKHuYYxe6lcIohSIUHA0okXGouGPdl0ForkoicVIlRfXHTVCwpZH8lsdxlF5BlR3WOIx+vnfCovwTCLmsTIfxtg7nFz6AZQnK15fjx/tfmwu0Ols=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744759532; c=relaxed/simple;
	bh=c8DBvaJrvgzsKkIA8gytUTCThGm7eqgoKYGFWa7di9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+tzxhW3tRyWV73yCfUQjnhWoD4eO+dpXHCsZwiYX+0Sg50kyS1ABuTCHFfM3NrDyWJ/Ubz1Go1x7bUSt4PwT5JaJE5P+oa1Ea6euvM1w1GbI/rUDA5THoyCvECJ4MU0x/OtKQi+WzX8dHP6kig45zRK3Bk0AVHtHwCDHaC/MFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=iEYWZcvu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="iEYWZcvu"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2879351b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744759529; x=1745364329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Typi1g6KX7Ehfn4YypTfJOkSrzPqdsOWJwM5fjFePI0=;
        b=iEYWZcvuHYCIyHTo9B/Mi9GegXyeH1OoMW/I8TRJNkF3DnVMzsY4643YVdNiXFezI3
         jE8529fR82laqtbOjam6tCUmrPe/De9CQby7n8ncLZGhtiZ5rmDHKk9m3CAtdsWAAmp2
         Cvem1Rw2rvfx0OyDOSEOXKgwIRf042+5tiKrVKvLGpUYDkDgRerXc8jRPaDPFggEewVA
         0Dk2WQ6/DibfncaT4ByixkrDtwbJYzACp/zleLXJ665KDJZqkrzMpNoW+0vUFSf1Ua2m
         w4wXahAfsivlM0945etEFlfquEYabEqoY6a1088PI1N1PG3Z44mG+TAwoL1fQwRpcEf0
         0wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744759529; x=1745364329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Typi1g6KX7Ehfn4YypTfJOkSrzPqdsOWJwM5fjFePI0=;
        b=RU/q2puyNYUbeUMx0F4P4fLxx5JPuJ8ragKSFTogP91zberakRtHt79FsIGcOsJUbG
         TvcISNjz0m1ThT83oQur0wmbSnNuE8JVKFfj8zy/6vr65OCfIY6k2YNXasTErPC2IaXn
         55/Dxptkqz3byErcHKOA2/4DG2ihSsEnj4caeJH/U+Npfdb2YLZ5AOTyJ793avB0BLlM
         HMGcyz5sFELyqcqkbz0PXIXhDwZJRShKGlFBeG7zIVaiP42Sglv8SDH0MA+1AfwQSWzn
         GQuT3j3W7yQMhgRHnPxDFVn9JGEJhMP0i1sIg1mx7GgG6DPou1ogJmmAtF4mStFeDPuW
         gj+w==
X-Forwarded-Encrypted: i=1; AJvYcCUtGT5DMzCb/u9FZhkjCTNkNjw5aZ9fnZNd+N67Xm6BuSLhLYiFOpPzV1ERIE6QecYsBQndwqJUHTiYb1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkqFC4aycH4sd1zwtXcfQdGdG4egr1BAmmR63nx6gbFsajkG8q
	OOFqUdFZyEON0/3lCxFJ2C/wPCafG9Kw4VmIZTA2ifhCv76I8G/FC9FKC4qA1Yc=
X-Gm-Gg: ASbGncsTdjghCa56vD1l5ljzbR+h5Tsqi1TKtI/8kOygRBIMutnKzXrfJHtH1rL0AbY
	31ON5Vhz0lv5ygq8HnK+JtprxIGOTrN9ntNIIU9+V/goEzx2hh5nbLBEI5tAaNjGuawMaIvmZHr
	NlktWvu5gf0dOwQ9gt3ANkXOekZGX0ZZdCV0dxaTs1QFbmy+ylTbpumgK7N4232Ql6SQdBZooSj
	I209F1GRyuM++fQQBTbhc1AQjoXZdXimiE0moQlarzMIE9q4AzpEOdPydmk42TJMrTSaBSj/Cn3
	Ou/vPlss4BvE1eLibr7ZV7dR/jZZDJ5wllte1zatmy5kvlGay8x0V/hbVcZZO36EjUmYASkSX+H
	Nvl4ealNPbCgT7JYgoxcIATfkCGc=
X-Google-Smtp-Source: AGHT+IEzphQP3s7FZ5e4GcCAa2R4BFsGamVOHIKYq0Z6d5ikKqoVlCyBOojccFabDl5OP2cE0NKWaA==
X-Received: by 2002:a05:6a00:a2a:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73c1f8d3744mr1737009b3a.2.1744759529366;
        Tue, 15 Apr 2025 16:25:29 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c5e98sm9443850b3a.57.2025.04.15.16.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:25:28 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
Date: Tue, 15 Apr 2025 16:25:21 -0700
Message-ID: <20250415232521.2049906-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest iteration of the clock driver got rid of the separate clock
compatible node, merging clock and reset devices.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ecd171b2feba..4da62308b274 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -47,17 +47,13 @@ ahb {
 		interrupt-parent = <&gic>;
 		ranges;
 
-		rstc: reset-controller@f0801000 {
+		clk: rstc: reset-controller@f0801000 {
 			compatible = "nuvoton,npcm845-reset";
 			reg = <0x0 0xf0801000 0x0 0x78>;
 			#reset-cells = <2>;
 			nuvoton,sysgcr = <&gcr>;
-		};
-
-		clk: clock-controller@f0801000 {
-			compatible = "nuvoton,npcm845-clk";
+			clocks = <&refclk>;
 			#clock-cells = <1>;
-			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
 		apb {
@@ -81,7 +77,7 @@ timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				clock-names = "refclk";
 			};
 
@@ -153,7 +149,7 @@ watchdog0: watchdog@801c {
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x801c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -162,7 +158,7 @@ watchdog1: watchdog@901c {
 				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x901c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -171,7 +167,7 @@ watchdog2: watchdog@a01c {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xa01c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index eeceb5b292a8..a20f95c60a62 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -19,6 +19,14 @@ chosen {
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	refclk: refclk-25mhz {
+		compatible = "fixed-clock";
+		clock-output-names = "ref";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
+
 };
 
 &serial0 {
-- 
2.49.0.604.gff1f9ca942-goog

