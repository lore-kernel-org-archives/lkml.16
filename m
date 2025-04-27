Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8B2459E0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739851; cv=none; b=jnlJfUdLcH/a12vB8M3RpzvERpUewAllYnamTAa7DsplLWYnsLRg3wrr0M5Y/b/7VqVw8uvjTmwRO57rn08WG8Damm+5bTF168YRDMyRTSjVmNEO6bKKKoWTnYPd9P+zSTKHrLtdpnM/37XKGKb94D0tQe+wfLsTtByJtD+E1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739851; c=relaxed/simple;
	bh=+55CHDPhy7ugVr8afIZtwPoA5z6AhwOB1hiT1fHQRa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS24UKa2geHYmL1qNqLHuqnyDIf3mpPMWgvHdIDxR2HVR6rOvPQ2Ezuni3pVAfUsAgfkZ3WMgcMOKpBrxbWwMlJLZMi7SG+R2NzmL4ga5tLTO4UWQRrWjsr0gukg+d+fO5kpgr2KQ7pzjwr6SYOgqJD+VmB1kTipfDMs3wvmsKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=asB6wenO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="asB6wenO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso23519625e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739848; x=1746344648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=asB6wenOLclOyq7FHXYw1YG2fz2XoC/uueIFoZ8vp99pHKebvqvPfuKdD5JlSRqnos
         P9Hc9OPYmiXfZIPdGUIocm1CYwLpUMoP/OPKSu2bMg30GUs9LThh1263tITDbzP2E55A
         H1RKIoTfbPO8//DtgPMNyZW4/8E0QWjUnmXuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739848; x=1746344648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
        b=DYRSZKNOGDeKS9n7iX2ovC4IW+ZJoalyyG1jYNSXIS659Q+uAqRkOeMK3zm5jSrDYg
         0hy45wZct49ky4HEMQf3lTUTIBaymZTOCAZd91FtSLR8Etx5WuQHEavZnTUHr8OwQ3QX
         AnC6czC9FhfQ0fA/synrY1RsfIsik7ENrjiDuMLhFrzwv99i4eut93UjdcLgX0lVyrfz
         OEUYekLK4S6UF5AIM0RVTxq5sFu11QSiuaDAbSvlN8YKnzkPoZF+6n8Z43nOW9HEUpwR
         BxFUNoBYVrmtmoG3jF9iwJG7BkCcrkV8z+ka1MzzU8ga5fJkS/le5VBqG7NxdGM+kS2N
         fj4g==
X-Gm-Message-State: AOJu0YwKVMWZp02n0BBsEGrPZ9sRGxI9iZ2q9aQxzKkrMwidr+4IfsCz
	K+vFdesvMwDljOdWWEguG0kXqkFz7cTNZ3lEk509+i5/kCzZfI/0J3GhnSD38S7scylLda/DDHm
	e
X-Gm-Gg: ASbGnctpRlhdXkoL79TmbdeUvlAbSW8fCrVr5BLx0MOEphRb4SMrJ7bp0intRF0PSGS
	tluu3smZ7LbsHRbtQCo+04iytZhn3eEpkklUamFvN7SwDofA3BgcD4m1Y0imoLg43CTbZIz8G2Z
	/5l3aP6G+HPcVfBFSkFSXSQGyZaqScdKR3xsxyD6RwKDRmEEIpH3NElUwPU6z23T8TPQcmLEBP6
	m7XUv0oDxP4NeOk429YxSfd0z+5crbnKTGE+h/QvFY+MT/9b8zG5UBbMiqRKegKx4Jjziy5GXov
	gf5vIGNn+0sFq8xnFeWWB3JVlvA8sZoXKTrnlAIZTpx7vjpM8/gbOl2dTE5sOcQyi9MK/D6uUZK
	3uGwbwg==
X-Google-Smtp-Source: AGHT+IG55beBCMeEpoU+v9sBHrbcIgFnVINAwcpqdyMq90VQ1/y+K+5G8xBe1CVGW38gxB0HOPdp+A==
X-Received: by 2002:a05:600c:3148:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-440a65dd132mr80678905e9.14.1745739848202;
        Sun, 27 Apr 2025 00:44:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Jander <david@protonic.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/8] Support STM32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:19 +0200
Message-ID: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for STM32h747i-disco board

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html


Dario Binacchi (8):
  ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
  dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
  ARM: stm32: add a new SoC - STM32H747
  clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
  ARM: dts: stm32: add uart8 node for stm32h743 MCU
  ARM: dts: stm32: add pin map for UART8 controller on stm32h743
  ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
  ARM: dts: stm32: support STM32h747i-disco board

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
 arch/arm/boot/dts/st/Makefile                 |   1 +
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
 arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
 arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
 arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
 arch/arm/mach-stm32/board-dt.c                |   1 +
 include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
 10 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

-- 
2.43.0

