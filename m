Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13B1E5219;
	Thu, 24 Apr 2025 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745481020; cv=none; b=ecPOAJSDLAqJt671dyGV3wt/NomiOKeNsyWYbvqzgZxTQph1ghTNC0KvsLO/EwdWCMk4gAugCG7os2sf/HPQdSGLBKzTzBlxmGLXE9KHW1wZl7bBFqPWvvziGqPLj2bV3FMD0ri1o+kkvTLklLtKBXkJa5e3mYcF9qR9tZ5BKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745481020; c=relaxed/simple;
	bh=GnZknFA3mM/LbErvisFejtd/AZKs+Dvax3C1Mp1vNjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWiCnog3PqIp7rvDaCAChntNwM2JyXEGo05sxmQV3EAJJlLda4c0v5nHs9jqVDpShOdH3DardR/weB55Rqp/KtM+0OvIH3jH7ZafmXwYU0BVET9KCLp+fBE5a1aHoK4WOMLwoextTUeUVmVpbgc1qYSUq8dAuNttcFnzKE4CRTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=k6Fg/i/k; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JBCvKpJv reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="k6Fg/i/k";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JBCvKpJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481017; x=1777017017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=;
  b=k6Fg/i/kL6omkIQg7VxdkJG3u6cIGbq6C2C4sfcj7CdrXsopuQYFeXSi
   qTKH9ANQUNLlN34eNZEpcyq2+Jmgof57Nc/xVqJJWk1Gk3DWvIRPpqmgD
   C558jVi6giiRPR52WrKcCZ+jkmqeMA2jnIDvgsfGOl4KAGRy2OtgPFfgr
   N58mRLE/el6+6rgrF/7fp0mFudbL0P/PPItdv6Sd0/YBX+VIgM3MI0yhG
   ei6qkbZ18w1v0gnE51crcC6yTM8D8vZuwVKdaTH1Z4vGlm4hrGz7j5dQC
   zdB0V34/F5WXyHcUw0kNccSdCfqmAam3PEAFkhBwsdnF9qN95+7yA2qIB
   w==;
X-CSE-ConnectionGUID: 45SGrGlIT+WzhyFrR6hCtQ==
X-CSE-MsgGUID: rPw/yKINRCGYTpmwzm1fxA==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691469"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:50:08 +0200
X-CheckPoint: {6809ED30-13-2417938-F0170C2B}
X-MAIL-CPID: 3625BD89FC92ED8F66117B423DE68433_2
X-Control-Analysis: str=0001.0A006376.6809ED3B.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ABEC164B42;
	Thu, 24 Apr 2025 09:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=;
	b=JBCvKpJvgHcY+NT4xxynklYDT+QD5vXN/29a3PCXzb5KRcisaspKVwJmxuK6gNe3iTj1o6
	UCmPVbzhC7dEZcMcnclWLhwlzUusylddyHsfZetmBjlfcT4QC991QLXV0T3F2ZACkUr36i
	t2+2JutJ0RE9uPsY5XhM7lb0iG57D3KZ0snDS7yoSPe+VqFfP28D22/ISny0kPh2p3USc+
	QsEbUY6MV8HHQhDOFSpFxV71KKA37MrfEa22jUHgX38DNc4OcCPy2pGksnxYN1aYXSjIP8
	tKDG79ithp7mOklPelRrJHmTYBGzs60eRIMbVS5T6nDprUdyrP3SRr0Q/tMf7w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add LVDS device tree overlay
Date: Thu, 24 Apr 2025 09:49:58 +0200
Message-ID: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The LVDS interface is the same as for MBa8MPxL so the already existing
overlay can be reused on this platform.

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2: None

 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index eb77eda881e0c..6f87f28f4583e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -247,8 +247,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
-- 
2.43.0

