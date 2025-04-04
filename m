Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABA1F4261
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777331; cv=none; b=G+Gw7e0yGo9iQpSGIfS3rlIPp4cpTdaldsA4LRNbrMMXT5JCEfpjtmihAeAmwcqqkftUksKQ67w51bQYjNGxpqc5j6UKTaj0vYNnJIq2s8F0TCVvyHuVCu7g+oFeESLazNYQwXjxqlAxi7uoXhbM8AsoQ6MtRp7eH5bhpkvqW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777331; c=relaxed/simple;
	bh=kN3isOiLK0vcA5KhRK4tMpjoibgtSSoo4ZVucn2ZDQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLuL4jmT22Si9YZZ8qeX0LRTgu4P0sIsCAFkhZm/IlW5SlefXuq+gToFEz7+nR54spk9fA8m+Ezyr57dgk4RSOeVA5Ul+xs2wMcKlKu4CQgt6/l8FbTWnq1G6oZqcX0ju7hOAGS0pBeC9Y9vJGRSIq/E6OE8fkYZyEHur0AjXco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=DxeF1gMt; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="DxeF1gMt"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c59e7039eeso290239385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1743777327; x=1744382127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
        b=DxeF1gMtoPBVJehJS7KpF+Q6N3V/jBChijFUApVL91UyONLtzWzsBYa2OhAAcP4jcG
         56YZVtrJMgljgspr6Pvc9nqufI2eaL2bs+Q/l7XX1rpUtNumSWoe+T/unaT0gZ7qwQKm
         LzYVWiUZ9xFCgshy0E/RIveJH/+k4W6Ag416OMqVfbXbZgIQAmuADlHquLViWa/qZoM4
         6E8gTMhYwl5Uo+o2T7vCEeHqeSHFLhbT/nUYp4DGQt1qi/l0jat5wpsWbdr5dOVBwdOS
         wVcuJB9bDxvu9y6IEU92qoxBzclIapVFamsvSiR03fPk1Xwra9eiGMcT5CrWAWZrU/kE
         Q/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777327; x=1744382127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bK+c3D63UjZ8jufbmxbZOM/a2XsXZv8kRnKHQX4cpEI=;
        b=nuGNID2iMdp6KB3lhenR0uDnnu52PvnY4hndiwue+urdvfe9STAusyTvGyg1S3W3hX
         cVg69YtC5JfX79tFbeluUzVfCn/Tp+6YfkWFb43NzV30T1a8g0elxK6oRNem/yWrMyAj
         2zaQqw/1u4twK8+iYEx71ri7dcGIxGuYF8p8QnsCK9LTWiSnKJpKMXw5PkYLgaoXrxnn
         DAf7X0+V+ZVrj/eMwf4x3exGZzn+ozv4ra10mFQ/alVYMYmlBJpdEbqsaFoaW5gHXBGa
         wlpJPNjx1WojBSr9WohGTM1Sx8CBeHQZryUxahb4VApwodSCmfAwLaFSHqVnLq9BFLWj
         2WGw==
X-Forwarded-Encrypted: i=1; AJvYcCWdeErPpWhE0eN5fWGu3diZZX+czyfsJZjquhAKmdPghpkk35FUv7s6S20CS4pJxKQ6knQlllhoJBGa3/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywne+7jFE2r49+mUmQR5hUaBc/rvjIm+6G+rWOv2IpEqwJbiYsP
	OoXXV4rr1L4QChrd2SIwWV160Q9cvEYxKPhfnbg2JwuCWTLY8eBXga1pYDUKNbw=
X-Gm-Gg: ASbGncuiDwIBv+lVSnvJ6lIEFPyUcpA+MieEVeLtwOskgsMUtQmkm5ru/UsUSLSXrOZ
	LEwMQrDAn1l52D0ajvgF3o4WqCBCDdsPc/pZ+nE6CM9IE97VP5q72lM9RSWCV79496nxh/838d2
	PWwbDpeBBfcfrdRIQCGSH+6tk7tYK8wRxUv4LTfx6QQRvrHyWy5hi1ZK9cCqY9gzMJnfYZ3f/sN
	qpuTPjIyO+wPVymxQo8MaieK2/DluTatJe4ely20EYkFlAdKaEBMgAGAOgvhJtySWKGpmPTPb7C
	B1ijv/mg35nS9+Ntq8PDVxXytdLe3rBzrAjH6x2SUcQkngZiBinC6BiND6t/ycR/W0w5hlnwh6E
	=
X-Google-Smtp-Source: AGHT+IGpe2CJgpCsJsGayaNpUYmgMLrht7bkJyklskD3eOS7aHMmjw5yzUjbFsf/0aNBZKBvoN2DUw==
X-Received: by 2002:a05:620a:170a:b0:7c5:50dd:5079 with SMTP id af79cd13be357-7c774d2779cmr487860885a.1.1743777327595;
        Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e735419sm224204585a.15.2025.04.04.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:35:27 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH] ARM: dts: stm32: add low power timer on STM32F746
Date: Fri,  4 Apr 2025 10:35:14 -0400
Message-ID: <20250404143514.860126-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree node for the low power timer on the STM32F746.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f746.dtsi | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 2537b3d47e6f..208f8c6dfc9d 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -43,6 +43,7 @@
 #include "../armv7-m.dtsi"
 #include <dt-bindings/clock/stm32fx-clock.h>
 #include <dt-bindings/mfd/stm32f7-rcc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	#address-cells = <1>;
@@ -245,6 +246,39 @@ pwm {
 			};
 		};
 
+		lptimer1: timer@40002400 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x40002400 0x400>;
+			interrupts-extended = <&exti 23 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&rcc 1 CLK_LPTIMER>;
+			clock-names = "mux";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@0 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+
+			timer {
+				compatible = "st,stm32-lptimer-timer";
+				status = "disabled";
+			};
+		};
+
 		rtc: rtc@40002800 {
 			compatible = "st,stm32-rtc";
 			reg = <0x40002800 0x400>;
-- 
2.48.1

