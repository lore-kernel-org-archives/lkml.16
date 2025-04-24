Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11534221F2D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484433; cv=none; b=Jc+1UjhtYALtP3mhdw/MlBuBN3cDaEY2bJMd6EhGFwUdzvE8Ic0uJTQdoYjfv8IhOwhIVjOzMmQsTF7k7KxebVp0qGexf8OHM6kWNFBn3kgovuaG4MWfappNtGp7R/NG8oxNnFvCZ4v0+4Ir7IadRFjGktu5dCCqsHe4mYUzIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484433; c=relaxed/simple;
	bh=szrQlU6xadPWyKkNCzJXlQqt5Pvn3jWxnIR6eR4Hu3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Egla4kz4rLb2MQtGA3KvMFzreiAjcAJl6Vjro0QhMChtH6DEsajI2L1oRvg2AOXL0rKzt40Lc22l+Ff6yBeA6l+rojRKtDy/SEPqAsUZQ4Ok3egWz1e46Me7JyqaJnv4X7XQgfhHn9eSe1nj5ZxuFURKOf2O7S6FzkR3LegG+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JdBbeoCT; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdBbeoCT"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb94bf7897so7812166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484430; x=1746089230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
        b=JdBbeoCTqqfZ5/zT5wubD6JagdexLDiU9xlLXyuOk7KNkoT0qYTEzJ3+nZo/iVSaSt
         oDfmltUvvvcVtzFUtCo6Wnb7sOsV8JW4c0glwZWb3ReJFUwIXxF2LEp/Bfnn3e+j7icN
         iESm3CptRQhGjGp/XFd/4601nMyBduBNbKVaSHIWjuQwusbbAGH645EmmJqLpKAlxgot
         7rcY+AKrusvDeTVuokQ8I00C86F/j+7D25WFDcOIWYt8xo07BEt2lnABJ0I9brxykyR7
         VdnfwrFm2u7vJ27HjsKJF1kbymskYBeAyrDO5Io0q3t0DbxKYOYjgSLtsym4AsTgxi2E
         qlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484430; x=1746089230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
        b=jl7fFrwGyY3NMg6B8aDR3i9x7hKXvnGeO+NuYBaoQg+wFHiEdgzLeTi9xfkUy3gg1J
         EP8OAw0T+lnwneFQe+tg9RVThnceUK5U4Tlq8KKspmMcFhBreX81U6tLmzi7Swajoz5I
         NzCueEmF42QoT/f7NvYshVCPoV5Zmi90E/0iKbA1LCoZWoh5PuJlAzy9gfgaDY+M/8uB
         2QpVx5SZ4G8uQLRD/agSv+Py4lZUxxo+o++yq6lLui8r/OTGkI6B8j7m0m/6B/j2DzeQ
         jlwbjd5bBiOCjnhiLNdRA2Hg5UxFq1I/Pi3AnJzi2hsqMefiRvpmX2edQA72aVZfIQiH
         G3tw==
X-Forwarded-Encrypted: i=1; AJvYcCVnou1bdG8gSW3ker303C7T/p8a9MGoovkmRcD3KS9r/Dz4qtxj3M8/8/ocLmxJm0bFkruS4QuNvCK47R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsO121UhG9TZBFpwdsdBBjpWt232BLQyoOUlh+zc4wjmXtTTG
	L81GnyhdbxhWNCrR17qFHUL4w5ZyPJ3PFqQDYdPcV/ovwKfkJ9XteZcdJgob/Oo=
X-Gm-Gg: ASbGnctXGlymagl2JD8a1dlh4TP3jalimHB9GiRNdZ8FopAIJEXREzWupWeV0G3XWik
	WVyxXw1Tlahalz6qBXiqND7BJjFxbOEQa9oq54DDK5p5ZKuPVHsX5uJby/20rldu8wg0RqDx5S5
	0xPswV5xYmDrmu3YaTlURbZKuNI6JqlKJZRaRpBBTcv+koAPguV8PQux043P1P4qXbxvK/m/nLl
	l9MSgG3i+Y75zmIowznFWOZOBfBqr6uGlCHu+wnUrDFvYikpyiFBIGyuZXcvtiQPRnfh48sR7AJ
	k09MiV5pR6zWNa0j5C9McHhsPLu+lBuHA+QsqO+5QByNZHYgqA==
X-Google-Smtp-Source: AGHT+IG690V/118jVCZXhJGEzeHLok6tjdjixbJjju8hozYkNfl4sz7fKA7GyqSoTyecOpVPS8y/SA==
X-Received: by 2002:a17:907:2d0f:b0:acb:6081:1507 with SMTP id a640c23a62f3a-ace573af8d3mr64249266b.10.1745484430243;
        Thu, 24 Apr 2025 01:47:10 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c22d9asm69948066b.124.2025.04.24.01.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: st: stm32: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:06 +0200
Message-ID: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  stm32h750i-art-pi.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts            | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts               | 2 +-
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi       | 2 +-
 arch/arm/boot/dts/st/stm32mp157a-iot-box.dts          | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts              | 2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..65975ca10695 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -167,7 +167,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 19a32f7d4d7d..9764a6bfa5b4 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -421,7 +421,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 6236ce2a6968..c18156807027 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -287,7 +287,7 @@ &sdmmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {	/* muRata 1YN */
+	brcmf: wifi@1 {	/* muRata 1YN */
 		reg = <1>;
 		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
 		interrupt-parent = <&gpioe>;
diff --git a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
index 6a5a4af25bd9..84497026a106 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
@@ -46,7 +46,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 324f7bb988d1..1b34fbe10b4f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -115,7 +115,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index 343a4613dfca..aceeff6c38ba 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -435,7 +435,7 @@ &sdmmc3 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2

