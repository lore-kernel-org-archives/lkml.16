Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67A1D63DD;
	Thu, 10 Apr 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246785; cv=none; b=FShha9ohgbwGgwwSkXts4+a0o/dGwwYKp4kCxo6RFyZ9IWDmGtdpEdvU8JhDrxfnVHo/ncb67ZlCthMOuUBGSDmKv3RehfCJGo8pq3tpcbE4v+lfWmLTGBQTuWVtGfVqRjHHMh8G7Xi5ix59ZJmw1oraBJjsiZIeJdD5bjLNGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246785; c=relaxed/simple;
	bh=ATC5BQWr41nq+0czBY9pUXOwuR5QyJNs0mlqkPhiBCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt1YHueYUNsr/gT4IugyLCXPJmBVIDZzvbBLX6VSUlxdrmqIfuJv9DHe70j7O78hZULyB0iclzNQcl2pYW6fPabuUIHTxd9xcIdoQxHrGBPkGsmAeV+3XKKOTxLHpLBCuxFK2c503BfX4pypyz9HcBEZf6IXvf0IZ1wVci9W4Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0ggOlOt; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0ggOlOt"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7be49f6b331so33677985a.1;
        Wed, 09 Apr 2025 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246783; x=1744851583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=g0ggOlOtcRgD6aQsmX2ExkshlHdeAk7W+YaEmNSpdlFhN1Q5FrGfOs3IWjk1oMN4tw
         oQDAdFH54qa3KUjMNfYsa9iD7d40kJcy6oR3Jnv6vqyB0Fk4gNv/ekcuhhxu6LBOt5t3
         gLFowKBqjrmGlj90vqVzZTV4YyBSI7QJoma5RDAyue8v35z4O3NcAcvb3tNuICSVfdvX
         g5aMrHNjjSQTCSjFD6YUERp3Ci+hpPIE9YtyqkV6YbDJsUtzTydJBbT95UKUNRk6+znF
         qxjX+Wb2NPSFJxFwmTOAqDL4F09jhT4vkyEqeMcRoV1bs/KwlL6ow+S0GMbHKHrPA1hH
         s9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246783; x=1744851583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21NBbHnJEvc3EKg8F1yzaK/H/yAjd0XIMDAW7xtC5ew=;
        b=ppAK32P1tQe3IhiHP7qxnmjZLmsA0iLNLO/OwA9EVIR6liw8Oa0+RimuWckyzL2aLc
         d0ynArmql4kjB3qVsZ3vD46d+3sG8jR5dF4uoi0I1gX05JtxzL0tMtTAaOyxEXXLpIxt
         OsqqaIRWxV7HxbMUrCjhsSLn23F+BtMC3MmNOHrq/mw2YTRgrjPA5POSgE6s0ClDXFl8
         8V/ZFrVVTooNXy/UvU/Q4Zb3T6eXeA5mcZY+/bKo5tFG3AkSbLlX096YdgM8cxT3f9rg
         zjNX5Ub5GBdu5ABlF/4DlkKyvZDK9ABjcJ78CRtvEoPDb4QiqAPxBRVSomH3RgnAHkT/
         vdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzgR8j2BBoulAD0dsfzAmjIPGKqW3D6PRZc1TRix2bLi6Z+bvQ0z0EqzHQ2HJMPcq1dN2SAmiO5ZjiJRqJ@vger.kernel.org, AJvYcCXbrxbMFFC40SGcMDnTcBu5t2/D5WaQP4UCrTnDF8IAKeOtPVpUnMQBJr3cZNINBp9hf3mUg0p5ei93@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkUznCemePiDN6tFTK4cHY+IAPvQ1IM8PDNASjpgVVTKYAh/n
	/xJ4grxy5Uk50f/+HwawU0sKhpah6x+jpsgxI/f2luM0QKMocBvB
X-Gm-Gg: ASbGncsJFBqueMp1cPabaDBXttMjwkwxvyDBYtzQE1TG3qs2J7puTcv+jVHHTeHmi8L
	bVL0RV9hPmmlyTzGpTBOdeLMmXLswVVoFI5NBMv1wA7GzrJ4UMFYTGoGUGDIWEoy2zsSoNW2fbw
	lNVy81IhtOgIys+hLqVKfyrj9cypK6TJzGjRTWTYB9pe/DRrCWQb3EO6xoThJMkXTRL+433IO+q
	vzyY3ZDoD/sEoQoMC2QhsZ3SvelG4pooH8W5ppeT8DSMyuhjnAdPYjnaWR6klvchwSU5Utf2UiN
	QnDmvP/Qv/m2PXvzZmJ6ZRALO+dtDJOqzybBwYOazBx/FVaAozbEkkaZBcoxSIX5eJDM7NtiHdK
	CP1RVrO/jkv/SuVU=
X-Google-Smtp-Source: AGHT+IGkn5DN9CLotIyJwd+pEk5Z4mTZgh2X4YBP62+cyvObhjex171ZLRHaadE2Sva4HkX98HZhxA==
X-Received: by 2002:a05:620a:2988:b0:7c5:a542:10f with SMTP id af79cd13be357-7c7a76bf8c0mr139525485a.35.1744246782717;
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:42 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:03 -0500
Message-ID: <20250410005912.118732-9-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The external RTC has the ability to be used as an alarm when
interrupts are enabled and configured as a wakeup-source.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index b3692b367a42..987c14d3af9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -245,7 +245,12 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -365,6 +370,12 @@ MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

