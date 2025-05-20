Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C827FD6C;
	Tue, 20 May 2025 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742984; cv=none; b=B3V2eZlavwgZKZqX7e9cfc+LXxk6WLoG8N8VkhEBZULXiWfaEkj6Lu7jWQQNZzKJy4mgfUDCij9FidD73aBnUKWJZR4AWqvlZlP3CNkgr1Ick9PmQe5xHLhIughtVhv3+4nw4hPnVBsyNzwJ1kdCWy4c2+37LDoJYzeisLPs2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742984; c=relaxed/simple;
	bh=r/0a45tDOG1Wp/4/S60HJvxc7MPWubEQ4sYHv9Gbi60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qtufm4grSDNZL5devcGaE9OXBfkgot60QFt3TbYGbSKGqpyhTqyXeKmNSWWseNegf/jOBFKnHZDWGrlpdLU3fMycpU4Y/uAV53eYLjVmNcO8Wmo0gPaElAHnUHB1Z8Y6yyew2v8HWhGda12O2JxIK/n0TCoxuKoPvPSKy+kzv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=E6IIruio; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=sRWml8PK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="E6IIruio";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sRWml8PK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747742981; x=1779278981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mydkjm08QIvLWA/4BcOB1dXEsbYKaUwIYfeH9kPQgNs=;
  b=E6IIruioTkRtzvsz4YzE6FUFtJm3y4XF5TlNjoldovtXwR7FEKsUlnOg
   IJ54IBp9AR4dd35cQSuWBmXCYH6XOh2vbDZbEHVCZnyjTyW4gF4hnyE58
   Y8d1x7Zh2ieC4ChEhq1hBhQNCzzwrX3SWa1mE6l6dRRMAmlfKPCPqILDW
   FTfgqYYfg5IQ7W5gwo1BoPxL6GvAtvVbZ3iHQGhDxffSlOt9FvNdWTm8A
   /OjqJz4nliTli9Trz09vgDgQ83eSpLZiH5uUc5RjhvOCbfhNUJxQvrbXc
   FFoKBCCCJtQhukFPydx7kiKNu8XGmf5PAU4y+uh3yjuvDkzIr4VDs1RCn
   Q==;
X-CSE-ConnectionGUID: WGbEe5mISL6y4FTUK6hA/A==
X-CSE-MsgGUID: wNbZQtggSh+ST2W74UFkow==
X-IronPort-AV: E=Sophos;i="6.15,302,1739833200"; 
   d="scan'208";a="44182551"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 May 2025 14:08:28 +0200
X-CheckPoint: {682C70BC-7-DF3E87D0-C74668F0}
X-MAIL-CPID: E98BEE298717E5CE9BA43ED74D55136E_0
X-Control-Analysis: str=0001.0A00639F.682C70C3.0032,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AC9B160A8F;
	Tue, 20 May 2025 14:08:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747742903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mydkjm08QIvLWA/4BcOB1dXEsbYKaUwIYfeH9kPQgNs=;
	b=sRWml8PKLS2gK0dDH+njNPfwX5dX8uBb4x78wNwmI8THAjaUaxNIy0E8nNNOZTWVSPlGQl
	arvXW+bEXegh5G+J2k4pX85rcpKWy58VMgcIgx/g8ZKxbBrwWqz3f0zdEyJU+jyxIJW5LI
	1tf7o811/HyX+ke4jpKxmCqluVPK7Gbj3eU04I+YpaqaWkSuUOPDf7dVehlrisH2k32W4O
	v2ZBUQDPf2KHfJFWxMvj7Jg6PK72UmDsBT/ogFVb/UEQdw/GqRU9/VTrjJkIc965k4Orjv
	ZjG3j/QiKeB161PgIJUdrLi80srNDlysDrNuZnNJgJ5t/vYoABXH5S1UK5KHPw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: tqma8mnql: Add EASRC support
Date: Tue, 20 May 2025 14:08:18 +0200
Message-ID: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Enable EASRC support in tlv320aic32x4 sound card.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Note that the firmware file /lib/firmware/imx/easrc/easrc-imx8mn.bin
is needed.

Changes in v2:
* Rebase to next-20250516

 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi                 | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index dc94d73f7106c..d7f7f9aafb7d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -79,6 +79,10 @@ &sai3 {
 		 <&clk IMX8MN_AUDIO_PLL2_OUT>;
 };
 
+&sound {
+	audio-asrc = <&easrc>;
+};
+
 &tlv320aic3x04 {
 	clock-names = "mclk";
 	clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index 640c41b51af98..1d23814e11cd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -52,6 +52,10 @@ &A53_0 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&easrc {
+	status = "okay";
+};
+
 &flexspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 7ee1228a50f4f..79daba930ad64 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -136,7 +136,7 @@ reg_vcc_3v3: regulator-3v3 {
 		regulator-max-microvolt = <3300000>;
 	};
 
-	sound {
+	sound: sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
-- 
2.43.0

