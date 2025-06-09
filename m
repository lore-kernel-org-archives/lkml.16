Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCF2206B5;
	Mon,  9 Jun 2025 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481206; cv=none; b=tTUJdiV9TC/8otuphmii+abvvcRhfnq4iTRV3q0ywgOwAD0c0a0sBhQpJZKVIRrR+n1CohtYGw8q69voEya+kaN+zNAAm3TpUB7m8OINp/FB6qIA7u/hw1u0rlfvmG3GhKP2A8AsSnNNYReOtzo03rqgXhEVYxdYUmziZhrlfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481206; c=relaxed/simple;
	bh=eRCFJ8dvOjeUHBlZsV7soqFq1C8e016G7WXxzwjB5sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLUgcXMnop85o5wxZb83dLy3bqDPlmM9TjkoKO+TsciW4d7uc8MDJPX7ac9tcdZTLgE9CkHsp8rDrHFbHsWA5RCMuC10uAGxWuz8Ccp4WDj2nHZG1SZ0wLUsCES2OgcsR0M5O4Hy13DYqQrB2zg0U86FdOsid/znqvdaRLM0tVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3pFtcJj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3pFtcJj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74800b81f1bso3327413b3a.1;
        Mon, 09 Jun 2025 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481205; x=1750086005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=h3pFtcJjl14u3EJ9nmLsEfaPHYlyhuT1p5HjdX8TkiXyo1KInTsnTlO7NiIXhojBoF
         6d/5fyi+3EqTDSUMocBq+nB3ozbUwL778l40lkDpHUAqpxJjZeJ2FIGQCczly4+pWrYr
         FZzvY0fkAg0nPzJJoYXFkqNIXMzj6BQ00ZdvYHJldx6oB6He1P4WFHLcKDmnW+MR26bn
         pR3xwSsekHDqPS78Z697h3gjY0OmqG5LalRUHEEof8f3N0RmyK/3Vk+hDRaGWRduqJUV
         hVBgjJ6hbxSSrdTYNV5lve76gfZryTI4XvRI7n3u1SQgXLle0GsRGQNl+8/+0cvLcafd
         Cf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481205; x=1750086005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=KxACr8gLWCS0SV2VjmYNuUKJZA8CXyJATvv6REQMXlEbOGG0rEuUEZFoJhF6wECqYL
         GuL1XlLLYpDENxswKqiK7Boi+8P2oJ8Aj7WGt89wKO4AKGmtDG7+gAE84lAgD0yhGHr7
         nkvAzN42/7+d9wvcJrLZJ6aTzhwuMhJzwW1HSVkj5/iifLAB3Q+F60hdFhskFP4qmf48
         zuv5vM/i8Q13NO8Wy0wRD0lrpIY3YGlZFtm4GURsfOYJ6LS0lb41Q/jVf/Pj9LINYkhE
         WtSAUEMe6mgHOpVFjbGhL23MoyGtmxuNsArglHZSr2Lqw7SILmQZiy1W3DmTX+r5TtVp
         GDOw==
X-Forwarded-Encrypted: i=1; AJvYcCUOypp9VgQA08Sj6ENO2mgc6tVFuL+RgM9AwQTn2MyZ/8RigO+KyTZd+XR9waQJ1zCXAhTM5KssoKKw@vger.kernel.org, AJvYcCUqrFN3x4cD6snRAOXOZAI8jh8viEIFxyWG8Y/EOTIIUtqg5F+PIfziAKWNUzeRB5H6dRYKS7ka1Jp4tcyK@vger.kernel.org
X-Gm-Message-State: AOJu0YzXukKodgIxh6Tk+3zpqhy6dreGbkIJDxNrWn7jvihlYmmIdJVq
	LrkMzQZZyeviVnQW6VEI3CEZG+0PKJseirwl6RRpUOFQeSAYL/F+6yZV
X-Gm-Gg: ASbGnctUztBGbP/+fd6azGMFONsC1TRLh8e/2x6t8uOGmbP6owln0jPvGsEcsF8BQrp
	NhBEMTiM/HCbLjUXa/20YAXhJRB/XH12rA9mV1dZJTG+snwvmYM62/4gibEXW+y0qCBHvLDufTY
	iTCzMUY6NQuMuCg787bRQpcMxOG2nNm6QTuYE7m2qDR9Z9b9LSs9a2PTSAH7+dd/bXolbz4T0Mb
	6h0Q9FOnQHQwgQmlFAx2FWYUhGC09Y59nyUjsbWBfwCIQmFadTLHStOcVtv6ZxPxH3rTlQnZw7H
	9tMIPZAUDcKExRcZz0k22AOMR5gqXcigfTGiiM2Qggw4F0P3BgZXLoIxzDxg5COn
X-Google-Smtp-Source: AGHT+IH+dUGtERHb0SkAjeq/UtecPsWqtL6oN8jrr+gftw/s1gpay7JsfqSU5olPdi8j+/+btNGsQg==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6732985637.14.1749481204905;
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:41 +0800
Subject: [PATCH 2/3] arm64: dts: apple: t8012: Add SPMI node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-2-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eRCFJ8dvOjeUHBlZsV7soqFq1C8e016G7WXxzwjB5sU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbsiqjS73g0fmtM9YceCfWNGbT+a21zFkYMs
 dMU+exBZz6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb27AAKCRABygi3psUI
 JPDcEACXAPeKbolXqg03eEru1TW7lWCQ6RPi4XUsGtQP3Qlrwq6TIxfHsjD/eNXSi85/dJM6UpE
 Ie7BDF8L4S6bVfsaZh8WLlGXe8/VpGEo0DK0aCdKUhg3yVYv5A+orpxheFgIEWS2cKs+/x4z4TR
 FSRtT1ovLmxeAoF6JJLPRnoUr6l7LTSHrkPQao9YztEv+yQ6ZoHwtamzhplHEVuFLvWMKiblQbx
 wLlDxQjEtcULk1pSUkfDIVaKWPmfoITGopUgumPwmEdZIO+5gNsuV1sKduLfjrs7wYGTePf1Ypo
 uyNu2ry41rRo10qw1rCAMoolpgbrYYXOAOnXEY3faGiHRy1/3WLv9WP1ZHV9uPmtmb85hPKN5DE
 hltsq9fErN+D7+nVrfXZst8JbNXfHkVTR78a5WP6wshssfqiorSS7tnkgKcoVSbsCtm7hpilhm2
 i7iLNLo2U+5IZX8K03KTf6NuACNl7ydxvBtZdgqOdyIA1UOn0Y5lm6bR5LZhPv9Pca5FPlw3yCF
 dDh58y1ejDI0tSzTE3weRFPT5CyjtQLbwV45+DoP7FNCOn6wLoNOk+PK3tM+pSTv300hdW7aMI6
 iv/PmhpmgtzkEZbwRE+X6DS1vffslZF5Qih3tdT2eeQ4yEDI9EDg6XnBex6jRJOy7T0E2fmzAmG
 5dJwu+lkn8Agqdg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..60e73a0401a80abd03f82d24845dfc12d8770ebf 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.49.0

