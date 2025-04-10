Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007426FA79;
	Thu, 10 Apr 2025 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279241; cv=none; b=dT9TOS9pT3R1d7slVCweuetWdOWguT23Q9u1rt9r40dLZ13scbNZ1OpM4pZWKcOamN8S+hPvn6/7rXwM/ddtImqR064hh/9Ddf6aJP4axvYPojgHtHLJZNs3UhF1V9oNAH8zTw9mHUcUvWpSk5QvXGWeFcv29Gy6cuIsjcOVxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279241; c=relaxed/simple;
	bh=mDdACf44e33XI0dpstXAdFq9gqILwvmm5QcVgDIZMgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rbJNAwlAbVriUuLHLuKKFrbZ++nVeLUF1btGzN56JaMiKPw/Q1Zwxh5gT19PDc37riNs4QbKz1OM0rBihsA0zEjD2Lxxu9FM7E/f0YFUn0gNbPbi77pTKB2AkUHtIUXG+wY8hQBiscM4ik7hb2fQs8/iK1hPKZton5EMKy9C0V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=NY+vFVyQ; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="NY+vFVyQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=caYvtvJqNEqdShPosNv6lO8f+Vtj++Kp5DISf3ZYdDA=; b=NY+vFVyQU7mS7bW90afhYAskNO
	18+jk1PZNwbpDNhTYinjfjYj54qksCZkDPjEKpSGL0gxKTOZ1dxcVR0++ccpu7faKCzzLqwdE040Y
	7G+SEm7UjWtle0rhGx5nsHO4tPq7jAd6deSLrwNW+Bj6CzZEDEPgsKCyMXVOfdQHHN/26gjvZQV2C
	J8DFEoiKA2nV7Jzsh5SjtN1/7MOX8Y2d/+H4JDWXtn2cKaDnaUrKZzDe/bYLXTA1cD1cdZWZkIKlK
	4mRmObxQgr1eYDg+NGX0rMMNMuAHmm8Wc/+xY2SgRxgB6YN9adRDc+6IYnydGpSATwy9/8k+Rr6iD
	N8yJZRjA==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noK-000Djj-27;
	Thu, 10 Apr 2025 11:02:59 +0200
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
Subject: [PATCH 07/13] arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
Date: Thu, 10 Apr 2025 11:02:45 +0200
Message-Id: <20250410090251.1103979-8-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410090251.1103979-1-primoz.fiser@norik.com>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
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
cards. Thus disable this feature.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
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

