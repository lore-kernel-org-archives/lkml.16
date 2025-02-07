Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9861A9B3B;
	Fri,  7 Feb 2025 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917416; cv=none; b=QgYzyBy7Xm9Di9S6g3No3eS8vtGq0sXivi/ukvnjOMM1m//JA5gyU8oZaomqDSpnYeldrtoxHJ56g2/I1VnjHn9/upiv7PtZw1g/KrfG/VMKRYYwVhKTHcyAPkIuwdSRe/E2J3rDuJ+fxkoDZsh0dzzaWGhDq2U1znTOrtkSeuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917416; c=relaxed/simple;
	bh=0o0RPv871OXoWz4JnC8P/GeEkhkdSN/tpKIFokIwh9o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EgQ7wkpqa05Qh0xbQtjaReWbnL2gkE/7B8yTDDQG0B1A7s7Pu5/nBhjJeEQ/ud1cJt3ZcT07gcEUUMAXU4VRfWCJE6vn3x3sfqWVMqbJTZ5+cIMARnlJQeYpPN43RL/aUo0G2W7Q10jYb7FJ1WHEjt1bd0GdYwCNrjegMRd114M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZkOgHRGf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Sq5bQilY reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZkOgHRGf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Sq5bQilY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917413; x=1770453413;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e2+AE/2LJAYye9HkKHifG+tBEn1kiEbNgM5Be/SBU0Y=;
  b=ZkOgHRGfDWoY002Iziaz9Xb73YBVk8CO8GmRYCblTmsih/YkV3OUTkzP
   xzmXiKs1/4ldC15Yx1YYzz3+M/DLog4nXEICYq/J9gHmbwkQBl0BVSikK
   SwZaEjKEyxtLYsZzM3uvEMUaBGMDypl4fjcREzxzRY4ICnM9rF2YwQf/A
   ltyfqNpCycz/UKIprM+vzcQpAHpAlGdSgK6go8k1J/u7n2swmixMOEknS
   7XPlfx2TLJgPNSCnMxdhscW+Oox0+lG+REv70h6amgMq/gpMPxZJacktx
   aIgWdTMXq4iyTXcu+JwSWiQZ9M00hQ7Q1RUqTfzguT1Fj2zW73KpiLQje
   Q==;
X-CSE-ConnectionGUID: av5eSYpcTbOPWv03T6b2pQ==
X-CSE-MsgGUID: 3BW5DVBDRlKWS9YBHJwkog==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636068"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:25 +0100
X-CheckPoint: {67A5C608-2E-2D67083E-CAF60585}
X-MAIL-CPID: 986F74BA90AE23D311AA173614DDDFF0_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11841167AAD;
	Fri,  7 Feb 2025 09:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e2+AE/2LJAYye9HkKHifG+tBEn1kiEbNgM5Be/SBU0Y=;
	b=Sq5bQilYhtLsl41kYmMh+fxhdDs43vuoSiecvSFOK6itUhRXpRpxAyac9Gm2cdrt4ZhcSf
	ynrbwFbxxgJje0dyPiRtbGdsk4LQTiEqXBqtbSp6Wn3/dajwQ3/MVTb3uzVySAxNiR8C3w
	KKTpxw+7m0ZIAty2oXy0gOJFPh+pY4DIKYbC4UkOPBEsHFFWcPJglqQghkPJcT+7ehBKy6
	QlP7pplYMPNKypCF3oSslFKjN9RXiZ5weE2QOVo87ICRfU1HkQju8s3s1jzcTy57l7gery
	kctGmaSw2DegfQaLcXQJlHv+EuOtSs/EUcAPgA46rLk6DBvv0PoXunPMTSJ1Nw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Make i.MX8M OCOTP work as accessing controller
Date: Fri,  7 Feb 2025 09:36:05 +0100
Message-Id: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

inspired by [1] this adds the accessing controller feature to i.MX8M.
The OCOTP eFuse has bits which can disable particular peripherals, such as
GPU, MIPI-DSI oder USB.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
Without this patchset the default DT completly freezes the SoC if GPU
is accessed.
Using this patchset the GPU is disabled without any DT modification from
bootloader:
> imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed

Changes in v2:
* Encode all addresses and bit offsets into DT directly
  This eliminates the need for platform specific code in imx-ocotp
* Added support for imx8mm, imx8mp and imx8mq as well

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com/

Alexander Stein (10):
  nvmem: imx-ocotp: Sort header alphabetically
  nvmem: imx-ocotp: Support accessing controller for i.MX8M
  arm64: dts: imx8mn: Add i.MX8M Nano OCOTP disable fuse definitions
  arm64: dts: imx8mn: Add access-controller references
  arm64: dts: imx8mp: Add i.MX8M Plus OCOTP disable fuse definitions
  arm64: dts: imx8mp: Add access-controller references
  arm64: dts: imx8mm: Add i.MX8M Mini OCOTP disable fuse definitions
  arm64: dts: imx8mm: Add access-controller references
  arm64: dts: imx8mq: Add i.MX8M OCOTP disable fuse definitions
  arm64: dts: imx8mq: Add access-controller references

 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h | 31 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi    | 13 ++++
 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h | 26 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi    |  8 +++
 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h | 42 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++
 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 15 ++++
 drivers/nvmem/Kconfig                        |  3 +
 drivers/nvmem/imx-ocotp.c                    | 76 +++++++++++++++++++-
 10 files changed, 275 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h

-- 
2.34.1

