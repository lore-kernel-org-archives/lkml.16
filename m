Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F91D7998;
	Tue,  8 Apr 2025 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121353; cv=none; b=kZ+HrdJE8E2nZmHuvb3DOI/U/i3GrNv/Q61eyZPVg8UsSotPrnUSaCQFkkb/uPWISXdh4sssO81ialgQV+zjRGxcu/MmEGRA3UNU2k4pTNznEia/LuLGcN9qu34fGFPzYLYlM3GZWRRZgrmH6Uqmg/jWX2FfIFkXCtAeka65o+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121353; c=relaxed/simple;
	bh=2PzR4o4IgAn+Nu6fMktFxMnhkTqEfpHCjvngioSwPZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2k2OkNjFv/pHgAa0G/EX+pQxnUhniTELHWNBAFhn3XqDUzp9Ih9QS/tR1zNKk22JLsXUhHAMabDZuhSS5FlkXhJ4E4OiNeKf6V9Oh/sDmx6RvFIK5bCG7JN+m1GvcspPPoXmh4doqtxMA/m30SsDkotM0OI+nhQlKzHS+1eBSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=OFMcVlxe; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=O2NHqlNx reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="OFMcVlxe";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="O2NHqlNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744121349; x=1775657349;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v/+gO/eDzqiwoj1Zge9Nk2I670NLxBB25O6xAQ9lBnE=;
  b=OFMcVlxeO4iRVtNGtuVjoE1+Fk7hBNrGuclTcFhzyEKvcTQiaq6+L1nF
   rgYJjtJIGo7ZP9hhhm+Yy4rMLZdmAifvhFfkrxcRRIu1AhEbNFL7o4fYu
   T5ced933P+h1GN7O/0h5a4wcZreNTbjDCb8ja+MOwZEidkux+lsIqkYK+
   KbUD37E2xfTryw8gdWEJnVE6BkzSykOtDqo3lR9ufUHquzrlxSDlMqCQU
   EhJmKl3kd1TbQAfN2bqvhI8xary8jRg9Y12ef5UHGGE9lTFZeQrfe0q10
   5saohgqczrqnb11fzJSPlrhFFATSgoEQ3pSYk/pHLME7LuWZfk5a+w1GG
   A==;
X-CSE-ConnectionGUID: zjMQrJlkQkWcpQZUvIOG0g==
X-CSE-MsgGUID: +nLC5QXzQlSqn/wuiTVC1w==
X-IronPort-AV: E=Sophos;i="6.15,198,1739833200"; 
   d="scan'208";a="43405800"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 16:09:06 +0200
X-CheckPoint: {67F52E02-1E-903EAEAC-E04C76C8}
X-MAIL-CPID: 5A79930083A7B365114DC689F0D41E81_5
X-Control-Analysis: str=0001.0A006374.67F52DF3.0056,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 413701621A9;
	Tue,  8 Apr 2025 16:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744121342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v/+gO/eDzqiwoj1Zge9Nk2I670NLxBB25O6xAQ9lBnE=;
	b=O2NHqlNxp5QNXDjVYtpGLSWdOKX/ELTWx7c0ZkMlBrZ6jfsrZTKAtW0urzHAC5VSs1TGDR
	l5pxaOE01iUdjI7Y2sRKMWfRCqSENvTXuVQxC1xZO4292d8bXyMkHE4jp8dIa3/7okOlpb
	1E4zSFZalXoUlvf3VxrzS40BFVS7D2jZ8EGB5ONcbdVSDHTY/6z6hXuAtTX6MAThWOuAQR
	/OHjID+4VjpmKvTpTPs75X8ndO37jpVLiMWvLh/yApSaWMUs63PjKs5u8THXw1Xukr85gs
	5USJ/OvTaNlXFg5l2j4CvOMoxYMI9+LI9rtThOoXI4Weh0Ij1z6B6kuTZ9WfDQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
Date: Tue,  8 Apr 2025 16:08:55 +0200
Message-ID: <20250408140856.1143290-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This platform supports several displays, so rename the overlay to reflect
the actual display being used. This also aligns the name to the other
TQMa8M* modules.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile                        | 4 ++--
 ...s.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 93cbd8d5081b3..38ce3d1c41c10 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -263,7 +263,7 @@ imx8mp-tqma8mpql-mba8mpxl-imx327-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8
 imx8mp-tqma8mpql-mba8mpxl-imx327-isp2-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp2.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
 imx8mp-tqma8mpql-mba8mpxl-imx327-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx327.dtbo
 imx8mp-tqma8mpql-mba8mpxl-imx415-isp1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-isp1.dtbo imx8mp-tqma8mpql-mba8mpxl-imx415.dtbo
-imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtbo
 imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb  imx8mp-isi1.dtbo imx8mp-tqma8mpql-mba8mpxl-ov9281.dtbo
@@ -277,7 +277,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isp2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx327-isi1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-imx415-isp1.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-lb070wv8.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-ov9281-isi1.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
-- 
2.43.0

