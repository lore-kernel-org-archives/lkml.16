Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70628A3FA
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549708; cv=none; b=ORdUl3uWWnTDVuOgnfbMmyv8wgQS9IjQniToihZXXTG9Rb/GGP8JAkUpLWpI8JETuyh9aTh8p/RkfKKLWkUfmxttM5COBr0WgAxvpvNeR8X2Pku18r6I60hj5hl2FrwUdEpohkntikXXMYkBIoJ3ue8IUSzfdBYprIfSkzA3P3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549708; c=relaxed/simple;
	bh=BBsO/QzFamCFKBviOR6aJuGOuWb7j+QU2IdRMrxiOmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vFWH4GX/pMqhxM9PQsMDjtVvB7rleHqnfYvzkAsgRPQOcLFXi+6fpwj4c+/z0F84KQuk5OAQiUiomXzzJJZF4IltowPBUDaqSkTzjSZENbZvmY5DCIjZCWrM2jhAaxqHL790MHKlVSpK3zJgALNIPEU/mzpk+fxltER3NFqyUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dYB2xKDn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dYB2xKDn"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso5065837a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549705; x=1750154505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=dYB2xKDnT7HhfdCeQazf0v4kxtjPxpK18i7DXE9vsZLtAMEFVZTxopuiq2ofNhAvr7
         Z5ysANZ4wZBPnxw91o6YUlBo41K0M2ObwjFa+gUl4kRDsi5PeGXozuQqiwqB3oQSYikA
         R/MsF9FqFPRGr+2Y9MSDC7rNZtEepp3FFtrzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549705; x=1750154505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNFLgO9kfRuOPSKdW9yn0XSFMUHevRdsYw2FI16nNfU=;
        b=pAMPe8Msy25pxAMq0/htFDMJyrNBfkUmhayUDTY9wLP44BHkADpF7xIuPddSaTxath
         N3N9j2LLRkg+mGVnv8537TWyTWLWnYslJB9ItLTPajKtq4U4+fCpfi+N62gGlOUj3ez/
         aLdjDWQdEW3ehq2Rloyv/QI3Y1agPdo4knydSLv+aql54Hny6D1/W24LpdMH2IwcCCsL
         Ich/um122mS16S1F5fz9PH/x1wbNos7AQSNQ7ekA56vztj7MkNRHAvwg25KAGM0jTwA6
         lm59HYa9c+YNoeeyi2ORMZGYZm9XVyOr0ZtopuqYJY00Z6emypdibjdZ5OVvpqnCVUoc
         NkXw==
X-Gm-Message-State: AOJu0Yz8dv8+Sc+puTdm6+s4oEfh/BkMacXzBV0yUc/+0tlCQs5jPyxu
	2Sh/MKvtrSo5XKciV4SD+cSJtOtjw0Te7SBkEA95MFgP1e4IsvNQIU3cDZm/nd5+eW7WPi2al+i
	emm6R
X-Gm-Gg: ASbGncsSFHHiAV2V8lwciA7o1MKO1szn0yBkQajW52y8Z90Jn8Iw+z681VEIJjkQKSU
	6d0Xp13PHJPspW56FBT4s/Mzz0FoVOqEtvXGMQRezeGXq2h0VCENN+2wCmp2I80Pr2F8/awLwJf
	nIsLhtPFvTJq5r/72Jj5DsfgurpeyMAXz3C3MXWPqYCPUAkFu4YswPXDQ/sNEJ3CXI3LVWxM4jI
	DI02Sb+KzpqoA4B+0Qox4YMDv87MIOxCWtHP18f6Y5U99EP35ePgyMufCiZ59aDk/TGgSbWbMeJ
	81fHQoF9N7TZOncN1xj/MYc2p/P76rZL8hFlt2R+aj0lLkyfcomScFecWBWA+hGwov2My9yrwyk
	49tQLI7EjOI/xNde6d1Ala5sg/xc=
X-Google-Smtp-Source: AGHT+IG57PZ6Xm8M/Dqr4czCnzfYZyTYEAAg9doQ7EidKIaUDhSXFwVRX2wpqWFLIhoaLQHBuY9O5Q==
X-Received: by 2002:a05:6402:26c6:b0:607:5987:5ba1 with SMTP id 4fb4d7f45d1cf-6082d9b3428mr1770004a12.20.1749549704176;
        Tue, 10 Jun 2025 03:01:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/10] Support Engicam MicroGEA boards
Date: Tue, 10 Jun 2025 12:00:13 +0200
Message-ID: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.

Changes in v3:
- Drop extra blank lines from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 938 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
branch: imx6ull-engicam-microgea
