Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DC25BEE8;
	Tue,  1 Jul 2025 06:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351129; cv=none; b=Cpr/3qSQqUtk4LRsfu/2hOLK1h15r2swx81wEyVJnphZNAWW42/deGKVt0W4MrnueRakuEFCpLcj0oTNfkRNidpea11pHi+o2N5JqQDfuvniHTgWmoAEOwo20LESY5XfclX9f2Fnk2nrpzatU0viCmEX6LzOp/cXxdibAqckEa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351129; c=relaxed/simple;
	bh=xK/ldA0i+fs0B3OJHPw39+4Ul2zH6V0+ujW0hhqaeEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJ33vNLueIIR7K0b5FTNCd5wBgdhrIq9OjBCuCSRQXGKwie17zZfShTze3flhgVTWzqAHSTBd5hMzYR7ZqFB41PaVfv406eaLg8W4YhLiQii0aXyyQWqakgEGQJMHc0y6GbUCazxMg47q09fZtaQ6PrdNusmm8fSflI7iSzLBS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=bCbO+hWN; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ZhbJH6am reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="bCbO+hWN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ZhbJH6am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351128; x=1782887128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zm64T/IdqDWHw2fYB3DMuVhVwWq8Nqi/tIifOFc3y/U=;
  b=bCbO+hWN5vIVQzXS+UYv37uUHvbBiPsxPJATEMNP/8keL8KfEmf9ErAQ
   pP3AtInki+QT7lBC5ca0Ay+rsr59A8Ev87Mvr3+ovXgPExnvCz7X6CRXR
   2ez9wHjuPLo3gnKG6VaayuLRyC6GQ5zX832WdGvHGxnEo0wVPgJICV5NU
   3+AldbgeT+Mv5OTyn0DApIEQadfuf12Q98YvaM3uWSnox2gWZuoCfQjPI
   H83iy5zLPCwfziEquYIRf1xONZL/9kGyiNUeUUtB8VDP50YX0kpv4UNCW
   oEIkn9Pn2PBPxz519PrNHw2bxXv2c1lX+Ponw2Qz3RFiXJ1u/Eyw9behf
   w==;
X-CSE-ConnectionGUID: knYFXxf9TQipES6gueG2KA==
X-CSE-MsgGUID: 19z7TP5dQjubtt8iE/0+ow==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:27 +0200
X-CheckPoint: {68637F57-6-F34124BF-F8CE6E96}
X-MAIL-CPID: D68F531D0395034A2964B73398F07505_4
X-Control-Analysis: str=0001.0A006370.68637F7E.0001,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9205216A55D;
	Tue,  1 Jul 2025 08:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm64T/IdqDWHw2fYB3DMuVhVwWq8Nqi/tIifOFc3y/U=;
	b=ZhbJH6amPJfx49jM9DM4t02zHYl3WN39XBJDZov9WJWXiTqDtwCRECPkt/8IA0EYqRHabc
	CS5+j1BOyhraMwwoCs4Qdn1oBBd/FLIEMCMQcrvXMq/U47HnJymz3rSlMbLNgiBBFYh4Y7
	HfNOHLw8SR0QHSXaYlE5yHO5SaBtM7sM7zx9n4ypGXxdj7F17o6iS/LqUenIE7Gym1zrrz
	3L1t78XITICwKyZIpMtKj8/RVLsuTpFaSm1FRsg8KDRspejz6Cmd1BwcsN718oNgvYZNgO
	6CB+6shfoWGg5EZrx/Ub9BffOD1CeuyY4/L968jC7eGsCKupbc+L0fucpOvrzw==
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
Subject: [PATCH 3/8] arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:51 +0200
Message-ID: <20250701062500.515735-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The jedec SPI-NOR flash node itself has no partitions, but the partitions
subnode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
index 9a0f21484be94..66a7aff893b32 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi
@@ -17,8 +17,6 @@ &qspi {
 	qflash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <62500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0

