Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F56D221F06
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211122; cv=none; b=MlYwZWko1Stz+tZHCaJ39rfFK/eb32OdxrnqGaPaDHNwg8OFxjNrr3iEW3rdNuMmu5qOKGAXL9gHNfncwcMF8msX1rdy78NSMEZTXZB+31MWD/10Zg9zUJccyaOjoweuQQEfNpkwXdrlO3REHMqdzxRhDTbrEZm1g4BzB+iHk2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211122; c=relaxed/simple;
	bh=7oQJKT0hR0eKb35E3LfSQrJKLp4aFEfnTRpv18T+szI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zcih3/xR0hQ/VY4GEcyz5MPTtF/cuKwDmFcjxfubhxstc5EAB5rbkLmzm6YK0mmGsAdxsPxDiPS0d3TqKHRsSzwcuBkTl8oiQ8+EJa2N51SapVHYaKT3fQXUEjuXE9r9Ln35dZDxs+1BJRogh7OqN3yeCW72rktHwBI9FrjbLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WFsPp595; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WFsPp595"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso39990645e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211118; x=1747815918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=WFsPp595Ddy168iJh531RDxNYq+IGIC5pdaZlq+QS627b+m/pASLEI96kliHYxDk0E
         +aSW5H2fZv2FgR+jZWHBPGwcRov4LGHaT13HlH3IDYIPspAjouNGj+A7O+Pzyw6KgHmn
         uoFuHKMmfeRjt76pBejDRb42F09cPfWKAs7OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211118; x=1747815918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=owSgJl9L6/bm0502+aJByquBjgN5YnJzJngnWmM5U7En7ySKi1iwpLbTxRAeZSso7P
         80n/XCHsPE0keIQQLVjWoyxCnNg5xNHVmTu9VhxXOfzPWiVXzTuG/eA+GxA5nSaqQ+oU
         RomxIeQ1q7/+aOrVsrhdP15W8p/WBWF58z3bG/f7/U9EoSBzN2PBRUN/I5pI9ts4r3l1
         mBUYvb5nRON0k40ZL71685TA9TLkwfTKmYws3LJgp5Mq7FpVrUphxn1agd4GzDFUTpQP
         rjcSv1pS2c+pVPyMl6mOKcPor36pNhtqxpPbCosv7MGTqjbTrnIKgIdcD/LLsyXd1wrH
         sUZw==
X-Gm-Message-State: AOJu0YwK+43M7b86pkuxBA193LidQKH8sbNAI1sr2my57nWVZ40BEdp/
	V6ebqV+t8OUpgGaKRQC+1M73uNUk2DhSMUuL4geEhIuJbg6dzGzey3zvuFO7DWd1JQ8qs9DeEl/
	JMrQ=
X-Gm-Gg: ASbGncshxmRi2GSj0IuAZn1mSM3Acz1tbZrIFCsAQetNukUVqVh5JXBfu1SdO/8UMba
	iPq3kAIa4/732Mfnmz1YfGGS1JYeQOLUJCksOtHQLpYgULrrD2NNLnFUb6oznL4wL1cvWu/8lBs
	eZRc8EGXgdGQsBZ2oAVDgvFGd564WcvrmNrC7AdlKJbCMTQoueOVRjkJebpE19T1HCsF+Bb9Yk6
	8PPTV+h78quta6T8PDlXYy9H+LsgdXkvPK9GQ7AqHKxQ54IvaOJVniMdyW1rT+CN2YlwIF5mLO2
	Sa6ky7vs6IBe7JBFqpkd4cMFjeo/fSy1q1A7uc6svrv21erYq4yCwkM6zl9jOgen9//IzqsPSX8
	wu5MrjCSchxszWsXdSUmS5tCiaIjfIO/EkT/B2v73f+U=
X-Google-Smtp-Source: AGHT+IFleRd326SrUnZHoqkzu6suoQz94DWWC/XeS2n9NtmmwCPboKZ/eBmAx4ZEBG6Ntfy5At/YEg==
X-Received: by 2002:a05:600c:a09:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-442f20d65f9mr19154735e9.13.1747211118349;
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH 5/9] arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins
Date: Wed, 14 May 2025 10:24:59 +0200
Message-ID: <20250514082507.1983849-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simon Holesch <simon.holesch@bshg.com>

The UART pins are floating, if nothing is connected. This can trigger a
Magic SysRq (e.g. reset).

Signed-off-by: Simon Holesch <simon.holesch@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index de70cd3a392f..fd12b97525d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -386,8 +386,8 @@ MX8MN_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x040
 
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x140
 		>;
 	};
 
-- 
2.43.0

