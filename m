Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2907D1E1023;
	Sat, 29 Mar 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274771; cv=none; b=r9Ll/iVC37JiP472eI30o9YvgmqUUaGwM5tNBje+ObBgChvw1WsbghP20T9+gcdJmd1kETGWSipvHI4f7TFq7oLO0CB1kHu8VhpTNDLzk+F8Tq/OquSceLq7KML+7tmLj6/HNL17GbuWrJkfMCUHeXtAoqzLBdYT6h/aVyCiqDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274771; c=relaxed/simple;
	bh=r/Ql0kRhoYaB9VsphAHa2zlYXQHVctx56XQ+pXSgLQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaYa3Zc4f5j8E2ustNEWVT6UM26u0Ik/iWBKr+S+rO2hchXQR27qcah4I30ob1RKM4kGvpGDZN1yO4ezcMnz2mSy7O6JGT9YG9IYNAf+FRXfh897ahnKbvgIhVE+j6yBmDREsfdEs+Ksqimoo6hxGX0TxFRILI34mO4UZ3m6Un8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YAYt32p0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YAYt32p0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac297cbe017so768384766b.0;
        Sat, 29 Mar 2025 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274768; x=1743879568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuJ1rCMKJ8piRzVxzGzbbZXPyezY0fLV1P9ou+GE3/8=;
        b=YAYt32p07hs88kZQlsc2fOYYpEdOH4qxcjm36Rw6G9+Ob0ph/nSdibaI+AMcNKW0PV
         A4OENw0MIijwBkBzblk2IqW6WTycbX7cIjrFv2gnqXGunsWBT+gN0xXcI4ahHZzbJqW0
         0oIkGVWQzbtOJyJ/UjPl0EKbb2EFIsODfCKkcy0ToGv/2UM0dRMHUX9qN6naOeq5edph
         KA3hPUFv+updxd2g4CmkKCrRvzcTn3xBY9i91V1yO/Wlgr/YKu/JvD10b3R0vpyJWX/d
         5UkB7o9qss6CVTcZyEzLo41KAUBg8aOwiplWstWmjy6pTY9sPnE21FSZ69i6TizKZ8y3
         +1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274768; x=1743879568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuJ1rCMKJ8piRzVxzGzbbZXPyezY0fLV1P9ou+GE3/8=;
        b=K/biCCbpePaVl/FXQ/i0hKZLJR6snlhDbCE5DmqoWF6h5XbfjU1a+jb4NwXO3Z/w+3
         59I/QScj7HTflRd8qRK/3SMwqUm2+yvMcXA2drUhsOZcZVp/jA8oNxvpxOFgVM5mJU11
         uKZacg06NdxOAwEw60ey+gkcFNAGdQSNiN54emuFzu9ksKQFHH6Jaf9ZxUMu/9iZIGyD
         dnbMRpB2GPFVjdBDnftuBUuGF+2rpazR0Gvzrrw7VFl8GjC8QByL1IC6jxYICjN/mDGz
         8hbseEmYWNSCw+LwdbSUVoznTR0q4x0aayQDtxQd68iA8WkmAt1Z3ry5phtzX9QRKDLx
         WXFg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0UzaV6+Q5yt7efqGeNdPLK8xuluzm9KmOAqjvQOHwoNLcNKDyWa64Lnw8mTxAkZ7LqlusTXjxDL0@vger.kernel.org, AJvYcCVnJa3ne20CFogWiKj2M7gXIlpKcSfyVWd9w4xG85i72tEl7z72ujUKLHA8LkIZyJ8jnwlTecQ7XHWMp7SV@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKs3m9bGIpWx3qDX1KughdGb9i9NGPvdaL6jMbt05tZUKkmUx
	bBzXQK4oiv83K1KkJzRrqNDonoKHjiDZh8LNeEBMrpcGmYZ+4sUL
X-Gm-Gg: ASbGncvJcMgO/L8sVNZTld4wl4YnLi9T3qMiKq+s5lCtaSJxmFad6dxf6HS+zA8uDwu
	HqvG+6VB5rHVrt5hHR4ap82b7uJC9KTjo/ssV2HN0UPlbJVQwLxNM0MV/l6kAecZaCQ3HL4Uyg2
	RH1RSGk+rzJ8r6TYUy/efEENyFS5NsaiYpIyWEMCtzv0Iwka2xPsCAQSgVilbvIWvJ9mMSpXzJQ
	cL4cZhE9tbX+WZ/YqPquKY9dxoRu+GNkgjYm8bFbGxlYPsY6L9N2YCEQqGzgnrSSWi/8bugz320
	EphVeklwinWY6z7FE2o46U80JZwGdpXt+xOixiVSbn1U+Hl1PGfBKlBH80C03vusg0QRl7NeEvn
	bd6K1XFGvqCiUMwlaa+otoWRJVH700FbFK6woES8usN6UUf56g0BXRNUkSv9MXln0ZsfhMg==
X-Google-Smtp-Source: AGHT+IFGctAWHqtx6AeFMYWfdS86m/LfdZde43epdyfhY6MjEgiqUrnQaj/WFj/gZ15p06VavYLUIQ==
X-Received: by 2002:a17:907:1c97:b0:ac6:e42a:fb4c with SMTP id a640c23a62f3a-ac71ec04f5cmr688598766b.9.1743274768323;
        Sat, 29 Mar 2025 11:59:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:27 -0700 (PDT)
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
Subject: [PATCH 5/7] arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:53 +0100
Message-ID: <20250329185855.854186-6-martin.blumenstingl@googlemail.com>
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
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ab2b3f15ef19..12e8daaa1c9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1503,7 +1503,7 @@ mux {
 							groups = "uart_a_tx",
 								 "uart_a_rx";
 							function = "uart_a";
-							bias-disable;
+							bias-pull-up;
 						};
 					};
 
@@ -1521,7 +1521,7 @@ mux {
 							groups = "uart_b_tx",
 								 "uart_b_rx";
 							function = "uart_b";
-							bias-disable;
+							bias-pull-up;
 						};
 					};
 
@@ -1918,7 +1918,7 @@ mux {
 						groups = "uart_ao_a_tx",
 							 "uart_ao_a_rx";
 						function = "uart_ao_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1936,7 +1936,7 @@ mux {
 						groups = "uart_ao_b_tx_2",
 							 "uart_ao_b_rx_3";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1945,7 +1945,7 @@ mux {
 						groups = "uart_ao_b_tx_8",
 							 "uart_ao_b_rx_9";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0

