Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482D24E4A1;
	Tue,  1 Jul 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351122; cv=none; b=UWvczawF5XJdqNaWCXNm1h479i8r9AUT6TRaJYFmd4D75UXKFQZHB6hq/UaizXzUedx5zruuWny939BozodtWYiYgrOHNPyWJ57QMVVWJI82Dm6JgWTjl4dNGkSZejTDgyqqlJpelqlayV2AJWW0tVeL9ZmkIp1rrjiZZI2F7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351122; c=relaxed/simple;
	bh=rc8tyuye3gQeIY3xq/ey5rCkeVFKBmQ82NEvW53M2g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5N/Y5si57eJj35eJVXSfLs5rrnJWA3Ke7xNYob8qsm5l+VVzBZJv2jSD4p15JZ02OjWzGl+TYCCiig/EtoULgW7Q/4pkGcCyADgnxcBeFwJNdx4Ugk3QoIpBzXva6KdliUh/V1jqFXOCWrDVxqaDzpc/+H8GcpQwouXgNu9N9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Y/JCcU8p; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XIDj/1NP reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Y/JCcU8p";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XIDj/1NP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351120; x=1782887120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H523ibeLh/S6NSHahPUKbrVHvI6iw8O56D/i76Dq++E=;
  b=Y/JCcU8p+8svpdGCVZ2tZNXLq44BV4fYNVz+f4Ozy/9LTjg3eLLoJ8qn
   uYKp6fgx6F6k8LXRA35qD8EbzpEyW5AXMW6CTY31X+lWJqs912p/dQKM9
   AkZIcNBgzkyLQTLqkn2tkSAs4F7gkmmdRbYSL0UXf04bKUcz+oUtTn7Ig
   yV6rsOmNk1OdV70NypLw/Jb3Xs070qsZGW5YzZBSEYyshBiiCvDBiCMyU
   O/O/WuQMwwi0+UBO2UKOkSy/QwIzjhFQpCdReSX5T5IRy/CGlFmv2BE/Q
   edH0d1moyMwQr1KkDidt6jyOaBP/E9Vd7a5UI9G5qzvOTm9Ch0mKMqmGC
   Q==;
X-CSE-ConnectionGUID: Zu4pZ2uYSzWWAXVq0P7Onw==
X-CSE-MsgGUID: dJ0oGTEiTnukOBWPnPIspg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943371"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:17 +0200
X-CheckPoint: {68637F4D-13-F34124BF-F8CE6E96}
X-MAIL-CPID: 4A7C7990F1446E38723108C6CB668AD2_4
X-Control-Analysis: str=0001.0A006378.68637F68.001F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8368716A4F7;
	Tue,  1 Jul 2025 08:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H523ibeLh/S6NSHahPUKbrVHvI6iw8O56D/i76Dq++E=;
	b=XIDj/1NPmZ0lrWzEH+bp1ZEoM5KuAM720Iyasl88uEZQohP0hBbJpy/S5tnVBDlDA4My6b
	FEhO+gODHnR07KQYAkFbRR9xhU9lkZX31JSNVT7cdRi2RztQB8E3M+Cr/hs1QvDZOlcMSQ
	3vKDt8mCtKUydW2bacL3ULgBTd35Jx1LM7lsLMXLku43YjqfCBStnQq4isXZtgV+QBuEQw
	lvv6nLLyV1L++OdZUe4WCJyrmC80/4c+W8EewcEogafRgKMD+I2rVwwJLRk9XAPWUXyy9f
	yh/CZFiHTGZeRqsgfWylz4hyia0hm/L6NlOaEK+OK37UG2QjaKQ4jKYCj9zG8A==
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
Subject: [PATCH 1/8] arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:49 +0200
Message-ID: <20250701062500.515735-2-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
index 12d5f3938e5d6..e39eaa1759365 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi
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

