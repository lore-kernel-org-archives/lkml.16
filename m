Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BCBBA42;
	Tue,  1 Apr 2025 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743528298; cv=none; b=bEWA5jLi5HxOyDuv0IY7O2793mPGCwjDwBM7nRv2aGX9AwjCT7UYsMdhtSUeiOpSZ100Lvs0eQ6DR0x5AfRi1+EYNIsv0DqKGUb/SnbyQPu6WNA5t0GxPSYp7by0p1gDiR+4a2vBafwNZ/kesBDUYzQXqQtc4OEe38xwCXGGbC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743528298; c=relaxed/simple;
	bh=3Afbh4zUUKkEfX+R9Ta4ThObmPq4HIGfRvVzx39itXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsCKizpJKOmobrpCNFPVs6ZhU4m9hkbUSYMkBC7ybGly+jaChjszM7GIntvYV6aQK7l7AO6qORfYqiWkb69k/8Q3pyxmW+QIqr22sO5UVKLHVRn4Py5+8pREKQ/nV1XW/OdcLNg3AoFhzetPgw/RG/GS+ZXuZz60oDKQz7pLjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=12dWZVIn; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=0nY0TcwV; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="12dWZVIn";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="0nY0TcwV"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 75B0EEC59FD;
	Tue, 01 Apr 2025 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528288; bh=3Afbh4zUUKkEfX+R9Ta4ThObmPq4HIGfRvVzx39itXc=;
	h=From:To:Cc:Subject:Date:From;
	b=12dWZVInVE9lgg1cmm9k5KbZo7xwtDxVANgRYjNJ6LzVhOXIlOEPxVNcH/mNDiPtH
	 m97vm4DNNg1mS1KPRPgcA0Rj/G9ZM7547Wq9omRUZ5yfFCqSMrYryZBKzPuT1WgNJi
	 txwen86h/duE4qdktjjw6y0ITGX+4KEkFCl4N/DWpRsCsdvmEaa7BEkUG/+2tkez3j
	 MJYNKGWcQRdmZIR0UnfkJVA0uT5X93I1TeORTzWWDG0E3Xxu+zVQ27KD+gNiPtMYUI
	 Iy45qqCY7FliaFNrB47CTq75gOWzVkfXp4fpmncr8tvaEU8WRk7t6gE/U1jg54KaWG
	 7B0vavTBBUKtg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTNXRoqBoSe0; Tue,  1 Apr 2025 10:24:46 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id BCE12EC59F9;
	Tue, 01 Apr 2025 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528286; bh=3Afbh4zUUKkEfX+R9Ta4ThObmPq4HIGfRvVzx39itXc=;
	h=From:To:Cc:Subject:Date:From;
	b=0nY0TcwVzsJOFP8SgPJnrlF/au70PECL8pZpgk33FZhkQQOdvz//saN5aUi3kM5WU
	 HMMvOBDCRu2aLGzDSXYq4c7jfG1QA4cLSmoYwjPxpCsbOjccacyj2iPZFErQooLj4J
	 5vvtEi5kg8sh5W5/wa8WExuiKhk2hg0OftOauDcSBWd0+DnGKLt6/y8jxsbOac8IOZ
	 9tpq2PdeGn76dbWZFWgFl63P7dnXa7iiYjBE/qCWnHkooVbulngOGaE8+rIBGxiNYv
	 H0mTg0O9i/ptuTio0F3j8C8Dr55Qy3sbHdtLUefe6YmMU5uCwXFDqp6k7b0/k5VtY8
	 g+urgRDXRqYDg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v6 0/6] Add clock controller support for SpacemiT K1
Date: Tue,  1 Apr 2025 17:24:28 +0000
Message-ID: <20250401172434.6774-1-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock tree of SpacemiT K1 is managed by several independent
multifunction devices, some of them are

- Application Power Manage Unit, APMU
- Main Power Manage Unit, MPMU
- APB Bus Clock Unit, APBC
- APB Spare, APBS

These four devices provide hardware bits for three purposes: power
management, reset signals and clocks. Not every device is capable of all
the three functionalities,

- APMU, MPMU: power, reset, clock
- APBC: clock, reset
- APBS: clock (PLL clocks)

This series adds support for clock hardwares in these four regions,
which covers most peripherals except DDR and the realtime processor.

Tested on BananaPi-F3 board. With some out-of-tree drivers, I've
successfully brought up I2C, RTC, MMC and ethernet controllers. A clock
tree dump could be obtained here[1].

[1]: https://gist.github.com/heylenayy/73df0b6b075615a944990507112cfc5b

Changed from v5
- Correct "Spacemit" to "SpacemiT" in commit messages and code
- Always use space instead of TAB in comments for consistency
- dt-bindings
  - Rename binding header to "spacemit,k1-syscon.h"
  - apply review tags
- driver code
  - remove "default" properties from Kconfig
  - misc style and naming improvements
  - make ccu_read() directly return the read value, drop ccu_poll() and
    reorder the arguments to ccu_{read,update} macros
  - drop ccu_common.reg_swcr2
  - clock tree for K1
    - define PLL3 with the correct offset of SWCR3 register
    - synchronize PLL configuration entries with the vendor kernel
    - reformat clocks definitions
    - explain why PLLs require the MPMU syscon to function
    - log a message when failing to register a clock
    - simplify clock registration with ARRAY_SIZE()
  - ddn
    - correctly handle masks which doesn't start from BIT(0) when
      calculating the best rate
    - improve precision of frequency calculation
    - derive _{den,num}_shift from corresponding masks with __ffs()
  - mix
    - match the full mask of gate in ccu_gate_is_enabled()
    - add a note about "frequency change" bit and simplify FC-triggering
      logic
    - drop unnecessary local variables and initialization from clock
      operations
    - round to the closest rate in ccu_mix_calc_best_rate()
    - change names of all mix subtypes to follow the order of mux ->
      factor/div -> gate -> fc
    - drop unused _flags argument from CCU_GATE_FACTOR_DEFINE()
  - pll
    - ensure PLLs are initialized to a known state
    - drop extra check in ccu_pll_enable()
    - round to the closest rate in ccu_pll_round_rate()
- TWSI8 support
  - Split cleanly from the main driver commit
- devicetree
  - drop extra "*-cells" and "ranges" properties
- Enable SpacemiT K1 CCU in RISC-V defconfig
- Link to v5: https://lore.kernel.org/all/20250306175750.22480-2-heylenay@4d2.org/

Changed from v4
- bindings:
  - Drop CLK_*_NUM macros from binding headers
  - Rename spacemit,k1-ccu.yaml to spacemit,k1-pll.yaml, change to
    describe only the PLL in APBS region
  - k1-syscon.yaml
    - drop spacemit,k1-syscon-apbs, it should be the PLL device
    - drop child nodes
    - describe the syscons as clock, reset and power-domain controllers
    - drop "syscon" from the compatible list, as these syscons aren't
      compatible with the generic one
- driver:
  - misc style fixes and naming improvements
  - drop unused fields from data structures
  - drop unused clock types: CCU_DDN_GATE
  - ddn type:
    - improve the comments
    - dynamically calculate appropriate rates
    - hardcode the x2 factor
  - mix type
    - drop val_{disable,enable} for gate subtype
    - drop unncessary polling when enabling a gate
    - encode subtypes directly in struct ccu_mix
    - generate clock names from identifiers of the data structure
    - rename CCU_DIV2_FC_MUX_GATE_DEFINE to CCU_DIV_SPLIT_FC_MUX_GATE
  - pll type:
    - correctly claim the parent clock
    - make rate tables const
    - drop SWCR2-related fields
    - combine fields of registers as a whole instead of working with
      each field
  - clock tree for k1:
    - removed duplicated offsets
    - drop the placeholder 1:1 factor, pll1_d7_351p8
    - workaround the quirk of TWSI8 clocks
    - fix the definition of ripc_clk, wdt_bus_clk, dpu_bit_clk and
      timers_*_clk
    - drop structure spacemit_ccu_priv and spacemit_ccu_data
    - rework clock registration
    - split the PCIe clocks correctly (there're three distinct clocks
      for each PCIe port)
- devicetree:
  - adapt the new binding
- Link to v4: https://lore.kernel.org/all/20250103215636.19967-2-heylenay@4d2.org/

Changed from v3
- spacemit,k1-ccu binding
  - allow spacemit,mpmu property only for controllers requiring it
    (spacemit,k1-ccu-apbs)
- spacemit,k1-syscon binding
  - drop unnecessary *-cells properties
  - drop unrelated nodes in the example
- driver
  - remove unnecessary divisions during rate calucalation in ccu_ddn.c
  - use independent clk_ops for different ddn/mix variants, drop
    reg_type field in struct ccu_common
  - make the register containing frequency change bit a sperate field in
    ccu_common
  - unify DIV_MFC_MUX_GATE and DIV_FC_MUX_GATE
  - implement a correct determine_rate() for mix type
  - avoid reparenting in set_rate() for mix type
  - fix build failure when SPACEMIT_CCU and SPACEMIT_CCU_K1 are
    configured differently
- use "osc" instead of "osc_32k" in clock input names
- misc style fixes
- Link to v3: https://lore.kernel.org/all/20241126143125.9980-2-heylenay@4d2.org/

Changed from v2
- dt-binding fixes
  - drop clocks marked as deprecated by the vendor (CLK_JPF_4KAFBC and
    CLK_JPF_2KAFBC)
  - add binding of missing bus clocks
  - change input clocks to use frequency-aware and more precise names
  - mark input clocks and their names as required
  - move the example to the (parent) syscon node and complete it
  - misc style fixes
- misc improvements in code
- drop unnecessary spinlock in the driver
- implement missing bus clocks
- Link to v2: https://lore.kernel.org/all/SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Changed from v1
- add SoC prefix (k1)
- relicense dt-binding header
- misc fixes and style improvements for dt-binding
- document spacemit,k1-syscon
- implement all APBS, MPMU, APBC and APMU clocks
- code cleanup
- Link to v1: https://lore.kernel.org/all/SEYPR01MB4221B3178F5233EAB5149E41D7902@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Haylen Chu (6):
  dt-bindings: soc: spacemit: Add spacemit,k1-syscon
  dt-bindings: clock: spacemit: Add spacemit,k1-pll
  clk: spacemit: Add clock support for SpacemiT K1 SoC
  clk: spacemit: k1: Add TWSI8 bus and function clocks
  riscv: dts: spacemit: Add clock tree for SpacemiT K1
  riscv: defconfig: enable clock controller unit support for SpacemiT K1

 .../bindings/clock/spacemit,k1-pll.yaml       |   50 +
 .../soc/spacemit/spacemit,k1-syscon.yaml      |   80 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |   75 +
 arch/riscv/configs/defconfig                  |    2 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/spacemit/Kconfig                  |   18 +
 drivers/clk/spacemit/Makefile                 |    5 +
 drivers/clk/spacemit/apbc_clks                |  100 ++
 drivers/clk/spacemit/ccu-k1.c                 | 1321 +++++++++++++++++
 drivers/clk/spacemit/ccu_common.h             |   48 +
 drivers/clk/spacemit/ccu_ddn.c                |   83 ++
 drivers/clk/spacemit/ccu_ddn.h                |   47 +
 drivers/clk/spacemit/ccu_mix.c                |  268 ++++
 drivers/clk/spacemit/ccu_mix.h                |  218 +++
 drivers/clk/spacemit/ccu_pll.c                |  157 ++
 drivers/clk/spacemit/ccu_pll.h                |   86 ++
 .../dt-bindings/clock/spacemit,k1-syscon.h    |  247 +++
 18 files changed, 2807 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/apbc_clks
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h

-- 
2.49.0

