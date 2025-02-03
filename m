Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D15208979;
	Mon,  3 Feb 2025 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586939; cv=none; b=CTYv7yf6P6pJeII8KvK8BLj8R+CSNJZtZxWvja+2o0RECq1PavV1cXY0aUjydI2zb+1aO7fCb29nS6q0BgX/eFegpPvLyFACvxCzB8WgehvFOE5/nilThHe/PYAidnMsClJRQsxVK2dZwsO+zP1GcahCsDgdPvhTyS+q8o+oJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586939; c=relaxed/simple;
	bh=44Osy0QmejpeuUA9QXxvCqoyb5AYDEoNzdgE+VJZQb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWp8+InR2TjOx4BNh+2j/NGL/AVmd0OTpHGFyWFuUUnEzi4rHI9ZLC5iDUOtZBUCu43zNQAs6EomVh3NcP533vLKlFeKBUoeRy6wz3obEzLh/gImqpLFSyGUWajkSNsaZPNpq5kNc0OUyOGkdza5nvGnHEwTgzcSobEn8JRE3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqkLuSzN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqkLuSzN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166360285dso69733295ad.1;
        Mon, 03 Feb 2025 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586936; x=1739191736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lIMfLDS7ciYVJaacV/5/yNLSo2GoGCnILtlvH/Xs18=;
        b=fqkLuSzNFfo8Ku+9NWXqEz1c3tQu/F1SUbfTTGUs3C/dqMjqgqgRDIRKr0/x2xqk5e
         r9if4gC5TPAXnKiEgoXcsvZwEWlJmXb/AQcoVc6UunLMKJbcx9uORBUEI0kHhPfCorYU
         JMvDNmZsImlIHFdFy7qrjmxzkzcMqxfuhECxyNPkd6WxzO9qgYsbrtpMa61YGWkl/6ux
         50DZ4KpKVGTdePSmI9dO03y8+3ifYN5UkQTBlxj1ni9UZvv9GGrbNpe5uV+JXVjWaigt
         LAyN0VfaMXHqcnm94K5r2WivzrTUO7d43ThhLXHch1zUncy6LKQL5lfI9D1XEbCdNOQr
         3VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586936; x=1739191736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lIMfLDS7ciYVJaacV/5/yNLSo2GoGCnILtlvH/Xs18=;
        b=rUDh3f7iyjuuhMGe8y5+Ch0mdq/awtrb/eLBc/uqQO4jOGv7cPGf5A2r6upelH9tAc
         8m+ev81a9ZiG+PGc7yOCnAyC5S//S/MXbga0uhCwcQgKtWerVKW7FseH2ICaLhK6uEky
         qmiSagfDAd4OiiR36NwS4rkE6HcovnEXnfwP2nUMSBU2ZgRIHS6CtCXUE3FggdHeO/uG
         jvM6sG9glqimXRc2rW0oEOGKIYDJgftu/m7uN4SAuE55lkgTK7XrF/pn26Ie3dqf7Qdj
         kse5Z6s73/H8PPfKI3KYIdkAIZNoolGnUs4QIWAC0lsIUbQ1x6WxWm8Qn0fcBhB7e3bl
         ULkw==
X-Forwarded-Encrypted: i=1; AJvYcCUq8qYLb2NZ4Sime67GgdCjRFCJh1St1mjl0HUGHQMsIqjuHAglzHEJodLwXYEQ96+PC88202CkLm8R@vger.kernel.org, AJvYcCV8pzl/T03G6l8q9jS/sV1pjT7B76OCALtQ+kZln97dSDdTLmm9kfNqZsnNTkx5zMlzUG6yLKTPOzUv2vN4@vger.kernel.org
X-Gm-Message-State: AOJu0YywA9uULTq+evCXxVyeR+IQgGJ6gyy/JGCek7iRlZA5+vNaZ6Dk
	tRdeyrYLjW+K4pZbU85IiTQIoz5k6f5f48hO/rNK0X8z09yz0z0c
X-Gm-Gg: ASbGncvtB9SbTjAcHYaDsUT8ANrNeKtyttQMlquU4Rj0MU19G/2m9AxPLQvCrS//Tyc
	GngYe2gs+mRlgtC5Kgy2ShpWDYPgIe+6ACCovS5AiMradXJR4J1cJT6RLn14SVA/Ju7y3S5zbNq
	5GtOz176ay39uZ6l54ggHxNL970+pUOMMPpL2yFrgj3UJ/G4FKmNWJYIlKvykAfRo4d6JrjFrbQ
	hgfchqVfrlPE6cXS7QC8ntBPFNBJSYOU4Vwa5kMPPKL1geL5Y2xYlkJicI0Gcj25Ohi8qY/JiQe
	ZZE1E/3AeT/jtwBH
X-Google-Smtp-Source: AGHT+IE5O/mt84A13nB307MWJ2yfB1DTRAXfmTvFWwSh6qD7FLx3uNUv+6iuiz/FJYYQN/49HMcc7Q==
X-Received: by 2002:a05:6a00:3a19:b0:727:d55e:4bee with SMTP id d2e1a72fcca58-72fd0bcdb7fmr27092002b3a.1.1738586935972;
        Mon, 03 Feb 2025 04:48:55 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:55 -0800 (PST)
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
Subject: [PATCH RESEND 8/9] arm64: dts: apple: t8012: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:47 +0800
Message-ID: <20250203124747.41541-9-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/t8012.dtsi | 83 ++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 45d24ca091b0..0a3d5a6bd047 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@10000 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10000>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,86 @@ cpu1: cpu@10001 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x10001>;
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
+		 * Apple Fusion Architecture: Hardware big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 * Only one type of core can be active at a given time.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <11000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <140000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <110000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <130000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <130000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <130000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <130000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <135000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <140000>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <150000>;
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <150000>;
+			turbo-mode;
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +129,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a600000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a600000 0x0 0x4000>;
-- 
2.48.1

