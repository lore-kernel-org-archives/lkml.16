Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8FD204C0C;
	Mon,  3 Feb 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586919; cv=none; b=oVzzej3pUudLu2ZW9daK6hjzkYJ8xTxPMSOiNqbRDfGhxK3ZkHdLuMxrLhOVwPP5YKisHcxPz/WboUX7u9By77WsHoAzmpjy+yhCQan+booTmas92R1JOb7nPSPrL+sxv6o8jsgDN95KSHRJW//kPpXddLvScjzpIXwcx0quuoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586919; c=relaxed/simple;
	bh=b5a7UBfm663gGgi+WEHqwl5zzCYQ62VmKeNGLDej6FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWJC25C8M62pNOcy8Yu8EHLFIYmBS0niFPgrWSu3Zb49UKiWSDDwPeDsbaEMSyxOgeTHBspfSLgmmes5p38jHYaYCbrQXoar0heJiwtLV43pRXji16JqjW2Bo+mFu3IyVWyheCXvq3YDC1HzWdAI7DTGkmzc30VTNjjxJnNWqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4Q9FKH5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4Q9FKH5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163b0c09afso72768225ad.0;
        Mon, 03 Feb 2025 04:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586916; x=1739191716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYOobTdeVvBQEcklmUZtQ/nTyy5cKNm1JGVJ6HGQd8s=;
        b=F4Q9FKH5n/i+1dCxggRKIG0TQSbApLKhjtHqszjrz+Y0uBUd9D9PLskZav/yTBBorT
         dW6DDH5nMXqUL4dbc+tWeTI6Sgq0PqWBQ2TSOWXR5dayjCQIDPRMCAD4C/DGvCJihxKB
         diGbLNkWck90DFHCkXsZZukbVVA9T5PaSJXc8zB28pPrwOYVKrsme+bqNiepa3kBPkav
         4RS8gyTMAGOF7zAv8tb2CV8bQhZSVFtrtyATYnOZwf+0Bv6hStskn+0zg0BYdB65+SeB
         t65KVRSCqHK2pEhGcfWep5pCYxDYaAroHMPj96L97Znby4O8KUwj9xsVJ9PDJidmSN5p
         JzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586916; x=1739191716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYOobTdeVvBQEcklmUZtQ/nTyy5cKNm1JGVJ6HGQd8s=;
        b=BZ7jjKQr62qXSIaV7Agt42iISfbx5fx1E8x6WFAO6taA5Gu+CQD3ibfzI/IRFASMqT
         SqJgAPHZGE4XZOJBJf0L2ZKzu7ViDqLXuNG3XCec2DJPmgUGei2pItgZQD9Nj/t4Nqw/
         fdwqrV/xS/k9ki5nfjni64aVmnn77mPjP0nHU0iD7QgSBIhesmMlgYpzJWMGf4Im600V
         CwsvZE4Us23V0l+59njcGaS91h9tpVD43l9GYyjjYkjTFSghm6sNkLHBhw1jmw6H9QEB
         5SUYOlGWzcaaByshFheewXfL3UaGeY2rzUZLSjN3hpH+mAc+b8osNrnX91ZKqMMpFEH2
         7q0A==
X-Forwarded-Encrypted: i=1; AJvYcCUmW6Yp2wcoemaVSxBgWuRWzGRtUfvLBDfq0mk1FwUQ0nyFjmAz3pfR378dFCp1oBMruwbNZe7TE1Mi@vger.kernel.org, AJvYcCWM3BQXV+CfaW8EE6NjsDTTmV+NEl5Dfkf+POzLSScqJsDqeu4v9EarQ4ZUo4jhfNwo13BjCeWZq/Yoi876@vger.kernel.org
X-Gm-Message-State: AOJu0YwcCtPyHaskcL1JM2yAE2WhYhR7l5TYKf6xcepN0f/j04gW/5zY
	blNV++v+/4+dPS2df83xWNqX31oXSfJ+4WJGZP4Fm1XP5KA/ci3HaNtHq4fr
X-Gm-Gg: ASbGncuJHVsihxNoxJ2DlyxXaGapZS8Koob7IgDgYIwFwi0Xx7ifllKONv1CDinqbw9
	rG1byMIiC5Pq8O2qg1BWIu0NFNUucll4CZ/bzd8WX9cH1Omy03QSgb+dHTP49nm7fXVZs+BFWm7
	0NYRuDQ8kv1KmDEaarO+cVEcaDLa08vGSpgvQlRZrVo2S2swGps88qSfDsmH69UYg3B1f53m4EJ
	3J5S2R8ViubePwBiyHGLLfvrL80vOygPE6oZ4ZAeWsG9OT5nlDZldDAVwsaO9QQCHs5jtu+jZTN
	bydkQLCWLZ/zup1J
X-Google-Smtp-Source: AGHT+IHNxiz6QozzdjMZnbxINSYc1bgjbCbDWy4u2OcKc7sDsAQ2D/vBYRoNRl5irV8KJMRowGeBUw==
X-Received: by 2002:a05:6a20:748c:b0:1ea:e81c:60fa with SMTP id adf61e73a8af0-1ed7a638a2dmr35595806637.20.1738586916570;
        Mon, 03 Feb 2025 04:48:36 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:36 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:40 +0800
Message-ID: <20250203124747.41541-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cpufreq nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   | 45 +++++++++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 10 +++++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   | 45 +++++++++++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index 0b16adf07f79..83c0a4deb5ba 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
index 741c5a9f21dd..d88894e0fce7 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8965x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
index b27ef5680626..261b5008a6b4 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
@@ -8,6 +8,7 @@
 
 #include "s5l8960x.dtsi"
 #include "s5l8960x-common.dtsi"
+#include "s5l8960x-opp.dtsi"
 #include <dt-bindings/input/input.h>
 
 / {
diff --git a/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
new file mode 100644
index 000000000000..e4d568c4a119
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8960X "A7" SoC, Up to 1296 MHz
+ *
+ * target-type: N51, N53, J85, J86. J87, J85m, J86m, J87m
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <15500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <43000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <26000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <30000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <39500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45500>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 0218ecac1d83..449c69d0d92f 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,6 +43,8 @@ cpu1: cpu@1 {
 			compatible = "apple,cyclone";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&cyclone_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -53,6 +57,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0a0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0a0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
new file mode 100644
index 000000000000..d34dae74a90c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Operating points for Apple S5L8965X "A7" Rev A SoC, Up to 1392 MHz
+ *
+ * target-type: J71, J72, J73
+ *
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
+ */
+
+/ {
+	cyclone_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <10000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <3>;
+			clock-latency-ns = <30000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <4>;
+			clock-latency-ns = <39500>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-level = <5>;
+			clock-latency-ns = <45500>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <46500>;
+		};
+	};
+};
-- 
2.48.1

