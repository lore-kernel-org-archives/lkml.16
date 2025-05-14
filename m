Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D7229B3D;
	Wed, 14 May 2025 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215736; cv=none; b=AmSmAQtnZM0SmYvQIJGH2wK/vWkXOKpCBoX2fOE0Ngyherr9d7A35tIsQuA0JmKEdgfacbj9XS3XNe2NhN9eY199WTVngvdF8Mg1IfkXsmwQd+juK6fU5CqlO4NLV8dJpoai4RoZyhprkDl784owOdmzX9n0/sAYjjI88idvjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215736; c=relaxed/simple;
	bh=7oAriG+yJdr6txj2k/dguFvIC+bfCdluyJTc5UoZPKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qifl/0N4KoBfrnk+CXcGoR2Swyu1mGnEsaIN4BFidS9wxMexG/XxpEFlK1MVocY/RA+IB+B0plQ/T0Az+oZ8BPSn4BR8lZxi8MyHT3AQKwO3YfyfzVRNOfyttiRG79xrXIEmy34DDOhmirKoz0fClYCV4+7o98qJKy7mObnOygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kJF32RU4; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AABxyhm3 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kJF32RU4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AABxyhm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747215733; x=1778751733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/b3jKQnjFfCzi+nMXSpxQ6mwboqPa2j12sqkwa/JUXU=;
  b=kJF32RU4F9y4J0MmNArV1Dl36eiuMjKMxqd1tJecznwnCEXj2jiFts7Y
   QR9MqQvnj7Ay8vAA7x3tRzLY9PuggRiobMS7A8yhoJl3nqZVVLI7cL/AT
   V1uZ052LZMsWGoCAP8NEpWWFbWgMfgu5XkVSt7wroR8M6ieUzpHsFbvG9
   +Xs8TYSt8VvxwZtj6brEhgqixiYi6/nxjhdxEpCLl1T0KiiTYG4oNlKF4
   zDk1OqgX31YhXRQCZN4RQKHXucpGNkhatU7Fz22aoD/llzf6vtit0YBbk
   L1RGxiiLSAXEKTlOdyHhCk5fcXCRTrORH8XpCmROWpPBfg3IAjjeyJhER
   Q==;
X-CSE-ConnectionGUID: pdY1pfZ4S9eNFtVX5MqFBw==
X-CSE-MsgGUID: unBuWKI9RjagjdxTdBfhtg==
X-IronPort-AV: E=Sophos;i="6.15,287,1739833200"; 
   d="scan'208";a="44067210"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 11:42:10 +0200
X-CheckPoint: {68246572-20-C7E25413-F4312D34}
X-MAIL-CPID: 929D38BA6E11661DC1AE8B71335B08CB_4
X-Control-Analysis: str=0001.0A006378.6824657C.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05B78169473;
	Wed, 14 May 2025 11:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747215726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/b3jKQnjFfCzi+nMXSpxQ6mwboqPa2j12sqkwa/JUXU=;
	b=AABxyhm3viV2vt+6Cx6039RTmSUeTPK8sCNkgxL+gt6ywRLSYJvihnkLwbNPvrrqqkv7M+
	JaF+58M5P6HeneWybu6IVarHruxlwT29pha5KU72FRJ1l+Ws+572aZ+IQ+NC5UIR5O6zuf
	EjXracL1q2iJmx/dDPAAyZkTjJXOVoCrNdKIRqDVVUAhYhdRP7aLvANg4TZYZCFfgxOneq
	gVJ4ZVZqjYCO7xG06oUclvaFyF9O8QQQVqaxfVZEm2uU5+VJlTizT6tuSE33u4s/SjBOdo
	/Mmvkyztg4ABvw6Ud3jnbkUtBsWQ7uR+gy+UOU65Zk5azy5FgzupEnIXsm0Zog==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: freescale: imx93-tqma9352: Remove unneeded GPIO hog
Date: Wed, 14 May 2025 11:41:28 +0200
Message-ID: <20250514094130.621087-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
References: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Starting with commit e6ef4f8ede09f ("gpio: vf610: make irq_chip immutable")
gpio-vf610 supports locking GPIO being used for IRQ. This already prevents
configuring the GPIO as output, so there is no need for a GPIO hog.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 09385b058664c..c2e9c126bd261 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -70,15 +70,6 @@ partitions {
 	};
 };
 
-&gpio1 {
-	pmic-irq-hog {
-		gpio-hog;
-		gpios = <3 GPIO_ACTIVE_LOW>;
-		input;
-		line-name = "PMIC_IRQ#";
-	};
-};
-
 &lpi2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "sleep";
-- 
2.43.0

