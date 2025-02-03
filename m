Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9664207DFD;
	Mon,  3 Feb 2025 12:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586928; cv=none; b=Xw3Da5M38JGvDq9OaKFnlqJAr8PGxEgfBzU1T9m9MzFDgykmZDy/A5q2Iu3wtyyTF9g0/yYQWThfqtrUxChi7FQwu+Bq32tuuhqtGvgmQidsrBWLLeS8HXtHEHTrSJyT6wGhLtfK7B2vhjoMxFdbwHYw4MXhYXKsabQJDasgj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586928; c=relaxed/simple;
	bh=/OXq3Zio4mXc4dUDr2Bq2h9ucUKYnTSScne/bn9s534=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgSBOQA6VMnPeN9/T5k3C6s7bf9mULs/YbER7o5YM3xEWQfVgYqMPxrgJ3KKwLpc5+2QGAbp54IiBvAHOQeY+3d9SdZ8yMPSUMz6NFYagfq8vqduHPqw6I0+D9OBoBQTOF8SRgE/JKz1aAMDlZIUE+vm9lT4vOf9ZAeDpK7n0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU1XO68Z; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU1XO68Z"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166360285dso69730085ad.1;
        Mon, 03 Feb 2025 04:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586925; x=1739191725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=TU1XO68ZhaF/UXO5USZEAn6HiC5zlZODmKCBl+xXrIcRCabt+gQ3JeCroSM5JzfK8r
         FD0gKlM2cVYj1fFiFxOY9rklQ5+As8bAyLZDbAwtASkQtVzjVcd2iyDjMd+vO6iZLH+b
         WQuu0RNuVwR8dahGiZQ4CsyJroo370+V4vP7Wr/2TENmcgeUVJuGjYL0TLzEC4QdqLGv
         bXZI8UZp//lGTlSAcfiMfdFrs197W3ldyUGEYUEm3Me96l8LLQju7U/g+CVDxvUyQQNh
         CGr0yu+8gOXclaTSxqcl5T8cYskj1F4k/rFfs98p23t76Qiq0qKuJJUIYrLiNkxHaPxI
         xOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586925; x=1739191725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pe3ZbblFRITfrVA5nsyP09ciBw9K7ZPZlBuPS3RmeY0=;
        b=jG/JU4eb4OYfAT4s9D3aIep/j/dEMshrV0VGmTw2cB+T+Fl2UX4W9KlltEdkRoGYoR
         pRFSfoROpYhOYXlUrLnWzdipBThcKexcUoSnlyUeabws9jUpC8nBOVmtSoKzbh6XJbvC
         7dkqmb2HdiP5hy61c9KmbLrVTGDPOBdrkiUCksFeQP5bkn922V3Ubsqle2NGdor+pqvW
         8prFl39G6CiXxEfAzL8CFsJP8m8aPln71hansTsi2D2upIeSV1TVcV495H/cKv7lW0Zl
         ux1BbD0jAFGgFvC5qnFYUMMCZF+Ulrb6NoGM6GtPUh3jHRv2ie1rbxj6Y09DNy7eI/JR
         tiow==
X-Forwarded-Encrypted: i=1; AJvYcCUZRr3mMuORV8pAteMNHG+kVcDLEzIYN/v9Ic1xfAoKzihHlJ6edCq9Mrtv4LO62u3km2kQRMyMtoLS@vger.kernel.org, AJvYcCWR5EUIVzf4UW9F2Dzu7KoUl47bQrCEhdE4K068b05injFfkUx+JJ62GTs7llCmUzxEzuCJfBrw0y4rXV9e@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZ10jXxZaVQ/WwhthA4CMfzrhM6p9voTZfzJZ/G5etQ9itMR5
	DjxAOS30G8chQ4i8emQHMpctcSQjHtCxAZ2CHwFeYtqF1fL3Imn0
X-Gm-Gg: ASbGnctISjesXO447Dcd7BHQmwqHxs2fkO8i83KEgVe+53WV4NQY1DqISPKxhSggQIF
	GuRDLAvUfxMsKkLR7Xe62/Dwz3azw5Nub4JqQlnQMHmKZBoO5Uu20D+v45R9L6DnG4ucB7zmhQe
	zRCdmS6/perZB5fOZCitHRYdGBxE+Fmg21G4993wuQ1y/wCZ0hbpHcL8ddFDoEeRIhJExVeDN5r
	QM0UjKaNAl4bGzXRLYG/VhqeSHsU2OJTXyEc4Q0n2GmJekAsvDIMZc4RuboaDP7Lg1EkC+h7vx9
	Wcmoiz0cgYVEWiC1
X-Google-Smtp-Source: AGHT+IE6PRgepwkrjqG2OmOZ+7qNJydgJxtUoZkQAYGjXgBZv3DVPV0sBMuXLvPIDiaVI0vvtHLMCg==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1ed7a63866cmr37247460637.19.1738586924881;
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:44 -0800 (PST)
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
Subject: [PATCH RESEND 4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
Date: Mon,  3 Feb 2025 20:43:43 +0800
Message-ID: <20250203124747.41541-5-towinchenmi@gmail.com>
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

Add cpufreq nodes for the two variants of Apple A9 SoC. The difference is
that S8000 is slower than S8003 in state transitions.

Change the copyright information in s8000.dtsi and s8003.dtsi as well
since these are now essentially new files with the original content now
being in s800-0-3.dtsi.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 10 +++++
 arch/arm64/boot/dts/apple/s8000.dtsi    | 53 ++++++++++++++++++++++++-
 arch/arm64/boot/dts/apple/s8003.dtsi    | 53 ++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 082e5b1733d0..382d7be3f8ce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -52,6 +56,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,s8000-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
diff --git a/arch/arm64/boot/dts/apple/s8000.dtsi b/arch/arm64/boot/dts/apple/s8000.dtsi
index c7e39abda7e1..72322f5677ab 100644
--- a/arch/arm64/boot/dts/apple/s8000.dtsi
+++ b/arch/arm64/boot/dts/apple/s8000.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Maui"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <650>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <75000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <27000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <45000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <58000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <58000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
diff --git a/arch/arm64/boot/dts/apple/s8003.dtsi b/arch/arm64/boot/dts/apple/s8003.dtsi
index 807e3452f8a7..79df5c783260 100644
--- a/arch/arm64/boot/dts/apple/s8003.dtsi
+++ b/arch/arm64/boot/dts/apple/s8003.dtsi
@@ -4,11 +4,62 @@
  *
  * Other names: H8P, "Malta"
  *
- * Copyright (c) 2022, Konrad Dybcio <konradybcio@kernel.org>
+ * Copyright (c) 2024, Nick Chan <towinchenmi@gmail.com>
  */
 
 #include "s800-0-3.dtsi"
 
+/ {
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <500>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <45000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <22000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-level = <4>;
+			clock-latency-ns = <25000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-level = <5>;
+			clock-latency-ns = <28000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <6>;
+			clock-latency-ns = <35000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <7>;
+			clock-latency-ns = <38000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <1844000000>;
+			opp-level = <8>;
+			clock-latency-ns = <38000>;
+			turbo-mode;
+		};
+#endif
+	};
+};
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
-- 
2.48.1

