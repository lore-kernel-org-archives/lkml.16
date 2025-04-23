Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4D291170;
	Wed, 23 Apr 2025 19:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435929; cv=none; b=L1kXxkznAz4Wol6/S5u1uyx+bzUTQ/G5DZ7q4TQhS47iiMqymLNnCWh2tre9L4kHCSovTwSrygnmrc8tjZYxCxvwbeh4OtCS+nhy7F3glmhAoLCerdBNFoZZSnEslBjLZZ4QflGfB8Z0IfcxW6n333YvUYSEyUzOFQjntaRx/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435929; c=relaxed/simple;
	bh=6W57QYzLUsii+2lgI/rDLUsSuP1BumMw2PCPR8oLvN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avluERc5DJLD8xQJVGYz6RfnWsVbVoOW2SEjndi2pvGGxIe6F0bsaRhcXkFM7c6HhgoXli3WOgEtIw8VWYqx9ckIM9GS3ZHP56cqj6Zd3yH+6Uug2myqj19p+KTuVHaLt6hJdGtX688JI2euCN3jp2o/VxK1cDsWGTct62/XuoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgQfYRhx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgQfYRhx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso2582265ad.2;
        Wed, 23 Apr 2025 12:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435928; x=1746040728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIYSdEWdYjNWg1JOdzl1CekCVHSxAkDwX11n6K87S48=;
        b=cgQfYRhxsEYHzBACXR81N1+aQMSmsSJ5n2G5DNQFui3g8cG/ayd+O6JFWu3Bj7GZL8
         rbfk6xOrnrTGsFaQAgTrpYFfyOCE7iKxneQ4f2xqfUG834jOWU+N5wldistFrayfFYBy
         j5ahObYryYTZHz/Z6hdiDtNA+Kc3CBLvSOLWUf3NkB3wNA5MZ+Cm+ypnbXaAnTLBB60n
         JtD6X/ZOGiK/TQ+0/JQQyxN4uc85pxC8op+d5U/w7/2m98KKE4aKVNMW9GXMlg/oLlGM
         N+3SGL3J7ZzreHNU7kxbI9K5/IK2k1tnuU36Yl6mmT1vm3N5HfOHZ64a5fUQoeq1axvn
         vQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435928; x=1746040728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIYSdEWdYjNWg1JOdzl1CekCVHSxAkDwX11n6K87S48=;
        b=gFFsCz1Ii4V5w2DxZVMPmSmPCSMH4lCwCzdWKX0Xw1tG9Hu70+MsgXvI2PvFJYshzd
         6I0Hwnw9zX390ACJNSsI4+CmKqRLQxylBcHVfGDESDQvsCsXh4t7IkJuzrWx5yWnllvm
         kJqwPClry5zpsXyLr5d33QaqbPJxa9GI8D3PHPPaxqrPLjGFaeLjsTr8qoFRxjhiIh0a
         S8xxbQth3uN29EqpLDMGizVfPfdjhb/FfhXhepRTGdxgUc39/sm0lvBG8uVSpxzLFJvL
         B/ClHrOlHwD3BusfvtuVxV6+CMqBpOQ0sX2TnDPKPE6EhiR5f5xvyXYapn3oVBQrEpqm
         3Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCWfB8oRFzCHcabAFJhxgBl84Ui+bgIHBgtby58wxDSuU+EDCXQaAkdwEWn76z8J6QAIhWyjvORdco91Rw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSMtDnSXMAU0sqgDKUZrdgRlYswkaFwWELrLqiSpOcmfT6jcdn
	qt5vBDjUbXBbzdFn636uc8W7FxOE1xvKWV5TYXI4Q6DSa7OWpeqV
X-Gm-Gg: ASbGnctUt0bEAQNxHhEoMxwBRLqS7uLRyw+iOXuVXMR9xYBEkzYzsu+FDNcNFDfXZ5g
	xGlJta18MxxT1g+5KEmf8aTOmZn1cmf1cP2TmGU5atsbtkpdGKSKb+8XFUdtnbIu3/CbBunfe1A
	RLdwmoyDkcH9RWIDEl4uTDmlLP1j9pDyQDJazrGHdQGxu8AQCj8NZ2MORaanAtQZ+f7mv6/q/zd
	KW28+dhXoE3WleoZPbLJ1gcDgeGb6ywy49rWDMdRjjLaj860bL5wD/+qHEIg+8floUIDkYiQfs9
	wM7EYPaQuP8fLelnhoRk3H92/KUrNCeP/0P4/3PEDGCpIHE4Sscb
X-Google-Smtp-Source: AGHT+IHISSI6sxpKSal72ZsfL0ROGtb7EMezHqIHuGuTTYCadSEw2oEO51PUIm+sClTFJHFj5M10pA==
X-Received: by 2002:a17:903:3c4e:b0:224:584:6f07 with SMTP id d9443c01a7336-22db1b31039mr6838215ad.37.1745435927558;
        Wed, 23 Apr 2025 12:18:47 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:47 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 23 Apr 2025 23:18:33 +0400
Subject: [PATCH 3/3] ARM: dts: vt8500: add DT nodes for the system config
 ID register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-wmt-soc-driver-v1-3-bd8bf32521c2@gmail.com>
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
In-Reply-To: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=3343;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=6W57QYzLUsii+2lgI/rDLUsSuP1BumMw2PCPR8oLvN4=;
 b=Ll1xSdAGEInXI8OF1yoMnE81rYGd2G/d3jEJXoTAF3+ka/+yccvvibfADDjw5UNi74/48YtIO
 KkJT2+QYWfgATNn+ZaZmwM/vHU7J55mRU0bnOw4ATQz8mugEZmxwvTL
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
index f23cb5ee11ae63222276c8ac178c52a6a3872c0c..1f81f0cbdb7e2c2378b62e40afd3675303bf8cc1 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -55,6 +55,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index d9e1280372c55c5080d242014c2392eaf4335d11..adc239a9999995c077dda0e2ef3a76066264bb8c 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -66,6 +66,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 35d12d77efc0f91e3735b98b8ec1f25a62c9c22e..2139d183a92b18583884f9329ad286e9da98c066 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -62,6 +62,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index b292f85d4e69b43d6eeb4525113265722a7b90af..5b2d3697418dbe668fa3b8586b0c98f2efa6bfb7 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -68,6 +68,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c61717ebb4f1f3523733241c4df11f741ad4ae14..2c4922933875c9c31ea7c979aa8cbcc3d9a934a5 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -65,6 +65,11 @@ pinctrl: pinctrl@d8110000 {
 			#gpio-cells = <2>;
 		};
 
+		system-configuration@d8120000 {
+			compatible = "via,scc-id";
+			reg = <0xd8120000 0x4>;
+		};
+
 		pmc@d8130000 {
 			compatible = "via,vt8500-pmc";
 			reg = <0xd8130000 0x1000>;

-- 
2.49.0

