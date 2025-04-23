Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF941E9915
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398403; cv=none; b=B1g7xNOeIZkVThHfRkGM4vdrBirgYyvOyzdOSp3Ofv9vbHVzcIN2rSFe7UaFGoHbd4jBGdJ+/v9BCaidBYOpvMH+BUHO8JwLtFbuZbYuQxHGk+D2KzxSeYsPcTci3o8yyF7Ky05isJY0BhLPfJIOr2UUMT4jFUnMXvQzP8TeyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398403; c=relaxed/simple;
	bh=plbpc31rVrOD0KMkWiMy9DSCysG2bPp4EWpOgbNVk+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O7ZrPRB5Uqkfd/Cs0WDe3jChrEXvP4Vc6UkM+f6LV3OfUUks8auEj9I3XIT+5YglkIkDp/rTUawxMVqBi1GFisLin1bszcqHyiG68CFduCQ0hkJ/W4fvMa6LDMW99Ww9chL3pBELHa6sUfxM+6FN0TNnns1sMbXRdEdaGiF3gLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=ewCvSt2H; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ewCvSt2H"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so4672669a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745398401; x=1746003201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=ewCvSt2HvDIyS5lDVc6vzN9u34M+s2cPVvmhImjb67c1Qs8YQneLmsIe2P7QI+W7k/
         Dtt+LoSJtn8u2CZAn9rDzt1/d1SH3kwUz2EmNjsLrv0fKLSe1uQtnjcvOKBsaAT9qJD5
         pgoEKq/yYaBBSQc8WxgAZl4Lt1XJakJ1ZT8SLxI2/K14Lg1B2VkqSrTLrm048wvSI2m3
         1VnXOaUDRjg7mnaAsZMoFLrEz7iQpAnCZ+k/8igg7iwgoX9pIMtFK6Jy4Mx5T1lvmr2n
         SwyCMH84po+WVX+k4p8Z0DTQcRvkj3byQxFqp15rugz2UYpsy5bk1IuCqn0qMTWvzTsE
         xcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398401; x=1746003201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=HxNZOJEUnCOqfv4gRaydazc1FoJKH45EtJllzJP3T+SOuuq7+eSU6HpTKY8RYDcVeg
         UyODJl768ZzCp3HdrXalbO9p6icXbOivFV7FP+nCCRhpU1oDmH6Zk/ArUjOpC91Fr11c
         Bhfn0RdlKl291vEfCGLgEEjpQ/TFuT4EmDccWXLd3SO/6gIlvxWOidDw3c5Tu4Gc/qW4
         FCuhKiJeei93Zc9gu7B4Dt355njQcLqB71Znw5eSSIHv/GCLzQp+F9PBe4TRY+TBC+DW
         DWU/8DRnqK60sxLozHN4hQVPt/7OHBWnsNJjCYQopD5BizjwUJ+SoaI6JLTfL7lpYuCE
         GlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIVNYDoqTlmbzyqPDFbkE9GSB0jEk9CSoDGbY5tzimx6o8rCLjEdCf/V3SqfgQnYG/MlpCvWtC00M5to=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyui0lJzQdmm825tIm7hLwdrIXg8FHTaEo8bZusQbmvCyzcLpuO
	rmwzNP4jgkt0HV3bq4a3NE1urw+EeFOdz4BbpbMnP64A7FpmBQMsezouIdRpA70=
X-Gm-Gg: ASbGncvR5hrK9nxjVgImdKYmBD7BBg7tB0KQ0+32vFVGKt304SSe5kTixCycQTRdLDe
	NMjDP4NGsp5qJbrjR1TIJTOgMijt4UsLuLaR94/U6UR7VMayZ5/0M2TZ7tuzHRuYSpNVjOxKMka
	CK1w5yFDMNHxevMRspU28ogOARtESmo2irhluaviEJBTAKhv2x1wBDxAFqafju/JeuMT0elksao
	UvKfyS9c348K9RxyyaOd46itGYBb7NLkyApLHptky2uVozuL6WgxDmLhgujR+FYXcEHmlOTmyWy
	xgGcMhp2eXYyKmD9OjQ+yNAeu/ZVADylLu5PvloQvOGYAL0V6WPw4eIcQEonsvF5UiiPX93Hdov
	n0w==
X-Google-Smtp-Source: AGHT+IHEKV/m10IrzT141uXdAo2R7TQilKbWToWRUKyb71DvBqH66dHmnRA2NqFUmClDybjkDOEreA==
X-Received: by 2002:a17:90b:1cc5:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-3087bb9f463mr21064712a91.26.1745398400742;
        Wed, 23 Apr 2025 01:53:20 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa5f880sm1047611a91.38.2025.04.23.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:53:20 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v13 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Wed, 23 Apr 2025 17:04:42 +0800
Message-Id: <20250423090446.294846-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423090446.294846-1-nylon.chen@sifive.com>
References: <20250423090446.294846-1-nylon.chen@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes the active-low properties of the PWM-controlled LEDs in
the HiFive Unmatched device tree.

The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf [0]
Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf [1]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..06731b8c7bc3 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -49,32 +49,28 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-d1 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d1";
 		};
 
 		led-d2 {
-			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 1 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d2";
 		};
 
 		led-d3 {
-			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 2 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d3";
 		};
 
 		led-d4 {
-			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 3 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d4";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 72b87b08ab44..03ce2cee4e97 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -51,8 +51,7 @@ led-controller-1 {
 		compatible = "pwm-leds";
 
 		led-d12 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -68,20 +67,17 @@ multi-led {
 			label = "d2";
 
 			led-red {
-				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 2 7812500 0>;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
-				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 1 7812500 0>;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
-				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 3 7812500 0>;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.34.1

