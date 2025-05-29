Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0002922DF86
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529368; cv=none; b=nWL+2I6PIGRq8FuzZLFeOQM2aE95Cpd4vDIPeeFxyskAhdkO26xsAZ06ypuljEPCf1sIVRZ8JV8zcj74X2oLF6YoRxGAr2RP8ZytxYHVeX8ei1xPezfvD9QwN8jwitcah4QLzqWIBOBFKK+2RutPWCtjzO9VjDAGigRp4uqDVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529368; c=relaxed/simple;
	bh=GeXs2YTmkQkV79yulDXUH0yLLyz3ctNNGJzYo9oqVmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpvXgMixhZlnhOMjkf7M4krEGQr/ekEi2gc6n5T4Lj1tVzkqeNBxSg5i+mKNK86NiHReA/jtN/eXJER/fJGo5nhXrQG0dZz7TPTv4pUkz8oKIn33SuB57rvz87OfJGNuWyHTP2VQO2xEqnFTSHKisYK6uSfIKbupyeOo+9ryp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BYb8gEiE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BYb8gEiE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso1671450a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529364; x=1749134164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=BYb8gEiEtcvV6HH192IHpNjuqi4qjPU++XFPclZ1ps8xRjMwaOMehThpg2KUlwPTuI
         hSyuKD23n51Ma7+5hNtYgcbhmgmx2RxYGktSGNZ7yxMr/YoPmQG2GlLBbS+XBM68Z9ZM
         WmAmHEpvAOshXQoyeqF4QDc9d8E0TCpchyy2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529364; x=1749134164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTXx7XXdzk7EWRnp78xo+LM1GM1iIdxfMvNDWhkbA/U=;
        b=uBUaWunPM2K0+n5cGf0A8+h6vxHrJWYTuoB4wsbk4XVGTRFci8ndx3DE/YVGkhyrmt
         UKRr5HwkaeFeMzbcYznrYzQfDgWm1p/ax0OmKPymVzu/uuLehYggqW3LUX1Bl4UACEz8
         jZOJCW8TLGEx5kzvgGyBjeRx6YCultuNCFqLTx5gnp+kw/HRriBLnbPAgPlqEExyvX4s
         /gGsrfLUv5JYLUS4Tyn+P8iqbk/Txi8onXBDDyFhXDuuNEsZKkwZieuZsdfaRYsmmqsR
         sH3vkcun0iG0Ruz8unlBJwbtLXgw/R74b86cGlG/a8F7xry4TTIavs772eTG6pf6AfO7
         lvTw==
X-Gm-Message-State: AOJu0Yy2PUu3heMwk3abL8YK5T5Q28qVFMaT6M6l19dCte2PR0bPdQZE
	pR/zOLiIusEt8SFJmpNpcgmuMh2tu8SMQYacvjekSUlT7jWWfGbXZuF8vUbnS1yN9YpzOdFN2cR
	gSX0+
X-Gm-Gg: ASbGnct1S0zQF+ZuTyjEGjnDVRHXmwTsaSzmurh/CdGgpmlPUIy6tb2W+JedTkp7WvV
	k2Pb4a/NL7/VReifDyK1uLpWr1FvYqHhGaI0hYsBNJ90wbW8t+iwCJKO/ns4pX8b8LwKfkJ2MDn
	WEjvl90+MxqW0yGgE8tzULXYDIsornYMlRWUA83C3HmfGtuIGIvILsmynnu//0vMwrCn/UsAZUq
	Wbhq4A4DdD17aEXj76GMHjgYFS2Gy+FkUQ8rPBsZSWZDXW/TJTwf53obl0gWZo26s9Y6eySv4xM
	iIv+bmFB9p/UDHpMeUOqn6bRPW+uT1somRlGe2x5wkvgaCBDQIFH6bYlA4H9tTMIwIxxXW7wTjE
	r1sP5/MRG7VHrxO0Z
X-Google-Smtp-Source: AGHT+IGNd99MwT3JpoTl6fZS3HsjpB6dOJqE1wiiL6YvPMiOlp0uVZuWybnPHDsSV0wIHKZmVqHGfA==
X-Received: by 2002:a17:907:9611:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-adacda55ce4mr238586366b.3.1748529363612;
        Thu, 29 May 2025 07:36:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 6/6] ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
Date: Thu, 29 May 2025 16:35:13 +0200
Message-ID: <20250529143544.2381031-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the options required by the imx28-amarula-rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- In mxs-lradc.txt:
  - Fix typo Low-Resoulution -> Low-Resolution'
  - Wrap lines at 80 char.
  - Drop '|' from the description
  - Describe what each interrupt is for.
  - Move touchscreen-wires constraint for imx28 to the top level
- In imx28-amarula-rmm.dts:
  - Drop label property (deprecated) under the leds sub-nodes.
  - Add microSD comment above the ssp0 node.
- Add patch 5/6 "ARM: mxs_defconfig: Cleanup mxs_defconfig"
- Add patch 6/6 "ARM: mxs_defconfig: select new drivers used by
  imx28-amarula-rmm"

Changes in v3:
- In imx28-amarula-rmm.dts:
  - Drop xceiver-supply property from can0 node.
  - Rearrange the order of specific nodes and properties
    alphabetically.

Changes in v2:
- In imx28-amarula-rmm.dts:
  - Replace '-' with '@' for the pinctrl sub-nodes.
  - Replace edt,edt-ft5x06 with edt,edt-ft5306.
  - Drop LCD reset hog pin.
  - Add correct #address-cells and #size-cells to gpmi node.
  - Replace edt-ft5x06@38 with touchscreen@38.
- Drop from commit messages all references to LCD display.
- Add patch [1/4] "dt-bindings: mfd: convert mxs-lradc bindings to
  json-schema".

 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 91723fdd3c04..3b08c63b6de4 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -64,8 +64,11 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_TOUCHSCREEN_MXS_LRADC=y
 CONFIG_TOUCHSCREEN_TSC2007=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PWM_BEEPER=y
 # CONFIG_SERIO is not set
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_AMBA_PL011=y
-- 
2.43.0

