Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5E1E2852;
	Thu, 30 Jan 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242078; cv=none; b=XKHkkGwnsmhWVP7a3V9krSdT/zlWZz3KSGmNHZizagDPdw1RUrWi7wB9xaFM3vLCtEP7074TaZA1o+j5TPbSrVN2x5F1E6Go7Avm7l7j+hmQ3c4D0VbUMGCybWWuGBALhnTPS/b0yspDUKq7UvED/rzoeCnZCcmybjKf4L51sGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242078; c=relaxed/simple;
	bh=PYb5PVqFei0MECxubIFcxESnWkCFmAzq6ua5HfuqqbE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JXguyKVxCQtFAE+R0tAQFOcVfwCffJXEe1JPScFhtG1qE/tVQYTIk51hhu5CpwJ/HeC7S0zHJpqPUIGQlGm/QZzFC1uzJogqMie7kk1n6uIf8PenRss75BnHWF8S5bbS4pXh2u5DVuksTW5sO3UoRsfWjSD50T2hXyvofV2BGOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=IUAGykQA; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=UR1yUV+7 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="IUAGykQA";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="UR1yUV+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242076; x=1769778076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xq5ntvdixTiMxw1S/ZM1ceyovGwDVcIx7hfQrpd8SjY=;
  b=IUAGykQAnacSxpBkCopTq6nyPzwgdokWZIGSxe88II70h66fOhZiIehR
   Wh69z3hrjh1mTw1/9vDBFI/yrdoE273w9nta7fXmsvO0NrRPOSixpwpiF
   vITd4z1wBuz7gXnCKDA4jy35LUvar83VCtx26kuhlbSJqsZMrLpXzJzia
   QvJgwF228/v2uGfxzyHNbWv9ZQVb/oCNZhKu1U+FIyCPGYtJo6jCiy2uc
   VcggS9kIMK7vjFTcRShlu6QyMEGa9Wif8ZTUlwEb6uczcHkPWfvIMGQn9
   hv73Asv6z3gKPvVOQals3nG+cNS4Xfhi/UJkpKvTIMgn8cQgK+p9nI5ze
   Q==;
X-CSE-ConnectionGUID: Xpw1lbTSSA+LmV+tlAdbqA==
X-CSE-MsgGUID: Jg7Qd6jUTN2CIa1azzepQA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374598"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:13 +0100
X-CheckPoint: {679B7819-39-31397509-E321C4C4}
X-MAIL-CPID: 9BA95ED871756AC7173E720217D157CF_0
X-Control-Analysis: str=0001.0A682F21.679B781A.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 141261675B4;
	Thu, 30 Jan 2025 14:01:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xq5ntvdixTiMxw1S/ZM1ceyovGwDVcIx7hfQrpd8SjY=;
	b=UR1yUV+70I+An2YmuusWORYL4BjlpiS/BTwBrJNm/+PFoMO9bDCS9TKCI2EMrLOBBHNhFo
	rYWa1E/gvtMOEcDdLpSaRWOYZwM2gpm+fM/q0bR98mVFPmf4bGKRZMBH7hoJhZdLPslodI
	SOOt31ld5pQa1rTVVysSFN3s99mD75x6zn9TE4eX8Q+UFisk/bE8oX6grAgpo26rttsikU
	RJ1Ly+346pXDyUqVWjBG2EcX2mrIv2NBBK7XrqM0HCy79RrMMTGKRsj1cIwqMrf+8zCQBc
	+8IL7ffBGiKcmRznMDIejAMqPvt/8r3VMM/27R3lpvmKlIAXl9CGmMnKBSjMsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller definitions
Date: Thu, 30 Jan 2025 14:00:58 +0100
Message-Id: <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These are the definition for the bindings of imx-ocotp for disabling
fuses.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h

diff --git a/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
new file mode 100644
index 0000000000000..6e554edefd488
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX8MN_OCOTP_H
+
+#define IMX8MN_OCOTP_M7_DISABLE		0
+#define IMX8MN_OCOTP_M7_MPU_DISABLE	1
+#define IMX8MN_OCOTP_M7_FPU_DISABLE	2
+#define IMX8MN_OCOTP_USB_OTG1_DISABLE	3
+#define IMX8MN_OCOTP_GPU3D_DISABLE	4
+#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	5
+#define IMX8MN_OCOTP_ENET_DISABLE	6
+#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	7
+#define IMX8MN_OCOTP_ASRC_DISABLE	8
+
+#endif
-- 
2.34.1

