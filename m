Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5651DED5B;
	Sat, 29 Mar 2025 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274761; cv=none; b=l7mdxWFbn9Up+t+WyxDGUl/i7INcHwsNdgHJi/K+0kHElaPOreLxkPlPs1RA5XBeXeqqBm8B5HCmu0cWWFcfCHj0RlQLWSnm8NVaM3PjXjOe/P0oRznBpvP6VUdU130xz5O6/TTCujRkJ1aAEs0Uhj2Sa5+GKM58Vit8PqGz4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274761; c=relaxed/simple;
	bh=9ogtg2rQlHBVrziL5abm5c5xx6O0O3dCFnj/IhQWcrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+0A+A7Up4UHnBinymCDgIM2ZX7N9H6wnAZzSPNvxxe7U/rCDVc6olUsOKtyzlwZb3jAIzRCFQPprn6h1+WGsVA5O2G0asCcwN4Tn4hVdUiWjYN5t6HENuti5gQczzmVCl3wIcn9W3NB0ZP3OCuIRgiNVbrnBgX/MwqcG6OZjO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=a0veOTbz; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a0veOTbz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25520a289so539017566b.3;
        Sat, 29 Mar 2025 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274758; x=1743879558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ush7CURThlYuZwLUlg+NY49Bwo1vYDShrEN3JXm0200=;
        b=a0veOTbz4WxaM1bM/BQICfx3F9Vc4socmX+M5Lv3dr9EgTbqWiG5gg8lfVN6EMLP4L
         sC4E1K1KPE/iFFLKkz6w65ojywybdC6DWqazVgRpVvZUeHbEqOqAK3L1ObWoGXLO6ouL
         YB9GWqQuw/gzjaybUKKawYb+uLJsYRTBFQkutaWRhNB5ZrOuVml81dyGSwx3YtjDhLTQ
         2T8xzjHOSpa0I8AZ3+pKYk9odyJLTqwqAcmjqZfELPq+zlgik3d5cKml3/Z731tTNJxH
         A6SKtc7QDAQEdjCqYget4kOiRrfBGug2xO5CmbxCILrPDJEx3EP8qDEbjadasLeXirey
         Y26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274758; x=1743879558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ush7CURThlYuZwLUlg+NY49Bwo1vYDShrEN3JXm0200=;
        b=qveDZwLQZFFd8djZR6dDspl+6hykXXEe+KP8lVFdTYjbCLea4Uq0/4UPKw+xvC74Vu
         AdUfaaYeEQUOog7p1BlXdlN3HVqwy4NcOqd58g9o0t12p6P1K2ZBRfndponaczkNqy1o
         krfnVFgn/aNgOHk/Kq+lPrIoFS+14ZP30CB3GHYdqK0DdVD/ZhjGzxYxeHvVoh2KbTmp
         ySafFNPNfg3YXSNbO6V1He/GbI1m9bcyGiw8GmRoeLuqnQh6r7POhk3c8yg671OBkhq/
         LP/QJEBR+czU+buYDEXyP50dDKaW7GZB+/EBJfHcJSiRs6P344hwjp3Nmp9fL1NBPZdS
         Q+0w==
X-Forwarded-Encrypted: i=1; AJvYcCV+QzyFVdIJsLYGwIiQLgmwkoVmsB4Z6nq9gj2rZk00yEoPQV2TT4WKFVd3v8whhxi6RVz9O2hJIvfR@vger.kernel.org, AJvYcCWkVk+xJOYqotP/hUhi6smfLsBsSi+KyDZXZrK9ErmTSVb7uisBnh+GBqglXYYyh2jopYDap9bBFM+Irfu5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeas8GP4aVHPOOM5qoj1Llxqg+me8lAStdQnrDmbrT6UN3Ikd7
	gdC85tUrjI+PyuEkPjy9j+6gUkTQ8wp9Je2GUMWCUBHHB6IL4lJeQvdIAQ==
X-Gm-Gg: ASbGncvW+hMuV5T7oFwfO57L/3HmBUlZe7KBZrMSGLfLzrNfwlrVTNMeDkRAO2442jZ
	dIU/3XcyH5OClyuZIaX2QTG2QAd2EJD6MWHx5U3SaeiTW/uNonF2iEcjg1aJSXMrLA2IYc9aAef
	VF1xyqCiqVpG7UNYPP/tMr7ZuYJrWpkK+4CVG3AGclKbOTgYQgnGaKhedF3yz0YJOpekOI0SskH
	QoZkJg+qgUtgfr09UK3QGjzQUn+wU2tmrqc/jehz+AUJzHPmjy5tKZ2ymY0hIXU9ffzm+doP0Z3
	xlf37MiS9KVkS5On0UPJz5ZjdgCkGJNMwoYoKudefL3ac4MG2hNK1eVPo7HkSMisXXrNkoxVskW
	wXYuAzKso4EzeBqJath34FjwXXYVyR0KuocaHy5UvtR2JyG3TQLAbGxjOyMcGo02F/qXhNFWuP2
	5M5eJT
X-Google-Smtp-Source: AGHT+IEXb3J1hhW+1cZ1cYh8Q+cmXWkp3blDzIk1DGjEmxuRwDiL3dqD3dHsbMWJI2zigPWKrKeiQw==
X-Received: by 2002:a17:907:9693:b0:abf:733f:5c42 with SMTP id a640c23a62f3a-ac73895f8b0mr304556366b.8.1743274757593;
        Sat, 29 Mar 2025 11:59:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:16 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/7] ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:49 +0100
Message-ID: <20250329185855.854186-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 847f7b1f1e96..7fe0c7d3ee6e 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -398,7 +398,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -567,7 +567,7 @@ mux {
 				groups = "uart_tx_a1",
 				       "uart_rx_a1";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0

