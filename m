Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA99922ACD1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529355; cv=none; b=g8cIuVqoI/291l+bqVkWVWsmJ6SpCDhQx3Q/DCPLh+L3Ya7FjR1iqqjzuuZk0S7dCPuaOXgvdJ54Pq1mdE+bLIr8V6h1xYZQ56kEH8en76hJMpcwszi4w7sL/gcgSDCTukN5DqBAjxjDaRX5Qbf4QZWxDjfb4dxAproeD+x0Wa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529355; c=relaxed/simple;
	bh=gA9tjOLVx8ac1A/yQTSk8Q1ajFXlqMG1hbeiLwWZnXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+Zoi/LjfE1HOUVxOQlA3vrGXACWYbs63MNFYmIlq5M+ZpGpBtMbZFnxtTIVubDEPc4M3fSQgu9IByVXlwzBnDpgyUv6skX66f7hQpgwJXTxVsgnmJe+elgJJBiiLqprRmgz9fxKqIIyAer4aQk2GrRzzpH6G76iffpf3aM80Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dbIK7raU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dbIK7raU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac34257295dso175300166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529352; x=1749134152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=dbIK7raUFStfh/QYdSvDbqIEt7IG31T2++jE2Kvc/slSBXkclUMn/JgB/Rvf7bMVDn
         wUkNVGVjkfnTHEz6DdT+5CCn3pfki0s6YJPbkAUx8izlgaTikIYJ0eRWfI5fqw3pXOMV
         3EoPFyTtnIcWKWGJgpgRwwKeKYMw72SYE4Lk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529352; x=1749134152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzYO3WM+V9HIufyqv0Dcv1pFHm97P39m0ar0LDGky6I=;
        b=T30aTNRZ1awfPWDNVgZXuYibZ68YLLSRni2DiPhlFuE+qCCIRjZAllGoEMpeDWHyrh
         OFtzx8C1PuwQXXwNfTFP17LAGarvatSzvkWyLlMLBqTNMTrxw/6kSMCT4sN3O0yIaZC2
         eF5TKWuKrJEU9FtLVIAR2kXTinSxVByYErj091BWFHQxiqRDMc4cVQyCVesauwLlzszE
         6CmJ8JfFwnzGv/I46/Dc2EVI8C9mQ56524peviJaayE6JEvQmVwExuCQ77wMMshhXtRQ
         k7Huwio/wZr+BrAPsp9q8C0AMma4jzRBUcauWOHGUgt9iqGuoDWHdawBkxJa8jYqkE5y
         dnWA==
X-Gm-Message-State: AOJu0Yz0CqoJrrsADLQWuvoRBGr3EirenEDNfg/ROUHxw2MwOjZGoSmP
	Gx3Cmn2UqeYzFbxu9BME1HgiOAE5iPQBJShkdV08RLWHGiyMZR7fhzVilc3zEk/Fi2djds4Bcka
	YhHxZ
X-Gm-Gg: ASbGncsjUClT02FZsxFs3Yt1/mqAyddoyTdt2MHIo0HTG1FDdalBHf14JkqJAyYmTPj
	6W7HhtDcwzvQHyWHtghw6ko2rL+BUm1M1hom9UDXr1snQXw0jplbPVqZF1qkWEUIROK0e8J6qdF
	CJn8QQmsVHAMix2CTYJuVbyZudYmMpXDk+GP6QC8q5N9rAyvzRP1KtuG6rUfkTFiAjranGD3Nw4
	iZNiaGDBOTFWXLlLgr5ENvRXj7FlPsxxZ4BGgcnfFdkJVzUcMtj/YTMhMWhHNLH6TXL12xI4WrW
	RiHqKSYneEJPZPsPGg0a3z2DAcTXKRc/9TUYA52g8zt17iKZTam7M06AdvAsicx5JJE4ccZDMNb
	SAvJbg6C27oqWLCFV
X-Google-Smtp-Source: AGHT+IGERChiFGE/d/VgaSjB/fBHCcIx46SIOubK/5eXYgYTFXXviLMgUfe7m+xgS8A7iYuziAf9Ew==
X-Received: by 2002:a17:907:944b:b0:adb:1b2b:fe27 with SMTP id a640c23a62f3a-adb1b2c0fe2mr217561966b.36.1748529352037;
        Thu, 29 May 2025 07:35:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Marek Vasut <marex@denx.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] Support i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 16:35:07 +0200
Message-ID: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
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

Dario Binacchi (6):
  dt-bindings: mfd: convert mxs-lradc bindings to json-schema
  ARM: dts: imx28: add pwm7 muxing options
  dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
  ARM: dts: mxs: support i.MX28 Amarula rmm board
  ARM: mxs_defconfig: Cleanup mxs_defconfig
  ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 ---
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 131 ++++++++
 arch/arm/boot/dts/nxp/mxs/Makefile            |   1 +
 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 301 ++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi          |  10 +
 arch/arm/configs/mxs_defconfig                |  14 +-
 7 files changed, 447 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

-- 
2.43.0

base-commit: 2d1e9b3978bc041336f1bf6c611fbbf435a297f5
branch: imx28-amarula-rmm
