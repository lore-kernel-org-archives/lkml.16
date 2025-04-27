Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6312472BC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739861; cv=none; b=IpWPCprVJRcNaiT/3p+C99rRxijibF3hPDOMdnvwoNlSbsnVr8X6TM7r43siG8ABkYON4/wmpf20j8DcvuRxZqPkkYQDBpiZTGlZ+h7jHmsma1fSDZuG8imS8572qPQktZbWsLs7kp3m3l07o8sT5rXDkOl6YzgogVq0LEz9bB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739861; c=relaxed/simple;
	bh=XQv+rmyAMWAkk266Eh1BSPY7YrAdkwCHljEucegTxnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZN6N1IM8RdqlRkj+mdSCHHhzcdDYKo4Si2Vf2Cr/IV8htcrWezxMerwgZcPIQ7oHKxhm3aw1QmUhRvjdY0wjgGHewGNwRCz0Lu2mc6B+7u64fd043dl+/vaU9dFyvXVH3M3WFMIcYJDYpS9ec4kcYOOBLZGyOF57SLy5J9lSKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fGlmnVtw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fGlmnVtw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso34379635e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739857; x=1746344657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
        b=fGlmnVtwgg+92BxecaJYMhpwMt5C39IYzVUf/+LQquWDup25kL5jsjFL/qfaWgDgDS
         MYmpwTodGcxsfGj0KzRhmMXUJ1mT5+GeBRXLeGDVLwjPvcx3jIqRChI4cDRrz0dI4viP
         Zk9P9TUs6ayCdyJ7psdeHPJ3Ji8qFwo6D7gUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739857; x=1746344657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B1CHvp+/NAtdvYK3PDi2I49Nj4XN1T6BUHalQZm0Y8=;
        b=akIdMcKZ4T4RB7r4WDXkSUsnypdip41fQ35eUN0hczqLZyvs/uwxNvDlpcREWKRYmY
         G3H3ASf0UYusP/Mtant5UtWcBP/Ou/IjbWsb/JTz88B79fgC9r9u/5LeDCO7KgEE5dMF
         raFpRx2kxICDJw2AkNEdC6JrdibofOgWt4/bMYkiT91nuw4R7XyFaTnaNFXBJWghaPq6
         d/Bb788DIjdVeHAoaP+JAldn1s+Cm1XCAdCXDT1q+NGafGKry54AXpBxE6ZfhQ5Y8oEP
         GlsOzjF3YPs7IMYvBabsHnpo/U2fv6jVkS4EU2uLBX805wpeHP9qz5zmeRbxxHKGe/sS
         cUdA==
X-Gm-Message-State: AOJu0YxTr1Ponn4Sq8C4iN9B5JCUkfOd4iO29nk29keqYKWVtM/EUO/j
	mYjAyihyfvR14Jc3SEyRlmIy4qytOI0mlH02XmIAxerEutuO5bEoMHAZBxpOvNdF53P4vx5W6KI
	P
X-Gm-Gg: ASbGnctq2LL5wkrcJ4YDcQUAUZ1DGyHPOr8e3EcfCPz+cyyzcdzYD/p6FHizusg/75c
	MOllNZlaBlPmQYxGAWPGVgPFKXIb8mZSn7YMDC+cJDSqi9agDdKeCvXcv44yHZUvPRovm7C8r0z
	AeZ2XQ//bG2bvV/Qph1a2hgckUIc82bLEwyefQ7xCGOKme2gJ1jGP60VYLzoKAtYsv4KpJ8pZj0
	CspX8F5tYsoHtkWl32r7SOVHW6pJ1FO5/8OU2yK4tXyHozKZDLQTqRT8mYKyU2TdSo+PyLFN1J4
	5zWLlCd/Ggr+UiyfsApDUmldpmJ2A4wR/IJhcogERa6VKsy3jY5oxoj34HrKriGXgs/iTGngIn4
	sSKmXKw==
X-Google-Smtp-Source: AGHT+IHZNrSu8FzIhEuFQ16NlJu+RuWVlKIcqsPehnQolCLBlqZN3KSAMIIbMcfsM4WNgYabQGztRg==
X-Received: by 2002:a05:600c:a15:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-440a64c159cmr74151955e9.2.1745739856765;
        Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 6/8] ARM: dts: stm32: add pin map for UART8 controller on stm32h743
Date: Sun, 27 Apr 2025 09:43:25 +0200
Message-ID: <20250427074404.3278732-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pin map configuration for using the UART8 controller on the
stm32h743 MCU.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index ad00c1080a96..96022afd0168 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -211,6 +211,19 @@ pins2 {
 		};
 	};
 
+	uart8_pins_a: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('J', 8, AF8)>; /* UART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('J', 9, AF8)>; /* UART8_RX */
+			bias-disable;
+		};
+	};
+
 	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
-- 
2.43.0

