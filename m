Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C8269885;
	Fri, 18 Apr 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957880; cv=none; b=tiSea1l9wyIDR7w3A0rj4nXflh9/iLhkGNIEG5LOoi8I0XC1aWPRiYl9iGBOv77KeuUil503rUbnGzjlaPJ3YBYkP2wsuiYk/PCQQM2gG89T3TmDEaTBOLNNtcKVboRtjYCxpyYl308B7oMGAk99d7npiyBwA0nb7UOS1qELSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957880; c=relaxed/simple;
	bh=j37D9wJ3jOprssiF/YnP1zSxL7WYcOAFkYLcHi7+u0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oX+oFfbkvoCay+sKZ6+EzIW156OG6qiz1oSnVYrhYV7X0qONlOMFPCcicPmeERSh0Fj2F8SRtBwIlbi3RSY4qm5wxtQvcH+AVdquJJ7Ll0YlRrL955ZxCb8I7o9xdyWTCfR5w7ryg7xud4OMYKhHrpi574UXGKTDW8uCM4GHoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=HnM2srK6; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="HnM2srK6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=P9l4T5ibgYIV6hKWUuKFPoWKHVOpP6IpFAO1zSrZC40=; b=HnM2srK6THAjKio1RhPMlRFpiI
	0ZcLscLwdLa52mv0a+3E//8sgtZbSssJj2Pqo45cybiJ8Qcp4sGICw2pxXEjYY3V/540K/orqASh7
	EsF271iFEHyNR6D4aNexSKCzZSi1/EAiiiujj60Zol12Vpw52ouswiuqLzjXWVeRIVcVTaTn4TnFZ
	utLKFQfS+C448kaPDDhsabv879M/h/KewImnClwNE37C9Virc9wGcSHBFPk9jxuDc/vyVTN/4Uj4c
	CE2Y04yemng6PDtTDWOdcytV2PNuFrO4HPkCx8W99lpEl8OZjoiAVaZmsRDxaV71dpKv1kII+fF1E
	aIFOcRmw==;
Received: from [89.212.21.243] (port=56446 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u5fFn-00AbM0-1q;
	Fri, 18 Apr 2025 08:31:11 +0200
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
Subject: [PATCH v3 07/15] arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
Date: Fri, 18 Apr 2025 08:30:56 +0200
Message-Id: <20250418063104.2202085-8-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418063104.2202085-1-primoz.fiser@norik.com>
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
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

Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
of the following kernel boot warning:

  host does not support reading read-only switch, assuming write-enable

Micro SD cards can't be physically write-protected like full-sized
cards anyways.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- add Reviewed-by tag

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 902b523fc92c..3d5cd0561362 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -48,6 +48,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
 	bus-width = <4>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	no-mmc;
 	no-sdio;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-- 
2.34.1

