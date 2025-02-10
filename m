Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAE1C4A2D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179888; cv=none; b=qWiOle+a4cLcz2ddau43yJgggsv8GWkQ/7kJCwRpTjX88WT6GsKvovkpp4Lmu3IOzRJWIsR+fyq9H5Sl/faOj5h4rg0/2WDmbqbD4/qiCzI0QaoO7Nh/wp4ae0a1p9ojOHizBEur+52uC7l3P0K8oQQUpmkdcFZcjoZ+b+xk2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179888; c=relaxed/simple;
	bh=hIAoZiq9l99J+1+RdYlSegHtO/xvyX/yoDYrDKGZXSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BScfM7PM46S1Bx0RP810YVAVPD5LSiq2OlwmEIM9gqN42y7eMReJoPu1HeuEhx0EgF9vdfjQ9Q64TbttjqO0JNk6r10JNNGNMGjjHHmmc4rXRva7UpGVeh3BEqN9IaDAKRksuN30Y+S41YoKRHrvbaMkK2lfsy4wka9iY6BBGiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1SMO389; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1SMO389"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-308edbc368cso7669281fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179885; x=1739784685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucIIiCS0ueGRQyU8ONCC0RQdQE11PYRCusiobKkbAOI=;
        b=X1SMO389qAyDDBbk206JSguIdSN73RLqroEoILI7T9hJ8lqIvvsVKjnDQLi48zNr9U
         a26QhN9v+G3z1pIv0174ugM47hVekui5epGJjIu0MFtGnqMZkIPunnNT8D7+H/JhtCuH
         KPlFWhkHz8H1ZjGL/9usWNt0z9jLHc7AUKC4ws0HflGgdBOm2bP9fZoTzB2SM25t89Js
         86m4S6uLPP4PYiEnC96o+n4BMXlgHCiIsR/kk92qadL1XLw1zrU4culUQe8DepK0tG14
         n7GYo1YdS49XkCTJMeXLt9yb4LXE0azXATbrXqa/ql/uHz8MoXFHnMLuoQxZhNlPFkU8
         c61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179885; x=1739784685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucIIiCS0ueGRQyU8ONCC0RQdQE11PYRCusiobKkbAOI=;
        b=S7UST2y3oPo72VUryMzfP3iQR/5JceqUO3MhRKX2e4Lk7wpKhhBa7mHosPS4A3FUXj
         gAfW7lJrjhzEfjAqW9HAdY2kLVwLxAwgIffTTqRZYZYwA+tmrGBjJLFTfHGJNWm0/mSQ
         tN9/u0/bYK+3fsR3WwxCn4YXMAXeWounnZzW2bZlLSgAWzfDBOq7L2xcFCWExySYXQmI
         nju9PT2ML7wZtiUa3FUUTd2VU6DIzrr7ktLeCMgk1a8C77Z1+/m9880EVvxCpvM1RU+i
         7PtWJSpHN7g13Ad3RBJRk7B2oGXuRYN/vntPk1Sd0zUhJp3lBWEUkk2nSdaQ/QYx3RbU
         F50A==
X-Forwarded-Encrypted: i=1; AJvYcCU3ae2I4tgr6dCbX6jwHJbLC833NsQd6ZhPMKzEfofhnv9QEikhVYOfYeug2oVlDgpcyAAF+B4ZODvRGNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZSmxwBTfJuRPiRYwXIHStJ9KIzK9QRkUv0jp8k9bzsW4Puq2
	/CM93frKTzVTPmRA4rLrONoC5wAHMFbhNKfYCF6KDmFCUzAYvGz7X9xQMLJ2uuQ=
X-Gm-Gg: ASbGncu47YyQXITubuSl/VwMT860vfZgTRS6v4uIBtTTuK6RrLBEemsYQo3uIK6RQkF
	nHE/xKF0edYFqK993Q4oymzQk/qySvXxqg/X2zbieqJmZAWdZv6ounVvCRzkOOUG/0O8OGSfhTX
	NNA7vpbaSVNs1vKwMCZM24Jc/5enTgyiaGFNzRTJmoweYP9lQUd9p9ZB3Zviovep+s6rtaK8qav
	T+6WOFGr8JuSIEUqbS3tr+5QhO/S1iEkM8KPULgAq1dc8lEMO1zqijLH14RICvqk3CW+GGrmdKP
	V2UWPsejZHAANVuGgo2WKq+lHg==
X-Google-Smtp-Source: AGHT+IFtvwueQ7c+e3PaLKf98HVOX1kUVt+8R0wzkEbCYyYeWULHWatmu5uSjWQeTxr/KOcvLpBuRA==
X-Received: by 2002:a2e:be89:0:b0:302:3356:7c55 with SMTP id 38308e7fff4ca-307e58002e2mr35606591fa.10.1739179885076;
        Mon, 10 Feb 2025 01:31:25 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:17 +0100
Subject: [PATCH 3/3] ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-3-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

This adds GPIO LED indicators, the reset GPIO RESET
button on the Netgear WG302 v1 to the device tree.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
index af7b6a976d3dd61f3c6846c73b8788437dea20e3..a351a97d257ead984a3ee05a8a0e50714ad7fb43 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts
@@ -8,6 +8,7 @@
 
 #include "intel-ixp42x.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Netgear WG302 v1";
@@ -32,6 +33,35 @@ aliases {
 		serial0 = &uart1;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		test_led: led-test {
+			color = <LED_COLOR_ID_AMBER>;
+			function = "test";
+			gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		wlan_led: led-wlan {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			linux,default-trigger = "phy0tx";
+		};
+	};
+
+	gpio_keys {
+		/* RESET is on GPIO13 which can't fire interrupts */
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		button-reset {
+			linux,code = <KEY_RESTART>;
+			label = "reset";
+			gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	soc {
 		bus@c4000000 {
 			flash@0,0 {

-- 
2.48.1

