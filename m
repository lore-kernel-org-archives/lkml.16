Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431525B1C5;
	Tue,  1 Jul 2025 06:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351126; cv=none; b=ZpwqqsiCUuHltcvrHyU5IKYmoaT/J7/qXmGvN4FooLQGEnsr+8NPWFxeXpJVDZGxRLdoW2CjKlVkgeYE/0kaToZOYRmcVMYiHMiU5s3PCl7/qfXNnQNEQ8nCHec10D9rUv3LXdGVIgfURM5Ec1z37MGbppAV4zxDbqowEmKNens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351126; c=relaxed/simple;
	bh=nzxmFEgFkEBLrmeBf5ue+cN83zq6lnkiK+YMAYj5yg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLPLtrc839qhFAdt25XuF6vx5Vmidy88SYPtqDPCpQ2KXIOYnvsu10cQXbYPHQ+inloBvdPOqoaoOUkE9HEmXIY2rK6lcJwnwu2rqxqpR6DyHYheaYreWSSwuKacqnvof8kEywY6wqlK6+JAcBkK/zjK4Xh9tQ7kaNJTLEstqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=SYhlxn8U; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BOYfXq0y reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="SYhlxn8U";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BOYfXq0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351124; x=1782887124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jvJSpWuqSHaTy3Hsey6pHPwU1ULTDl2WgXKxYEb5nE=;
  b=SYhlxn8UbdAD0B9NGDzcKBgGgpMAmw4QS7y68Y63RAa4c8SjN984PRe7
   6JoXszvTebqs/o1okBkOhS8a9b+ALw1qnin85yULiUqsRrx7qwl5mHFPb
   JtjKb+fkllMgS72ntHjBtKU1ulu1CEg6qwbvjWjtzfzVfotY133PZselb
   Hep/ZQvZcPl758+8nMUBHThVX6GsAg/KjlpSx/nrxWwFRY4OW95OTyILs
   LmS/PKRn8ymYd898WnQRfKIhrU1eMQ6fW16SDNQMBar93qmLn52ZVczDZ
   htdKR4yPL78KRpk6Wn308eY1DHW+/m4VZfD6dsaaQk4OFrChtElw243XI
   A==;
X-CSE-ConnectionGUID: DPtb36mQTE2nfjHoEYrZLg==
X-CSE-MsgGUID: uUk3NebXRtGIIqDUH+l/3g==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943373"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:22 +0200
X-CheckPoint: {68637F52-1-497D558D-EBA6F5A1}
X-MAIL-CPID: B5B289A437088DE106602003F1F7351E_3
X-Control-Analysis: str=0001.0A006370.68637F79.0014,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81AA016A539;
	Tue,  1 Jul 2025 08:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jvJSpWuqSHaTy3Hsey6pHPwU1ULTDl2WgXKxYEb5nE=;
	b=BOYfXq0yvd4lb4TmAw/ojWrR3oO8vsZ9PZWoXdFcKuJcLlTwmsDfAKL0jlCj3yOv4MOv9e
	7gIWhHLVLKWLVtqAPyAXHuJ1/M9ROe9TyxodzOvQMfQZfFsuavCBgerShDPAvIB6t5p0ZX
	KaPFfct5WPf+ALbDvk1D/43WTD7wluCTOBxORuP6hRxQvOYUr3nzVVbtC029YyxGSjSoix
	98UkNYhjUIAukUS9nEoWlzeB87Yb1VH7hnYg/Ix529KIywjqtKJScwDiFw4Qnvx1RquKix
	4lQN0BK7Ldbh3XxJDTA76qjHinHWbwtEymhQQpYFSyV8ZbsiuIPtrWjHZEkZ2g==
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
Subject: [PATCH 2/8] arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
Date: Tue,  1 Jul 2025 08:24:50 +0200
Message-ID: <20250701062500.515735-3-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
index 4a8f8bc688f52..cafb35f674aa4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
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

