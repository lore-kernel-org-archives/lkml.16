Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D628B207A2C;
	Mon,  3 Feb 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586924; cv=none; b=X1KQNxZQIgzvl9jrNflC7O5yPA0gCDttRF/VMRqfuCKB57qOnIYurPSvoBR/x4Eby+iwFUhBhPl1+AHCv5gzRgzzTPSTDmFVlyBitrk0sEqVRCMogTxfS3SHCuDb2RIwPvHEXLzbrlw4Wzxb4yA+veQYwIcVJdPy8N4Uct+RgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586924; c=relaxed/simple;
	bh=BfdYE5U+mq8SIRFJsmi72bmG3EBJqq9TjsS2hQB32cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1qV0wTTsyNT40L/9qNoyBdGQq4eafmUuhvTgvu1OKQczZpRsTBaZOJK9rj48sE0XfUQZsnt2BQ4mIAMf3udvgsiUE3MaJtpHGkpvQOKL1XJjUnJ7eWeqfo7ejKIgC/VhCm9W6LxsEowAYGDVqSNuGECT46X3Q3MYISjp1IKXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXQ4Dvic; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXQ4Dvic"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2161eb94cceso50751225ad.2;
        Mon, 03 Feb 2025 04:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586922; x=1739191722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LkP12Dy2J2B7t0xjl9+9JD7vtd93pwtcrc12+hgZoc=;
        b=aXQ4DvicWehoOKZIII4qpR8goDyiCJmHZloKnubYHR0V0wdMj/RLnT54RY07ddT80M
         cACrBsvPPrcS0aaceur0Yrm2kXO1B0lAV1WI7/SR7TusK43rXj3xQ85m1lkLHOLRJsfg
         iXJ4/UFZrHZoKOSZPr6+RyZrbv6+Mh6qO/m5PWU/BQtNjhLitDGG/0jr8gCj+I1if08Q
         tEPgl1O/YYT+mz5irv50nRPNmKa03DUJsRkX4j9c+OU3eV4MMb8BCPbm6yk5+hzq190H
         LyMxu2wftpjMLL1X3GaM4YHTJEnwh7xsWpgy8UY+kPYRcu3/i6bpI5XgDLGeri7I1vO0
         jMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586922; x=1739191722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LkP12Dy2J2B7t0xjl9+9JD7vtd93pwtcrc12+hgZoc=;
        b=RAMEXldzpkv4zrIOcmNmfMzFa2ETkN2R+55S5stF/qeA0FA48QF+xh35ezKPx26Au3
         ThB62M8kdzGep17d7AvH0xS7HRrlT/J2OeIJb7DW6DwceUbOmwgf/kJ6kBmtgoWl4rZX
         Vq5bIUMtmz1YiDZpgCZ1TsxyCqIcaAm8v3JeqKZS4LwZ3Sjssplqfg6LijEvJCHzCiCX
         TNnwrEco41kV0DqmMsV1yTlqpYfW+CC3K6sJJKs8DGXU5OVxfdQJp1COdV9IdaCU7Mxd
         STLHjdQvx5Z7hsn81+72fDDlVPMK1Ljb2Owr7Ubaqb8Xf8bYc01V/drCrLbuCSQXZcEy
         A7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGArqGpfpRASEAR5fcz3myYA/rd7DlQnULBR/4UPwTaMuPgil172Ai2EmsX0XOpe8rNGSNZ9ZOae1/@vger.kernel.org, AJvYcCWylbz0TN6YBSDHobwmYuk59AxNRXytssol1eGTSbLv5tUWM5VSrkl1ByJpBZ7qhBiuU3FGMx4gryXNLuJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfVYpju2tazspfkQJ6Y357RpXOxO6NYb0Me9P7oJx8mSP1sRO
	NfdOocyLdzS97zOYGbiYSE0pA6H3bqcN4BpJaap+0ih2GBTYaToRZxtuG4MC
X-Gm-Gg: ASbGnctuWqSWx5M7viJqd1olxkVZ5GWLxv5U/sWIII7CzVGkqXfbAxwG1tVxSb3yEC1
	L2RhB/UYrovSNVkA4GEfwWvYpOJlCFctFrDpqWu1/y07YVf8lgMtbBIvjUJwNAlv2EkcBGX1YYi
	MOOF8zgsM6m9ACS1DW/w3YVTdY5mCRk7Txi1kDu6pNCOV7Yy5dabF65Mec5UJ8QkXFfmhSSY0gQ
	i7+5w08HIbt936oIMgNC/MxM3XVqkm/UNWSd6ZswYzARx1rzG2ucxA0CzpKLPhFggHzne5/lchc
	81H27l4IYNmgh1QU
X-Google-Smtp-Source: AGHT+IGbtAfT5l94kOHzzGOxTNJFkUHwyUD0cdCtuhNKa/qwE630Sx/u+J6An+CM+1rznyqoo3fjCw==
X-Received: by 2002:a17:902:d510:b0:216:2af7:a2a3 with SMTP id d9443c01a7336-21dd7e5a6f0mr368751385ad.53.1738586922124;
        Mon, 03 Feb 2025 04:48:42 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:41 -0800 (PST)
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
Subject: [PATCH RESEND 3/9] arm64: dts: apple: t7001: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:42 +0800
Message-ID: <20250203124747.41541-4-towinchenmi@gmail.com>
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

Add the cpufreq nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 52 ++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a76e034c85e3..15fd91d12f30 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -35,6 +35,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -43,6 +45,8 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -51,11 +55,53 @@ cpu2: cpu@2 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x2>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	typhoon_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <300>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <31000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <32000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <32000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <37000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <7>;
+			clock-latency-ns = <41000>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -63,6 +109,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202220000 {
+			compatible = "apple,t7000-cluster-cpufreq", "apple,s5l8960x-cluster-cpufreq";
+			reg = <0x2 0x02220000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.48.1

