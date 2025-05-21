Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548C21770B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842280; cv=none; b=XGQUTi2b7saouV2Pgs6oSB6cUgOE42aF8m7rX1wTxxZLH2kqPbeg8OBR7wuQ1H1kEAxtghEWYOyZMJFS80GWwEYjYV3Sfyuv3vs83C4G9Kh8f7qz3DC+mZTiQnvnglRL4zGP7xOFDQtTLldTokPt5DfkuIiAE1FZCjom3kuXpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842280; c=relaxed/simple;
	bh=Tevs3pas6CDAsUh+2wMEgICV/gQAKnqDWGoJ36kuST8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNefjHNOK0lDemC3HswRZF2E94jiJEFXfJBC0tfVUEVuSXAaJ/oi4fLQPja28Vnn+66mM69sVGVQKbfACz76kBYusWxYDlV0/ACEMFS16rj2xbReSEfJTEUD/EMuh3ExkIggHKC90CM7JGIiI3x7WVVbxYgmE8mXVtnYmBmJ56E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b2bML13WHz10xj;
	Wed, 21 May 2025 17:44:30 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4b2bMK2CbzzMn4;
	Wed, 21 May 2025 17:44:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar -- cover
Date: Wed, 21 May 2025 17:44:18 +0200
Message-Id: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANL0LWgC/x3MSQqAMAxA0atI1gZsMRS8irgoNbYRHGidULy7x
 eVb/P9A4iicoCkeiHxIkmXOUGUBLtjZM0qfDbrSVJFWOFq/24gT3zfyFjCdsrmAhuqahl45owl
 yvEYe5PrHbfe+H9DUt01oAAAA
X-Change-ID: 20250521-jaguar-mezz-eth-switch-75445fd1c725
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

This adds support for the Ethernet Switch adapter connected through the
mezzanine connector on RK3588 Jaguar.

This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
connectors, two user controllable LEDs, and an M12 12-pin connector
which exposes the following signals:
 - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
 - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
 - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
   GPIO3_D1)
 - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)

The whole SBC can be powered through the M8 3-pin 12-24V connector on
the adapter.

This also adds the ethernet1 alias to the Jaguar main DTS as the GMAC1
is exposed on the proprietary Mezzanine connector so anyone using GMAC
on the Mezzanine connector would likely need it (actually need it until
https://lore.kernel.org/netdev/20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de/T/#u
is merged).

Note that for this to work, you need this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=ba54bce747fa9e07896c1abd9b48545f7b4b31d2
otherwise most packets are ignored by the DSA switch driver.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: add ethernet1 alias to RK3588 Jaguar
      arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../rockchip/rk3588-jaguar-ethernet-switch.dtso    | 189 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   1 +
 3 files changed, 195 insertions(+)
---
base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
change-id: 20250521-jaguar-mezz-eth-switch-75445fd1c725

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

