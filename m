Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C71269882
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388205; cv=none; b=dc9m8NVBuB743KZMhHKtbyAnsajq+qe7wP5SThrDtyDMFO2s5PbdDs5iKkLaXJ+slZQ7ZjNq5tBd1giwNNu5NqAzrcH3gPdvzdPpVF2eRvFCBXL6gMQZb+hPM2kkY/XOScfzxLrT4Ip75Ff7Rk/n6tP/iuY0/MiX5eAsxtEB+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388205; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGtEIVeYZEHmCCn3LSJxv40ZnUtpWSQI5UvMPHk+hTbfMtX5U0qo9/kHtSlDqGPG1J4qKykGbhkqvlDBiNhJR3HsnKn8c6KifDc6okleCuKSBuxjQaGaIzrv8P2gxEymClc69QETGHTi3UW71226+DdEr69fLUfEIrkYZwm51ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kugvnls5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kugvnls5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1084265566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388202; x=1745993002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=kugvnls5ymO9YGKYRkVpcs+T+5m+VCybkf7UZbL/cAF1iGUnBKFkHR9+6Ul5DQ/JUn
         P0mgxr/rBXtXAvq15JLk1QPp3/He7FbFZgHxXanzzsjrsnQ8mqb51y4KNrwPcaXYzl2W
         PsbFMke6pt9x652q2K3pQbaTo9ooFMjIzrkUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388202; x=1745993002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=xUkU2hj5PfmZZJ+9tljRu1IwR0mAuxo5HoG0oewwLgLYyhKT8EEmY52KhEyvkd0wTj
         IamkP1aMTU0fZe+OawUvAwwKERX0iY5+bH4cmeFE1GLnU2u/BOu+2gPq/vpzeTgFyqYA
         UStwiNFE94mBKWqEPXRut6AAKKmwhLs2TIqbsfE/3+3Izq8FoUl7XxWO38tuHI6gTJJv
         F9UyQADuDerg6KrvLMSdsc2re/z039TClLmvRRRux8mYmYW8IWQlKItwoQkvB7mawh9J
         LWLSDQYhCXFbBrM0urusg3K42kEPcRc3uy1eoKsv/bU8PVcWA0/WyUFnrmJu1NzjLIm+
         54Rw==
X-Gm-Message-State: AOJu0Yy4dx76h/o/J9JqIDKIU08XAKUOyQxaoQmB0BbGrLxt5aN6bSDW
	lXlKbknYAojWZXpkLaCKxoae0jLBHXeW3V50PigmidQWV9CyN4US+SNisjMhIAsEC0ExZhgnB08
	L
X-Gm-Gg: ASbGncv7bRLMiivfQPzZkT5W2eQtl+DE27OTSvf7ypNFDCBBsJV5hQoBROS7VgZ6Hw7
	ly8WMR1f7kD1vZefamriuvDjuWUwmGAAQHvYz6hlhKqJNN3yiVT3uYGLKE1zek8fYbNPv1madw0
	OBFwvty7T04GfaSJ5VWbPuyjDpfObC5RsxOVq4YOjQ76Fr110uItR5jvJvsc4ttqk4+METFy8ZH
	tbpRvG3nTgit/iApDZp3PFM87igg7xgUdeeTqWZ4DiAkYpJnTwx3S4asQtDYisISGk0jMCAk1cy
	lTC+eWdHPDxaj8nWCE9Ok1SVbyXlbg2IjRSrFn1km8Bxg6+C5PVd73Q4lq57uEgdo6k36odovBa
	sS94c
X-Google-Smtp-Source: AGHT+IEJ56spgVoRyAaSkes0KMlG9QsQfLguHD7mHBCsh2ck1d40hCG4yrSLmlQgHJPAAi1Y7j5Rmg==
X-Received: by 2002:a17:907:3f29:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb74b7f3ddmr1978951766b.29.1745388201594;
        Tue, 22 Apr 2025 23:03:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 16/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:33 +0200
Message-ID: <20250423060241.95521-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

