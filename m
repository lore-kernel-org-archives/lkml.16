Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38747083C;
	Thu, 10 Apr 2025 15:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298791; cv=none; b=s/P+bOrsrOhoePWl83vTrL2EX06/cpYVl9O77/Nm/yTAsNXaelxxieiozc2hqzVfujy/o5A6MfYWGZOf/tF6+SgfwajAvct0Qc5E1m/7WBG7COb2kR3AS0kjDeYtSmGFz5hXW2RxPSVHEg9rlxOXh39PBd+Yg2ebKaMCEhrKxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298791; c=relaxed/simple;
	bh=wTMglkbKtKlUQaNdqRRsMnBsbEkE93BSbw4z93ZZKIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EeYTmbkstq5B5ZgzPBV5Xvuwp9PrQrBo2MRHy7ZYoSKl4SZzlOXvhEed8XBfAmfsR+qkN+1My36hiN1VfLdDru/VE9rr7cvBnstl6LwweuRlKrtdPajI1AWk+IXiZ/1hGcHHdciYwodP9GRFmnebTZsBxeeGvWwTePTx2PPTLro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=GiW8d+nd; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="GiW8d+nd"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2930; q=dns/txt;
  s=NAESA-Selector1; t=1744298790; x=1775834790;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wTMglkbKtKlUQaNdqRRsMnBsbEkE93BSbw4z93ZZKIk=;
  b=GiW8d+ndmA0evpugh6DULHVuN2xhy4WL2NZzbBLjLe1Ebr4BnCQJiFzY
   uTprlzujGOEMwEzOs09FDUeVXdgh7FtDE6cbtrXzTZWqyh/Qu/RcUO5fl
   NoPJ9RQpqxtHSF75JRZIE7UUjcPintMdSHFJ/cX2Z4MTsmfR8VzIEWS8u
   QS5AahvNa12L9iuXX9WxVYBZuW2Pd3z/am1eXf49HQIrMB8gLoZA7ZAbH
   zhNzqumMRRDOE/qCwmx61PSphNG/PEWHRo8rZDZ5v9Ypg8Ux9x2iKM7aF
   0bZHb518ni30g/2vLFSqiy6mZmz2QLKfO9qEBt7nWIyurWKbn3Jv31TZS
   g==;
X-CSE-ConnectionGUID: y5c9bJa7Ru6OQj4l43CACA==
X-CSE-MsgGUID: aru/8STISRS5qaXuf0eXlg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941672"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:20 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
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
Subject: [PATCH v3 00/10] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Thu, 10 Apr 2025 20:55:09 +0530
Message-Id: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0568 (UTC) FILETIME=[C4DD4500:01DBAA2C]

Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
P550 CPU cluster and the first development board that uses it, the
SiFive HiFive Premier P550.

This patch series adds initial device tree and also adds ESWIN
architecture support.

Boot-tested using intiramfs with Linux 6.15.0-rc1 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

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

Darshan Prajapati (3):
  dt-bindings: riscv: Add SiFive P550 CPU compatible
  dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
  dt-bindings: timer: Add ESWIN EIC7700 CLINT

Min Lin (2):
  riscv: dts: add initial support for EIC7700 SoC
  riscv: dts: eswin: add HiFive Premier P550 board device tree

Pinkesh Vaghela (2):
  riscv: Add Kconfig option for ESWIN platforms
  cache: sifive_ccache: Add ESWIN EIC7700 support

Pritesh Patel (3):
  dt-bindings: vendor-prefixes: add eswin
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board
  dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
    compatibility

 .../bindings/cache/sifive,ccache0.yaml        |  44 ++-
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 drivers/cache/sifive_ccache.c                 |   2 +
 13 files changed, 469 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi

-- 
2.25.1

