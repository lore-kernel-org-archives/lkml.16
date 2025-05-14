Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9F22A1E4;
	Wed, 14 May 2025 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215733; cv=none; b=OvBDE9st0GGBG3drFDeIxgFlSECJmdk1nTSm/Ka/i5w+E9ghHfFPnQtjgFMYS4FLmXsfChNPQTD2yxD03pfH/QIoO2FPIV8AnAHisyUUJxDClDOIi8PwNsscgapmGBs3w2V3wKs9BIjaptlPUP+N7uTeJzYF2cfRDQy761P3S9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215733; c=relaxed/simple;
	bh=zoXMW86+ZJ8fN+eY3ZCHabWml+/Ig28iGSVplBxm2Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRZQlzYYkoc2xvSYbGZz/YGOa9o+0G7eN5U/6a6X5WqXSKyhV7o36iI5KDQVaoUJbeUTL8MD5SPtgBUqAVsRLtLrVaszXeFtJn1xSpNyrAXUTQ+mQyKDbUGIELvOapDbP9JYd2h34QChaiS/Ni5PvmWjRVCfBjk8LxcfIDK5xaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kv0LLRtx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Z5MFqRMb reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kv0LLRtx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Z5MFqRMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747215729; x=1778751729;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Wvx3ucJuAray+HL/HptLX7X5NZZogGGvAUJPEAufiY=;
  b=kv0LLRtxNnI9SU8zZLTgicKbsbc7nRc2KZEvBG5dKUGxtjfuSAhLeFV8
   HfVvnkLuAWf388GQE7GfENX4n16iphXGAODa8BnVA5hThrsD6terGSepv
   Dg5Trw8zh5KBUDHf/QH+u5yvbWoLil8u0xrQt13zkaQNHAdYLWYxa590J
   jqsd1Bs16P+yDunH4SgT9rkC4iEuDgGlgLr7n7VseT+/b/qM8U0hG/mGT
   MVCsEU9BFKaiKd85Jl+XxbjLpm56ajgEGgK1MlkXG3NNb3QjsQGemy+VX
   5fpERtxyaBYhtO6+O0ENbQwFLZ6hFPPpkw7ExoeT+10kTG3Da08shq42J
   Q==;
X-CSE-ConnectionGUID: Q9Nola/5Qeu9dMgyPBR+VQ==
X-CSE-MsgGUID: Om5AOhGLSN62OmU1viv7QQ==
X-IronPort-AV: E=Sophos;i="6.15,287,1739833200"; 
   d="scan'208";a="44067208"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 May 2025 11:42:05 +0200
X-CheckPoint: {6824656D-3F-DF3E87D0-C74668F0}
X-MAIL-CPID: B2EC1E38393EE08C66776342BF6B7804_0
X-Control-Analysis: str=0001.0A00639C.68246580.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3845168F22;
	Wed, 14 May 2025 11:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747215721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Wvx3ucJuAray+HL/HptLX7X5NZZogGGvAUJPEAufiY=;
	b=Z5MFqRMb5LX1beEmHGwIHMDFVu3mtTHZVP8rFGpLNK2jjcBOtun5gXXUjpO3tismICs4zo
	v1QTHzIciZLq9/vkoPXiTmCyNaILP6KczQabmMGcbW3wjR5E/W7z4WYpTisQ3yTXfxsfB2
	o/70xfo4iUBfb6+8hM6i0oVV9/4J73m8HW+PPfQ/pYY4I/xdObKS8fVVuXcuERzTYH1FVG
	tIE3nOyW83w53o4yCD+kzwaSZXVh386q6Gl8taaEvuQ3v1l0iO0ez/mmhSBJ6lrkXj6ZEU
	s5YkFrvUc5+Gf5no+WYLgaptaOuTdymTyx9+b5nXxnrBImOlFt/Gb7dhUhUGXA==
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
Subject: [PATCH 1/2] arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to 600mV
Date: Wed, 14 May 2025 11:41:27 +0200
Message-ID: <20250514094130.621087-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

TQMa9352 is only using LPDDR4X, so the BUCK2 regulator should be fixed
at 600MV.

Fixes: d2858e6bd36c ("arm64: dts: freescale: imx93-tqma9352: Add PMIC node")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index 2cabdae242273..09385b058664c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Markus Niebel
  */
@@ -110,11 +110,11 @@ buck1: BUCK1 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			/* V_DDRQ - 1.1 LPDDR4 or 0.6 LPDDR4X */
+			/* V_DDRQ - 0.6 V for LPDDR4X */
 			buck2: BUCK2 {
 				regulator-name = "BUCK2";
 				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <1100000>;
+				regulator-max-microvolt = <600000>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
-- 
2.43.0

