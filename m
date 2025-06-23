Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035E62C1585;
	Mon, 23 Jun 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695159; cv=none; b=LzicO2+gr8sYVekrfZqJtEDybxv5UVW+P43A7aOPozdgrUoBntG6OdZ6MdcDTALSzmR6KuPGWJVWZ0BbyuHhMUAPBmHRVT1h6EP3hbODYO/33OZ6CO+owOTZk6RNIFNe4DoiupWy/I+ddXVlI7agFOv3dkBIX1dw7/99IYWsx4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695159; c=relaxed/simple;
	bh=ek/Pv9ynWR/uXwPFyje24kNL9VDLBe+vnBxK8io6B0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nw/cfxZh4MuZL3Z2L4NIgeAEGXbvS5HCGyF72NVe0yauXMV2LqHZHdopUxJyNxfqDZVDerdc5LpUj+JCiQ7PBEWqdu1IfX/fZfXO5RDV6AX5eaTNV3QIjygihmsnH1ww2EUKVDAjSTO73J+ljJ3Act8DX+VpIIsBfYGg3lh+IHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9GwWID/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9GwWID/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e81d37a7so2723927b3a.1;
        Mon, 23 Jun 2025 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750695157; x=1751299957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZa735fH/TMPXiLLbcp+s5ZBvlVgx4jayqrOGdHzhjg=;
        b=D9GwWID/AHglehE+nkLOBFoKJnVtPjbJKAVLwfoqYBlFZpCO+c67ehKbeRUZkORqGE
         2F89+5NRw6hg5v07T8J9p8vYzDKTb4AeboYSfNbL4z9Slx9v0SX14dfw3necl9rtlVvq
         z9oZMaQS/DKaWcGcuWp9sdMkklL2QT0M6YBHn0Vcx5FwWGPcIq23TpOx9XsNPm1XY3QS
         KdXk1ympmeg7NgMijF2B1qlWHaSHnBuuZDtxf0NEIe3gani49533VYtDgOTbZGzr4Xfw
         h9s9NBUEuIH63SVjyAWj+LvOwAh3gnFnUjZVMdYoFVAw4WUw3nOn4IrQVxWBRhQKhZTQ
         MRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695157; x=1751299957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZa735fH/TMPXiLLbcp+s5ZBvlVgx4jayqrOGdHzhjg=;
        b=T3m95yIDWhucChRYxhJo4T/SLU1TR63G0U6Y8AuNsY1GElCF+HrFdOcUDgIh9WeoHw
         jsL7fmAmj4J1nxkHCYS6FfHC3sfy5ESZrappOxSTTTyaWHn/55tqQLdF7e8DUxuxMn4R
         E0qy8T1lLR7cMBucuqEK+y417XRxhPBj6y0SCHvrPTkoGqpO9v53nlP6TziKIY4QDBqG
         lrndacY2qK9QX/+el4WWTrwFeIvf/6gyWzCLXmdb6N0FdElQGopWAnDD7UMjXltLH5vQ
         y/DTy8UKn9qZpJUQaq9U/WpPkz2IP0Uu4tx33nu/Fu/xKCUZTaCmgBruP7tdN6kxIxUg
         oyTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQw/Uc6fAVNH36TxJUvEmFbhlRYR3Y6la12pvauYENtK/PAraKduzKXv2XYdMajx9x9GrsxGUt/VBtGuOs@vger.kernel.org, AJvYcCWtDjQN/oaugctyzvoX44walgBXy2iBslsHplqfZurP/Ks7FWrHUhtl+fJky0aXvftE5e88cf8xmXCH@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtW+wGB1KRPVmW18dYiIUuPfVwF1xnwTchthITSTx2+F75t6I
	PBC/XbmO7SfUctdQfCUfTTAmduyBSdBGA60G8wC2xsiNkSJlG1ZXP8AY
X-Gm-Gg: ASbGncsnSvnOmpdaynx9hjcFSwQqMg0XquhYho6IzdI5l0FFPr1g8IJgtqeuZP3rZk1
	cITTnmZC1EwjMH4JNqcZ168kajNKPkje0AW4w1XUtQ9pTjL6d5scg+fAc9UylgpR053anUVf4df
	eWn3RO8uSxJIndhOEWmJqZGurSPKdjnNOX4jrgEGy7FD4vwJ4bkU+K4gC5kmKomUmox4kBh7+Zs
	ycMsgHRozIr1/cH1+5VD5LgIQJ+uJs6zhgnLq6d5cDxM3kNGze/xF1dEKrng8SR8By7S5xZEIG2
	hfPFjGM5wV3n51b5tKXk1m/D8MGdZgfohGRjjWWVpibBeLkCCgwIoTPTPOlB9o49/WlcKTgkS1F
	uzPXHxsoJFzFEYMg=
X-Google-Smtp-Source: AGHT+IHbIPvjsHfg7Sb2eO5LgYj4ARuy56pLEb/egTFxA2oVO4ufvqtUM5hYA7WL45ggD7zMTd5CVg==
X-Received: by 2002:a05:6a21:4d8f:b0:21f:54e0:b09a with SMTP id adf61e73a8af0-22026e933dcmr21976430637.15.1750695157151;
        Mon, 23 Jun 2025 09:12:37 -0700 (PDT)
Received: from [10.22.1.180] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a467e6dsm9029608b3a.13.2025.06.23.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:12:36 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Mon, 23 Jun 2025 13:12:26 -0300
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p-j722s: Enable freq throttling
 on thermal alert
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250623-b4-verdin-am62p-cooling-device-v1-1-cc185ba5843d@toradex.com>
References: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
In-Reply-To: <20250623-b4-verdin-am62p-cooling-device-v1-0-cc185ba5843d@toradex.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable throttling down the CPU frequency when an alert temperature
threshold is reached before the critical temperature for shutdown.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 .../boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi              |  4 ++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  4 ++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
index c7486fb2a5b45cfa2bd7798eb4746ad2af8c390a..138b9c395be4bf7bd6c1941d752871af8cc9b1b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-thermal.dtsi
@@ -12,12 +12,29 @@ main0_thermal: main0-thermal {
 		thermal-sensors = <&wkup_vtm0 0>;
 
 		trips {
+			main0_alert: main0-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main0_crit: main0-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main0_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main1_thermal: main1-thermal {
@@ -26,12 +43,29 @@ main1_thermal: main1-thermal {
 		thermal-sensors = <&wkup_vtm0 1>;
 
 		trips {
+			main1_alert: main1-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main1_crit: main1-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main1_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 
 	main2_thermal: main2-thermal {
@@ -40,11 +74,28 @@ main2_thermal: main2-thermal {
 	       thermal-sensors = <&wkup_vtm0 2>;
 
 		trips {
+			main2_alert: main2-alert {
+				temperature = <115000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
 			main2_crit: main2-crit {
 				temperature = <125000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
 		};
+
+		cooling-maps {
+			map0 {
+				trip = <&main2_alert>;
+				cooling-device =
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
index 140587d02e88e9d391c41001643ec715d41bf262..202378d9d5cfdc8eced935117398bcf859088d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
@@ -49,6 +49,7 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +66,7 @@ cpu1: cpu@1 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -81,6 +83,7 @@ cpu2: cpu@2 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -97,6 +100,7 @@ cpu3: cpu@3 {
 			next-level-cache = <&l2_0>;
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
+			#cooling-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 14c6c6a332ef2f118e483744e97222865560e6ac..cdc8570e54b29d068aab4e2788a8b36dfa539cfa 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -56,6 +56,7 @@ cpu0: cpu@0 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 135 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -71,6 +72,7 @@ cpu1: cpu@1 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 136 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -86,6 +88,7 @@ cpu2: cpu@2 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 137 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,6 +104,7 @@ cpu3: cpu@3 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
 			clocks = <&k3_clks 138 0>;
+			#cooling-cells = <2>;
 		};
 	};
 

-- 
2.43.0

