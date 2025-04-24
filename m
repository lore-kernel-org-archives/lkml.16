Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9322170B;
	Thu, 24 Apr 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487691; cv=none; b=BTOcE3Su6IqkE5z+z2qUfxOW2E9lL/CLOhE1TqtENPR8NZefNr1PZdSVePNwwNDxq6pxX4toeePdjRKBNQmlkoghsOxxdZ9Vi6/vsUtmp/2+49wAkxiAkQb0TzS1z7+ADfDh0Pym3R0PvMJQ/Sst3Bxq20vFKIp2t9LXETRfEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487691; c=relaxed/simple;
	bh=19tL4jN41z9FQI4XEWC1T0aTF7LcGwsN47y3eQ/Ipt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ws+2NG61olaAzCuQQjZCQ2eLYiNVuBrYXkEUGg1Fg4RL1uzEvYL6rwc7L5LsMN6ueGj9Hd+pF81SmFaUPDKMH6ZWc8X/9R+eZ8Vh2L2bpjemYYQlW4GMNRn5oA3YXFhu4Up/0jrT6MgqPDm1neYO7jLK3MR2vrMYDSGTx9rE2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B7F49341C25;
	Thu, 24 Apr 2025 09:41:23 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v9 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 24 Apr 2025 17:40:48 +0800
Message-Id: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEHCmgC/2XSy27DIBAF0F+JWJeKGePBZNX/qLrgMSSoapzar
 tUqyr+XOGpj5OUgncvlcREjD5lHsd9dxMBzHnN/KoN92olwdKcDyxzLLFChVh12UjXyHeThnHt
 J4JPFZFWDQRRwHjjl7yXs9e0+D/z5VTKn+6LwbmQZ+o+PPO13aGxswUWbKAYViEyiBBockfUYL
 AIaE8GJW9Yxj1M//Cw9Z1jClkpW6XWlGaSSpAyyZw6O1cuBT1PfP/fDYcmZ8d8Cgq0sFoud1jp
 FRAhxY5uVxbayzc0a743XGiLhxuo/26qycWXLCaQmDcG2QYHVG9s+LIKpbLt0poZDw8aT2VhaW
 WwqS8VGj6xdZE4QNtasLVW2tJCedWeDdqSs39juYcttVbZ8IgmBOsKI5aXqfa/X6y+C/TkdlQI
 AAA==
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4903; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=19tL4jN41z9FQI4XEWC1T0aTF7LcGwsN47y3eQ/Ipt8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgc2ipfCvflkv7IgzKm2TGKqrcIQE852JrMGz
 XONCyCYo6+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHNl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VsID/9oBNZQAUHgvMsCPG
 Cx92IzG1YBqV3eqH307VhjshCnq2QZELYTeEHZEq2vdmuPYaCfaBobhFSyathnO8oY/UlNyFW3f
 ilBcqOpNHU/O+jlb7sjyh8sDs6q2nBhJWa7xlj04QDWf/4tdWiaHyDDqN3kvf5UuoBw2mU/fFRu
 uMqMG6vf46eUhClRxjHXt5CT/2mrsEDgjhJk2R8nULeUHLK8ItTDtO8XeLsgZ1Mrjv2a9Jj+IWC
 426c2oDIGEn+jHlb835Y4HOKYKQS9ICWe5OwQAj5BKFuajFQ3Reb7es2SS/QI+E8AIZ9wLKTqA1
 Mc/7dj9Y4BjZH2Vq3uPY6y2Q0j9/QQqE3Wgz8e6eLuOB4xVR49/zV27T4eY/5cWJVPeSkydsCgs
 sbPRP4Q+b1dlg5HWXJ2PorIO3Pe4JOrjTztb75iLE1UsnJRQaPRmz4CR6B25PbxU5RhkmqC3/r5
 L1DZG4JYAYNDh6pQ86abV2q/5176Pb3Gn+kl80zP3hHq9rj1oKSPuS0nFhwOcqVUmg8Td0au6ir
 eTEcz53prLxG9gkeMHwnMLSgdSe5pyA2rMV+zP/GXsSX7UxOUBDKlAv1K2RoUJUtILphUC7Fmtk
 0aYgUz/sg2I/C3vqF+Ji6VjoZFfejPLAtrA0D4Qs+pFCYrjTqiQ1ucVUuVN5dSvNY5wQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO ports, each consisting of 32 pins and
has indepedent register sets, while still sharing IRQ line and clocks.
The GPIO controller request the two clock sources from APBC block.

Due to first three GPIO ports has interleave register settings, some
resources (IRQ, clock) are shared by all pins.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

This version should resolve DT related concern in V4, and register each bank as
indepedent gpio chip in driver, no more sub children gpio DT node needed.

Please notice in this version, the reset property is added, but optional.
as I see no need to activate it in driver, instead I suspect it may
break cases if bootloader did some prerequisite settings, so I'm leaving
it for future implementation if really necessary.

Add clock property and rebase patch on top of SpacemiT's k1/dt-for-next branch

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [5]
Link: https://lore.kernel.org/all/2174489329731.7849.17910336598453828998.b4-ty@bgdev.pl [6]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v9:
- drop patch 1,2 from v8 which already merged by gpio tree [6]
- add clock property to gpio node
- Link to v8: https://lore.kernel.org/r/20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org

Changes in v8:
- rebased to v6.15-rc1
- adjust dt-binding/code to request clocks
- add reset property
- call irq_domain_update_bus_token() to support threecells interrupt mode
- use devm_platform_ioremap_resource(), so drop "struct resource"
- fix Kconfig
  - select GPIO_GENERIC as calling bgpio_init()
  - change to tristate, make it possible to build as module
- adjust defconfig to enable gpio 
- Link to v7: https://lore.kernel.org/r/20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org

Changes in v7:
- dt-binding: fix 80 column, drop unneeded dependencies
- tested with patch v3 of "gpiolib: of: Handle threecell gpios" [5]
- collect review tags
- Link to v6: https://lore.kernel.org/r/20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org

Changes in v6:
- rebase to threecell gpio patch which proposed by LinusW at [4], 
  drop unneeded *xlate(), *add_pin_range() function
- add SPACEMIT prefix to macro
- adjust register comments
- drop 'index' member, instead calculate from offset
- add IRQCHIP_SKIP_SET_WAKE as gpio doesn't support irq wake up
- drop #ifdef CONFIG_OF_GPIO
- move interrupt mask disabling/enabling into irq_*mask()
- Link to v5: https://lore.kernel.org/r/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org

Changes in v5:
- export add_pin_range() from gpio core, support to add custom version
- change to 3 gpio cells, model to <bank number>, <bank offset>, <gpio flag>
- fold children DT nodes into parent
- Link to v4: https://lore.kernel.org/r/20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org

Changes in v4:
- gpio: re-construct gpio as four independent ports, also leverage gpio mmio API
- gpio interrupt: convert to generic gpio irqchip
- Link to v3: https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org

Changes in v3:
- dt: drop ranges, interrupt-names property
- Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org

Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (3):
      riscv: defconfig: spacemit: enable gpio support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 +++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 18 ++++++++++++++++++
 arch/riscv/configs/defconfig                    |  1 +
 4 files changed, 33 insertions(+)
---
base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
change-id: 20240828-03-k1-gpio-61bf92f9032c

Best regards,
-- 
Yixun Lan

