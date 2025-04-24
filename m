Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC181E1E19
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475754; cv=none; b=m5Pyq8+I7trjRx/+DE+sWaBY1hCLhIZmSuf9eu+db+Ee9Sxw5qd/t2Ux0ffg+wS/FHMFCCLUiMgIWK+36gZzj/iAqwxEJ8g4EzycC7UgztCud/JvHHyIzBrRIUvo6/VCHfAPsrekllIy5pWhDi8JQ6Rf8HJ0b8NiH+xZ/ua5kKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475754; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGp5cQgyTI88RHzDFLBtYXZwvDoL8pBltwhDB4h5b4RqoEM/Lu7M7xqCwBwjc6/9qCxP92rNmOYOIOBApL/ALjfqUOQEpzzmdqm2SwtO5g0rcSXr7D+/oIDrwxTFgfg3L5HtfAy3xxDKfBXFY9gxxXRJxCV4f/o4m46mzcLJgkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qdnk3ZNh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qdnk3ZNh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so5574795e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475751; x=1746080551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=qdnk3ZNhfHNDmHfwW83Fo64a5QPPraalVN88oJFk6WunAe1dz0Yu8Rw2f0q6GcN63x
         WEbubBAMvoaDIeCZMlJZqEtneUj+8zwqo6A+dAsD456uvl/2vMjZH1yhWPxG53RSTnIs
         TQX42zafA9/xSf5NSm2fscfJqAq6CSIr4Zhc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475751; x=1746080551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=EpRu/MWjv99C6+uQRHSrzsisKAcy4wvqr1sVYpCEm8VqVhqjWzxLisIcDibCiWh2Gx
         wqCY4ogjF1vbRvADOhGIVqK3ujcfXPOKNWDNcXs8kZ2li0mt5FZnCyQLws1cbd+RJWvq
         9nym/T/pGFCvFUBjRgPo2w4D/P69p5jr3jII7w0rrvn1FbKQ2tSX7yojWS+jept0OeDv
         iWGaITvibnSDdOnI88z1REEl2yZZvrRN7ol5VTs4JjC/boeUIunaTrZ8jV7TJRyckT9d
         syiv+80TqroMQBfxbnPawUbgVScAXCa6qejMfdomRk95wCf6QWmvMUNGYCuLFmRcevDK
         3RdQ==
X-Gm-Message-State: AOJu0Yx79XeYu6PSpNWqGfhR7HiUDnHbqgwVZgiEvxZOB4WMNrI6naMR
	NFH2oof/Syt0at+dfPbnnr0bK9Ix1VphlFm8P9rv6uN0rLI0YpLiL/XWDTdXBc640EJsCgjQS/d
	H
X-Gm-Gg: ASbGncuvBTd/CUfBYyDuqn1j8ooB/ZzKlke6OJWPQiI8MVZOMTBju76HWIt7IHfm7lb
	KPsn+LMcegMk3+nsZPE3aRjh8rFzbUZ5D5zCrjeJuYeBT/geqOSVqhefjaWocc0lAEiYirLgBLZ
	xnacVGQc3aG135MBZ3QzdJnGmUKW2wzhesWXr1d+USnolsQxGNaR17MQk1F6afWcF0yY4hhH1Uq
	LNt4HBVYQ+Plot0LAU3HQa9HdDi41UuZgTrFxdMbT/2cqUJ1TTEgZu3wVtOTeA/3aNndX74xfCq
	d8EC1Tf+bccgfTh+Az1HRgqJiI28km42uPiTNJhyJZOgYUt4BUbzhIoYFKQCTsp+0AKXMqbcxiD
	OFIun
X-Google-Smtp-Source: AGHT+IERMp+XWsY4F0x3mSBeRwTvbYJcZ3M/RXSGGiprl/mRX85K/4aqN6WtoEv+WLusrd9qS8Cjww==
X-Received: by 2002:a05:600c:3553:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4409bcfc11fmr8017185e9.1.1745475750966;
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 17/19] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:47 +0200
Message-ID: <20250424062154.2999219-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

