Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFCC21D3D0;
	Fri,  2 May 2025 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223505; cv=none; b=sZl/MlPJpXKnH9xA+Tcxj7nVYScq+QvB2zfc18ED/ZXvT7q0gj2eqa0VsY1+EvcHLyPHpzJLduG/9rVfPZSCwUxptAcLVGy2RbE7b5+Uqdd2tqS5BbZHAftdfEZ49Oz+RLf1QSB1cZH3DXOYyHjPY7l8o+PQMAQLt04Q2GkvJKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223505; c=relaxed/simple;
	bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LO76wY2ZpYIrPbw1yFf8CpcQtnGo7oQvc8TqkZK76whZTH8LmQICBT+fWgzsrgRuN/dJwiZoNnEzLDsIik+02zZ8quu29JbZ1d5S4nPo5NIK3LCGor/F6JozQ8W/T5z+9yqajwZh6SWOj2lPNcmdEvmCqo+5en5zgdfslrYiN3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTSguQZi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTSguQZi"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso2967838b3a.2;
        Fri, 02 May 2025 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223503; x=1746828303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=aTSguQZiPMslL3pAB5cVB8Gnq+uJEffRkL66NTozIhB4loDRtgF8FiFWj3LBesygS7
         L7Feyhu6LJXf7L5lMnSd/yLYdT/0xWfGQ5nZekmQAPZ38t031y2LOzK3+wIB33UUSjnO
         Hq7RJQPuWrp4FQtgxB0cmJPiEnYW2Kvg9JSwiOnfplRKTTyJNj+48I/NrXjjfkQClC+l
         rx80OnHyzdRl6XeczYpZjX5JDOU0HQGMFpGoasTM/C2nT0HpoUXYjEkE/Q4lU2uSZOYR
         N78e4u+dos1VrvjzFVHitqlZ3501n1zJcx85icQOAFmzl82rDflBm3lGmyoCfHpHjLki
         G0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223503; x=1746828303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=TIshOi2xqE9XJIWU8UkfssaRtTZWWRu5onWbJ5EZwyOZyLHSxr2JPD27iqGl8MGu9Y
         IIjC8GHxlG1LXaO1mZPDq508eBLdkxvqXgKMZOX6Ll2Z8SvkoZtLBQNNAIzMHAwXNfcC
         TW3iETRZ7u2IpZUFHimQOTTg9pwp57EYibxpUGUYqf48lXTrUP9kzzjhJ0xcU8OhafAR
         uveSjbVpxSlhEe0332KJxYqN87m8tUpbUsg74UBJ4bB/ULVoyAssiUx4YIAuGayAXoDp
         6bjJHDee1d9wdaWPest10bKrskrIr6Ha9IAKXv8ep37D1DC5QzzDMnKRkyuwvytG0M+9
         kagw==
X-Forwarded-Encrypted: i=1; AJvYcCUOTFHYpqlHCnJZwfBBr7mcJUedflvaxe4zm0SyxHvEdrf7QLD6w11h2P1G4XcBWVSAeV0l7z6S6Uh7jDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhdqy/9ywNrZTeGSWxmQhesbrY0RguJhY/9p0KZHvSjC0ZbLTA
	LU95F9b9yf1ptyIiVPa2eIZdmLbo5xC0Nequa0z6QIopg6NBEQqY
X-Gm-Gg: ASbGncvMBxIi6v3i99gUwSnLuoz21nTKNH5l6g9AMzRcWmDW8B2fKt0NqnLq/AavWJn
	GaYvKxqSdE7fkdmwCZJMWVSF5yFeYmvivdAa1Y4pIDmYAibXaHshN03Bn7OEjpUP68EWfRyKTM3
	wlcsDRgO5UXdWp7Y0UX2zI5KfUSM4n15wyoTIqzJnr0J2xPKD653y15Gt1YjCy1/2kge0j2EtOl
	jWSnp99yhucCKb1R8vbnTf6EL88fYgERnygQX5MTTHDa2Z0pvCFLzPuLa7LaJdhtBvbP8+4RUk8
	YDTvYGodFtwdHpugFG7FYpP75BHHbLK02SVYzKBpLDUEjbNx2DxzeOzFDSx4OQ4=
X-Google-Smtp-Source: AGHT+IEIHdpKHHp0Jwn7v/qswP5sSpR+7kBroeMagApShsPV6L42FJ5hXjpTpVflWJhXlFGCaYxMhw==
X-Received: by 2002:a05:6a21:6b86:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-20cde8575f6mr5246810637.10.1746223502909;
        Fri, 02 May 2025 15:05:02 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:05:02 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 02:04:25 +0400
Subject: [PATCH v2 3/3] ARM: dts: vt8500: add DT nodes for the system
 config ID register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v2-3-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=3308;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
 b=CdXpquQvvaMvwd0gcmXPZLNq+z5O4wX4uzNPsvinL/S+zR46NynHev1DlfM1FVWwry826+djS
 lMlJuAeRroJBBILdR0gJkSvp7YJvYjQC6WVmUABZJYFkPQiz08/gdvd
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
MMIO address 0xd8120000. Add respective device tree nodes to let
the system code access it at runtime for the selection of appropriate
hardware quirks where needed.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 09f5ed3e6821b72fc440f9de3df0ad484d2c4e17..2ba021585d4889f29777a12473964c29f999f3a0 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -55,6 +55,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index c81810b967bb349419a5ac7db4e788faec3695fb..99c064c916b2279797f71261ca9306e9dcd4bbd8 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -66,6 +66,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 555008120a3e315591d2ca49a39d354925d570fd..0d6c7bd87f7dcce0eef056d04c38ab1de5d52639 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -62,6 +62,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 309f6e5129fb817d343cd58a8d90340afd8d6eb9..0158c0ba5dd110957eac38775d3bf3ebd2ab4154 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -68,6 +68,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index 3f4a514d65e2ac7658b73cc9c4f3cae1407265bc..c4bfb4d30aad0358b39cbf30edf0c63e32167bbd 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -65,6 +65,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		chipid@d8120000 {
+			compatible = "via,vt8500-scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;

-- 
2.49.0

