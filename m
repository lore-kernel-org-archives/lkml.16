Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AE2080D3;
	Mon,  3 Feb 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586934; cv=none; b=CrZnUXrkFjQ/Tojdo4K7H9i7h3LhOwdz+StpmMiu1truu6i2qesRt+2IJ1NYQ1aqYMd2CdPxQEv9odrXVbxaNhHgbwAIAkwFMwh5yF9u7A7/A0QS18UQP6gQwDr3a6TbpOdtT/1G1drO69xwLkHxeguBw1nIwZWL34t8X/f4UJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586934; c=relaxed/simple;
	bh=ds0Jl3iw+VLntIg0GvIupnbswiEsCAWcMzpKzMkYSQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hh8DhsKgk5lKfLN3UpPEnRbq8b2OXX6VXf6lEfOUDzyLIA5lGciT66v3EJwnjpeg24yTV1mF3y2whpP71+DEBrZK5PJ+2V73wY8oY7Ep0rny11MHPnmQPRX2QqiWVCoVTWWK8KGCtGNonqKstHzJLSdfxNKV98Z0YNJj8HHIENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnLQcyjE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnLQcyjE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21631789fcdso69058735ad.1;
        Mon, 03 Feb 2025 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586930; x=1739191730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=GnLQcyjEODf+jvnpr2be2bap9cXrlvghIieQpc0TK6YhBjFWsuNg30tSuQG3xHMxlo
         5Ozzq8d87BizfyFi1xmawUuhlbxuMbA8Koca42Q23d70wz/Y1EHuf8S7vtl9lqj/GMC6
         6EHoDjx2X9wzfKh7JHhTYgFs8gqEnbqKpb5V+5Cur65MHljxStcld6KZHYXMz6S3bUgo
         xS+tRo4XCQDyWSMxYmqb8TTZtoJkA/6NFPdxlAd68af4gYu/V7ng0OoubuD0MsQkRD7B
         ZlAtLSo5/2XJ0efiPXZ8DBHkbJHPRVOZ9XZB3TCkaGYaOIG80danw8WYQ0LsrPYbb8Ze
         AElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586930; x=1739191730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=OoWpt2h7EbbxvIW9FGMZKYJbKu2U5XaVBLsSw5zyWRgOdquhTR8PdRrpQQM3f9qnFt
         fudGczahPSBTsDf9RV+8pOOVmh1jMe4RkoZsf2nywRJE9L95roK8fxhZhpzGfOl1oYfJ
         j8p5XYoCQT5TI1msW0+t3D1EoX6ZbC5eHLS/7tMPj14BnpEzWw4QqAYtxIQA1GZyzaNw
         HaAp2AJKLVRghT4X+IvjTw9OZjQR6tAXVmIbHbyZRRwjtmEk6FCH+o6fm/l4402Tfj/r
         z0Y3VUSMIdpWSTBXha9q5c3ZQfbl2S9oFVHdXPoLnYXJFlXtRARj4R+fr2fkZONlvAQe
         ms6g==
X-Forwarded-Encrypted: i=1; AJvYcCXmoOHlVD5i5WIZFcccS3IyRAwL9WPw+3sgTASSIRDxsaZbXJvKBG0QDOB9mp0Pa+OwWUorBx2PpIcJ@vger.kernel.org, AJvYcCXsAZ63pvf4yis9H6fbcvrZtOSnUoYmfx4FugyeyrxhgogGijEbBnx0d9IT9hPiOxK+ShFMoIY1gNoKx/qf@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSPzdPNcaVpPlm5A6+8PMe2wV3pl6q/VZ9Hk0g/X/mk3YOs9k
	nhRp0gERKbV+Pnydepg/W2X61LI39rCK97WB6tREFcG89XdAULpK
X-Gm-Gg: ASbGncvgRRSbRwDloUI4k6KKmwwjUhfKm/oqhxsWARwLiQ3YmBS0yDi9TzDrJvbIOm6
	xSFvbqEr+1AfnySQTXCScSE1znpDzvpL3v8Z6X1yJvt9aVkYejko7mj4qNqKe0ETRUk0yo70MOJ
	5IcQH3k7/VB8szF5DjQYUFDyAtOt6GQNeyPhODi4xHCkOzJ79X7yvDUEkAqc32DBjUGVsb4ip3O
	hETEV+DuLtmGidela6AVoWJorBx6ceohrTWsUMAjFU8mfe1hsTHFQMxyr2VrzRK7A6bY1ifEUCb
	GQuSviSgPEvqP4n0
X-Google-Smtp-Source: AGHT+IG2gJDQV9ByXKH3jCoAUfKcG9AffDalAhNUFxq2O5PchU6Ikr4yuxy3gHVej9DOE0y0Nn8ySA==
X-Received: by 2002:a05:6a20:12d2:b0:1ed:d35e:b6d7 with SMTP id adf61e73a8af0-1edd35eb796mr845104637.5.1738586930412;
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
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
Subject: [PATCH RESEND 6/9] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:45 +0800
Message-ID: <20250203124747.41541-7-towinchenmi@gmail.com>
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
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |  8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |  8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi       | 86 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
index 1332fd73f50f..919e067ef073 100644
--- a/arch/arm64/boot/dts/apple/t8010-7.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -41,3 +41,11 @@ switch-mute {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
index 81696c6e302c..4ea8cf12e430 100644
--- a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -42,3 +42,11 @@ button-volup {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index e3d6a8354103..2547e8c60cad 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,89 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
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
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <13000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <18000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <31000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <37000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <39500>;
+		};
+		hurricane_opp09: opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <46000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+		hurricane_opp10: opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <56000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		hurricane_opp11: opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <56000>;
+			turbo-mode;
+			status = "disabled"; /* Not available on N112 */
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +132,12 @@ soc {
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

