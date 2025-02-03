Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62295204F84;
	Mon,  3 Feb 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586929; cv=none; b=RxPvv3WTj3Is9HmMkEIapXXj70+khHU3FKBTvQZvVY4D3XuWmpt+sT+W+E+y3SyB56GW3gIx39I5HpH50nQXuYwh08h6oA3ixzbcZXolwO1Mck2xtzh3NYS7uMMwar0zlZoOOPhY/HxlIoGyYAuwirU6hxy6zRX2deVj8/mT80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586929; c=relaxed/simple;
	bh=B7mtf1DJcpu8B9/+6aUJjchV9QT2GOr7ITKAc6bZZAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwLYW0EVeaejl8+3sQAwxPoyFMDOIdlIIXW0/m1bg5Gt96RWz56Qt2G1h0uMc55JwIRa/eKN8ZqENBf4LvRBF42p6UlzJPFJuH4TcmOjhpJa586kOS/5tqdeUR5PbkWvntaX7cb/8Wh3AkzBS2pcokpWnt2840fBRUKIHSotVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnYjveBN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnYjveBN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163b0c09afso72772155ad.0;
        Mon, 03 Feb 2025 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586928; x=1739191728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=AnYjveBNz7U0xrJrDERoDbjMG5gXYFxUvyPc/oo1wUsm5UewcvpslCCV1pjwReaS7K
         W8Q+4zTm+E6a4843WM54KJBXheb09CXTlyYkd6e/sNfbMJDR5Bf2zd1TNrU0DhkISMZF
         g5P6OsFvw+fucGjOwXWwccL4jkFjM0tE1uVzUzkgnFo2ep9QZkDcvAP2BFVerrpox2X9
         Cl1VxipTa3xGB8S4oqg1zSdvP0sW2WOnhSRN4r8MlupEO+C+IGq4S3komwKOvi7Rw3RP
         mkQPTWMVZL/2WksEaMEcymw2a4Pc+nfkByJu8XOxJarnP+yKL6zpvadxYa6ItixJbe98
         C60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586928; x=1739191728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm1vaCLADXIw6mjVBCZqzL8tPcYfqeyXVx72+uvDa1M=;
        b=evw6LgkH//WKXHpo0/pJWNdbbop4EcAHc0ycl8Bu52/lZKgYrJs8Q/hmF9LXmCcEqX
         t9J8ZtLWn7lFOc25KXls5sj4qHHlXDqgQuWd1TauZljY3XA9PQUHBg8GWqVECEXPZYd/
         7QYg4hWXlzhCYMxFLkFI8KbeuuWR8xi1V8x+CKF6blbsH3egkjVBTGgShTgBJyUZ8U+U
         b0qaVtaRyP2z9T+uEv/yYEJAGDqmovxjet8H/RDL+jaGTgO7zm08kcKWDAZ/Awwj7RMW
         b1mFat+ZOVmcfFhSMkcm57lOWWbt+NLmtaCJdaQpFPg/efrbCmWMo2W5KRtoXZZbEV0W
         RCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz8ZVOkM2pnMmy6sjzAll2F/4x6G6+dcQ1hS9kZ/lyKhdGdbLYz1l2bp9akl1ms1eO6oWbLwuC3gO3+fBo@vger.kernel.org, AJvYcCXg8/wPI9fq+3RiWzNawbpAW2QHRtsddrziR83y/ayzCAE+OCW8pqiz4SOU6bHc6VK6aMr4ii9WGM4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvLpVD8hj/F7FNcVRMdMCgva8pXCGzS1U0kJ3zwbuffqKGqLt
	LSoeXim2RSu9MCCu4lRzX6Uk3Qfemouqs0JV5ReXo6zBadpSuQ45
X-Gm-Gg: ASbGncslF2Gc09Eo7izUnii6sahHJ79GViECbCEudLDcMsbZLBwg43dv9zECceW0SxF
	RiqnQuN9fjJnb7gT+I8xUpdmTRhl0R4v/sEKrbPqiKLH64EE0npjVTQ4nRFth1/kgM69vearQ6/
	Jb+MxEdbtcfe5+IjHaaQaObw0KgZK4eVBoirMQSoT6KOGfz8Gm/xd/0cp46vUS4VbDk+4oQDejR
	jX1dXiYSAdIKRVkJRerySHeLBWAAzRRQey2JBqk6IwUmGab2VfJagaJgp/YaptlrcvN+6RHCOHI
	iEwgEJBwGlwxIT7s
X-Google-Smtp-Source: AGHT+IE97aEIk8J5W1tlC12SvmYrsDcjP5pgG5OzlyrxMufGM7t3dgewYKr55GaKek+1e4q6nn56sw==
X-Received: by 2002:a05:6a21:4cc5:b0:1ea:f941:8da0 with SMTP id adf61e73a8af0-1ed7a640c2cmr37123084637.24.1738586927673;
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:47 -0800 (PST)
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
Subject: [PATCH RESEND 5/9] arm64: dts: apple: s8001: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:44 +0800
Message-ID: <20250203124747.41541-6-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index 23ee3238844d..7f7cb8afd3d3 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,twister";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,62 @@ cpu1: cpu@1 {
 			compatible = "apple,twister";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			operating-points-v2 = <&twister_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	twister_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		opp01 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-level = <1>;
+			clock-latency-ns = <800>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <396000000>;
+			opp-level = <2>;
+			clock-latency-ns = <53000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <792000000>;
+			opp-level = <3>;
+			clock-latency-ns = <18000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1080000000>;
+			opp-level = <4>;
+			clock-latency-ns = <21000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-level = <5>;
+			clock-latency-ns = <25000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-level = <6>;
+			clock-latency-ns = <33000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <7>;
+			clock-latency-ns = <45000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp08 {
+			opp-hz = /bits/ 64 <2160000000>;
+			opp-level = <8>;
+			clock-latency-ns = <45000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +105,12 @@ soc {
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
-- 
2.48.1

