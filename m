Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D2221146C;
	Thu, 10 Apr 2025 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275790; cv=none; b=jq8z2KMdLo7nRL+pdNMldzpj5FBwr3q/OtJ16sXF96i0af+B4WtDg2bDpFPNZL6OFdCvlUjdwaILTMsJrD/SCHUJCI5P0SM2V0PhuNcAbLdOz5RLr7Uw9lFM6Uy4k/ciVVPVFSQKwyQ3FowPg9BKEa3skJUaC65E+q4zZ6LQqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275790; c=relaxed/simple;
	bh=DdzjTwgy/ASzXe0f37Ozn7xiGT9nJ2oIFItkDrFaTp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qDFh7nE/kYiySFdh03xx0JpO7HNaxDa/jEiQcAObysDnkgmDoddEkUZY/i6TQXusEZ22EEpS1V/XrtWJlhC8jjhFzOi4Ixwup8lSeY6gsjGvmrmp+QE1TpBVc1iQwYftk7oiNK2q4IAzIZCGNpB4E9wP2tCfgNzUz1+fBYNj3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=p3NEftJY; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="p3NEftJY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RzFZaFbiyh0k4uhyLpPCRhWq94lofXi27Sh5rcKdyO0=; b=p3NEftJY6ofRcgP0BK4zjSiEfi
	kKlyfE+COjX7oV3fCKjP9z8sC/fTRNA2+epIz8Hp+82o7y2AopPYvq2SFBsaMfFJRGTF+ykbnImta
	7GRgG09JD5nEqUPG5ceXYvivdM6/uzdZFo6VH725fdprqHNhhAGQsDPmfhwhxiOstzuUsCtBN01H8
	Wpo5Rk+FAXb1Qu+Qvoiho0MhTEvQZF4A3xN8IKZOnjrqJybMu14CNPqT7mquhQ0kfSJZCGSJ7RzlT
	p4Q00VU6awm1HA9sShLl5+7zUPAaudHzQZrcR69InjBLSKJiqJyYD1PqBMqHlnnyooKVf2PA607oZ
	VpEv0dMA==;
Received: from [89.212.21.243] (port=41926 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u2noQ-000Djj-0d;
	Thu, 10 Apr 2025 11:03:05 +0200
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
Subject: [PATCH 11/13] arm64: dts: freescale: imx93-phyboard-segin: Add USB support
Date: Thu, 10 Apr 2025 11:02:49 +0200
Message-Id: <20250410090251.1103979-12-primoz.fiser@norik.com>
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

Add support for both USB controllers. Set first controller in OTG mode
(USB micro-AB connector X8) and the second one in host mode (USB type A
connector X7) by default. Note, the second controller is not OTG capable
due to HW design choice.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 027a34dbaf04..faad3c3e627c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -82,6 +82,19 @@ &lpuart1 {
 	status = "okay";
 };
 
+/* USB  */
+&usbotg1 {
+	disable-over-current;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbotg2 {
+	disable-over-current;
+	dr_mode = "host";
+	status = "okay";
+};
+
 /* SD-Card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-- 
2.34.1

