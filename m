Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51D19B3EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024390; cv=none; b=OWEszPOEfjiOaIuEfQgXgKRBeLEk3KCE3Itt1zHObmdl2VyULhT0qBHIsocauuvBdpPuV+qX6iRGTnNZSL4PAKU6lx2qAHE6wDKjGDGaIC0/u8yxYED/bXggzXAa2N5UBTE3fXdYQnyl6Z6WMYZPt97LJ6i7kDQBe42kepKYcHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024390; c=relaxed/simple;
	bh=YURbMdd3VwqoU3lr0ONQ9/JbbFBJboh0LIEz+aXO8b4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzJdQ0LyqIcReyEAa0nD+Mhlv8GnR9Rvi6Bb76ln4cwrCq4uL6RUR0Fk1WBoJIn3qa7M4ZV/KCECYd+75QZfNYiZQYc4HVJo8miYpBxPF/2B6Ly4HtC4Z0DSHFWBiCSnon+PVvjV+n31+3ebrjGE0CExXbCStIpBRUAZRjTa3Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 537Anp8T001689
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 18:49:51 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 537AneRr001489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 18:49:40 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 7 Apr 2025
 18:49:40 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>, "Ben
 Zong-You Xie" <ben717@andestech.com>
Subject: [PATCH 0/9] add Voyager board support
Date: Mon, 7 Apr 2025 18:49:28 +0800
Message-ID: <20250407104937.315783-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 537Anp8T001689

The Voyager is a 9.6” x 9.6” Micro ATX form factor development board including
Andes QiLai SoC. This patch series adds minimal device tree files for the QiLai
SoC and the Voyager board [1].

Now only support basic uart drivers to boot up into a basic console. Other
features will be added later.

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/

Ben Zong-You Xie (9):
  riscv: add Andes SoC family Kconfig support
  dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
  dt-bindings: interrupt-controller: add Andes QiLai PLIC
  dt-bindings: interrupt-controller: add Andes machine-level software
    interrupt controller
  dt-bindings: timer: add Andes machine timer
  dt-bindings: cache: ax45mp-cache: allow variable cache-sets for Andes
    L2 cache
  riscv: dts: andes: add QiLai SoC device tree
  riscv: dts: andes: add Voyager board device tree
  riscv: defconfig: enable Andes SoC

 .../cache/andestech,ax45mp-cache.yaml         |   2 +-
 .../andestech,plicsw.yaml                     |  48 +++++
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/andes.yaml      |  25 +++
 .../bindings/timer/andestech,plmt0.yaml       |  42 ++++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.errata                     |   2 +-
 arch/riscv/Kconfig.socs                       |   9 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/andes/Makefile            |   2 +
 arch/riscv/boot/dts/andes/qilai-voyager.dts   |  19 ++
 arch/riscv/boot/dts/andes/qilai.dtsi          | 194 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 13 files changed, 352 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi

-- 
2.34.1

