Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C3450F2;
	Tue,  1 Jul 2025 06:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351118; cv=none; b=M4J3DPre2SmNXQNj/eYX9bQ6yZLQLKe/1+Lk6yLgtTKaaoKS80jYg8nAnHbm92K6M2UPjRV00lZw6D0omxEJUUM4X6x1YKWr/n2d/fZus6DvGnnhqM/NRO4yb5LPKY+1owzAneyPSz8fmyHsqW6GYUlK5iMG0PI/drXw2p+UEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351118; c=relaxed/simple;
	bh=hBK1puw3CmwnwUZ8lXhRAEqf7onqewrfI8EIkYdtkR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FRXwRrYuWbc4+kAMCjuqpV2JjaGRVNKytBc0GSeJcO/CXSakvdYm7T/mqn2RhL1WiQAKF0iYBTbepPNmss45qNQAVL+ulZwOlFf/egDJuyqKbSzo+7owaTVND6wIHTbX47v7XwS/acyRbMGlHPu7O36+E+y60BCRjDryEoJEmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=EI04OAKk; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k7zGGGA5 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="EI04OAKk";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k7zGGGA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351115; x=1782887115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JxIQLyP26v4rF0viEUEQnw43xKOq8QxXK3Q1+9z51gI=;
  b=EI04OAKkQyEs8h3Njo4pav1pZIrj70hmAPKdyiMl+TgFMX5KCoIej+++
   3BJR18293efyJqGEDlbNVDMtBqb6yFpob3+lan873M487L5Gb2t/cCACt
   UuO58NJKiJe+Ga3du16W8UzaHDa4+MSGEmJ/e+R8m1zqvgqzhQc+2nZK9
   IFNRD3vLelVwWUgn3+o5MDk1hP8yhRD26ptFXNhW0rNfQLpGGBwx/COEe
   oX+AYAYHmBuyEJcpi6ZAsBczI90CguQ9b7TrDUjQWg5lG/Q6jH4HxKxRf
   VGFSxEXrq3CFJbhUHOVQ3DqG/7m6p9awq1xJ5qghrLwnJK/qAYsyD0X0T
   A==;
X-CSE-ConnectionGUID: kLXLKSUvSECYNTAmH4TDvg==
X-CSE-MsgGUID: ZSAxOqnSR+mJTwx/0dmXug==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943368"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:12 +0200
X-CheckPoint: {68637F48-4-ABFC28F4-D6731B76}
X-MAIL-CPID: 4D93FC8CE74F964E39D083D9A1BE8425_5
X-Control-Analysis: str=0001.0A006376.68637F79.0065,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E2AD165890;
	Tue,  1 Jul 2025 08:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JxIQLyP26v4rF0viEUEQnw43xKOq8QxXK3Q1+9z51gI=;
	b=k7zGGGA5zJxR9wVKxccy/UDRfdq5y6EhEtggs8bEFWvgaV+fRV9iDe5y11DVvr9e7uO0NQ
	z2fsY/1vI1HdFriLCVJAIFw7wSn2fGSbamg6RrK9MfowAs+3Obt7vdL6FSxA9xEraQgnUd
	LTnzMdnDZxuV0+ty4tg6vdflXiVfWQGNJihdn8PqbP4sFsmS0Fn3F8BEG9gN4lAyT/TaBo
	d4zvFpeBrcLBvCBKPBCCguwSHfDEGNsmoyCdT/FcAPORFvld5XdDTm9JFLtZ+rw1D1Csub
	yjrPW22fTv1L4YXZuofBNBaeMnA77cRtiKV1cPIqN1dO8T2dzrAKWi+PvxYNsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 0/8] TQMLS10xxA DT fixes
Date: Tue,  1 Jul 2025 08:24:48 +0200
Message-ID: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series adds some fixes for TQMLS10xxA family and consists of several
groups:
1. Remove superflous properties for spi-nor
2. Enable SFP interfaces on TQMLS1043A and TQMLS1046A
3. Add missing vdd-supply properties

Best regards,
Alexander

Alexander Stein (8):
  arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
  arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
  arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
  arm64: dts: tqmls10xxa: Move SFP cage definition to common place
  arm64: dts: tqmls1043a: Enable SFP interface
  arm64: dts: tqmls1046a: Enable SFP interfaces
  arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
  arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash

 .../fsl-ls1043a-tqmls1043a-mbls10xxa.dts      | 12 ++++++++++
 .../dts/freescale/fsl-ls1043a-tqmls1043a.dtsi |  3 +--
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      | 22 ++++++++++++++++++-
 .../dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |  4 ++--
 .../fsl-ls1088a-tqmls1088a-mbls10xxa.dts      |  8 +++++++
 .../dts/freescale/fsl-ls1088a-tqmls1088a.dtsi |  4 ++--
 .../freescale/tqmls1088a-mbls10xxa-mc.dtsi    | 16 --------------
 .../dts/freescale/tqmls10xxa-mbls10xxa.dtsi   | 21 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi |  8 +++++++
 9 files changed, 75 insertions(+), 23 deletions(-)

-- 
2.43.0

