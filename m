Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A11207651;
	Mon,  3 Feb 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586921; cv=none; b=kyUFMSON9CMNqjPSR3mwaU0yyZUUbQJ+J63UUhIPnY+V4sT1lqJRe2ycHMytNdPGN990idSHyaxVDXmhozgyd2kJls5SM1f4jwz6exhnyUFIGEU/J2eoZSooyZCw11t4LazsFZaf9qXEssqNkWPsyhjOBk4TMJg6f8G1T5Ft4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586921; c=relaxed/simple;
	bh=M+WYmF0ge9bzhcaDLjDbvd7/acmmwqW/IaJZEhzdWFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6RDNc+bBE4vGvHGE00bhcu5Z+dnnueQY0dbXd652lNYg+igDiY4xMOt7BZigU8I1WY9nXh29BPS8/hsQSX6wD21dF+7hBemVehYBayJ+KHcYM4pdr/KkNx5mwQmtkB/dsDVfO3umNB/loN3ICwWDmZFMvs2CIQyNPQm9Umrvd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMOpz+6N; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMOpz+6N"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2165cb60719so75876005ad.0;
        Mon, 03 Feb 2025 04:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586919; x=1739191719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxMhVB4BuFZ5ApySWrQAxUEWGEe0HLRSWM8qzETXyfg=;
        b=JMOpz+6NQkxSWU9JqwmrebkFVtfVF7MEULAAEW0U1XYcgBBn1a//KDu2ZjC1QPxtbW
         qCyY3dWt1I5pV0VAlN10e0j3R0sZoI/IO7lIp1kGrmMSHihi0xoNbobwLr5+7n2nMAhv
         TYKR5075TvPipRIXW9Wui4kr5+7TI55VEeDEn0mzqFQtgTYTSLy/3gGV2ZF4to3ZNTNm
         lSL4rHm9ZRiLapYF8bC7ig490LKEk3AijHnlLjik3EOd9AUX1qNv9wDaDrtXrcDT9mal
         RyP0XiR2CkXdPWGYl2ogpxiEbX6ftQHiKBqmjJa0QmmSXZsaBTt5lTA4zWrNjwi4DbWv
         NypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586919; x=1739191719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxMhVB4BuFZ5ApySWrQAxUEWGEe0HLRSWM8qzETXyfg=;
        b=a8q4UNGo4or9KeqcGKnfWy6IqugvQPQ3mMtS8Q+jBjUQ6ioky0IIMbH248COMuMK86
         tWTQFxu6oGuTqZtmBcmEQ//Bu0hTTxIz0J7HLCYcW0tB1oeeiUWsRyQ64bMSrwN/R0sK
         j6CU0AC27Z+rVdYI7RflthPtTZRe3XCAkYehJii1FjueDQLniBv2Q11KYv2KElpDnVzY
         HD9wWiK58TNYf2L9rp3flZFZ/qZZvxMlFTX13GVs/RGHt6MAa7uy5vXI8J4rf5Fhw4bO
         XLbvCbAktyR0AnfafmHf5VQCB/f65TnMmgqOBdXj9w90Mq58NhoNKjdXYYQealhQVU5b
         b1xg==
X-Forwarded-Encrypted: i=1; AJvYcCWMAan6CXi2gT0uPk3C3IycMvdJcYONIXrta6uQlGetg/oBkfuVI+P/46dFZ0TeI0a1/W3PbprH+PKk@vger.kernel.org, AJvYcCWrQVHquSoGRBmVZDZlbgobw2rL6lCpLQXa+dCCKSslazzK4frltWXbqQIEh39JN4h62NxdMjsR+oXkWPgB@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEIWQ2uNV8cFjUtjhf9wqqCdS4j6K6DfgWrTJ68pxgjtPrjEG
	0fIQ0jc28+firsYYeO5idAKgINMDmREqom8EYxt7BXYIcnviIuhPnF9mjaU2
X-Gm-Gg: ASbGncvQ9wtEB0Mnk6hqybcQZU5vuP2gCxfV/uFEJS4rlN6uNB+6TdBRKDySKhaXmgU
	RhMcoeEv2bjqMhzFM96V9nJPsyWw97s7R2QP55AEdbAURHBmGU98llGZ0i+m5EON3O1le+fX3qG
	alYLi9RG4MTV3EE0hNEfz9xTLYr12l0jkuulTCQdsUcV8T2lOSsPwZ3B6WS6LUaRG4R0E9YWVYx
	VDBXb30+nG4bW/jKb0t909rTGgJsUEqIpUQdMgTOJY+s8OblR5vx6sfgXxD8faRY2qfq8jx7A4T
	PJHFoa957P5NvKJz
X-Google-Smtp-Source: AGHT+IG51KC16Wbu1ERa4z+u0QYHDh0bJ/mjT2XKV4JUnCIVovlm0uf2m3P6dBWpNe7Neb6QdRPlxw==
X-Received: by 2002:a05:6a00:9a6:b0:72f:c513:a5fc with SMTP id d2e1a72fcca58-72fd0c7c731mr32930105b3a.23.1738586919357;
        Mon, 03 Feb 2025 04:48:39 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:39 -0800 (PST)
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
Subject: [PATCH RESEND 2/9] arm64: dts: apple: t7000: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:41 +0800
Message-ID: <20250203124747.41541-3-towinchenmi@gmail.com>
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

Add cpufreq nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-6.dtsi     |  4 ++
 arch/arm64/boot/dts/apple/t7000-j42d.dts   |  4 ++
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi |  4 ++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 46 ++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
index f60ea4a4a387..0d08e2589449 100644
--- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
@@ -48,3 +48,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-j42d.dts b/arch/arm64/boot/dts/apple/t7000-j42d.dts
index 2231db6a739d..24fe5a99f3ab 100644
--- a/arch/arm64/boot/dts/apple/t7000-j42d.dts
+++ b/arch/arm64/boot/dts/apple/t7000-j42d.dts
@@ -29,3 +29,7 @@ framebuffer0: framebuffer@0 {
 &serial6 {
 	status = "okay";
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
index c64ddc402fda..773c69449902 100644
--- a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -49,3 +49,7 @@ switch-mute {
 		};
 	};
 };
+
+&typhoon_opp06 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index a7cc29e84c84..4105cf70391b 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
+			performance-domains = <&cpufreq>;
+			operating-points-v2 = <&typhoon_opp>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -41,11 +43,49 @@ cpu1: cpu@1 {
 			compatible = "apple,typhoon";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled in by loader */
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
+			clock-latency-ns = <50000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-level = <3>;
+			clock-latency-ns = <29000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <840000000>;
+			opp-level = <4>;
+			clock-latency-ns = <29000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-level = <5>;
+			clock-latency-ns = <36000>;
+		};
+		typhoon_opp06: opp06 {
+			opp-hz = /bits/ 64 <1392000000>;
+			opp-level = <6>;
+			clock-latency-ns = <42000>;
+			status = "disabled"; /* Not available on N102 */
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -53,6 +93,12 @@ soc {
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

