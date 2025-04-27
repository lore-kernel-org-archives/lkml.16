Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E1D246326
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739859; cv=none; b=bXh9YO12MZ8crHF+TQktMeaWi0kw12ghxjYdhB0y4vVloBaCfiLzIZtEDH+0GYk3ayV3gJBveEOeZ1Z5QV/Yvuv+eMhOEzfVNG/rzumTw88L/79M4O42qKkFbg4AiLK6EmefC2UZ26n+5PiUEMycvBPtoSm37cbZ5mRMTOk3/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739859; c=relaxed/simple;
	bh=LU18ejxajg8FSFquzPkM9qPx9/7bPG977mh2EZyZ0mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBFB7Xza/wvxW8RldMGQ21j3b6cYSE7legVfkwIhu/ajTqTLRNN9Ghs6ZoRwnhrM19ELcok7wf0U1kuq3313E7pk92z62FA2Qxn5MTA7dzWlbr/j3bDjgBt5roqCED4FYsFNawCKIPym/dCDjsomxR4N46uVEWtuMEzv5VSMqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rKSXAuxx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rKSXAuxx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so35315095e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739854; x=1746344654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=rKSXAuxxFzuyNBE/+d49pB9UVcTTf0tvWvVRdd+nsXVDN0YoKKHtihV7i1Lz/OIiNY
         AhuZARQE4vx4lkCIsIJCJXuoTQNCxag/NQXC6vN5dUHgR3GvMJsi3wahDhkEK9knvfsZ
         Z6KReS0bTtDoSpuZcQE4O1Gaz5pDRflqQjpPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739854; x=1746344654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46KG8AspdUK+HWoPDCPbBAKne4wXkKAJk7Wn2N6bCdA=;
        b=j0uYbO7A+kpf6ZbvpexKAzUjjLGGYXMj/TZXu7Cr3OkTO8cbbxUnsj9ZaYGe5AzyIs
         I8GVJLXZCEzC7XoTG2l1KvJcWvtiRd5Ef9MQZeWt//+ueSjCs4/fTGMgh9FsoVZnw0gK
         0aWlFze3jg9Q83jqfLUjIto/C0A+KQ3brqs74zWi1t2imFDEs4w1KtPYpGE4r/k8AJr9
         dsVcDRh63TwkwYMlAhLPPO3Jaut9DCBYaksx7ZrIia4oHuPWjx7z2Gxmxf3Y3Cv6A31O
         27bKseITuj8u+pjO0uJoTDnDex4w779NdTvo023IBCZHb1tpZo7LUNdOvm9/Z2GIiHx+
         xCbw==
X-Gm-Message-State: AOJu0Yw6d0Mddv7CMkA58ookdNNASfcaET9gtG1aydWzzIOdjaEMDbsC
	m5x2j9pNT2lPqQ8l2VGFwX1ORKRSfMmpvX/QjbiXYOvNFPUSJBugU082Yc05LYOZM/IZJ8XWjx+
	T
X-Gm-Gg: ASbGncv/zpEcIF9NL13XwJVOPL9U8GspYwp4Re4cIkBczQrlF1pnG2DWI+aCIRkcSOA
	MyJncWvMZBfPpYHE2obkMEmh4+XvZP2RjnteO9LQTGDwme0iX0ebr6Wux+V4tVqoXHJ8Z48ElGy
	4/yxPyrSkPo7l8hBB0+pV67R6dYze6xIzzZ086/q3aGThWmjPTDTDypTQv7epNjZZTleRDcy7Qv
	RUCh3hM3u/gX//UfbcFDEVVTX7qx4hSC37MkoqnMgLosewzG0CBbQkRUVUiZ4e7TSwhkhDKuev0
	Ns8YrYpsi3OIgbyzIjY0dEjDDUCCJhxGa/anVlC3NYxqILudSgATKvoEgbn3bkmLwqCffNNEqzD
	ezN6epw==
X-Google-Smtp-Source: AGHT+IFmKdlug3XBTeQtHBTWufSsMQj6wGtrXk30tYDh/x80OEhGe1hDn/XAFAGgsIRKs0/u6QDg0Q==
X-Received: by 2002:a05:600c:a02:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-440ab76b5e2mr33817675e9.1.1745739853968;
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/8] clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
Date: Sun, 27 Apr 2025 09:43:23 +0200
Message-ID: <20250427074404.3278732-5-dario.binacchi@amarulasolutions.com>
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

As stated in the reference manual RM0433, the STM32H743 MCU has
USART1/2/3/6, UART4/5/7/8, and LPUART1. The patches make all the clock
macros for the serial ports consistent with the documentation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/clock/stm32h7-clks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/stm32h7-clks.h b/include/dt-bindings/clock/stm32h7-clks.h
index 6637272b3242..330b39c2c303 100644
--- a/include/dt-bindings/clock/stm32h7-clks.h
+++ b/include/dt-bindings/clock/stm32h7-clks.h
@@ -126,8 +126,8 @@
 #define ADC3_CK 128
 #define DSI_CK 129
 #define LTDC_CK 130
-#define USART8_CK 131
-#define USART7_CK 132
+#define UART8_CK 131
+#define UART7_CK 132
 #define HDMICEC_CK 133
 #define I2C3_CK 134
 #define I2C2_CK 135
-- 
2.43.0

