Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6B13A258
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748280274; cv=none; b=rMEHxUnFJO9euZDJunoNjMnXT6xr20TbP7qIWOZYzwxVy4lP4widHDzMBf2wsVkx/4WLEOFuLsrEbOPDqxtDWEaMKaH/LQDJjO9lpNOwRDJ9+OWTxTaMlRRvEPih6gqeISazGIaquaF8ZfbQRqTr8XafZ7IkE393HwvZmU2f2Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748280274; c=relaxed/simple;
	bh=ZcpFRckONNk0IxICy9wdY3sQ8Q1X3+puSI8PoaWnr94=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dc41Egxk81VmQ/U5Xygdvxl3A1HEUPY5P6WuR+8OvFVNuyFEOnt6s8UiA8YToMG1Z9l/nv2E+LfTOho643dphRAQOi5lMrEcwjmjsOT9qpJlwlxRLLDjkgDsruK5KkO3D9GMGlJL4MX+rXL4eeZLjzfM9hAwvctuH4ciHn2me/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b5hwT0xxFzcBF;
	Mon, 26 May 2025 19:05:29 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4b5hwR6dDXzvWr;
	Mon, 26 May 2025 19:05:27 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/4] rockchip: rk8xx: allow to customize PMIC reset method
 on RK806
Date: Mon, 26 May 2025 19:05:14 +0200
Message-Id: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqfNGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMz3aJsi4oK3aLiEt200jzdNCMzw2QTgySzFINkJaCegqLUtMwKsHn
 RsbW1AKpXPrRfAAAA
X-Change-ID: 20250526-rk8xx-rst-fun-f261c40b6d0c
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

This allows to customize the PMIC reset method (also called RST_FUN) on
RK806 PMIC from Rockchip, mainly found on RK3588 devices.

Although RK809 and RK817 also have this feature, this isn't implementing
the feature for them.

Finally, this is required on the two RK3588 devices from Theobroma as
U-Boot changes the silicon-default (which is suitable for us) to
something that breaks our companion microcontroller's reboot detection
which breaks a bunch of assumptions in the MCU FW code.

To validate this works on those devices do the following:

On Tiger:
i2cset -y -f 6 0x6f 0x9 0x62
On Jaguar:
i2cset -y -f 0 0x6f 0x9 0x62

You hear a nice (loud :) ) beep, then reboot and it should stop right
before entering U-Boot TPL again.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (4):
      dt-bindings: mfd: rk806: allow to customize PMIC reset method
      mfd: rk8xx-core: allow to customize RK806 reset method
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger

 .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  1 +
 drivers/mfd/rk8xx-core.c                           | 15 ++++++++++++++
 include/linux/mfd/rk808.h                          |  2 ++
 5 files changed, 43 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250526-rk8xx-rst-fun-f261c40b6d0c

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

