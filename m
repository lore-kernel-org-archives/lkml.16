Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298021ADC67;
	Wed, 16 Apr 2025 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813690; cv=none; b=Imd0ETns+IXP3M7S4F+gAqdnnkN0w0XTmfSHkUlbzwQZKi44cPHNMLLfiStpzqtYOJxZ+a6tj/mma//BpHIfE1GmzFXWQyllrGQwMbu5kUK/1+W5kKwY+kRSn2dvdLMt06zihf+QzHCTef8+3c+JoEG+KEl27tSfKgYB21z1h3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813690; c=relaxed/simple;
	bh=l9TDtXY7OU7uL8aV7cw32/Pd7TSJScjkzY1TxJoUmj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgGUGYLdyJ4w2D2vEGF1xoeXMExAKvMmNSToqltRBGq848ChSvELJGZmwCVncMfIDM8ZqaEb2hy7t9uwr83/itwF671ei9n5YvzgJ8fitRDb60o1RpBO+gxkBQOgt1RCuvT+L4uCsfWcnwaEw2EJoz0BtGcQz+ktT6vCJTsjrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=HHdz4cUV; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="HHdz4cUV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C421DBFC16;
	Wed, 16 Apr 2025 16:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813686; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FScWshifJvIijnD4Sqm8C1fnkngATgObzxPdFsDLYYg=;
	b=HHdz4cUV7+QsbsguIExtP7/+cPEszjbCZcBLkQepe1fJJGz8DZuC3jSn9x5WfCWCGNbab1
	AaBkVZ7sDyjXXn8HKjZ+YOHa/nORFP0DPkvHqKF7/3Imycl/4jHdUo9Zh+sk5w0i51fiFD
	d1YgU1sPMDuITFRA2q6IGdy66mgIueKV/GGcRKgF6rEsbOVjhgosgQucv+H4Rjz046o2vt
	zgxgJlG+uywRUfYwGnBljn2Y66DPq9SLYDQC6xVWUN9cC9sk5Ow+8mdUEYMQlZDqA4BS+y
	zJ6T/nLcz/QoIS6N3w1XfGpuDkfdKIO6mICO0Kz09k+/GK7Zk5UBUQ0WxwtKLw==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [RFC PATCH 3/5] arm64: dts: imx93: Add node for EdgeLock Enclave (ELE) firmware driver
Date: Wed, 16 Apr 2025 16:26:22 +0200
Message-ID: <20250416142715.1042363-4-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This adds the node for the ELE firmware driver that provides the
S400 API.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 64cd0776b43d..122519648d1b 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -222,6 +222,12 @@ cm33: remoteproc-cm33 {
 		status = "disabled";
 	};
 
+	hsm0: secure-enclave {
+		compatible = "fsl,imx93-se-ele-hsm";
+		mbox-names = "tx", "rx";
+		mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+	};
+
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
 		gpr = <&aonmix_ns_gpr>;
-- 
2.49.0

