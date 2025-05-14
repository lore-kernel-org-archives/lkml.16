Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24552080C4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206356; cv=none; b=Hn4p5uocsyECu2WkonMfk8NzwCsPyWYCHydGd6LLt11oUQtM9egtcG1IOnrU/8nUMgz9GvJkY+Y7ndgDOYnGS35wmN/kmaBCoS8UR7MiZKNUHBVV9KUcsek4Tstmu7JDpoFDeFvxS9WPjDUJ6UJQXfe7hRKiaqgr94PZZehCSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206356; c=relaxed/simple;
	bh=grtG+Hf36RQgBxi3RgtBygizeBbvhLU0VbgEFlTLRYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oT+E2u2ZKUO7LKbEHNDcBF+lgof41sGb/2vLUxZmW7s/Dtd+kCydKi7XFR9JlMVEwaDI/W/vNbCyA4h7skp4vtOqPwMo8GGKxt6xrfIZ7abj+dhhI6N3qBkfYFmnWw76YjWrii9ARbBLpgqGm/Q6XKk+glmRMUhynOVKJ0lpbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=idrn8WeT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="idrn8WeT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so74161745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206353; x=1747811153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=idrn8WeTaI1bn/cTuLzet0q9+OYqNFlEGbzUyvCfC9Cq0fgzY2gmgmzkr24/slKhcg
         fTo28sVuR0H96z9nFWfoKtNUNaiSzgQMx/sFaO+6V2PCs2bWOKHeNfwullB1fhllstxW
         b8AG5omhCRiT3m1kgHuMZ1QD6uTXpFuCtSKt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206353; x=1747811153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asjqK4k1HFHU07fICU4xAQQF9W8B7Lab4LvrCMUtqn4=;
        b=Yuuz3Uq0scEUv/dE1eiZRbLkv9ISVgEHRKlyAKQlXjriRkatc52cZj3XZDuyKmEE7C
         GZ4qjpq8fCgo4Nkd/7qKOns9J+CyNrObFY8opVJogrw4tgAHAr8d01MzN/70vLnjW8Az
         MNuk+quc3wAYutuAidMzeT6uttHSgy/HL2h68hKgx8XUdoINMrO+K+HqjRDxycA66NNX
         4pPgQQ4AZ5L9kQBsgO8HHmY8vQweL+LoBZ/aLg40c2rOqrBBTMbCj13LA7ULPWPnAYcD
         J+0g6MZc7T3wY1hI4+cGm9eB1W05GqO4XZTlnggqQ9c46d4ZdM18hpdMHsmaq3Or60Yh
         zPOw==
X-Gm-Message-State: AOJu0YyR2YdbZDLmUx6gZHAm5NpeIguvq/Qx4/uDNxojkTINSgITSLfN
	wVYEz6XHOdjTLvUWaiNTi1w1K/0KHQmZCvczKkpzdXeozm/ZLU1LG8Krf4oZynTkxHUE7vhnV3y
	C214=
X-Gm-Gg: ASbGncsuXfiqvn3tzwzRibeYiVOg9UDHdOJPSBkMoPvQfEUpSnJVnzGTKJXKQaG6m+J
	6DHDjEogOVWX8PsYxs1KLDd0gE/440fiLVAxXfjGadOzJDnsKGJ+Q8RfyQIBlniVVsuzQ6FCW5a
	OzBNu7/2TCCvXzwrUSN9kCd4G/68eXlpMVa2tkCuAvZ+xA8PdC/yQcgQnX+9g/Wtgan8yjw4JCX
	W+Np+MBSnpni+4SZtskb0oP6qUK4cG+ln+hHPzhZ6FbsBdUpHzaseVEo7gEy6/Lj4nIKDP/INLA
	aBoqLTvii6VxdcX5CYuJ19XxyT3lGaCDAaTEA20XZRxcS53s2y6cuEliPHEp7OOq2Ljv0IXC1B5
	ms5ZZMD7JufNvA1Oy7+4ZAQJv8pCD52YAYmll/tlQkXM=
X-Google-Smtp-Source: AGHT+IHc0QtO0MfClvGYtNmSS0trJ59pgTJOhiVrzxjClwg6I7hvnE7Dqyuc9UcLulozaFc4dOaubg==
X-Received: by 2002:a05:600c:5125:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-442f20e3e9bmr15676275e9.11.1747206353147;
        Wed, 14 May 2025 00:05:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: imx6ulz-bsh-smm-m2: Update wifi/bluetooth pinctrl
Date: Wed, 14 May 2025 09:05:35 +0200
Message-ID: <20250514070545.1868850-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Adjustment of wifi and bluetooth REG_ON pin settings. Align them
to the production kernel

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index fff21f28c552..6e4d09bf002b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -128,7 +128,7 @@ MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b099
 			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b099
-			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x79		/* BT_REG_ON */
+			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0x100b1		/* BT_REG_ON */
 			MX6UL_PAD_SD1_CLK__GPIO2_IO17		0x100b1		/* BT_DEV_WAKE out */
 			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x1b0b0		/* BT_HOST_WAKE in */
 		>;
@@ -149,7 +149,7 @@ MX6UL_PAD_CSI_DATA00__USDHC2_DATA0	0x17059
 			MX6UL_PAD_CSI_DATA01__USDHC2_DATA1	0x17059
 			MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x79		/* WL_REG_ON */
+			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
 			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
