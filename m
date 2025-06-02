Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E08D215F6B;
	Mon,  2 Jun 2025 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868739; cv=none; b=ZX4t6jqKPVnyjieDZCPebhighPHhGCSPJI9p8ponK6eITP9oAsPG9+0aScJjLwdx9S/+RyVRunlVsqZHJ0B2sgLRMZjJtODnjRpTwxktmaxswbkjbMfguu5Bs7pd3aTqNfdXs/cg7B5lGUlWfiW34cyyAOtZzggmLSJpO4uzmFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868739; c=relaxed/simple;
	bh=kLIQLvncsrMXNhkMSXPH1bKlaURjWeZCyUZk3Ef1v6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EsPiN97/xTc97B4OAGtwqI34rTCG29rN9KU38cSIXX33Sn0qx7EKdOHLgZVytx+IngzcsabnSfVZZMwMAXhB52jyiOHFcShH5K3eahNK76B+Jy6Z+2paG7dzmBEVY30iqfckm3X5WuodmmccIHjPlsQ65+uCS+v3hdafIuR/b1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=cWqOLWpt; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="cWqOLWpt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZxhTgCLygSpRzZ9PzHb6ECFgejGwUE72Etj5ELI2Wgw=; b=cWqOLWptPRZS2apnyR7vYHWdOR
	2s8bFDL8T/eRFZt8GpEJ7XYzh7n9b0DZfcBvXJ1oeFnwupUw1lE2wh11Lrs/lGvvdklnQ4+sGT/2b
	skDo4BHK4n7cF129X0xlvBDh881I07pno4lsiefN7kUyinnV/hjBqZ+WEoHIkClcElMOzXgdVhq7L
	QjwcRGB6NO/g+NZltYJJmfqUHpeWl/F2Myi1/J4N+3BiGYxorKLMfSGyGebeIB5E+YACumUNjp9mw
	YJSbXAbxqA0jiYMmtw5bbdkMKKYdrruQxe8GEEl+5GVIE3WImlFkf6dW9cW+RUF1XbSOEYoK/gXBT
	EshVYq/g==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:56998 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uM4e8-007eqG-2L;
	Mon, 02 Jun 2025 14:52:08 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Move ADC vref to SoM
Date: Mon,  2 Jun 2025 14:52:07 +0200
Message-Id: <20250602125207.2265222-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Move configuration for ADC voltage reference from board DTS to a SoM
include file. The SoC ADC reference voltage is connected to a "VDDA_1V8"
voltage node and supplied by the PMIC's BUCK5 regulator. The reference
voltage is thus defined by the SoM and cannot be changed by the carrier
board design and as such belongs into the SoM include file.

Moreover, with this in place, customers designing own carrier boards can
simply include imx93-phycore-som.dtsi and enable adc1 in their own DTS
without the need to define dummy ADC vref regulator themselves anymore.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx93-phyboard-nash.dts      |  8 --------
 .../arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 13 +++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index e1c9aa77c000..475913cf0cb9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -53,18 +53,10 @@ reg_vcc_1v8: regulator-vcc-1v8 {
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
 	};
-
-	reg_vref_1v8: regulator-adc-vref {
-		compatible = "regulator-fixed";
-		regulator-name = "VREF_1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
 };
 
 /* ADC */
 &adc1 {
-	vref-supply = <&reg_vref_1v8>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 0ea61841e591..26bd801a49bb 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -46,6 +46,19 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_vdda_1v8: regulator-vdda-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDA_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&buck5>;
+	};
+};
+
+/* ADC */
+&adc1 {
+	vref-supply = <&reg_vdda_1v8>;
 };
 
 /* Ethernet */
-- 
2.34.1

