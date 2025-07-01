Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C938426057C;
	Tue,  1 Jul 2025 06:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351145; cv=none; b=qsJ4swKNn2c0izX/jiUjRy9VJAQegZDfaa6qwte8gud0MMVb4Ab6jl5v7QZeONWesyWmqB2X/OIJZr8kgqapWLd0UYQ/77+ef+7mL8DnJZ4oY55oNlQu9viXFAkEryKc7ttjaF0bpVu3pbapKE/X7ax0ToAYG8VsfN8sEg8RK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351145; c=relaxed/simple;
	bh=kqhbusb4G0seCqWwpnGwHlvyQN7dvmsg8Alj6q7/U2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIEhdULRPG9kjimqCgEhwsUxEsf4WdClh+JRxK4oCP5xs72JlZbGaEoddkTbIUv8Jb41Y87RsvLt7zFZyDtFbr8MlEguFDR8XXpa4z5e/HbQNiGRwh0zb5dOIu7Q4jf7og/8Ol4EN7fhkmyzkGgm8cWGOC788FEXUbu1mjb5X3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DwxaYY8d; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MHCRgmIF reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DwxaYY8d";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MHCRgmIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751351144; x=1782887144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nK4p8G0pyCnC9FqEn0RQ8k/V3iMh88LJHP9Q1eet4ok=;
  b=DwxaYY8daG/uV35iIeVdEjWIoy2frNYhiQtAsoBvZvhZo07FLDNNXIBA
   AxCeLMTyVyHloVisDy9tM4FxYtjQygmq4z3IbVrVbpmLUvnXh+CRhDUbA
   36vsqrDiIfCjCkugNcdHUvGSRmYMTKLo5KPzNdu4cscoULMRdxWtasT+d
   bLU59YVkSNgnE9eqBvvdHmZ4Fo15Sl17/0kiDAPkplXJ2K0+zGSNRJ18w
   dZP+Sk0QBL2CTH3+ymeuSUB1f1P7T+6b4LywyN9K2pUztBVGc+Dg/qiAq
   20iii0BOpBmNTJwdBSHpKnVkso7vzFLx91/Q/9DRiItD+Itsm0Ruihiur
   A==;
X-CSE-ConnectionGUID: 620mXZKuTGS5s7ta6AS+yA==
X-CSE-MsgGUID: hWxztEe7TpmhUxhrRTX/Bg==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44943388"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 08:25:43 +0200
X-CheckPoint: {68637F67-6-468F1319-EAD2FB43}
X-MAIL-CPID: 9019E50B743E46FF6436B8F25B1106F6_0
X-Control-Analysis: str=0001.0A006398.68637F96.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8719616A570;
	Tue,  1 Jul 2025 08:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751351138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK4p8G0pyCnC9FqEn0RQ8k/V3iMh88LJHP9Q1eet4ok=;
	b=MHCRgmIFBlZwwf4tfLm7JkXog9Lhq0r725SsyHqbDNk6yVNnn6RzFZjMoOYM9xsjXzvH2Q
	J0DK9FnyF1m6rOm8Lzpjb7I4dX9ZV8+RKv1NzB8xNYkzQHIUGqBELUnl1dvdO1NnYYr1dQ
	eCZdEvVISX4oWCrPnBjPdpKb8boKJk0MqVb6KV88/2X1YRmo3UqozReQbZqiXllzM+YPqG
	j8iXo3GB0uaEypxlQbTh0kPJi5LMqV2DfFOQlVkL0ZgC7waJFn2DwXqd1DyF1A3KIJA7f3
	VzlZkJr3EVMYUmUzsH6lnzXENt7WIFP6BilshJUwPWUepihjSC7uJK3CqNd9Jg==
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
Subject: [PATCH 6/8] arm64: dts: tqmls1046a: Enable SFP interfaces
Date: Tue,  1 Jul 2025 08:24:54 +0200
Message-ID: <20250701062500.515735-7-alexander.stein@ew.tq-group.com>
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

There are two SFP interfaces usable on TQMLS1046A. Enable all the
corresponding nodes. U-Boot will configure the connection if the RCW
is configured accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../fsl-ls1046a-tqmls1046a-mbls10xxa.dts      | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
index 37834ae3deac5..43261cda3fcf5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts
@@ -44,6 +44,22 @@ &esdhc {
 	wp-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
 };
 
+&sfp1 {
+	status = "okay";
+};
+
+&sfp2 {
+	status = "okay";
+};
+
+&sfp1_i2c {
+	status = "okay";
+};
+
+&sfp2_i2c {
+	status = "okay";
+};
+
 &usb2 {
 	status = "okay";
 };
@@ -51,6 +67,10 @@ &usb2 {
 #include "fsl-ls1046-post.dtsi"
 #include "tqmls104xa-mbls10xxa-fman.dtsi"
 
+&enet6 {
+	status = "okay";
+};
+
 &enet7 {
-	status = "disabled";
+	status = "okay";
 };
-- 
2.43.0

