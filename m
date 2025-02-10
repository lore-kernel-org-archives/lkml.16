Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84F2580CF;
	Mon, 10 Feb 2025 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205926; cv=none; b=i7J05KKKGnU/tXpTn6rs9peF4eKhLb6KrwRGDlb+8CxfcOqV7o6TDu4sLYXtlb0pIzgQTVhfbddCHbtDOVn3wphin6b9V3rFkdv33kyMeQKYpKfhtkNqmhpSSxYMDlRihEoY1AkmRNfyrf3IeX44JVcvwR3KUnEGnKLSwMjuWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205926; c=relaxed/simple;
	bh=7vmbpwcC7SzCJRr1X7tfbhNjspmj83V3O3MfyXlaVGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uPxxeXiXKTYpenJTlbrzHzCq1N3SL9ZR+Z5D0qxKWnn6wiF5jUw08Ht47+U+86mVCoPjCNdEiCFVd37jgGrTXh+t7foO1s5cwaLXz3r69gGNeXQowHLj7U6BdXeR6llNxtKJj4wwJwEEeA3MzFqdEXP2RYjBGTb8xbT12rPuWBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=QDFswwxh; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="QDFswwxh"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FBEB148026A;
	Mon, 10 Feb 2025 17:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6DNkDzYRsREfj0sp5nnwVNuG1cgUjook0PsY/o2nTvA=;
	b=QDFswwxh5yq/Q2nfGYfaK501Bz0ERwVgeUuuFwMvuAaafD/kufwnfQS1M1waMGWLfEsY7A
	sFJaOQbB+axlAp2u/9cA3KB6Vq7nhqk+f6VibzjS7T2pFh0dhS3MUmg8Bdm8fvDE6eKgfs
	xEBaL2rd9jha90gVWGof01FEMJtA/EtEvx/nxLnLjRyVLqpeVJb6EO2c5EPCnLwX143msc
	BroLSCG1RjjUAJ3WQxENrIn8Vu77RN8B53afl/PMkzjwl+MNWfbeVS2ooQp8UqRhsc1PIp
	lFJJDSK/StYMm25dNmqcQ2AO3vvOPtgUM53rbVbZECl4LwrsuGZ5uo5IGXp0Bg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] Microchip OTPC driver on SAM9X60 exposing UIDxR as additional nvmem device
Date: Mon, 10 Feb 2025 17:44:50 +0100
Message-Id: <20250210164506.495747-1-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hei hei,

on a custom sam9x60 based board we want to access a unique ID of the
SoC.  Microchip sam-ba has a command 'readuniqueid' which returns the
content of the OTPC Product UID x Register in that case.

(On different boards with a SAMA5D2 sam-ba and we use the Serial Number
x Register for that purpose.  In the linux kernel those are exposed
through the atmel soc driver.  Those registers are not present in the
SAM9X60 series, but only for SAMA5D2/SAMA5D4 AFAIK.)

There is a driver for the OTPC of the SAMA7G5 and after comparing
register layouts it seems that one is almost identical to the one used
by SAM9X60.  Currently that driver has no support for the UIDx
registers, but I suppose it would be the right place to implement it,
because the registers are within the OTPC register address offsets.

When developing and testing it became clear the OTPC needs explicit
enabling of certain clocks in the otpc driver.  So the patch series
starts with some rework of clock bindings and clock drivers, along with
referencing that in SoC dtsi files.

After two patches with some unrelated fixups for the otpc driver, there
are more patches dealing with sam9x60 support for the driver and the
necessary clock enablement.

The last patch adds an additional nvmem device for the UIDx registers,
fullfilling the initial goal of mine.

I tested the series only on SAM9X60, not on SAMA7G5 or the other SoCs
affected, because I only have sam9x60 hardware for testing.  If someone
could test on SAM9X7, SAMA7G5, and SAMA7D65, that would be highly
appreciated.

Last question: Should the UID be added to the device entropy pool with
add_device_randomness() as done in the SAMA5D2 sfr driver?

For detailed patch changelog see each patch, general changelog below.

Greets
Alex

(series based on v6.14-rc2)

v2:
- Removed patch adding bad OPTC conditions warnings on probe
- Removed patch adding more register definitions (the one register
  definition required was moved to the last patch adding the nvmem for
  UID registers)
- Added multiple new patches handling the dt-bindings issues
- Extend the possibility to enable the main rc oscillator to all at91
  SoCs with an OTPC
- Added patches to reference and enable the OTPC peripheral clock on all
  capable SoCs
- Reordered patches
- Reworded commit messages
- Squashed patches with dts changes for sam9x60
- Fixed bot warnings

v1:
- Link: https://lore.kernel.org/all/20240821105943.230281-1-ada@thorsis.com/T/#u

(I sent an RFC patch on this topic earlier this year, you'll find the
link below as a reference to the discussion.  The patch itself was
trivial and not meant for applying as is anyways, so I decided to not
write a full changelog from RFC to v1.)

RFC:
- Link: https://lore.kernel.org/all/20240412140802.1571935-1-ada@thorsis.com/T/#u

Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Alexander Dahl (16):
  dt-bindings: clock: at91: Split up per SoC partially
  ARM: dts: microchip: Use new PMC bindings
  clk: at91: Use new PMC bindings
  dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
  clk: at91: Allow enabling main_rc_osc through DT
  clk: at91: Add peripheral id for OTPC
  dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
  dt-bindings: nvmem: microchip-otpc: Add required clocks
  nvmem: microchip-otpc: Avoid reading a write-only register
  nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
  nvmem: microchip-otpc: Add SAM9X60 support
  ARM: dts: microchip: sama7g5: Add OTPC clocks
  ARM: dts: microchip: sam9x60: Add OTPC node
  ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
  nvmem: microchip-otpc: Enable necessary clocks
  nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device

 .../nvmem/microchip,sama7g5-otpc.yaml         | 32 ++++++++++-
 .../dts/microchip/at91-sam9x60_curiosity.dts  |  4 ++
 arch/arm/boot/dts/microchip/sam9x60.dtsi      | 25 ++++++---
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 11 ++--
 arch/arm/boot/dts/microchip/sama7d65.dtsi     |  5 +-
 arch/arm/boot/dts/microchip/sama7g5.dtsi      | 25 +++++----
 drivers/clk/at91/sam9x60.c                    | 16 +++---
 drivers/clk/at91/sam9x7.c                     | 24 +++++----
 drivers/clk/at91/sama7d65.c                   | 44 +++++++--------
 drivers/clk/at91/sama7g5.c                    | 30 ++++++-----
 drivers/nvmem/microchip-otpc.c                | 54 ++++++++++++++++---
 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 22 ++++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 28 ++++++++++
 .../clock/microchip,sama7d65-pmc.h            | 35 ++++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 27 ++++++++++
 15 files changed, 296 insertions(+), 86 deletions(-)
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h


base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.39.5

