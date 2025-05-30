Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD621D5A4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603987; cv=none; b=pQoNUPWVONfsoSQ/igfa5P/F4YNDVSXGYiDQbcy3BcvFha/nQORUVIgU2tWLaa9edCoRb6RgI1iJWUlYKASXSKixXUDh72BZX8RhGtTOAaQt+hATjbgOqUcFMdwlPmzITEqbhCvM9pdcX9D5jztYbpa7hHYG/2cZdn5S5ZIKOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603987; c=relaxed/simple;
	bh=63UqaY8eo1/+MF5TIlcrSnoAO41a1hgwgM6ht8qQvFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+cg3ndf6gG6EES9QEMzmjZLrIH3WgnkM/5u+pevGIijpmCqGLapjU+Pcf+v5y/hAoPUzArt/z1azez5WFYkJKMfBNMLcuaNJR/oZtkfxVZ0vpscLyp+bT+ZUMNktxBOPHHbNv/sk+paBvsNXGZBryLUvBKUcXd7OHe8zq+XFPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jWorY0ZH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jWorY0ZH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so11794615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603984; x=1749208784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=USDzPWtwfClWp+wqP7p23s9TnEvWK9VkLl4tGpc0TUk=;
        b=jWorY0ZH/zS8Ls/jGVG9FKanOq/kN3EEFQ5Qf6XhS1aIsAXzecnH7jrfPVWv+QzHaS
         GVWPYEAEeTM3a6im1jZPzfJfCkDQbjFG/BIuESEa4WHCg1Q11mDhX35Zl9tyXR0aKM70
         zE9dWcYuPrMinVQqb4cWWoQIvstYJNZ+eKgFampZ0ZToRJi45TfaarCG3XneIAAbzEtu
         1YnkZvKUKxImO1PkU3QIU1LcSQDEW6gA97BypyLY1fUAtNQpKoxIE4sploUguyiNyuE8
         tuFIdbT41K56KKo+AzKGMIK6Nqw1sRiffd8sC1meEnOm6lH4LDWRl8UMWxlI0nfoWfxS
         4+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603984; x=1749208784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USDzPWtwfClWp+wqP7p23s9TnEvWK9VkLl4tGpc0TUk=;
        b=iylGGkpxiqvA5eqGJgMY9QmfGPIxgVDzGKoH82rXxQG4lmZaLBMx41g3w+CyyzC/pZ
         hn6gxJn2VAOHTp8gP9Na9bwCnwfIF1vjjNF3l1jdkZS8ROX3ncjr0nCOn/X7JjQ2UPwk
         3Ks9FcWmW59ar/uQWnKx2MwyimXostpQgc2LgxgMoUGYD0giN7pb3pthDRJ9E8L5AdFs
         w3rwcDegUWUirkAnRztiHOPwoPFBGEGDEy0/wBAYdwVAB1e02gKDlzN/7m2GWf31JLRm
         fLYMgYcvPXWGbDcNMmx4Di6GXPXrwoGyD3r2jRxrQFhyMloYO+IiG5QBXvPMdrC4NQWD
         4pdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXhlWQmRA7Hv7j+hDARsNBZrDTRiMgYbMIowVx/EyD1I+0nZFwNZzmu9DzDRZ4Bf2a6sCOiy0ifi4ZRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycA3DClEKTj2h6uWHqYIVSPbX46nMr1jb2ueZp4arQ5LCSvSct
	omR8dyYj+5ubKQUWepXG8cZqh2CIDjpKXa7JDaogtLmKPMr/9t2TmZPzuuRfaWyIrrU=
X-Gm-Gg: ASbGncsQiUJFP+3mH3u8eHsaJWepXxOlwb7KXy1//IlKlMox74UymrhE7yg/z3iBcIE
	KBg7Z4iTMVzxat4uJ6xfaSQYydKKcyXCyRXXGip9C5BUsxIMLeTdsXMiON9nzBoFDF8OyvFJnDo
	z0oNxX3Y8HLztmq+OR+3rcEH/Rtgihl28z9Nw+xEg2+PlYsU0cuA5pAEBdBKI3omIoCrDYQZ/Hu
	Zo4Kg1whmvzcfzUGxO+7Jy2pBzxV1N2L8LDdHsi3uLdIlSgG4Ygvtd6eXRaIiz7y5JI3+LIqS/W
	J9aMs+iYlIeacUZiDxcsQg7ZKUzPvZ/YBj2tu689nYTuaxY8lSvUCcX6C24Pb2aHRY2A5oqlrWo
	noXYg/Q==
X-Google-Smtp-Source: AGHT+IEbp0QcHOdy/Wep78m1G3gFrb9KOos/vWXOjVVBlX3y+lsRN5K2Os1MzG3FOYd4Bwb4BIL7Jw==
X-Received: by 2002:a05:600c:1c96:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-450d64d63d1mr31026995e9.9.1748603983832;
        Fri, 30 May 2025 04:19:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/8] PCI: rzg3s-host: Add PCIe driver for Renesas RZ/G3S SoC
Date: Fri, 30 May 2025 14:19:09 +0300
Message-ID: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds a PCIe driver for the Renesas RZ/G3S SoC.
It is split as follows:
- patch 1/8:		updates the max register offset for RZ/G3S SYSC;
			this is necessary as the PCIe need to setup the
			SYSC for proper functioning
- patch 2/8:		adds clock, reset and power domain support for
			the PCIe IP
- patches 3-4/8:	add PCIe support for the RZ/G3S SoC
- patches 5-8/8:	add device tree support and defconfig flag

Please provide your feedback.

Merge strategy, if any:
- patches 1-2,5-8/8 can go through the Renesas tree
- patches 3-4/8 can go through the PCI tree

Thank you,
Claudiu Beznea

Changes in v2:
- dropped "of/irq: Export of_irq_count()" as it is not needed anymore
  in this version
- added "arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe"
  to reflect the board specific memory constraints
- addressed review comments
- updated patch "soc: renesas: rz-sysc: Add syscon/regmap support"
- per-patch changes are described in each individual patch

Claudiu Beznea (7):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the PCIe
  dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add documentation for the
    PCIe IP on Renesas RZ/G3S
  PCI: rzg3s-host: Add Initial PCIe Host Driver for Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045s33: Add PCIe node
  arm64: dts: renesas: rzg3s-smarc-som: Update dma-ranges for PCIe
  arm64: dts: renesas: rzg3s-smarc: Enable PCIe
  arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC

John Madieu (1):
  soc: renesas: rz-sysc: Add syscon/regmap support

 .../pci/renesas,r9a08g045s33-pcie.yaml        |  202 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi |   60 +
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |    5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  |   11 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   19 +
 drivers/pci/controller/Kconfig                |    7 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-rzg3s-host.c      | 1686 +++++++++++++++++
 drivers/soc/renesas/Kconfig                   |    1 +
 drivers/soc/renesas/r9a08g045-sysc.c          |   10 +
 drivers/soc/renesas/r9a09g047-sys.c           |   10 +
 drivers/soc/renesas/r9a09g057-sys.c           |   10 +
 drivers/soc/renesas/rz-sysc.c                 |   17 +-
 drivers/soc/renesas/rz-sysc.h                 |    3 +
 16 files changed, 2050 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c

-- 
2.43.0

