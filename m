Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC4279330
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783697; cv=none; b=lMlocwD+rI6P7pyKb9h2+FLaNDwzGGa+g14bAIpR1UFdQpU06qGeU1Sxv9rjfNCF20fJG8rwvJC9Fgqvop57LpRb7CvKs1lCjJC6i2z3dUeS32KivV+A8LCkAQ0UJ/nq1IkpKxakNRTEQSSGIMdykckv6u40ncdpgBcRYunE9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783697; c=relaxed/simple;
	bh=plbpc31rVrOD0KMkWiMy9DSCysG2bPp4EWpOgbNVk+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bMupkwtSyY1uLqdJPvaQ4gx3ZTh4udXEzktWz9ee28HutzfuQtMUlq45EwDORRM199vQm0WCSEj4hxaKG7l6vmm7lCUdTAsKFT3Gu+28qAzvoOt16HgruJ8x6ZldHUHF+L3GzAzhocG9KJJfT9K5H3ZdtZrDNeYiBNZqqBmO4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=P3b6Lxal; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P3b6Lxal"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e6a088e16so14629315ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783695; x=1747388495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=P3b6Lxal12gJVlPgV30LrHtHHKxGSI2qlZmaCjf7FwEHT1OMF5rXySPhf6j4flADkE
         7R9X2gWmOWN2OwNXTuErJWMFenx1BpukNZH3vfkxikf1T6s8/UpaQgddI45UQlyTAhJv
         ZOeMfaodPWyxcrvcSornFVqQoYvWIY3xwSpkWTB28zPRG5PQLjJRm7Fzgl894IhlEBbd
         AxoNX62oECDFtzrLUJUKnHtSx06ezCLANDq+SSN/Tg2XHhzdN+gaIARgSmY3UF3DfnIN
         +rMs5QyKvdYP1JrxZBbK7MsjmKGfzds2xRpJoXVr6jblAA5589wCsnivXNAe5jHtNU3C
         uJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783695; x=1747388495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3iCEA8tjYiThU7Rin4dKsTFv6XsSOzMIb0/FuGpw2E=;
        b=EUDKilOz2IB2+FUK3RdYMIrLUvsGDHWbXvEzqNYwrM5NSuclDWG9tf0nMW5t6JMOn3
         y0xg7Gu8dzBOSEtlkWHQC1rDlQu6cqCCqQrN0PE69luXQ0sCXOf+FvI3ta/92MnYDUki
         V+U0oHcFYFC6LGIIedC8pN9dCM/tX9VDDmOV5dvZXC2poFY18OgCM1XyjMFTLXNtox1W
         BGEipSz2doggJ7MzQKN/ff4cT87doqFjGE/kWL+4ZTmqwxOsZD88Xhxz5H6rWlsY/mo9
         y/YDpWvBrRv62covoiCpCcVMSL8nS1QfD5qbKhbsq/SLUnDKPDZFvjbRPNd4GMDaWYMp
         QXJw==
X-Forwarded-Encrypted: i=1; AJvYcCWGHajtP5/3thql5n/9R1q29I7A+u54wfgFXs2dguDXs6xD5uja2i17TY6oC9wCOkRBQ6i6ET0heeOfnlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYO95A83qedKfvqGHXNV9CyUmCIg+3xVIANuu3pR5NlIsgPlJq
	6sFDlXiFkabMetBAUp0GyJ7iR23gL3iU2E11exnW7Nv7bZNdo7YWPV0BG9WS2B/hrb3HST7yUES
	WU6VKCA==
X-Gm-Gg: ASbGnctAQwAbrS3jpIeq8OJTocQO51A8043gQhyaQIQbTY13bxlXqogAODdkanmIT3q
	HmgjuIk5oQef2eVAXhSiW5Fy8lZTsVdQK1InRtLkZCRnBJZG8UjCr5Z4PhheYsf72+6idt6qicM
	SseZoz4IUhPYeVOXU7v6C+desYFIIxySGGUp+BmMFSrtDWQg1/LDyTSQ7AR7reaQb9tjg0igx5p
	hcawtvgUD0toWYkliWjnraal9/SdMcZoz9ymFqIL/8J7GUtga2yZN/KMH432jQUU51G1IRVuhFk
	Oun+fvNVlaRzyZXrYenE07MHR5RKv2irSueP8JoIyjS6/ImXoiMPje40sI2V0YVDQT4hfFoYeKC
	RAQ==
X-Google-Smtp-Source: AGHT+IEgalPQ22cx7DiKoLmOGrrO9ni0jyC4XIPIwGEyDn4n6J78lWHZEvPtJShZItbWPQLmYJ0Xvg==
X-Received: by 2002:a17:902:f602:b0:220:fe36:650c with SMTP id d9443c01a7336-22fc93e3d82mr42864265ad.23.1746783695428;
        Fri, 09 May 2025 02:41:35 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:35 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v14 1/5] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Fri,  9 May 2025 17:52:30 +0800
Message-Id: <20250509095234.643890-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
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

