Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFB1DF75B;
	Sat, 29 Mar 2025 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274765; cv=none; b=jIT/S2tKqRBGi7XgHsUONYGEB8VB6GdiKMoT+A+CzAv8ATCNJ3qIg2+bwrn6OKQbaSKt6QkzAxKCdqWMuUVqwoNk9aO2VLkb52imKzcBtMLkK4r47InVvvV6adn2LR77TKnMur8qfqDwJKZd2MxKiHERp8vgcS/uUpfnVsE+dRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274765; c=relaxed/simple;
	bh=bIWpaiZfJJiBdN7hP1rZtf6NZk1IQo57fYME6/wf/1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/hw/0XnVKeVyHVkke7jtUuB7ItLTvQ2K+dQ8zWW/BRQF/4725Z97uQ4B7FFrvQi4ivoopXBhd/monVA9cBE2UNRbULEPmn+beppcY2kD5/Fw9KAL35DQRRwLCzo7ipMuDHiEMyuNCBGaTS4LJmaFvwY7xbhybfrGUDqpNz/yW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=I1as3nVl; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="I1as3nVl"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so515387066b.1;
        Sat, 29 Mar 2025 11:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274762; x=1743879562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnIvJ5GkQdTsudX8kCSNJ/vtno+O1kFQRgoOLI7QT+E=;
        b=I1as3nVlkY06FM4wgmJnN7hxsCjK3us1ko7mW2/v+Tz1kpH+PSm2fn3Wz/v9fijZFa
         gwGDW3XcuZIeyLiY1wTZtaJBZonyei5IH0Kien2ROqzCWk88gV0p4nQJxVSYtRKmgWS+
         lvn7cecB4/81PvgvkU//y5vHYYeXF9TTkooBglhiOzyglVi3O9vGi8Y9Df//EApqWMbz
         c0x/hN0QdCJRkTx7t/LQ+KE7UKghGW4G+BDGjwp7m9WR1nPriaqO6bS0+Fb+m8wYp6/X
         cImRhXc+9hXROejvB7OnbEugQ8FGalZnKwZ436XIAK3ZhVfGQ+xRiZeSsEB5O0UyiWYM
         U8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274762; x=1743879562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnIvJ5GkQdTsudX8kCSNJ/vtno+O1kFQRgoOLI7QT+E=;
        b=WwLQuX57jcZ/GBPO3UeKRI2Xd16fAQ2yPko37UE+iQPx4AyHftHt40lgYzRWlwjAjK
         i+BbEhl50X5RkQK2jVFqEG26YPzcgThaX9GwYWupzotQjPU6Fof3WLTSleiuep34hi6h
         BrZAE9XDQfqn8gSXpZLPi80f9wKOu0rI4BtTkrY86URbPIig3vBR2VLKhgqIEp29mKqp
         S5FO5aYDtLmJZJKRZYw35K7TKXthhovi0HGnW+gowpMFacv4T+Z7tr4DgirZaIOEoVru
         hYihyzg15qVfQkTF5YaQCu9LIcRaTlUygVbjBBBNGZMj2TgBkl/GpP8MUCxqJ6j32ZaN
         BQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR+H1OaG5H07tZ1xR3Z0FVbg6BCaDEyrCPOOoRwLLRGrgBNb8dHvp17HFrChcn0a4NMknRI9VwENmN@vger.kernel.org, AJvYcCWt8Ug7Utjzqarr6jEZY2fDdDSgtbiv1LtqaWVXzZJCBGo5bxuZHP9T22G4ea0ymhN/tOZjfp1cmNguOMyj@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAjFSvVBYpwMzbuaBSa9EXQcTLGyTQHXyZNmuP2cH01SwSgEv
	yAbi9KSwduEfv9xDbNHanYBLGb2xCXbSfsfjFEjpZu4x9T0fDZC8
X-Gm-Gg: ASbGnct5013yIviz1KXyljxlOk02ubO8d6pPDjASYL6sxvA9MZrw2B52GdIE0O+6TzW
	lDHYGU4E61brlVaPbfQYQSeVMe2gT6B3GUQF8BhQcVPgRGVqQNpJjHFWjT8SMf8at2hWbgg0oE3
	Okz1xYQUutPT1VBNu0YaJhWFFhPVXnTXW00e8HPAAwk4/U74EBb0pNN56efK52tV8+zVZcKINEh
	8yPvfDscOq6N8g/MJH1sXwEeILSKMwUCs7CeNTY82/tYTFAr9B75cd7KCKhE1ZZqMTqG3yzaJnR
	FuT+3lpMlNvoIyfeVeeOOV15IB1ws3f8xUCeTKVZ2QAeW+gHJkrOn8+wX2rrLnGbmkfym+r1IRu
	xs/Xby1niKkjssycOgojhyVHsOBVuuVNPFfcdo0abaw79W1mk5HKu4STdQqQhO2VQfFacuQ==
X-Google-Smtp-Source: AGHT+IFESawv1sch0Xh3dWQk//nDyTPFLIdKhU+1BsFulW/LDtgKGmqIj+1y+Hbo1pfEDL+B/1he2g==
X-Received: by 2002:a17:907:868e:b0:ac3:aff6:817f with SMTP id a640c23a62f3a-ac738a5aa6fmr362758366b.13.1743274761496;
        Sat, 29 Mar 2025 11:59:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:20 -0700 (PDT)
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
Subject: [PATCH 2/7] ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:50 +0100
Message-ID: <20250329185855.854186-3-martin.blumenstingl@googlemail.com>
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
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 0876611ce26a..faf09f77c605 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -368,7 +368,7 @@ uart_ao_a_pins: uart_ao_a {
 			mux {
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -521,7 +521,7 @@ mux {
 				groups = "uart_tx_b0",
 				       "uart_rx_b0";
 				function = "uart_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.49.0

