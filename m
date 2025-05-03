Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD31F30DD;
	Sat,  3 May 2025 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273182; cv=none; b=J9jkXz09H9aUI2UJZ+0PdNDjTij03WFgQM8Dmq5Gw6aoyjeVxthWHzmdR0LY8LGgVCd4gzj4a5dTSf8sBnm0tXKPeXCBSxIVDtHNJdikFjZKyVa1vvdhFCWz0CfGuL1rts2gbEKDKA8MUMapcu/8ETlAYktbAscJ0+40Mk/DyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273182; c=relaxed/simple;
	bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8cwB5MwBkk5i+k5NMh2Mql4dxQ5t+SkZl4rWMRqEwrWd7zCJ6qTr5gP+SzqQhfFrNv4OcEZv9GpNcEpUL84KBtkhFl/gQy81YfBb6woxnvwXGtsZFZrLgcKFU7T8B+iyJS96Bd7cUXY5bMn1WxN9uTtY3UXKxT87JVIvQyh904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuEpQAyr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuEpQAyr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3015001f862so2281011a91.3;
        Sat, 03 May 2025 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273180; x=1746877980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=NuEpQAyrslqav7n5QslTF6uzlr/JSJt8tBn9kUlVlQpRtjALJ56WNlTeOBGFRnRaxZ
         IdQ4A53Ip9+7bXw/UQvcwJ/ayMjq8YJj4qxGACzmd0FH7PKNRLBODw3lTLKk8sjvNcxM
         12ZGuJjYlVXwwBohfX+YD/08zCzChuYqhQSUFU6oJ2Of4D2c4z64LzjfpppyvHWK0Cqa
         RZXABBgL03ezUByJzlF+5jN1QGxDoqDiBOnyCgVT9H6SU2keJMAIgPUg7UdVgP9L/LDS
         KrXC/njvK3YXOQNTgGbJee9Zy5/Tu+acrL4R6AuyBl7pzBSkVe/GqsmW3auQub5hnMZS
         2K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273180; x=1746877980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsfY0lV9E4GQej2w/iz2H9P9kYpTOHKDKPixk3yXVII=;
        b=Jo791U2Tmx2aIJKuBhFghOHT0mNZEwzA93wl8VyaLf02YUHkJdiQeIr3qqDUnjGOgy
         rKOE/pa6N/1E1nBfohGH2CPe0z8aLKyLvkuHSGMhCRPhRhSHA1A3VN30SI2xP7BpESyr
         97/NrhvIQFZslbtglWUoUT2cCr85CSaxIR1AAaHpryV05P2IBwbXb7DNrUVJhDqwfKbO
         JQP7z4O8K8xSCwR1BAoBQj/ZHdh8YfusLgtOKpxHzp7oO9+hyUOwohC/uf6Rg/LMm6dv
         WUNmJFQTsWjmEJuLJigCQIZyO1x2MZh9FNxrd1juEX27o/4JbDkN0HZtH+FWbLWkDsEa
         mZxg==
X-Forwarded-Encrypted: i=1; AJvYcCWRX/ipWgoeKLtMBj6RbNKqda4ke2ZgApft1dUqbkyP6qNm05McZycBMrkGxUo5RApqhMVnVgVhrtVsxgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzqf4S1lG7Vcyz1N9IDO5lqVkHFWegEMELquont4FbetsE9uxR
	jwot1hFy2hW4LHlloTn0YmHUbQTp3nl1UGztwElhru1CDVIRM2jO
X-Gm-Gg: ASbGncu6AgyJhQTV0AJg9GrzTQsQPxSuRR7InZ7aNZPPID0vBPJjFveBxcqFH+RMuMY
	CN+x5hOnI2THMvKZPJN5CZmA6LImiXI1JmDKjj1b/yYCXl/JuKLM8kxuqGPwelVIUgZzaU+tsye
	7lQxW0kY3yTXmWkCPjQYswepRYJ2qI+V7qQEL2/hyhkg9KWRFNb+9Oi2jnfgnELCB/RdtwMf6W7
	oEcm/ImbhDxMVNEpXREVUpINuXVn9VfDD2o+UVpW0fvKhw1xwpZJgBbLJj9OG7YZV9J/0soto11
	s4hyzmSPJh2KbOjWiQu4U6nYiecWBRbWSN06H6r5iPXIQ6Yk1xcd
X-Google-Smtp-Source: AGHT+IHo07xACMd0WHyn+ptRHsMdpYfr3dNlaXuZOyQHE5V6GOegT0d8TzAAcTKr8eLDIZ9r9I1D+g==
X-Received: by 2002:a17:90b:3506:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-30a5aebf90emr3409932a91.22.1746273179808;
        Sat, 03 May 2025 04:52:59 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:59 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 15:52:33 +0400
Subject: [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the system
 config ID register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=3308;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dWBUq8bBWa8P3YO4Zzb1jAw2fF/9zbTcQ/3MFoyjWSY=;
 b=Q5zeXE1GVBmZ0NC9FYxAgrg1Xao74WTqZNc9cnSUgJsM2fbNVpTIj5Bl8X5WS2TKnACPtewKa
 GEXHPSCaL/gD4E/PzebzzVpV1d9mt6BAJ4itvI8evLLzqPRs8goRKj5
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

