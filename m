Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A45B2080F1;
	Mon,  3 Feb 2025 12:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586936; cv=none; b=lhfs5UjfTFwJFVU1gvihmsEZdPhXwTCJdjbACYisfI8BeXjxWKY55kt19xSUG4Q8H5SXcOsMdJL2/qviKJJGqQtV8AynEp72ClUL8fkgAFzYRsqMvk39gHF9AUdMP5EaXXImYtuq9tWk0gs6FZ4XyLdCUXdL39rpIes+8mhVjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586936; c=relaxed/simple;
	bh=iNsrx+A3S3Bq893uN45njkoolynKBqKNdOF8toIAJlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=du/20X/6eSvdsWt5dlxpmK01y9/xkew+IZ9jhkvTy9FtUdqViw4PpdQxxMDPagRCQoJnhQNP3bWpnv1StAbqE/QUHS5XLqBDUwe+xNnrbVjy85Jlr+a3hgQtRuFVz+Nd3PzQwHfYsdgGEpOuI3NgiLVwkziyMZjVj7yax3STvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcEBAhqY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcEBAhqY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21c2f1b610dso99035935ad.0;
        Mon, 03 Feb 2025 04:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586933; x=1739191733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=XcEBAhqY6+fmD5pHsbvh4Iv21ygK6D6bIdVqjX2zv0uXDEq0huWERHTy/jzgu0V3Xh
         2YgpYSsSaC59ZxrOD8I5Q/FRN5T4D0yAvSATv5CbIIklnAZIfx3O9ISbGUlfJET8fxbb
         rXFRcBkwjPD4s3d17WUPcMnfvpNVtXIo7CR5l9fnEeZQAPyYoR0H+v0garEJ95vgzaQP
         lUzFD/o3AO1G7j4rNqCoEpOiUn/fb+CflNkaszvNCBk0Zy9vLj0DGlAgxBXfGnTj5hZH
         yuf8HLep4FTGcTNAAPeTCXNcBWMFYkmRr7NOhhthDrELgA8SAS9sjg3zE/sXgdSgZ4Jh
         yt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586933; x=1739191733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJUClOvadSj6QX58oHurrlBpkJQ7IYPBO0FnNkQK6nA=;
        b=OWD3yuTxz4nG36uAKtoV9c8wINHxArx/UmhdURbaBjkZMbA5fzCmG2vX+a/6HbpOR7
         S+l5MZ1xPLFS9lAx8e+8FqIl7Eq1nWAhcmnpkSkXSqlpbooShtvlDbSxmfDn33IUCVfw
         B5uQortcdlBzJ1ItXeCDTnY5WdjqnEuaK41lWqi8WE1pQRAS0e0jSX66Bp6X6U6pNkPr
         IArLmvfc8MegjKUpFFgjXqstmxBtEVlCzJrj8+29o4vgyDYkCC0AnZ7tiVYVPSjegbyJ
         mc77oMm4mfpt2Db1yjlx0j7kUzpM3H6UrmYL3fJEoH7kR66BbxpVT4tBY4l/8qFLv4EO
         XIUA==
X-Forwarded-Encrypted: i=1; AJvYcCWptKlxc0TVGmbo2eSmEzVQjsjle3bxFHIwpR7hWmMQVRATEdTH0gRkRUmbWH2YsO+HVv2gvJq1emSr@vger.kernel.org, AJvYcCXJfuN82elnolCwZrmu2AKVm0BVKy9NOdLlgD1Z9Pi+S2OSjX93kWxO4oQl649KgeujxXQZz5v0x259mV6W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3oT7stx0AqCRiV42McBbo/ofeItk7iDntP98W6L5GjwfQFh7t
	+RaTL04Zj++8lfHzKuRfhGT78ThMc6r/gF/1cg8cuNj3M2vK6PEu
X-Gm-Gg: ASbGncsOIHLotTKRMVz1lBVaGDZKcenArcIBTfIxUoWAHNOWVwUp9wuNAtsMRRYSKO9
	8aixNIt/riNTiDW9zxGFlOlL7n5tAxZMKtfIBvdKdQ09JqNLNxHgPpdFkzrXQYmRvHe8EYM+xgS
	4b4QjP/F/AQjXmW9W6KLEm5pYFpw/M/FL/AUMdMrCDHzeQA+IJxrMEfMrb2CmMA8tUz4xnVS/sN
	1duYgwtVfixs7jxVASXsnhPzX+RoVBJEnR7O9eNvpxV/v4H41B7mSXCG4NBhZZrDLklYcivY+dX
	jdz86E2ROB1LkWcP
X-Google-Smtp-Source: AGHT+IHLS6dbll/fZOAVWOMkLyYlVa8KGHl3l8e4OXqDcFOAKzegus2Ld1uPVya/4zL+Xr1xYMnk0g==
X-Received: by 2002:a05:6a21:6d88:b0:1e1:ac4f:d322 with SMTP id adf61e73a8af0-1ed7a5f947dmr39422757637.14.1738586933175;
        Mon, 03 Feb 2025 04:48:53 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:52 -0800 (PST)
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
Subject: [PATCH RESEND 7/9] arm64: dts: apple: t8011: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:46 +0800
Message-ID: <20250203124747.41541-8-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 6c4ed9dc4a50..3a3d5b615a6a 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,6 +42,8 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -48,11 +52,80 @@ cpu2: cpu@2 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	fusion_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * Apple Fusion Architecture: Hardwired big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <12000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <135000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <448000000>; /* 768 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <105000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <662000000>; /* 1152 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <115000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <804000000>;
+			opp-level = <5>;
+			clock-latency-ns = <122000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1140000000>;
+			opp-level = <6>;
+			clock-latency-ns = <120000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1548000000>;
+			opp-level = <7>;
+			clock-latency-ns = <125000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1956000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <2316000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp10 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-level = <10>;
+			clock-latency-ns = <140000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -60,6 +133,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.48.1

