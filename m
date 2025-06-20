Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146E228CB7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406794; cv=none; b=dZWufJL9R0ncnSIteAfYGBaPieDe808jHRcyiD5ngZdbIsUHuXvQ0NMw30akqULSP3gBfaUSTgyScQ7eROLBskmwg5suc60KVMEQrJi3QqTYwlrzWDdSAGbu4sljAGJ+++8JIhrQmF/Ms6UruKLe5BXPp3XX0lLQMGStzpucrwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406794; c=relaxed/simple;
	bh=KnTtT7H0BDAXwRML/nK7OxrH7+Yn6paLBhETbSoOyfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZSeNdnLFRHJvf9LwZVgnCzZ8jDzBWLzca32LAGLq2jh20eF3y1QfCjCYzbsJgwNw6TixJn1H9szccNoAWHE2pqx6XWZLkOBZ6EhnYUefXAcn2SBxnq8qHTaURxXMl4UdXorvOf+UeZJgqNM7yWTMd77g+xxOyRezsMqBVRjcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Tek1Y5Ec; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Tek1Y5Ec"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453608ed113so14646765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406791; x=1751011591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=Tek1Y5Ec147rJi2m9BtQcujHPuixf8oYvA8faTq8BVHSkKxOLLjFunpuC4qGUvmhYa
         iV2Dt81p/NKuhdT9hwn/9JQ78cYwWMehS3PQaC+AbV4wn5SMK7dsDGVtlniY/cl9rhGp
         qpZGD93AVDa2el/l/6eHs2Xsebc8aEb9JFICo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406791; x=1751011591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2eNUIeZ5UwiRp6oWlkiO1U+c9h/DGgR+XfrLwmwISU=;
        b=JsCr7v/ag/W6GcthrCLZkWw/GtjKHfpLTEpLtyjOBl49cqvDnQxMdqbf4nhYH1+gpc
         E7ZoWUykPRgJHvJqZMRSM7Jzzv1B93Oksg3exQxoXe403BRVrwUOCLSA7pKNhRSajE1G
         3udxjGaEHLiByy81mlQIQSySnM9B0oP00kKGnbHXjJ5HXulvzwSa+2e0sVTHkunn7sts
         cX3GQorO7z6VsyttBcTUipKf2PdgYq9jy/qRJR+K1OtnLMl4txm3KxzFGbVakWCtCSVU
         05bSUKIpKqfz6oY4DEyjkufzB2t0uYW3pZgooaFs86xcvQCO+qImuhTDYSVe5dcp07tI
         iQCw==
X-Gm-Message-State: AOJu0Yz6KyUwm9Xk5aSRTFLVIw0kK4MgrEoYfRWEr3vgAjDMir3lYCCz
	cOgj1Sp75WrtMVpNVgNhsa1R3mLBHBLbJWgaQYG4EMb1fCiO4tHxpvFiQTmsWmwie57reZZQzo3
	Yv/09
X-Gm-Gg: ASbGnctyck+PEoxmVI94hRdcpDoybnT9EFMMAgnE9NQ5VEL7a7u1LB7k6q7NE8qiJDP
	7KjhZ4s0iFXpYv4w8Dn7h14pRhOm4pv8pHgW8bya05GzR2IetRdj2gfJbX4Ht+pk2Qbt7GidLMo
	Dxz+xH3bF8hy2bimVI/aUkmGVzVHVgfUOW+mPjyBCt90aqbm2pGxSMPAM1nRz7IhNIz+T2H5DLX
	ee+VNyGRkBXA+R6RvqM45jHhZ54mkql8yTJqqwpf8PdEZMSdxilt4Xd7g9ofQCZQbCvr2ArQK7B
	TjoQ076HD+/ENZxD89fjKnS+7C5dLlJ9F+e+UIit7gL3ie1BZ/uk3mS+bDjjNJCZd3t2C65ra7M
	yNKJwhGguy8TeJI6OxUmt5ffjASdrqeNtsiz6UDbKs8Idc/kGY7nc
X-Google-Smtp-Source: AGHT+IGex2m7oBS93TBsbAaINT6CSOEuBu1mC17t+mWbAEvl99cHeitnaXtcBxitr8TCel6t0Kgqvw==
X-Received: by 2002:a05:600c:4fc1:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-453659c4832mr14575205e9.6.1750406790643;
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] Support i.MX28 Amarula rmm board
Date: Fri, 20 Jun 2025 10:06:16 +0200
Message-ID: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for i.MX28 Amarula rmm board.

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Changes in v6:
- Drop [PATCH v5 1/6] "dt-bindings: mfd: convert mxs-lradc bindings
  to json-schema" because applied by Lee Jones.

Changes in v5:
- In mxs-lradc.txt:
  - Fix deacription formating
- In imx28-amarula-rmm.dts:
  - Drop #address-cells from gpmi node

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

Dario Binacchi (5):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 5 files changed, 315 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: fb5103df1b24f6cf8bdb333b24bbdf45d4186b0e
branch: imx28-amarula-rmm
