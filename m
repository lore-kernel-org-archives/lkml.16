Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805C3283FC5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434394; cv=none; b=P2cJhd4kdfiQxPuZJPrn/IaV/PJhExik9ilGPuTtfwupIwjJkrzUXOufiw/Y0/VCz2+gfo1rzfhAp/GX1dHPbfrqMYNj58mhXg8vm6/Jwfb1dlfut01EXsKH4GtjsX8g/2XlhxQRbRljOqs2XOW+D492VkvVwo2yMNf0TnMl0Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434394; c=relaxed/simple;
	bh=RMtFUse+IKv78RNPdpuh1ai7TKuWgiCBZr/6gVgYYoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=loacw/Fow0jb7IE3Dm1n9kD8oTQnnk1RcMT+bxiufm4NV1OhcuBLzGEa7ZotHXW1DJ+jMinas4LLdW8DFQ9CBlCvPAbjc6syfpbJZxOoCgN5wn4gdPEl6p/QA6ViJUOIDhMNbM54LV/X9KpUdLuf9DqWUq0Zx2zSTIqqsYGA/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=T9ExcSXS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="T9ExcSXS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad69e4f2100so662319566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434391; x=1749039191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=T9ExcSXSztrgqI0DbjkOienfTTa6lisU/T9zkMpnnue6+umYgZZLZSkwwk16pljvpG
         feYuELtIniJNHISdC6VRdd9DgbHu6cH5w+pbIv9tbWFlVue8q5AKChralKFnGMXzxMTY
         UH8M9u1CAxd1ib2wVxplgJahY6HNy/sLwCQ9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434391; x=1749039191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIm5zjYKMN6OFYzQuz3a5OKGZSsL3cGIU0/LJYInxwI=;
        b=VTw7c5fIyz0ewjcXE/SwFyy/R2G0Hd+o7naFsZTOOaDF0ByY9azymkqLUQgBRgpp8u
         +sSM8bP3Hf7GCRcMkUnssdGQ3tJJVfCMoks4why0tp3w/b7GcNAOTKVfHK2cqDn50apy
         opaAotVk5PBETdP7VlFClQBn+n5XfUap4w7oxWvruW+pT0Sl1M2A8lsVHOfKRLSNtqOJ
         v8ytXhbqjkiZJyHSMK1wcshWVrLW+P5JbwJl/lTrLH4iYBVLIrX5/MYrCvX4pkBiicbZ
         /vscNPoqyYV3XVVGBeIk/tErLu9pHL1ZPzPSUD9qrLbTNjgli8U4M0GvqYLlDCi8TKS5
         ExCA==
X-Gm-Message-State: AOJu0YwE6ZZrFSePlLr97Bjg6ciej5wHDH0AHp1IwMyHCwdfFgcMecEQ
	AJ94kdNVpS/h9u0tp/6sztP04Zk56uemGQzrrb+WkYatLriYpKbrBJfbcxdG5avdvaXakGNnon2
	pstj7
X-Gm-Gg: ASbGncvAOiLGPcnK9lDaqrGx5y8zQjVkO/jvtb5QjJmjzzN0zXCELBMFuPwwvlAt3MQ
	Fg38va+szznuocc8/ReW7CtnIlWVAF4oD8JdY5bnegVcdj+tC0PZqh8y4LezlZ1bRq77UdalUQZ
	clJEcuIc51EI0UV0VxhZ9W6/JkdAUixmBI/1PMDFKGNdYKqR/9FRztTA2RoK/JQOyau55Zu581i
	OI6SoQMNO+99q2HzbNCB8wQLkyyKRsCXzrmaAmHi1C6jqc6yr6aMThJLW2EG+k+zlh4APGkecIG
	YHiGehqab8OAK41SAMgXv6C4mkTfQEDQGphrqBOgnb8kneF68sGNm7ncoIgxeOZlQcDQ4T/GWbL
	Nl6gxfPJk/dWb
X-Google-Smtp-Source: AGHT+IETyf2GSBL4as/yohckfyx/K6gSToAZaD2CCVz7+dNiszWCRp1kQVLr9GgDovIvyA8Dl2hlzQ==
X-Received: by 2002:a17:907:608b:b0:ad8:91e4:a91c with SMTP id a640c23a62f3a-ad891e4ab51mr577513966b.29.1748434390436;
        Wed, 28 May 2025 05:13:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v2 0/4] Support i.MX28 Amarula rmm board
Date: Wed, 28 May 2025 14:11:37 +0200
Message-ID: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (4):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 303 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 6 files changed, 421 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 33f410b0eaf4ebc3272720b4a68943a73a59cb05
branch: imx28-amarula-rmm
