Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B11DED4B;
	Sat, 29 Mar 2025 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274767; cv=none; b=f1mSnhL3MZd+AeR9RyYZLfncY1l9ocpcC0R5MKbUUf3wPPfQuFTFMijmHJ+hgIPy/diI38YnnKhq6E394K8m1A52Okyn+cZlOas16dXUL9g7G5iyhT9OLp2ydpYH1/mtPEggbhnt6cvivCswI6hpvaOiGSl+0Witbp7V8MwRI/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274767; c=relaxed/simple;
	bh=z7FwEqocIbJzvxnEuWRqoG0LLOHGsRD8XRljVsi3xgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I43vDJ7yuJcmKdcT8YXp9Wl3hLIq3rfDy9+vjko5Iq5tztS1mfdpU+Pk/P/Qv1c4J6sGf+2irUKuwT1ZBXA+9rSSDFdAEmOmf8MdE9p201MdNvP6HawkF+iXGsgpgveMcbQJXlX5cDbIHXFD0JNjddwCrmCv/xllmo43GUzZKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=L58nTiXN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="L58nTiXN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so476599766b.0;
        Sat, 29 Mar 2025 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274764; x=1743879564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKkfbO1BiF+QlXbqBxEEyljYmITDjKlUPtvMrkXYk1M=;
        b=L58nTiXNsuP46pZUUNd7/tc7JIPcLY/nZov+iPkg4GbD6gToV/lL10m2mXaZGAO18O
         dOQmyN7rzQrcKcI9kToqVHHj+CopnIH5I/gwBXhPpi9CQkU/sYUiX/3ebZy0V9snQ84L
         89DQhjO27q+Kmkp1kz1P0nsDTU9PNVfeOv9+1s9IAQufqyW7hHSpozWRL6hM4wfRkUDh
         mOlLGQ1yI7cekiBRCVGr+OuWiZZxdR6A3pLhzvZOqeCtGFnJwkc0pQ3bi3Q8TRStrq6e
         n0c2XuotTS2bNTxeC7OynHe39x9pSKieCUGaJsTzO6IE7UQdY0dvOv8KLbhfTplYlFvY
         RPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274764; x=1743879564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKkfbO1BiF+QlXbqBxEEyljYmITDjKlUPtvMrkXYk1M=;
        b=nylS3GBpHO8L8GSwmi68pvzGdU+tMro0ayuVyKz74hs088M+ASYyzYckbLGXw9V/3f
         GDIiFSIF3hXnBsStXa4IMvMyd3cGsBUWb+SwORnoZ5G8KqDl7X0CBR8ZCjQXNw30kdLL
         k3oBZBYZo4IwoMg8k40HRnFCYEulLbfkp/MmIlUODSXkxawvRxWtaD++gXBQcoaFbXwG
         ibWnSr5wMQhSuOP+J2/3poDpJgGOpdiqC4mAQ5+ROKXA5ywp/mSS6bvG7pD74IKuYBEs
         ArhCG5WPCbsuv2UHSATU+A5THUjwu9cp7roSa2K6jcEHFRC7qrAvBg0QR0A8y6FfLu6L
         ehPA==
X-Forwarded-Encrypted: i=1; AJvYcCVlaBOjiBQLxPOeo83wG+z4lDSAv6LntGnMJlrP8N1orqpHqA+iBQ4bBJItSj08YfQ7Hfe72ZVG67qd@vger.kernel.org, AJvYcCXkOXqgr7JUbTpZluhjls6KFtT1NSQdm7jjhZE9vWtI4d3CJ3tYh65c7RtjSbkNrcHiVoywH66+XUOlmVjq@vger.kernel.org
X-Gm-Message-State: AOJu0YxvM8gFr6Sirr8DQFKD+8SIoxmCXq8Va5hPRV1NX1lp6P6tfLCp
	8SFKpEehQS/C9hSWWlCr9IceA5GHtxoPU0ifRB517gfnSvlBx4+HtcXZbQ==
X-Gm-Gg: ASbGncssyYqranyDPNJahYqhBJEj85cUJ48y5vSoAuQ3Begk1J7ksgEaQw4JzzZuY+i
	HCIiJ8F+t/R86NZlO4MtX3uSy1HNC1COdYhb2fZV6Eow1qxOSewhcm/On4w8h9LGGtImvkiXbN+
	sYNit3wiiaDYMt0miSfNyf4p6UAfmWrNLEv2etniArduBtTWF7wMdXt94hSCxq77YpjL6UmS6Zr
	7C+7KAS9q22DiSsNtg0oc0CjT+V4aRryWJGRdgIlG1WxyUdaS3Flxb+eaU6WEo1h6/P2mVI85hP
	nkSEXbNbA4MgybTyGIGELKvHhpYv68my/RNsXQPeYKZbvjyfGoQAguhjasaNYp5Na5ee8EF9VYC
	O0GKAVtOwrvqRy8wWlRP6DiBqBVCwKSVhP5cLfC0kBaBi/s6cvNFuKH8kXaiy6jX78HnII5CD4D
	FSq6bH
X-Google-Smtp-Source: AGHT+IE5q4K7Ef6k7rcJl7ZBvAtJqJkvDsSBkJ2ZbFVfGwP8BH9jLRx/9uvMrwpU0vICOl+FUBSWnQ==
X-Received: by 2002:a17:907:7d8c:b0:ac3:8790:ce75 with SMTP id a640c23a62f3a-ac7389ea3a2mr289697566b.10.1743274763406;
        Sat, 29 Mar 2025 11:59:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:22 -0700 (PDT)
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
Subject: [PATCH 3/7] arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:51 +0100
Message-ID: <20250329185855.854186-4-martin.blumenstingl@googlemail.com>
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
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 8ebce7114a60..c4a9f855e5de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -105,7 +105,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -122,7 +122,7 @@ uart_ao_b_pins: uart_ao_b {
 			mux {
 				groups = "uart_tx_ao_b", "uart_rx_ao_b";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -520,7 +520,7 @@ mux {
 				groups = "uart_tx_a",
 				       "uart_rx_a";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -538,7 +538,7 @@ mux {
 				groups = "uart_tx_b",
 				       "uart_rx_b";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -556,7 +556,7 @@ mux {
 				groups = "uart_tx_c",
 				       "uart_rx_c";
 				function = "uart_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0

