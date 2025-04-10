Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CB1C8632;
	Thu, 10 Apr 2025 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246783; cv=none; b=iaNmb2L57c+E9Crx9258/McSibTA9k2hjLkF2BHLbjfkcL2mLAbCKVb2cCv0TpiiVCOlhDdkQNwFZspCZ3qvoNUMmOqO0jTW8kPmU9PwxQzJ1TeG1kqcF57ea7Cfl2eI03/nV/VY4awlRqmiTZL3u/gBgxjgDzgBANmrinqxjhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246783; c=relaxed/simple;
	bh=DlUEQEr6eNEM37F6TrBK8XujA790jUwUvRA0/st/S2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3yPernJa+Ddda2TBC3a18R1/OaymIT7kGtRIV9TGsd7xov/dl6l1RiFfrwCd7+bV3i7ggpJwUBZbDgH9iR2/z8DWEVJVBpe09AlQc2O7K1sIdDFDtCea7K3m0DQaLzSa7/Ii6SQDmVx9B5N8bSK/MtjI2CpnNFjUOnud/wWQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5qmqhJD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5qmqhJD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c560c55bc1so31396385a.1;
        Wed, 09 Apr 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246780; x=1744851580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=F5qmqhJD+p9kJ4hPupOpNInNouMOhfnxstNBlDbmDJVQGBZ43he/RKLDduhDUTVoCb
         lAXO0PhlObxW2RXHEYPaGekMZ8lpZSKHrmR3D/SbLwnzlvOk5WCI2CA8+vZCH/rVvX12
         OCaQHHfG4duvS3iJOyXY+qwGMRVwcG3IumyGX2PtKA8ydHWSWg68PjnE7ZVhfowsN6cq
         T5XzfRQd/fWwV00gbXNzeDiHhzJFxHEnU6paxrH997oEwXAsbnEYWWFIdvhvGlxk0Tvc
         I+NyQ/mrtFmr9n7+vJCWURzPHLl87ZlIS3ddMxHzBsBJH6A12fysgnvQE1c8k00aQjZ6
         7azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246780; x=1744851580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=Tre3hzgCvH/k+SAymrUja+vakpMWOAZwMAj0s0at4ufg8kLWCcm+FUM3zvdKPaiMst
         CtZ7TG2FSg23R/5eOWAhNLwPd/biIMJ63pi3QvXdv90Exf/lK9+ZmN2+M+zIzuKUb40M
         RhgyYAyNpdXRiX6Oa6TZNILzuDWrpxVeDg+e8cqNh8Fn4lSmUPVIs51j8lByOhZxEdK7
         /CYe/Ag/BM58Vxap5K84MP02h2gQEEpCFxmtwu3tEPHsDvFH9AEKAk+P+PuahvlTwN5m
         BnbIhdDpxucuWvpSVXA0+SGspvurj1dIx4+PMhrkG7Bwi0BvfcDZL8LfYm8pXl2zjKKz
         j1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMBIdiedizJ8mOurFygo6O69fPQHBPs5pxZeJTHs+EM0wGpvHGup8BeyDM8kF2bUZdYCbk9TmwaZiI@vger.kernel.org, AJvYcCUVPg1IWVPjMH1oFTKaT5ymRQ8PbIE4YhmtfUw4dFHm7igzxz9Pm1SFTwiRz0e8KaPv9uJ0hMAcqmmbpg3A@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZ4+chDs05RMBt88QCwXVdNybXJyQjyB06FWDdlP/dK78MnT+
	FPSwFY0Nq6yCxgkZi50Lyd2HMBVs6GuIJVpUbT6cFTQ3x/c39kvB
X-Gm-Gg: ASbGncuRkV4aoMTex7cz+/JDPyCH03DQkCdLvnDtHVvAB2Ee26ZnRmx3/lXwgf3Bbxa
	5CDGR9NA9wHbebtqnQKHYNtwv+v+QwpZlCI5JiVcVxY04g1JT9D4inXM4YeZX6KOQiddLYRXL9b
	XuJn06XWeAuh83MK5As38E/EieWhrcPi1Qo8UQVF2J8E8NjvyX9H68foQbGPiMKj60KNrBXdCci
	yJZcGHat9RXDQIcrVtpDWmj8b9Zpzw/ywuz5ZOgTsFVbUFpz+QOfK5Qokfdx11cq9MIrnejj7xW
	CVLBEv8DArrWGXVBvrmIV6X7OBx0Ixp5sYMzzJqr/4OJ5ggpTrGj1KFMxsKBE8nE6M6OYVaJJVT
	/QY5ZE/eQSPF/Amo=
X-Google-Smtp-Source: AGHT+IHMaFesdbwBQ/9S3gzd2hrnklop5LrX3XvIYEQehAtXNRnm2BUKFiblv/IXgjxmg3TAsEYK4g==
X-Received: by 2002:a05:620a:3903:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c7a76bf77emr153611685a.44.1744246780532;
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:02 -0500
Message-ID: <20250410005912.118732-8-aford173@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..8d4d1c86ad71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -235,8 +235,13 @@ eeprom@50 {
 
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x51>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

