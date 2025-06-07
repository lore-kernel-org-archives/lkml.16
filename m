Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A318FD2FF
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288830; cv=none; b=T0aAa5LQRM5wXCzaD41ZC4bR7k5yOt8VLck5MSSDlGt52eWkFFzNdVdAKKrRJmcfcAR7oFQukTGCm6rQp4JY0Spr3mMshtMbYmEqYO9Wu4PQJ9+qFRSzTCZ2B+YM9s7Y0HZLhCGTB7MMPkFSRyRv2Hek47UgNULBJAPVHMCovnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288830; c=relaxed/simple;
	bh=r/p8vjTholAGUnw7ennp4sAfJrYAwEt+Ralg6aU1yrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HWcekelXoK0YASYYjklpz/dO5X1Jh9y16a5cv/oYicDamPx0PULdeOcL9lgiPB8DAr2NRffe6br3/H3zzZQmFq8wFURF/HbsCr5MJDIjcQuSPbZThMeiU1JpK6XUt+5/T93Pp0bXB7Y0q9ljsvAvPwmET52xO64D5ZWV4po1eHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KxLO8I/i; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KxLO8I/i"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adb2e9fd208so532408666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288827; x=1749893627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=KxLO8I/iZyqOH6fozqXQ+0OUu8Q/U4ZMlrz3/I6cN1oeRNg83QifLHIwKabxh8GOBB
         tfOPF+o4kYlmIq+XPr1+veHH2g7Yseh6CITaSBwC6trBNZ6KIITP8NCemCpW5DreA4sZ
         oPKNoHNFHmBLJ5j1lLT80pZDvosRwqA/4+VgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288827; x=1749893627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn1CB+ZLcGxV8ZFV2HSZz3RsXenQLkjSfas4c7S2PdU=;
        b=T1aBD2zFo5iDnHdC0R1nvrdHsRYoUOwrBX9KMvieCKQbLpWNjrMIpGIOkrMWc1tmhS
         zIDwLVe7YyIIE7cmvd8xoKhlIJ852AuMiS+Hd+5tOUE3KmVB0n6Y06ScOISkvtUg4uOw
         U2g/BHbLkdtXlKa41KznDwOydyN2cnv0Bv80oTaQOqqB+4Dx8L9X1rBmGDf9zgFfDcrd
         VbLDunj/w/EoTluouTZNejvFT8STJKD4IdnM0csKU59luWPPr3+/gwEkqtxG3Ma6p04s
         M7xlj3Wtru3FJQP/kj0QwxunlMOZcjtWGOk3tEll24WWRUj6BAkk8w49fM3baJ/1cUWs
         qZmA==
X-Gm-Message-State: AOJu0YwkA8/r7uAMi5x4DYBqGPwNG2Ew6fA2VwaIRau+ItGf6BBf2iWK
	8nbp62E0DCTZ8Zwj7QnZnO85r4cdP/qPv+SHbMtcX24jGCiD1waDdx5WIYXYWoRKkxuej/qF3hS
	Zxs4b
X-Gm-Gg: ASbGncsh82+NONfdArz0j4Xcu36aZ7uO862CriWHc0g8A+S6vPCvU6iy+JCZEYKEIBk
	mCG3mlYANCiIJUnxnEIpGipYAe+vvlNx83DW2F6wdsya6XcocwWFf+jhH4HBjjB3naRXxQLvhtS
	DaH8rlkpnZ/pncT48nRTWRsSSpPulpC8iRp/kcsLGyKfWmsjwblZIGaO3vMkQqwLb5UdzbC65ew
	PJ1cpPaZpRyVd+lld2hXhLBH3C40y4uFDFc3LHb2P1002Cw38Bhy0OhIS1qxUmbFhvVpJyLQndt
	m2XyAHMnkbB87et4tZ62IeJ3UiCDkqMhjWdYSXXDF7Q0gABuX5H5qFpG0aX9+qHyUzRXPZ8wiZt
	E0zFfgE9LwSB+hQ9C/4oekBwjk9d+qZahMZXbTZBBi6s1IWZJ1P9zmlaaEjGPqy/w3y8mYzfGqj
	pxRGFwrB8bEgZW
X-Google-Smtp-Source: AGHT+IFSjDnmW2EWNA+L7rjZYf/CeSyJkQ7tNtchDLVj5RAdGtBJa7XPtmYoEbrLf4khxRuwgaXdPQ==
X-Received: by 2002:a17:907:9491:b0:ad5:42bd:dfab with SMTP id a640c23a62f3a-ade1aa8db96mr547985866b.30.1749288826712;
        Sat, 07 Jun 2025 02:33:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:45 -0700 (PDT)
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
Subject: [PATCH 00/10] Support Engicam MicroGEA boards
Date: Sat,  7 Jun 2025 11:33:12 +0200
Message-ID: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 306 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 164 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 362 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  96 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 946 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: bdc7f8c5adad50dad2ec762e317f8b212f5782ac
branch: imx6ull-engicam-microgea
