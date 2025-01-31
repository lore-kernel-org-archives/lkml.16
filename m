Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4113F12B71
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285334; cv=none; b=j+4WIpd8hlP5s/d+loeRQkpCw/NBtTpyu/IsWNHydXGzJvaaddItQVnoTym2CilkBoofaZpQOxBh+GNAXNvndUmY8D2cRSbVoKRSi+5diL88BlowIbsgWuLWCOVy81nnwL1sEzciCei+bEe/CYtmLKcgbEz+P1TIA1+CPi1hBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285334; c=relaxed/simple;
	bh=Z/5cIqgu/W+LDyHnLi8DCYXWccNyGI+A2bSSP4iDs2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HS/InVE9IcOvF9WmbhbMQ1b6o6IL9LyQnxTUUjjoKYiIoYpiFWrpK2GX4irWycSvXbA7dcC5O4EJWO96si/jOrpkrNRzrxt5j9db+zVGFaZ3DyTKL9jvhmJskVBKV3OU55+VdhC8AFhFz4tS8+jwK1kl3oV8Z9Z5ziF+WbB76ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=oV/uYThs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="oV/uYThs"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AC7AB2C0125;
	Fri, 31 Jan 2025 14:02:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738285323;
	bh=yes7xD9tFz1XhfYUV2iwA1QJwcuq/M7YoaqeIkqKH+w=;
	h=From:To:Cc:Subject:Date:From;
	b=oV/uYThs+99GpFfnJjJ6TahkFtsImnlkIc9DFpMyNhOk0SKaCJfTM/qGa3JWwKJqx
	 55kif8rj9a+8vzszjKeaK8TfJz48DePpIK4a7Yrhlpx38hf03IYDvm1+O/AtdAqduT
	 Xysl46W+ZZ5A6NnEKPCJ5MRRTTFQfal8yOczTw/o/xJEO9cHHNETe/vIarLpEthQXQ
	 t+Nh/ai+IEI1pGqfHJqX5yAySkgz4SrC5UuLfnSW6TrO4apiKkEDNdwn49rHq8cUhM
	 Ynoo9YaQ7Ublh/hdUbNYtkWHBfre8kaIZx3FO4dR97qxKKeGIr2DR9Ac1oThsSaAQF
	 FFHClFDzoKECg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B679c210b0000>; Fri, 31 Jan 2025 14:02:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3F8F113EE2B;
	Fri, 31 Jan 2025 14:02:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3CE732809C0; Fri, 31 Jan 2025 14:02:03 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tsbogend@alpha.franken.de,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/4] RTL9300 MDIO driver
Date: Fri, 31 Jan 2025 14:01:47 +1300
Message-ID: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=679c210b a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=VwQbUJbxAAAA:8 a=2fb9Dq4sOb5bA3HnAgEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds a driver for the MDIO controller on the RTL9300 family
of devices. The controller is a little unique in that we can't access the=
 SMI
interfaces directly. This means we need to use the hardware description f=
rom
the DTS to compute a mapping of switch port to mdio bus/address.

Note that the dt-bindings: mfd patch is dependent on the dt-bindings: net=
 patch.

Gmail seems to have decided to throttle mail coming from our domain so th=
ere
has been some things I've responded to that have hit lore.kernel.org but =
may
not have been delivered directly. So sorry if it looks like I've ignored
something. That's also why I haven't send this round out earlier as hopef=
ully
we've done enough to get of Google's naughty list.

Chris Packham (4):
  dt-bindings: net: Add Realtek MDIO controller
  dt-bindings: mfd: Add MDIO interface to rtl9301-switch
  mips: dts: realtek: Add MDIO controller
  net: mdio: Add RTL9300 MDIO driver

 .../bindings/mfd/realtek,rtl9301-switch.yaml  |  29 ++
 .../bindings/net/realtek,rtl9301-mdio.yaml    |  98 ++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  33 ++
 drivers/net/mdio/Kconfig                      |   7 +
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-realtek-rtl9300.c       | 436 ++++++++++++++++++
 6 files changed, 604 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml
 create mode 100644 drivers/net/mdio/mdio-realtek-rtl9300.c

--=20
2.48.1

