Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7A238737;
	Fri,  7 Feb 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917462; cv=none; b=IXgyalxH6Exf/Jb0rLJdsdLvX7U2CuOyqjNM9LRfSuRAGkxe03wNf3k8YS3Cq0iboF+J03pVBAy44R1dg9NnLtZjJj0U0/hS6EXa0Cfdre8Xlr38dP30BjpvW65dkChT9HtSElG+EP7k5GG/4gVdTpxoer4xpizmreX3tL05/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917462; c=relaxed/simple;
	bh=WZdQImwNoHHqSpy2Q3eqmp/iP94bs1fCIY64jXZD4/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tl1JAMYtbVqE6lpyxHGvcwpaeC5Jaa/UGcw0zSlTN0wJ+lSZ+zwHAGE5kR1XtLOiKWozTbMWQ7/DFV/gOzUmgJdC5vwM0UllTvxYrOT5nUJoaQY2hjjr5Oct1WQyMQ2Y0NTtSgXgT5bMGDO5pd8LigkUVfkeU4T+M7culCceVWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CqJynzIE; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rpZ5t3j6 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CqJynzIE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rpZ5t3j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917462; x=1770453462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFW0TtEuC1R227YTpxajrq5OhUhBVT+uUuYSWlEy4yY=;
  b=CqJynzIEHv/bJQn6k6WTQ9gy8qzZBwYmfF2cCAoR1qu8lthh6K1vDmiw
   Dhxpzhk/OKolMXUOBhA/LfJgT4Kay5/i25OR/5hMIfBYfOkSNRD0TJ6dV
   TCakYhWbEj0HFzpu0fds2bVCxWO9KDet8bubWPCD2mx7xapL2ZpYapZVK
   9M6LpmACJZ2zUJm15tNhehYZ0uZfsnAnqQ3ZuG/431JI2BEvcf0ZStG+H
   cExgrUKC/rnECN3/RXwno6cLziPEymohQcY6cra6mDPmO6WkG6vCaJN4O
   tdC8CFOa82wY0EUXEy7Sj1rmnXr5YYeGrZrWD+lu83QeRedFTwRTi9+v9
   w==;
X-CSE-ConnectionGUID: n0BqvstSTrWJTquL+npnKw==
X-CSE-MsgGUID: gNk8fwG5SPW35iu3hrjoyg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636120"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:18 +0100
X-CheckPoint: {67A5C626-14-2D67083E-CAF60585}
X-MAIL-CPID: 936AED959B21081A840AE6DDA0361249_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3599168346;
	Fri,  7 Feb 2025 09:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFW0TtEuC1R227YTpxajrq5OhUhBVT+uUuYSWlEy4yY=;
	b=rpZ5t3j6zGVXzHvc5pVK36cwbQdd67GRr60fiDBrJBSz2RbVwYta741gGtgSDmcoe3tT0k
	qzI6wFbBqsn/Za+gwNiEPplEWOyrna3QS+zUnlrj+NCmO7PA3usGHROX8d+3XigvoHWwUT
	DxsIaYkCjDz2dEy2Bl93uEH0d00GNCzpsQCGA8Z7pv9uKdNsn5bxfHY14r61SB8wzR2usP
	zx0v7A9eed19LtAf6P3/WjHypnqQ9tV2tQzTMbv6w92MCnHgAoMWJbHTQ68FgYq+AiUqRx
	AZMm5cS1PzOP3Jp4px6a/e95aOZQJlKDCe7MnASkbSHG9KYqExF6Q7R2MDPNdA==
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
Subject: [PATCH v2 09/10] arm64: dts: imx8mq: Add i.MX8M OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:14 +0100
Message-Id: <20250207083616.1442887-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These definitions define the location of corresponding disable bits
in OCOTP peripheral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
new file mode 100644
index 0000000000000..d991d57816264
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mq-ocotp.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MQ_OCOTP_H
+#define __DTS_IMX8MQ_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MQ_OCOTP_M4_DISABLE		20 8
+#define IMX8MQ_OCOTP_M4_MPU_DISABLE	20 9
+#define IMX8MQ_OCOTP_M4_FPU_DISABLE	20 10
+#define IMX8MQ_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MQ_OCOTP_USB_OTG2_DISABLE	20 12
+#define IMX8MQ_OCOTP_DOLBY_DISABLE	20 13
+#define IMX8MQ_OCOTP_VP9_DISABLE	20 18
+#define IMX8MQ_OCOTP_HEVC_DISABLE	20 19
+#define IMX8MQ_OCOTP_AVC_DISABLE	20 20
+#define IMX8MQ_OCOTP_VPU_DISABLE	20 21
+#define IMX8MQ_OCOTP_PCIE1_DISABLE	20 22
+#define IMX8MQ_OCOTP_PCIE2_DISABLE	20 23
+#define IMX8MQ_OCOTP_GPU_DISABLE	20 24
+#define IMX8MQ_OCOTP_HDMI_DISABLE	20 25
+#define IMX8MQ_OCOTP_DC_DISABLE		20 26
+#define IMX8MQ_OCOTP_HDCP_DISABLE	20 27
+#define IMX8MQ_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MQ_OCOTP_ENET_DISABLE	20 29
+#define IMX8MQ_OCOTP_MIPI_CSI1_DISABLE	20 30
+#define IMX8MQ_OCOTP_MIPI_CSI2_DISABLE	20 31
+
+#endif /* __DTS_IMX8MQ_OCOTP_H */
-- 
2.34.1

