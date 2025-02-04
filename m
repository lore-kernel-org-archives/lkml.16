Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0659216E10
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692206; cv=none; b=ojAALPeqgtvLwu6/Xg3mRezKls9x+fg9/xE3rdq084MamJS5+IDSIYJ/3frdO44hnVblP1k6kbNQ0Wzh3wkSgmCY6DmcTxkfkbK7ZSaGGOhCqisCtFAAYyuryQr7YHBoua7ipRaZFbvCy7pzgTnzvG74aCd7R4KPtMA9nmGQ1+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692206; c=relaxed/simple;
	bh=JbI8qWmAllX5oHCpQAUC6iMO0saJniF4+yrto1JGymY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRqjMchiqhMll1KydaXuQi18REbVRz2R6kCDUSvvfhNAb+n5UUPb81wypTKkqe2mdV+l8oSNVIN8kjDBnzXyi+DUsycte7dx7/3snqBWBe25xCilB58WtrMC6TNjmtVkmfpKQKj9dQAxPVaocRTEx0iHvh83vLLX5/3k94nqE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=cm8e/gBh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="cm8e/gBh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38be3bfb045so29370f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738692202; x=1739297002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W7/uVh1SHBueJ7TDZhlHeiCdQneN4JhcxgrJWh5ZZA=;
        b=cm8e/gBhLwSAx2l/wlbrbQ5O0vxAjipVDv4lpZ0PQhNGJynmw5UKuSW9HteIOhn3Oi
         tI9RSjZX9FZZLAqRBKCdRizTw8VHTBYf+fxOQodsayuee1OgLLQlHLtdQEuqpfuQb4js
         gJjPoZb0egxGIjfIzjQI4wIvMOM+AG3+NHYjl9gwnOitBhVEOM3X8AgFSBAhhRqOB1Cz
         oo0s9+bnQ37Rx7yEpO2HCQnVUO0H/jVB3/zHLl2L5FSe2ibDe2RZrU11IZPBYahguMKJ
         pGipCq/u5W3UUngF1EFhXV196O6HAyg0XDkdg+B0DNvgxYR/t5CczFbhpfK4T2F/1yOO
         /Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692202; x=1739297002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W7/uVh1SHBueJ7TDZhlHeiCdQneN4JhcxgrJWh5ZZA=;
        b=G2t/Pfu9xS+HqhXEEp1f4CHKfetv1SOIIrYiWuQCGQjNigLFnqdFraHT+FROZ/eoVb
         VCZZIukbMErnPM1fl7CwMWdCmfZ9HZQuQ4ZO/UKOZkOBzQ+w9TYvNOZ5aOhJXHdFbYas
         gcdBOeqlzS9e1+b9d/HF754/1q+GtvDp6LHDMbY8GjxTSr2wfiDGpO83DaQucvEM5g7q
         KvT/oB1XiswX2OGrMugkMWOvSsIlqw3hz8K8iId/OQkAc+tZ3MxM1IEfxj+SrSoa7y1b
         ICAvvQvlTP2RESU0aWCb7ZgXPdqAMU93kx59spOpsxDyqLUXKZACEN358wb7tSGmQlfx
         zZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVb7LElhaiEHk6fa/5Uo86WoyOxbQq2Ll9agvuWSCm/T4QgHcHcQUZWAYAoTYJp18d59GnBel9tiddW08g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NLMLEeUDjKfSbx2/kRGXmQ5yCBZrSSO9rsGkwkegSq1rDKM+
	K5+taaQFSANYbLvuQKaFssl3PZvxAFCnn6QOfay71KlPjbV4OtQcy7rZvO6nV/o=
X-Gm-Gg: ASbGnctlRVLv/qL/zdQxtBnJ9HXrW1saR/lwCt2k9u20MZBp9f5R6+jC0OG1Whu9qvn
	XFFvaxPRsrZopTde0Uiimd3roZwjCpyS2tq7H9YDef4/fE0Mq5Ihpvsk/pLo6skE6/5bLKmeBnL
	tz9sYiMQw3yGPpu2Y4o0YszTx22x94Z1Jndk7uXNBxfOO9GeU46gQYyaBYp8uWnDmXPQlMr4AQi
	D9SX6O7aIFRnM2np+dVgxSC0Xa2xldy/UPvOFfkUMGom3TtqEdqZ2fewc3b2IAyKqDECMOIH5Ar
	P27uZYGqETbI4sSwKIqQUyTGGE2fA0oKcjFjL6BNUtlC7Sfzsw7ii1MgkM8bHEN6b0oLIH0yjcT
	fp6Om/Fv1K3A=
X-Google-Smtp-Source: AGHT+IE/qY9aAKQmWdzpYQlP9HqBpbBqhuFIYDUB8Q8Ee1l43WimZvBDhx75rwg4/X6t6kRWcupvFw==
X-Received: by 2002:a05:6000:4013:b0:38a:88ac:ee69 with SMTP id ffacd0b85a97d-38da53ab53dmr3527394f8f.13.1738692201956;
        Tue, 04 Feb 2025 10:03:21 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm202687235e9.28.2025.02.04.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:03:21 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: sbp1: Update for ir38640
Date: Tue,  4 Feb 2025 23:33:04 +0530
Message-ID: <20250204180306.2755444-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250204180306.2755444-1-naresh.solanki@9elements.com>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update node to align with infineon,ir38060.yaml

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 124 +++++++++++-------
 1 file changed, 80 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
index 8d98be3d5f2e..34f3d773a775 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
@@ -1838,13 +1838,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic2: ir38263-pvcore-nic2@40 {
+			ir38263_pvcore_nic2: ir38263-pvcore-nic2@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic2";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic2: vout {
+						regulator-name = "pvcore_nic2";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1853,13 +1857,17 @@ i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic1: ir38263-pvcore-nic1@40 {
+			ir38263_pvcore_nic1: ir38263-pvcore-nic1@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic1";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic1: vout {
+						regulator-name = "pvcore_nic1";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1874,13 +1882,17 @@ i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p3v3_nic: ir38263-p3v3-nic@40 {
+			ir38263_p3v3_nic: ir38263-p3v3-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p3v3_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p3v3_nic: vout {
+						regulator-name = "p3v3_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1889,13 +1901,17 @@ i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v2_nic: ir38263-p1v2-nic@40 {
+			ir38263_p1v2_nic: ir38263-p1v2-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v2_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v2_nic: vout {
+						regulator-name = "p1v2_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1904,13 +1920,17 @@ i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_nic: ir38263-p1v8-nic@40 {
+			ir38263_p1v8_nic: ir38263-p1v8-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_nic: vout {
+						regulator-name = "p1v8_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 	};
@@ -2070,13 +2090,17 @@ i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
+			ir38263_p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v05_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v05_pch_aux: vout {
+						regulator-name = "p1v05_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -2085,13 +2109,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
+			ir38060_p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
 				compatible = "infineon,ir38060";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_pch_aux: vout {
+						regulator-name = "p1v8_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -3596,34 +3624,42 @@ i2c@1 {
 		reg = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p5v_aux: ir38263-p5v-aux@40 {
+		ir38263_p5v_aux: ir38263-p5v-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			regulator-name = "p5v_aux";
-			regulator-enable-ramp-delay = <2000>;
-			vin-supply = <&p12v>;
-			vbus-supply = <&p3v3_bmc_aux>;
-			regulator-always-on;
-			regulator-boot-on;
+			regulators {
+				p5v_aux: vout {
+					regulator-name = "p5v_aux";
+					regulator-enable-ramp-delay = <2000>;
+					vin-supply = <&p12v>;
+					vbus-supply = <&p3v3_bmc_aux>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
 		};
 	};
 	i2c@2 {
 		reg = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p3v3_aux: ir38263-p3v3-aux@40 {
+		ir38263_p3v3_aux: ir38263-p3v3-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			vin-supply = <&p12v>;
-			regulator-name = "p3v3_aux";
-			/*
-			 * 2msec for regulator + 18msec for board capacitance
-			 * Note: Every IC has a PTC which slowly charges the bypass
-			 * cap.
-			 */
-			regulator-enable-ramp-delay = <200000>;
+			regulators {
+				p3v3_aux: vout {
+					regulator-name = "p3v3_aux";
+					/*
+					 * 2msec for regulator + 18msec for board capacitance
+					 * Note: Every IC has a PTC which slowly charges the bypass
+					 * cap.
+					 */
+					vin-supply = <&p12v>;
+					regulator-enable-ramp-delay = <200000>;
+				};
+			};
 		};
 	};
 	i2c@3 {
-- 
2.42.0

