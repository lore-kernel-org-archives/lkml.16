Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED9B27FB19;
	Tue,  6 May 2025 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534240; cv=none; b=k9T+Txvmup0C6t1ch/5PUMSoN9SbTCyq51qFTWCzn0cKRsglZK+B5OWuRizBw/FDq26Xft1UEgWVp2n9dYLNtObVM0VdGqblUgQ77K3ygRhzpCkNdtGC/tEjJILF+9msWTnwhvxLgHsG247NBUwiSxn+vKa/+M9ZfuQTXYwYJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534240; c=relaxed/simple;
	bh=ZuNGJLcwlQE6SIrCFcatyB5zE1+UA6IbeKLIuWFriIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TCjGIGFUf32fV0gdjEG1WzJJNvdThxBYtY6aSx/Nqo2mjza3y9mmg1rfsNXxeIcznVG4V4pPD0VBkgKR6h2fIWFcX4wNM1W/eUdB3iTG/JKUvkPeTHkkG7u018orT/bhYKPDnhsF4geWPLB4FL6PBaWH+aBpAASwr3unqq3Ocd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+U3AsFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+U3AsFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D38C4CEE4;
	Tue,  6 May 2025 12:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534240;
	bh=ZuNGJLcwlQE6SIrCFcatyB5zE1+UA6IbeKLIuWFriIc=;
	h=From:Subject:Date:To:Cc:From;
	b=V+U3AsFFFy82KLFyeMkqo5pp6h8eVxTongDEi+S8NXdo+LmdmXTRuM2+FcUGZ0EJ8
	 JsCcb8DfgIyefu81+GrVLAcmb6ksB6NGteszAKMtnnSwwM4xxoDBz5B/Bl8C6AGzjZ
	 OFDHRB/AmjYmO6ShQ8P1KqZhSqQP8ArzqXC7jky1E9ZyUPdqEkwtDc5+gZnY747VSt
	 KJ4vvN3Ssz/NlUvMSzhEftplfI7Kzd3EFq8mp/PbGNWcyOxxevUWjKnHM81rcgPzZ0
	 HJkW59HzGC47n302QVf2YSGM1DxkOur2oUEmmSoyBNH71IJLVFjloBpsxmacuHhZFg
	 XJ5JkWY7ZiJQA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v3 00/25] Arm GICv5: Host driver implementation
Date: Tue, 06 May 2025 14:23:29 +0200
Message-Id: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEH/GWgC/23MQQ6CMBCF4auQWVvTDi2iK+9hXACdwkRDTUsaD
 eHuFlaSuHwv+f4ZIgWmCJdihkCJI/sxj/JQQDc0Y0+Cbd6AEo3UshY9d8mIwcdJnPTZlapqHNU
 aMngFcvzeYrd73gPHyYfP1k5qff9mkhJSKIeVbXVlXG2vDwojPY8+9LB2Ev5Y1DuL2RptyHaNk
 wrbnV2W5QtVDWfm4QAAAA==
X-Change-ID: 20250408-gicv5-host-749f316afe84
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2

Implement the irqchip kernel driver for the Arm GICv5 architecture,
as described in the GICv5 beta0 specification, available at:

https://developer.arm.com/documentation/aes0070

The GICv5 architecture is composed of multiple components:

- one or more IRS (Interrupt Routing Service)
- zero or more ITS (Interrupt Translation Service)
- zero or more IWB (Interrupt Wire Bridge)

The GICv5 host kernel driver is organized into units corresponding
to GICv5 components.

The GICv5 architecture defines the following interrupt types:

- PPI (PE-Private Peripheral Interrupt)
- SPI (Shared Peripheral Interrupt)
- LPI (Logical Peripheral Interrupt)

This series adds sysreg entries required to automatically generate
GICv5 registers handling code, one patch per-register.

This patch series is split into patches matching *logical* entities,
to make the review easier.

Logical entities:

- PPI
- IRS/SPI
- LPI/IPI
- SMP enablement
- ITS

The salient points of the driver are summarized below.

=============
1. Testing
=============

Patchset tested with an architecturally compliant FVP model with
the following setup:

- 1 IRS
- 1 and 2 ITSes
- 1 and 2 IWBs

configured with different parameters that vary the IRS(IST) and
ITS(DT/ITT) table levels and INTID/DEVICEID/EVENTID bits.

A Trusted-Firmware (TF-A) prototype was used for device tree
bindings and component initializations.

================
2. Driver design
================

=====================
2.1 GICv5 DT bindings
=====================

The DT bindings attempt to map directly to the GICv5 component
hierarchy, with a top level node corresponding to the GICv5 "system",
having IRS child nodes, that have in turn ITS child nodes.

The IWB is defined in a separate schema; its relationship with the ITS
is explicit through the msi-parent property required to define the IWB
deviceID.

===================
2.2 GICv5 top level
===================

The top-level GICv5 irqchip driver implements separate IRQ
domains - one for each interrupt type, PPI (PE-Private Peripheral
Interrupt), SPI (Shared Peripheral Interrupt) and LPI (Logical
Peripheral Interrupt).

The top-level exception handler routes the IRQ to the relevant IRQ
domain for handling according to the interrupt type detected when the
IRQ is acknowledged.

All IRQs are set to the same priority value.

The driver assumes that the GICv5 components implement enough
physical address bits to address the full system RAM, as required
by the architecture; it does not check whether the physical address
ranges of memory allocated for IRS/ITS tables are within the GICv5
physical address range.

Components are probed by relying on the early DT irqchip probing
scheme. The probing is carried out hierarchically, starting from
the top level.

The IWB driver has been dropped owing to issues encountered with
core code DOMAIN_BUS_WIRED_TO_MSI bus token handling:

https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/

=============
2.3 GICv5 IRS
=============

The GICv5 IRS driver probes and manages SPI interrupts by detecting their
presence and by providing the top-level driver the information required
to set up the SPI interrupt domain.

The GICv5 IRS driver also parses from firmware Interrupt AFFinity ID
(IAFFID) IDs identifying cores and sets up IRS IRQ routing.

The GICv5 IRS driver allocates memory to handle the IRS tables.

The IRS LPI interrupts state is kept in an Interrupt State Table (IST)
and it is managed through CPU instructions.

The IRS driver allocates the IST table that, depending on available HW
features can be either 1- or 2-level.

If the IST is 2-level, memory for the level-2 table entries
is allocated on demand (ie when LPIs are requested), using an IRS
mechanism to make level-1 entry valid on demand after the IST
has already been enabled.

Chunks of memory allocated for IST entries can be smaller or larger than
PAGE_SIZE and are required to be physically contiguous within an IST level
(i.e. a linear IST is a single memory block, a 2-level IST is made up of a
block of memory for the L1 table, whose entries point at different L2 tables
that are in turn allocated as memory chunks).

LPI INTIDs are allocated in software using an IDA. IDA does not support
allocating ranges, which is a bit cumbersome because this forces us
to allocate IDs one by one where the LPIs could actually be allocated
in chunks.

An IDA was chosen because basically it is a dynamic bitmap, which
carries out memory allocation automatically.

Other drivers/subsystems made different choices to allocate ranges,
an IDA was chosen since it is part of the core kernel and an IDA
range API is in the making.

IPIs are implemented using LPIs and a hierarchical domain is created
specifically for IPIs using the LPI domain as a parent.

arm64 IPI management core code is augmented with a new API to handle
IPIs that are not per-cpu interrupts and force the affinity of the LPI
backing an IPI to a specific and immutable value.

=============
2.4 GICv5 ITS
=============

The ITS driver reuses the existing GICv3/v4 MSI-parent infrastructure
and on top builds an IRQ domain needed to enable message based IRQs.

ITS tables - DT (device table) and ITT (Interrupt Translation Table) are
allocated according to the number of required deviceIDs and eventIDs on
a per device basis. The ITS driver relies on the kmalloc() interface
because memory pages must be physically contiguous within a table level
and can be < or > than PAGE_SIZE.

=============
2.5 GICv5 IWB
=============

The IWB driver has been dropped owing to issues encountered with
core code DOMAIN_BUS_WIRED_TO_MSI bus token handling:

https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/

===================
3. Acknowledgements
===================

The patchset was co-developed with T.Hayes and S.Bischoff from
Arm - thank you so much for your help.

A big thank you to M.Zyngier for his fundamental help/advice.

If you have some time to help us review this series and get it into
shape, thank you very much.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
Changes in v3:
- Reintroduced v1 patch split to simplify review
- Reworked IRS/ITS iopoll loop, split in atomic/non-atomic
- Cleaned-up IRS/ITS code with macros addressing review comments
- Dropped IWB driver waiting for IRQ core code to be fixed for DOMAIN_BUS_WIRED_TO_MSI
  https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/
- Moved headers to arch/arm64 and include/linux/irqchip
- Reworked GSB barriers definition
- Added extensive GSB/ISB barriers comments
- Limited error checking on IRS/ITS code - introduced couple of fatal
  BUG_ON checks
- Link to v2: https://lore.kernel.org/r/20250424-gicv5-host-v2-0-545edcaf012b@kernel.org

Changes in v2:
- Squashed patches [18-21] into a single logical entity
- Replaced maple tree with IDA for LPI IDs allocation
- Changed coding style to tip-maintainer guidelines
- Tried to consolidate poll wait mechanism into fewer functions
- Added comments related to _relaxed accessors, barriers and kmalloc
  limitations
- Removed IPI affinity check hotplug callback
- Applied DT schema changes requested, moved IWB into a separate schema
- Fixed DT examples
- Fixed guard() usage
- Link to v1: https://lore.kernel.org/r/20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org

---
Lorenzo Pieralisi (24):
      dt-bindings: interrupt-controller: Add Arm GICv5
      arm64/sysreg: Add GCIE field to ID_AA64PFR2_EL1
      arm64/sysreg: Add ICC_PPI_PRIORITY<n>_EL1
      arm64/sysreg: Add ICC_ICSR_EL1
      arm64/sysreg: Add ICC_PPI_HMR<n>_EL1
      arm64/sysreg: Add ICC_PPI_ENABLER<n>_EL1
      arm64/sysreg: Add ICC_PPI_{C/S}ACTIVER<n>_EL1
      arm64/sysreg: Add ICC_PPI_{C/S}PENDR<n>_EL1
      arm64/sysreg: Add ICC_CR0_EL1
      arm64/sysreg: Add ICC_PCR_EL1
      arm64/sysreg: Add ICC_IDR0_EL1
      arm64/sysreg: Add ICH_HFGRTR_EL2
      arm64/sysreg: Add ICH_HFGWTR_EL2
      arm64/sysreg: Add ICH_HFGITR_EL2
      arm64: Disable GICv5 read/write/instruction traps
      arm64: cpucaps: Rename GICv3 CPU interface capability
      arm64: cpucaps: Add GICv5 CPU interface (GCIE) capability
      arm64: Add support for GICv5 GSB barriers
      irqchip/gic-v5: Add GICv5 PPI support
      irqchip/gic-v5: Add GICv5 IRS/SPI support
      irqchip/gic-v5: Add GICv5 LPI/IPI support
      irqchip/gic-v5: Enable GICv5 SMP booting
      irqchip/gic-v5: Add GICv5 ITS support
      arm64: Kconfig: Enable GICv5

Marc Zyngier (1):
      arm64: smp: Support non-SGIs for IPIs

 .../interrupt-controller/arm,gic-v5-iwb.yaml       |   76 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  196 ++++
 MAINTAINERS                                        |   10 +
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/include/asm/barrier.h                   |    3 +
 arch/arm64/include/asm/el2_setup.h                 |   45 +
 arch/arm64/include/asm/smp.h                       |   24 +-
 arch/arm64/include/asm/sysreg.h                    |   83 +-
 arch/arm64/kernel/cpufeature.c                     |   17 +-
 arch/arm64/kernel/smp.c                            |  156 ++-
 arch/arm64/tools/cpucaps                           |    3 +-
 arch/arm64/tools/sysreg                            |  495 +++++++-
 drivers/irqchip/Kconfig                            |   12 +
 drivers/irqchip/Makefile                           |    4 +-
 drivers/irqchip/irq-gic-common.h                   |    2 -
 ...3-its-msi-parent.c => irq-gic-its-msi-parent.c} |    3 +-
 drivers/irqchip/irq-gic-its-msi-parent.h           |   13 +
 drivers/irqchip/irq-gic-v3-its.c                   |    3 +-
 drivers/irqchip/irq-gic-v5-irs.c                   |  819 ++++++++++++++
 drivers/irqchip/irq-gic-v5-its.c                   | 1176 ++++++++++++++++++++
 drivers/irqchip/irq-gic-v5.c                       | 1046 +++++++++++++++++
 drivers/irqchip/irq-gic.c                          |    2 +-
 include/linux/irqchip/arm-gic-v5.h                 |  387 +++++++
 23 files changed, 4507 insertions(+), 69 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-gicv5-host-749f316afe84

Best regards,
-- 
Lorenzo Pieralisi <lpieralisi@kernel.org>

