Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92774EED7;
	Sun, 22 Jun 2025 03:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750563777; cv=none; b=t7keBaME6YSDgDFzud+RSn7mkt+u0tUxHWMCbFwenJRN5KERc4VewdPcDiKEmIGGh7aNe9mm4ynQx10Q7eAXzu6bfJPqAu/pz8q2eVpPyE54zxF2Nhp15THhCuf+smRCh3NtQtFy27khcDSrkhXqNB1I5Dd5MesnNrUSMOf1SlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750563777; c=relaxed/simple;
	bh=HjVBTL34rvRjutnml6EYDYfk9467BjGj5hhYsottzmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIoIwTpfH6OAlQ+7Yn+8KuD6pDEiAPk82r+E7bmdNj71hcLjHMQlcGV5lZaOSJF2HhqNPpPcEX0L6hJK0uwQtDmpdLB6OYlpvpMmMmMijR8uMmN6+5E1Sbn3RsLslt7DjyANKl0W2dmt3BW81eVvbyOCQZdoZZi7pL4YwM/TxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEBxg8g0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEBxg8g0"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so3638593a12.2;
        Sat, 21 Jun 2025 20:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750563775; x=1751168575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACa23R2a+vWrpVNOMeXLchvOc5aLFqZI4f5KCyJMeas=;
        b=aEBxg8g0FzvrCVfIOYF5v6VivPlbKOnSN+tgZpocP3e2UdxH5Y5i7hwD9CXsIRNKB5
         JvxIE/YkYoebJu+CeaT31WTlAOacUC0aJtfo+wPdRu6CzSusL4hg53YFKAbqn1K2fFHd
         hp5ijLi2qv5dWmY0sTCAqTNlGn7PvUwSmEhvymY3mIYcQ79GUdX4QxLLbXVVHCu/GNMR
         ytbkBLorLesoMVU9EnGQk9dtuKReJjpzu7t3sRme20UypyyCpCWX7QfnxWUuwrRjtBV5
         pIHTdtwuq494Ucbam/C1+YSL69T5/m73BcOmvigdBvuxfPq5slxLBTcQstmxr83sx3pk
         8BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750563775; x=1751168575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACa23R2a+vWrpVNOMeXLchvOc5aLFqZI4f5KCyJMeas=;
        b=LxZxa4ZwPHE9rj6Tf8VUuUBjsPe7dq/e+z2wT6+etYRR/rLv+hy2L0+LuZ2JwdT67s
         iul7HlGli5rwTS8MQqnkTmbv1NrDnGUaqSb4pzr+J9+ILioyPVEuK2T2i3RBt3+VGDLf
         yYHzGFtIS/Ph3tddXTRM+LyDiNvhfwuU4kCUyIrzsZ5rud9s1MsKXEtHHTI2BAmmI3zN
         P1UL/Bj8OUqWoz9bUTdakEtDU5maxAzt12NHmous6XPzAF0Klb74/sJwjVwckyg0RORX
         8JG6yWd8aor9PFC3/kJNmDmjXWj7cpof78HhWHQm+eWU8Z7BDdIPjVArcTSMf1pGjmcQ
         IlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUzB9AYCyJaUGuadOnfcR31mfXEei/OE9wRn2Y92O0PctAWyLhW6i0qLw8ANvKyDf9Z/atGNa7YjCbL+4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfwoQiRl6z93GvQB0j45vfUQCBKOaWIqBJqzxpslYF9vP/rzg
	Q7vY5J5XzodaSx7Xh1pKxNSfLtcxLgZmSa5vVGEFxccZvSwC5yE16qnh
X-Gm-Gg: ASbGnctBUJkuSuQ1iGiBoRb4xxBf5jSXEGc7cG59RSJ4IsZmZOkpYvmUypmMVXuarTF
	u6OKPV0pL8Hx3bUyjaf1qKvQ70QGTWXDWOzbX2QdcqrXTjUhmcHgNLzfXDKxiGurnzcVcDTetKV
	T/0PCrzuZMSCrXNKMCw4FToe/1Apn3baOmVS2a/Bx95aioj7IrRJezfz/Sc+MoGkuyK7dMwUkIc
	zlwxrN+C8khIWZPqCDQy1p+Ncwc7VK6wVkQgBoDkFfEkeyIIs/972zjmNYxXY/IvaItxMc1n0+m
	ujSBAxImZHIvxSOJfhHL77u/Srf7btjnnow+GBhHxw5S94KMlJhqZQI7ZKDWYnq+TiB/e5MSy5y
	D96ibIRAjX1vSWs6l8dhk5hO8wHD547jEl7nmQKqb5CscTqnyx237Vyq0IgSXpbFQHdE28OLT1Q
	==
X-Google-Smtp-Source: AGHT+IEpj0VOlzI9r7mWn9sjy0q/1s9TFnZUb9JfOL27IcJREPBlXh9zEia6LgG2v+7itLsR3B9dEQ==
X-Received: by 2002:a17:90b:2703:b0:314:2a2e:9da9 with SMTP id 98e67ed59e1d1-3159d8d661fmr11658363a91.25.1750563774425;
        Sat, 21 Jun 2025 20:42:54 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a333a79sm8222291a91.45.2025.06.21.20.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:42:54 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH] ARM: dts: aspeed: bletchley: enable USB PD negotiation
Date: Sun, 22 Jun 2025 11:42:47 +0800
Message-ID: <20250622034247.3985727-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Enable USB Power Delivery with revision 2.0 for all sleds
- Configure dual power/data roles with sink preference

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 66 ++++++++++++-------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 5be0e8fd2633..ad0051825a32 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -398,10 +398,13 @@ sled1_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -484,10 +487,13 @@ sled2_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -570,10 +576,13 @@ sled3_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -656,10 +665,13 @@ sled4_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -742,10 +754,13 @@ sled5_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
@@ -828,10 +843,13 @@ sled6_fusb302: typec-portc@22 {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "source";
-			data-role = "host";
-			pd-disable;
-			typec-power-opmode = "default";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			try-power-role = "sink";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
 		};
 	};
 
-- 
2.43.0

