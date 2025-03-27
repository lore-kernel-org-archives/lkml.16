Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3675218EA8;
	Thu, 27 Mar 2025 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086517; cv=none; b=Bo8X16Sc4eQYn+lCecIZLovit8nGlTIpMY19DgUojQEcoDwcGEWLbNP3CGMgbWQlJ5e3e8ls4p203BIz3gEs/vo86tDnQ1idWt9Oweqcw5DUiTUz3qXSwrmcGXuqjPSWrZd1Kp/vTNygS8Wr9qS3hwNjzdUivHrc/YBnsGYmxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086517; c=relaxed/simple;
	bh=DQk6qJ/KX1OAwGXHbpoo9Na9a4V1m2eb7VlT3lB+Kb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNQNNBQGRQGaGqxoSTHCsIMn80sReXysFAPrSEMNLm1KylGqpOpNq45YfuOCdFMV+JwDVuPvS6XjrVVvnGH9bZVFsxRfM2c0Qv4zEdFTRme/2xvCSkXKmkiXBd9YCsZi27gqyG36yOZqnsh1Yru+pnIogh32IkxhyGrFg3YJ0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pPLTmwij; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kLIafZZ3 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pPLTmwij";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kLIafZZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086515; x=1774622515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmURNj4AromvGqUUkaf231R+Nsz2g5wNqedims7By/Q=;
  b=pPLTmwijqlGXJ6B7IzRbHSbK1/0pAc+u9XgOTAbkOnglbX8Euaqo1301
   DHO3URDYjN+D4KceYrDcCDgR5hEake8GLwY8VthAXcDfepmMDOAgLOC6f
   heScJ38XMeP05dLb92HevSnIXGVHKCrdohyVjJDYYr4mwjeiZW0AMjnIr
   3pkO7Vch4aCc8eYueKuU5YfijZqpHypiqzig4ZTY5JZihMb1bXVC7eZVv
   NtwankgVMN+LSP263SH8Rmvu8zCxFJ3gn+LLNqFFICtQ0zoFXZHou82lY
   LExW+VTbEScoQYf3HhrJc6Ybw1o+Ey5NiZAFYoXxykXD+YAUPf5j9d27c
   Q==;
X-CSE-ConnectionGUID: 7SeO/uEpTdWuMLr8Ge5c1Q==
X-CSE-MsgGUID: U1u2AatXQSixSP4Wx5QPvQ==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199514"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:54 +0100
X-CheckPoint: {67E563B1-2D-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 47167665E6C1DFE25C5FAE0BD2BD087A_4
X-Control-Analysis: str=0001.0A006370.67E563B9.007B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98B7E16C181;
	Thu, 27 Mar 2025 15:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmURNj4AromvGqUUkaf231R+Nsz2g5wNqedims7By/Q=;
	b=kLIafZZ3P9GWucNB+Ymky+WT3scBySFXuu5ob3aRKLLT+STtY8xgQJm80C1Ot/J6CHbetI
	rAW0ZF6f2bTfwaAqusie45QyUEHvJRym/xO6YkZo5e7JuB5tBR0IX3AbIV/rdByRxv+bO8
	WT2TEziigg/fPo5qsD+ZLzIoEzFYQjdI8BhfgJzf0pydp8LYVx0ufFOcl9kg9xvirmcujE
	GtBsxQasttP/u9uvzYficYEHDaOXWzA39YsQYaFf8R4lO87fkMtrlnzU0GQMUJPUqH3hLp
	RcHyuRr1EUPZxqmqx52be2UyhcypXHFVOe8brbTvMKETTP0wKcefZb2T2HN2KA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
Date: Thu, 27 Mar 2025 15:41:09 +0100
Message-ID: <20250327144118.504260-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This add an overlay for using the RGB-to-HDMI bridge.
Note: As DDC is directly connected to general I2C bus, there might be I2C
address conflicts. Hence not all displays might work.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  3 ++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 14759331dba24..225a7665b8ad1 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -6,3 +6,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
+
+ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
new file mode 100644
index 0000000000000..e713a2ecbfc25
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&sii9022a_in>;
+		};
+	};
+};
+
+&hdmi_out {
+	status = "okay";
+};
+
+&sii9022a {
+	status = "okay";
+};
+
+&sii9022a_in {
+	remote-endpoint = <&dcu_out>;
+};
-- 
2.43.0

