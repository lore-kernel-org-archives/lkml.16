Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF6123FC66
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819713; cv=none; b=KOJsGgUnOXQBm4FUC+3z456ebGWB4ZnJvclGuCfcw97E+rXidSRY1hJsKT6S4zPrNQTlgTrj+AKtGj4njdqULC5YMsFRXZRJRMIDMCEvD4sG5z7bjDl2oUV0wp+0p2/+2ieA8dbTNSTW499b4yQ4ajSXEE6k/KzLcfPKFy3Q/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819713; c=relaxed/simple;
	bh=+tdvos/UqVi6pMAhZ0/80FmoEyTCrLTd9vhGypQS3jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9zUnk76ECJG911i3Ci7NA/pRpnwrXPkyiXF3LdWNx/5PpPD3SdjLITMSZPsStXICYkEeKoyLiCG6Kf/I27hNt1vNp1jMYWOq5Hl7g6BOipXHA477fiLsSOStVKcoLSfw8H64qJRSAQUWtpn7TlsOzxCaWMEQQ1CYlHhd50RlX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RgeWHUTJ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RgeWHUTJ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601ed5e97e9so5574579a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747819710; x=1748424510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=RgeWHUTJTnaSEG9BS5ltx/NwZhoG3abU9z4h8HMUK8KQ+8g9YINqml6CGuJb0B5IPb
         Jq6LZRDblzNRlAvAiGQGrdpwyVxYJOQzbiYAOl0a6TZF1/AEydcQ/nf1Fg8rEkH/B2wZ
         Bzj26ENbXlJ3tFHUwgwzJjAcaDJvO5hoFobHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819710; x=1748424510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Br03zaPymWOmp5DzQkScr+PbTLXI2KHvIOqgBOpOx4=;
        b=ndXZFP5To70jaAybT74c2BNsbETgE/a1yWE2KvDUHvkvpVO4wDjk13vjskAy87kk7z
         s2rRmtd1QZLCHTHWGjoispnbexFEqsZ0mbXWvTMayGrBoIscyHOhbZGfP/NTMhPtK3ZC
         4KCaH5wNyiYn+V6Flbr8YOCGLlsvUNdrL4430RVVwmf1RTEMf+VBgnhx90PSYlp3dujs
         gg/YjMllZpKsZ0Rc4ZifDN2T4M7T1CqeAefsExMvNNAyOwEg2V3UuGYN79i9z9NX/Q3y
         +w0Cuyq2OcjdxWllLUN2cQpp8Lx7cb6R/+t3BoF2hXdDB5v0m4dn4UWtk5f3bUr92d8p
         2u8w==
X-Gm-Message-State: AOJu0YyJ5Pj/zeZXpty5cUTaqzWUwQF2Yg0Se2B3RswJVC7TQ9fzgCrE
	BtRdGVOGg1JHjGw6I8Fuhj8Z7K2Q/EhE4ts37QewS8NdMpuxBbu6HjG86TMQj3+hlbv7+CqgTwe
	7LQ8d
X-Gm-Gg: ASbGncu0+1mWzQPknz2j1KRERqNCsaD6Iwvqo+ZNs1z1RX74oNty4r7E7aJduc3CD77
	/28EkdczUcJyQvaEVqWB+zeXndvMx2Fh+/efPEHxQ8Q3vThlFxlBDGEd2PI3WeaobCr9pBTiW5T
	vABz+2GonbN/T70HYiqdBkMkH02F3hb7YYJFfv2O3E+F8gVeSe1cmzDkCpoUPKhf4PuxulIrqKK
	AcmOrpmscrpy/eoF8q0HZBa7Rq9hLq93I4IZdfe+1EmiO9lNXs00+EEg8ilA/hQL3WvxiT5VejY
	IeTQ6mGW+ABR+LNW6vO3ZSyu8oKUyvx0Fe6YkAkFYZ0voMtC0tU0pHX9O7khbYC7urNVqh8dCAH
	mChcfRciYksjo
X-Google-Smtp-Source: AGHT+IE9Rsd+fMS6VUFvdncItJY6md4j6oNw2IpDZyEuTisqE10/bRSVI7wzKmHIESJJG3Xl38x7OA==
X-Received: by 2002:a17:906:dc94:b0:ad2:3723:6bf5 with SMTP id a640c23a62f3a-ad536b81a94mr1643951266b.22.1747819709868;
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:cfc5:5070:d6f4:1d86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d275d9fsm867442466b.74.2025.05.21.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:28:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Support i.MX28 Amarula rmm board
Date: Wed, 21 May 2025 11:28:19 +0200
Message-ID: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
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
 - 256 Mbytes SRAM
 - LCD-TFT controller
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC


Dario Binacchi (3):
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 302 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 4 files changed, 314 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
branch: imx28-amarula-rmm
