Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A702101AF;
	Wed, 16 Apr 2025 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765326; cv=none; b=uXY867HjcKHfnzO80KLGDpylXAnf+rZUHZvll0dO5psE8XzHFq2AyI2ZYkxPRDMVKZ/QOHEibQRF4dIAY8TTn7FCajzAA9X274xUaLgqIAtj+5VwuR4AZwL046slTsUqB06uDA6BB4023xU0gtpdMa9bE6f3ImoPZ3nUL80/W84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765326; c=relaxed/simple;
	bh=2YD2jBYzpPEnztLRYvPwkJtYaviF9h1IlLac7IXBp0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abo0umxX9BCrF38t9U0/XXeXfh3b5fe38/9LLLjdR5dyCQ7G4s5fqRaLhdNHq7TCpyPs+1AdyAspCRm2aYF1ypZ/BQQjwIHiZhsfeoq5i8COf2kT+CE76QbXnkLW5MjzcXdtFgOB+Kw/L96Ekrd0rDykgqLIEjAmqmrFQtFx6zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeKP3bIP; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeKP3bIP"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47686580529so64836241cf.2;
        Tue, 15 Apr 2025 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765324; x=1745370124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=ZeKP3bIPUAWh4EtCDIjv1ZCyyPbkLHISU/WufbSd9QCF3pLxs3Z6f/aAY1vR5dxadt
         dweibjVt00DABbtsxv1BZB2WIb8D3Um+zKkd7nS7FcSi5opBuWEGCM/wWqjLLnIr93h0
         7w2HYaL05MFXqW6Plw1j7gZj0wFTDSuQqm52awUoHQjynDpDH01Q7mPaNkziAlLfbmHP
         7mlkt4dCLPoVyklGgamUhtKlpWVS9IRBjoxY/XP4uRdRK5E8lHSOsG3nKj2S0OtLGoiB
         Ow7B88DskEAScDHDmBCwjTCOdiIlYwZ687FOQUq4wfU35XP054IZvx2hE5V21yYVsa0G
         SxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765324; x=1745370124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYDNr8z0j6kvzKO3dAyJ0NuELH4gcjDFUxtK8W/MH+0=;
        b=YcIePttpSAQbXX1inp3w05ZQGRao43zcuJptRIsUC/CO2tXsS0koe/rYCsNimdzbTN
         7WMPdq2aT2RE8DyoCJ04I/KNL2aiJ2Drosoto/wZHpqRhMf4dE0/WkO6c4xZ1q/BAa80
         ytwcZqoJ9JdGLZEf5a9/3/vehfjMzwRD794juPH+ZA2XHeu3kvL3r0LHnXHzdxTONMcc
         v3o9DhX2omA9vxS2NNiGKtjb1LmWhPGNp1k4s4vtpCzlrUhSDNGQPK35QJdl95VgBHcx
         qkwC3uerOG1hkwLzrzGuRL6Fut4ErgQzbYkkKeH2XvfR+6OlIp10w7gBPBP7H731rbb5
         DM6w==
X-Forwarded-Encrypted: i=1; AJvYcCViDhVfmmChB7Z3DJ9Z6m8T2gfGzyWsLj/AjLADGUJrJd55mD4eugb9PNOoYW7qXfPu8t/P1vuxwuSX@vger.kernel.org, AJvYcCXPRlO2B4SdpS3U9K9EFaXHezxFDKiWBg2+WXBc97qgho/R6DtIO1bHszPpImkt2y6yr2ErnZ/oAo2ayQmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcor+ImJdpkbtGumxUBazlkysN59BfUDFVhhGWCbU8ughS1PZc
	YhfFkFwG9b3EvejR50NR+VibIF5aEp8eAwR/W8zJLllsYqQ6luoZ
X-Gm-Gg: ASbGncvO3lvCAlgd3w3wPNtBiIXcRgkZPS8I/jboENZPOpMxkVOdoEmtEybv7MUfyFl
	yo0ARPvQuYTb8TWL87Q0WNme2pGsJoj9hVmnA8BDwY68G064twQdMW2hOjHxw2Wf7T7aD99ORoP
	6WBOKTWMftqfWODErgKHR5/QEYybBfTsK1whZCeWu2B/Cctwy+A3x7MSauMB7QpBxwpPIYhNA/e
	/mQbkRoMB+v9XQy7HNdmiMahNnNQpOfToXsbdveGs5ZE8OYnhBG/N6aMRfOOsYkoXUEGnysOmAh
	gkDszDGQ6xHiU+bM9rkgmT6ZuL5IDED/WpytUVse3Gzl7OJwpFdKyfZ7B8VIkAw9QxpyCt41NDE
	GVkKB++z3ixosfho=
X-Google-Smtp-Source: AGHT+IEepn+UeOPUMPtQ+Vo5vkRhE7eJ7bdIjEaG8YR8t+Jzk2PtaJNwLyufGdL/vXQbzGFnzLR9Qg==
X-Received: by 2002:a05:622a:18a7:b0:476:a90b:986b with SMTP id d75a77b69052e-47ad3a40319mr23332801cf.28.1744765323709;
        Tue, 15 Apr 2025 18:02:03 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:02:02 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
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
Subject: [PATCH V2 09/10] arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
Date: Tue, 15 Apr 2025 20:01:35 -0500
Message-ID: <20250416010141.1785841-9-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the interrupts and wakeup-source to allow the external RTC to be
used as an alarm.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes

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

