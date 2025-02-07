Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1AE1F37C6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934907; cv=none; b=BzbCJ+5E9kTZJhR7ivwnCj5KkDfHBqqV1/m4HLLktJM9to7kD6eKqSu/PL3KzRFFGCZxJKzOaunm2DBkCv0D0ZUdMpmy2DVfx9OODl/ruZApjk/Ml1JMEjuTTAtA7bvMq9bav8+zOYsgaYkF+q/Oe+/04UfgUcZe9nu0zCZY5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934907; c=relaxed/simple;
	bh=ECqzfq7qoMuyq+r19JGd3UHmxyBzNK9DnZVYotYQS9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krvxZFYG04w4jTKNhtToL59vYiRMd1XAueDoVDyoN/0is9Ju5bEwnIxm3OqhFyMtT65apZZ3kJ2A2to+FTqS4ZimlDGa3CFauzWCwY6pX/WmdQSUNsje77m+cuXWXFQ8I2KCQYT5HA3tR6jzL3uWIGa4UNchLYeAQ7/367TVrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eSpItwe0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eSpItwe0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a39e4891so14133825e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 05:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738934904; x=1739539704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljes7wHzysMxiQ2RSq6rzU3Ys17WdodOahX8+S3+D3w=;
        b=eSpItwe09eAUKxzRKhb/GcB36ta32JjYHso7ePQnCOtqy9BUqygtda8eePxC9bXget
         lk0lwieuDLfXITfc3IPt/Njg1ywZY8LYOMOaBAGvaOS3ShYaIPYpCU+fLywaOb3crCJK
         /mePE0RuBCUfewVp8mxicik2o9OZfo7DfUj+8L2o/5yyvwVyisjIrH+wV6ICEdyg5G+2
         k6VvuziUyncnIQ5vI9esEk0/qhtS77OBaQW/jN/xYJaLrGb0/qaw8Dme9tkKGo0botHk
         NuUZIrv+EC4DDygeYoHrIfmLV4pinMCP2jQuIkhFWaxjMAy7EOwvdqtepAbnTeIiB7gf
         f3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934904; x=1739539704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljes7wHzysMxiQ2RSq6rzU3Ys17WdodOahX8+S3+D3w=;
        b=AJRKMxOe+f01STztg5PYHatSJ8BDJYjV3RI+Vn05OVPE8rZBVHXiGhe+lCd2QLOP+z
         cCQrYoEVQlK/RpR7v4oFPhKP9N/lTr61ypYGDeC7KZ9Uyg6GiqP5HIdQ38fgKmynGwmQ
         DEDHqX3irEjjbplfYyP18H9vpAhdsnE4nFIZk6wxlXHthn3GeyUcFO0tfu6qRAhn7Rg2
         0hB+rT9RILBKIa2PyrvmUQfKgmmRTDtBATnekFjg7ai/FXPuPfNCy+B4m70zayeJPjGW
         xtJ0lzSdA5cxewv0aWNSAZmaGDOsRMrVPbsLEuoCDRv4sI66B1LAAbdoLXY26PCUzhoL
         /u+g==
X-Forwarded-Encrypted: i=1; AJvYcCV2xwpk6KcY8JeUhD72V07blUhUa9cmn1QaZvj9gHHL38RXC27t23TFCOBXU4hCrNNQm9Oc3XvAA5KQlhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhqamuBRbAKn9sxHQ0vSsIncGzYAVZYFcQ1kSHuoCEnhNZves
	Hldl1grdyKmRaw83/EI4gYWYvBI7ybsl9kavCF28mpEMtfv8aDtjS7/LQmD130Y=
X-Gm-Gg: ASbGnctGgi1JQWoBrLO9VzEADFydp/iP7zaWGsHxM4O3r/M7Z4VNR2ozUd3FozeH2hb
	D8Dx1Q6GRlClPo97h+aH7OTPihNSpqhJrBFRDsgHTcPokLnkZ0V7P6htYg4x49lls8PrJIUtKNh
	xO/pkfsxQ8c2chpQP8XANw9m4Xf//vT8/UO8lRcXj5N5qFZ6yh4QFCnRW8OXeLxp8G3FteU9b3N
	UR+mtdxRIIXqfYEgGtB9g+g/06eAKv9xKC7TNNgiJkXKdVg09H58ppiRiT+/YfZW1ecD5fXP5OK
	SQTfG5V05jdpIiUsLDfOubsyKXOSNnljaIcv7OarjDN5tw4YCGLEKu9hotCUtdlfcpVhakgmZKN
	eGvNm/V59d9Q=
X-Google-Smtp-Source: AGHT+IGB4XJKYpEGae7tPR5GuQ2osyg0LoIfkHVlKh5g+8ClsDOeUgh83BithY47hmF8ctYqNIpOjw==
X-Received: by 2002:a05:600c:4e55:b0:434:a7f1:6545 with SMTP id 5b1f17b1804b1-439249c384fmr25835735e9.27.1738934903804;
        Fri, 07 Feb 2025 05:28:23 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6b89ef5sm2641562f8f.31.2025.02.07.05.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 05:28:23 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	conor@kernel.org,
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
Subject: [PATCH 2/2] ARM: dts: aspeed: sbp1: Align regulator node with Infineon ir38060
Date: Fri,  7 Feb 2025 18:58:04 +0530
Message-ID: <20250207132806.3113268-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250207132806.3113268-1-naresh.solanki@9elements.com>
References: <20250207132806.3113268-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMBus driver expects a regulator node, which was missing in the
board's device tree. This was corrected in the latest device binding
update for ir38060.yaml.

Update the board's DT binding accordingly to align with the fixed
device binding and ensure proper regulator support.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V2:
1. Update commit message
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

