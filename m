Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D83269D17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388207; cv=none; b=ufBx0Tp5Ief6mot5JNcPmQ+JSnrSOajl+b223oBEXE93HDarzzOFCqDL1Ax2JIACuEDXCR6cg9CTp1Cv/8ZMUHx+gktc/JbEcIyTbs58cD9vozksOR1ARBazrvv0o+MVDCseSXffyxpZ78DdW0i9T7xm+YhCwhBjKZgrj6JgIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388207; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AG1U09MsmS8hdqQRfCAb/Mb021gVz1PWW8M44iwp1vYvguVpxhpubtcvpS2ZBms2LUBQfI26NOEZmYv9m/XTlMwEiAYVs20V2XiQ7SKUg2+XnPSYFRA1DYyNM13FlPyIu3+9gF8sq5YATO4pifezz+ud7FSkwvs0EA0Z/0EgA2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KLCB9KX6; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KLCB9KX6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso986573a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388204; x=1745993004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=KLCB9KX6r6o957n+xQESPWLdVV3PHVVIOekAlCvLhuKm0Hz7U6jcN719cBB3sv7NOQ
         8FsoiuFksxx5n4VyKCttftr9EnpY7qzc4Yb16c629LKio3VRUOzizFiDMx2x/Kl8wLJl
         dbHswO+j3+qAvVBlSFYDpX1mA33+VgHm7wdTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388204; x=1745993004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=mSiudOqekKBy08j8HH5aW8be/+74O2F0Lbe3FzWKKI/4JcdV+xcTrWMl+YJaX7qpqj
         6QQU578WXtv/c1IwiMXPFlBRMruLEuOZyS57vO75uM2UvW8VZwLZxWSlyMwqlJ44aRhq
         OMKp/1uTW109Od8phMGOzJfgG0ZghYQVwMuFEYI1i1bKdeUVgcZfy3WmDUkcGNQMnnvV
         GaWaOx5ssT1lhbOGo1YTb/vYWt3vyuHzPq2TjXQWD9tuwDGyOFbetHpDALU3ChxG87en
         8Aa5ftVILsjPQfkFmG2SCbE0SwLsYbq9j0Edi1EK/pS1xLsTISCggVyEMcbAEOLoqKly
         r9BA==
X-Gm-Message-State: AOJu0YwHzluS1lLkf1+ekkcfifETlorU5/tqHNlg4YUYbCaqljGLZ/Re
	QatzQpKspRfKjYP4IbI0g5Wd8wyIfG17YZmAAmE0r97zJ0wSpWAu+GUrDTiR1B0l0NErrjyKu3F
	k
X-Gm-Gg: ASbGnctaM19p/k3D0gGsbCr+sl1Gg6ovk6E2fczVo4TCenherlss69uPriq6w19xyYn
	gwSmPdD+lKHNi+LxGD2twhEYK3qAUjB+Y+pnfVHMk1RHHcLVV2iIVGjzd0PoVAnlJ/pQRv6G8dP
	WyQOp6IMQ3QU0PWBwW1tLJyUja+puByhX5xjr1R/Yw2y/UYZNPDihzys9/pUlq3siIAEONzV9Wy
	Qq7a1guBUwrZiuDB+OG4bb1A6pkHeVgyFwbP1Cs1jqZF35xr89AgzBjxab9H+D4NXTTXqt85Jda
	bpMl+i3qC43HTgW+67AmdvasNvV+7kvo2G06PANUND3I1nKTSGuTYDt7VJViqLHkdWntaZwpJio
	CE5CyqK6VVgi821M=
X-Google-Smtp-Source: AGHT+IFZSf+bG+KI7r41cPCeoQNA0TACINpcw/DiMJU59t/n7F33j98DIG9obiHLOdT98I7Ur4zh6A==
X-Received: by 2002:a17:907:1c94:b0:ace:395c:124d with SMTP id a640c23a62f3a-ace3f559e71mr99328266b.25.1745388203852;
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:23 -0700 (PDT)
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
Subject: [PATCH v11 17/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Wed, 23 Apr 2025 08:02:34 +0200
Message-ID: <20250423060241.95521-18-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

