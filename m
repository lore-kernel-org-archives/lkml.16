Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2779F156C63
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844487; cv=none; b=L9P0iCOF/XBlrXRiwBBWXnvqWZtLuJkLB7rZwQ4LLYbE2PjfobnJjGDCE5jEJyUF9kPH5f2XVl4WDl5HP38EeHKd+HXHmE4XAVcUo94xsJggTwwI0Fc7pBi1CNCeXUqr25KwHE7nF07+3OKbpukBfctRs5AZIhM9Earg1YHLeck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844487; c=relaxed/simple;
	bh=8I/ca/pCjLe9NYgAmfzAY760RfmhK1YRNBFVMzOhrPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e2PxPTrC9iemM4j81q/yB55C094yO4Kdn2FhJK5gsNEFIqKZ3ub8VfIOQBJlL6DikPq9eNws7ypCTTVL/XhZYpCjr93ki0EPxTNqUXyZXeQdb0x49MAFDH2+3iqFnAgPgru73gtd3ZsMYzt0kPMEVUDGArZBjTv96GKrsGCFX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 55267nmX095976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 14:07:49 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 2 Jun 2025
 14:07:49 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v5 0/8] add Voyager board support
Date: Mon, 2 Jun 2025 14:07:39 +0800
Message-ID: <20250602060747.689824-1-ben717@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 55267nmX095976

The Voyager is a 9.6” x 9.6” Micro ATX form factor development board
including Andes QiLai SoC. This patch series adds minimal device tree
files for the QiLai SoC and the Voyager board [1].

Now only support basic uart drivers to boot up into a basic console. Other
features will be added later.

[1] https://www.andestech.com/en/products-solutions/andeshape-platforms/qilai-chip/
---
Changelog from v4 to v5:
  - Rebase the series on torvalds/master
  - Clarify the patch dependencies (2 <- 4 <- 5 <- 6) in the patch description

v4: https://lore.kernel.org/all/20250514095350.3765716-1-ben717@andestech.com/

Changelog from v3 to v4:
  - Restore the modification to cache-sets and cache-size in patch 6
  - Do not constrain renesas,r9a07g043f-ax45mp-cache since it's independent to
    this series.
  - Delete the redundant example added by patch 6

v3: https://lore.kernel.org/all/20250513094933.1631493-1-ben717@andestech.com/

Changelog from v2 to v3:
  - Rebase the series on Conor/riscv-soc-for-next
  - Reform patch 6 as suggested by Conor
  - Modify l2_cache's compatible in qilai.dtsi due to patch 6
  - Add Conor's Acked-by tag to patch 4
  - Add Conor's Acked-by tag to patch 5
  - Add Conor's Acked-by tag to patch 9

v2: https://lore.kernel.org/all/20250503151829.605006-5-ben717@andestech.com/

Changelog from v1 to v2:
  - Add detailed descriptions to PLIC_SW and PLMT0
  - Move the aliases node and memory node from qilai.dtsi to qilai-voyager.dts
  - Drop "status = okay" in each CPU node since the status property is by
    default "okay"
  - Reorder the nodes in qilai.dtsi by unit address in ascending order
  - Add myself as the maintainer of Andes's SoC tree
  - Add Rob's Reviewed-by tag to patch 2
  - Add Rob's Acked-by tag to patch 3
  - Add Rob's Acked-by tag to patch 6.

v1: https://lore.kernel.org/all/20250407104937.315783-1-ben717@andestech.com/

---
Ben Zong-You Xie (8):
  riscv: add Andes SoC family Kconfig support
  dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
  dt-bindings: interrupt-controller: add Andes QiLai PLIC
  dt-bindings: interrupt-controller: add Andes machine-level software
    interrupt controller
  dt-bindings: timer: add Andes machine timer
  riscv: dts: andes: add QiLai SoC device tree
  riscv: dts: andes: add Voyager board device tree
  riscv: defconfig: enable Andes SoC

 .../andestech,plicsw.yaml                     |  54 +++++
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/andes.yaml      |  25 +++
 .../bindings/timer/andestech,plmt0.yaml       |  53 +++++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.errata                     |   2 +-
 arch/riscv/Kconfig.socs                       |   9 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/andes/Makefile            |   2 +
 arch/riscv/boot/dts/andes/qilai-voyager.dts   |  28 +++
 arch/riscv/boot/dts/andes/qilai.dtsi          | 186 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 12 files changed, 370 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi

--
2.34.1
