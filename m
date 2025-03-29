Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723A1E0DCB;
	Sat, 29 Mar 2025 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274770; cv=none; b=cgjgCreXKKQAeSU9Y7bGa9CSaIeWeWCK3BUIpEkeG+Kjvwvpm9Oa4pFbmrM2SRVb3QgiVwCilG4iJv8zZlKaBBWJG6ccgOAaFeN4Bgbz/wQneMSyepKK16CTfxgxbmrovcMPSSnilrDp1CcWD+Mf3PNnOGAKCFVJNl5GH+xMoyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274770; c=relaxed/simple;
	bh=aFwEz1k8FSet6cTYZo0wr85PBsTsQ+/2rF/2j/m24Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFZSex3OK+BaYZ47dCv5hM+qDqd7PsGx1z/22HgtVYB9qtCGNsHCFdVgIaQRrPeISHnUjj5E5BHahQdz/weIfYk8kM6C81AUiHNm6yA4V1FsbSYwzDfCSwgdHqnn82BLIh8IsDELdOBwmbqNVgyl27HGi86zZMY1UGrb/q4pBkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=az/3GAs1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="az/3GAs1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so4122616a12.1;
        Sat, 29 Mar 2025 11:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274766; x=1743879566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHjnimUXRB9yqs2JrX76wgCEkUn1WbBc4dXkc5jfVng=;
        b=az/3GAs1Lwdwz6X2Zuqajys+xhSMNVLDwNankZwIw+++D67vSXHUp6fBL4SvAMgJsx
         /c/8QwIn/b74DG/OHMgI8UwzAshs1ZOofHCH18kJBtEi6InYSzthBimhZD4+eDr/mgJM
         riB/Xegs/eONgi+i/kXWBFd8HL6Se+XOMbQUfuju/HSorhd1WMBNdrz4YB8cY3DebB+Y
         VL3JoBb3fjtt3nCDzYArJ6QAiY4LSSHumlukUQUupERmVoMWB2fhHD5wlvXiU0zp/8PJ
         /CrNSVFurNWnGbswRyWsIXMB4+txyE4wn7+oOsnjNdqeuobmnnkwxX8BdNtn+YmfEll0
         IGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274766; x=1743879566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHjnimUXRB9yqs2JrX76wgCEkUn1WbBc4dXkc5jfVng=;
        b=sU8kN06Qp2db4H+TzZDtd+gtUimGgyUMm7Ak3dqnWIOn82Il7GFbbc2P0bNr5WlvlQ
         ZcfPDLrxQ0cwrSbeMg+Ag/SbNlk4/SbtuBjOqBRn/ovDhoyAn47MmU+FNN51pOG/iDZ0
         zlJOIfkZC08eZzTA25UXkYPFcMmPT24n5qIwXgqRTSlkJFYBE2GIY/P7b1RpkbEvguRb
         N9rrnNNekEa/KMnC9XifWh7L11vDtNJqXtBX29AZPI0JSY5y4cDgilCDIl6Gbe3Im3lq
         by1KRqPDsa7DlD1h+IGKGoIhcYS1G4Fue+v5ltOqHm626Mj+6VMy5S1MlB8ARYlD+/We
         smKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1aRVNiwUfz0PBw4YgH4z6vXJ2y36pq1XW/4BhDzSuAxSbWZRqaHeV+nbTG6Eggq1W9ai4ojjI5O6i7r/Q@vger.kernel.org, AJvYcCWA6d+o6EWnvaJFLifzxa1PyzLuJKbZSkFKTJ6YkdZ23bTg7vRfQsaYSIEYVzGOw9cIFdHdG3KgtlaF@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaQ1VPuLlsxOVSiHg6zbemhEET9z8Kb8rHeZ683JE2Pq/yQ9q
	jPgotOeUFBPJtqdVaZhF1lTCZzNEV484BCacQYRnCQGXLf+p78FepAE0uQ==
X-Gm-Gg: ASbGncsWNPFa3QDl7s+yH+ftphmen74dVZUUvSBOLdeDOtDvul+X2rgCK4SlllzqRL4
	bsywZ3Jig4G7Xs9+/IK2rgYOuRVHBz9oZcvt+MHy3H8hChIv+V/3azIa4CdlPuiu+/BCZtdePog
	IWUeZy7VhAkVuHJWP4uUvXzlmsk6W4+x4NvdC6PwzousqlUupDS0XP8PY+US68m+y6CY3sKp6kX
	SBnKHE8JIlmSgp/w91qnc1pdw4qIdunMbxXPxwqOzd4A06N/joUrMUgw17g67agKRAe2LHaDuPf
	nTuZbXmuER4D8jtDF9dFix/mgEDKRMGFkXQbmEDzU/0mlfd8YCRqgSn9fUmfsjzd9qPDe+HHHJr
	SEvw1Gg9Oq1nsWeaLIa1L8KfDDQZvx4wiiE3GsGKNxqV4Ies4/KRNUbI2c2t73QbIoK9lysLi0j
	YQgLRm
X-Google-Smtp-Source: AGHT+IFWI6IwRE1qRMFr432PaEFmBmF6a/bj6HZe2GViLF3Hz14MG35bIU/UGxCXhgixCty/+QMSGQ==
X-Received: by 2002:a17:906:7955:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac738a4bf32mr302869766b.21.1743274766374;
        Sat, 29 Mar 2025 11:59:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:24 -0700 (PDT)
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
Subject: [PATCH 4/7] arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:52 +0100
Message-ID: <20250329185855.854186-5-martin.blumenstingl@googlemail.com>
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
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 2dc2fdaecf9f..460c46cfad6a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -163,7 +163,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -180,7 +180,7 @@ uart_ao_b_pins: uart_ao_b {
 			mux {
 				groups = "uart_tx_ao_b", "uart_rx_ao_b";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -188,7 +188,7 @@ uart_ao_b_0_1_pins: uart_ao_b_0_1 {
 			mux {
 				groups = "uart_tx_ao_b_0", "uart_rx_ao_b_1";
 				function = "uart_ao_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -522,7 +522,7 @@ mux {
 				groups = "uart_tx_a",
 				       "uart_rx_a";
 				function = "uart_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -540,7 +540,7 @@ mux {
 				groups = "uart_tx_b",
 				       "uart_rx_b";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -558,7 +558,7 @@ mux {
 				groups = "uart_tx_c",
 				       "uart_rx_c";
 				function = "uart_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0

