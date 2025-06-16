Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDD2BF3C3;
	Mon, 16 Jun 2025 11:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073069; cv=none; b=bkJqKTKfZlhdDsR9bPmuzN+lYjv+cUqu1zV2uGwCMvnaWvytdMHdOCP+VXKsOuMmtkwddP8+T3BN6ro7cuGHmRcRAarZVFIx+ezTVSOOM/PmlmNqBU7YRkmS0u0n4tKEWwCnEr1Ccbcfc4QHFMEAkqpezkkXW5XDuRIeSupnfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073069; c=relaxed/simple;
	bh=npKvrSYMx0G7203vj1pvhDj5mrw+axGZsxDIgzM8hM4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sEu9FkmNdHjtrgaeZwwymIu05tVtlZaMD31U8mxkSuzFCXqQmc2wu4/XnfqBwylx6Md7WuePMKdxDO79SBmvEg4WHcpulYICpDaEae9g79IDmIBYtUpyXM+G23zjtm0tDUQ74Nl5JRNco4ycClRA9fsNO2+BJvUmAA2G/fK8ngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=utjXbm2g; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="utjXbm2g"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2938; q=dns/txt;
  s=NAESA-Selector1; t=1750073067; x=1781609067;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=npKvrSYMx0G7203vj1pvhDj5mrw+axGZsxDIgzM8hM4=;
  b=utjXbm2g9XAVUSvFgf9higINEfiNT67yGByK2p0scVO2DcaYT9griIKa
   ojtVHFaC7E/JC4yCV8THZ0kgLgIa3pobntgX++E7fcJhFf8mpyl4eewKo
   R3UlBLdEEgHa5jVRSU4lfsGNKCEcPETEm0uH8vOLhJ53n0uDjgmEH1yWk
   ghL1pkJzZEPDhDvfbHOEGd5NH2xJvYjasuuaqE+LyZUrVt0YljvNQza5G
   77RIQVKS214cEcS/9xMhc6PJacaiuEAYdZhWMQ55LX0nG+UoUcpurXwzF
   Yy/NBensGoZyPPLNCcwWZmgbgXU4NnJPgWb44DVPBpyaB+50ex94CJi4Q
   A==;
X-CSE-ConnectionGUID: X3b86I94Qtyi3KJOVUTt1A==
X-CSE-MsgGUID: tu3C4LvuSaWC29l3VOEKSw==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117878"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:17 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Mon, 16 Jun 2025 16:53:09 +0530
Message-Id: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0327 (UTC) FILETIME=[0E03CF70:01DBDEB1]

Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
P550 CPU cluster and the first development board that uses it, the
SiFive HiFive Premier P550.

This patch series adds initial device tree and also adds ESWIN
architecture support.

Boot-tested using intiramfs with Linux v6.16-rc1 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

Changes in v4:
- Rebased the patches to kernel v6.16-rc1
- Drop patches that are already merged
- Added "Acked-by" tag of "Min Lin" for Patch 4
- Corrected the commit message of Patch 7 (Patch #10 in v3)
- Added "Tested-by" tag of "Ariel D'Alessandro" for Patch 7
- Link to v3: https://lore.kernel.org/lkml/20250410152519.1358964-1-pinkesh.vaghela@einfochips.com/

Changes in v3:
- Rebased the patches to kernel 6.15.0-rc1
- Added "Reviewed-by" tag of "Rob Herring" for Patch 4
- Updated MAINTAINERS file
  - Add GIT tree URL
- Updated DTSI file
  - Added "dma-noncoherent" property to soc node
  - Updated GPIO node labels in DTSI file
- Link to v2: https://lore.kernel.org/lkml/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/

Changes in v2:
- Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
- Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
- Updated MAINTAINERS file
  - Add the path for the eswin binding file
- Updated sifive,ccache0.yaml
  - Add restrictions for "cache-size" property based on the
    compatible string
- Link to v1: https://lore.kernel.org/lkml/20250311073432.4068512-1-pinkesh.vaghela@einfochips.com/

Darshan Prajapati (2):
  dt-bindings: riscv: Add SiFive P550 CPU compatible
  dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC

Min Lin (2):
  riscv: dts: add initial support for EIC7700 SoC
  riscv: dts: eswin: add HiFive Premier P550 board device tree

Pinkesh Vaghela (1):
  riscv: Add Kconfig option for ESWIN platforms

Pritesh Patel (2):
  dt-bindings: vendor-prefixes: add eswin
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 10 files changed, 425 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi

-- 
2.25.1

