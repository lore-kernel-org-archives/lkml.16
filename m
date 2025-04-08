Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECA265CB0;
	Tue,  8 Apr 2025 09:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104697; cv=none; b=kdZiZMXH+pdm8mPobuqCxxAZb9Ie8YIu53ZbZhvKN6T8o8DHAAYckLkMsgS25xpf0VxjH0TkGWJiHj2XxmGcQkjjvKoM8I6qmFOBq2KjQU+2uXv7Nbio+LrD0VaGLUtuLB/hww813Jo3JbOuFEL+RLeHUAgf2OvGEh4bvr719I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104697; c=relaxed/simple;
	bh=G5xj9j0efrC3N99Nf8kAjp/+6DSPyu8ymmPavJTCzFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTlQ+T2GCZxkNJVGMACIlvZ9vVuj1VloqQOVAEmpIJuj5Lhqf+Fu+b3AJaO8g9todzudk2FAvTu3KnBOdZneHm9xMXKBSc9Th1x3DeZBVMOSQSeNznU18umi0mD3IsDCSv/Eu0+x58KV6VpCRx8WZP/L0zhB3nThRSPAyA78M2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Hp3NuvSS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Z5562KSn reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Hp3NuvSS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Z5562KSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104695; x=1775640695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xVN//MuR4wm6RUmqVn0fG6wm0+/9v921P5UHDogrHwg=;
  b=Hp3NuvSS1LBYMCdtCSFReWrGBxIwFlcpdnJ8Af7FhHy8FxoQXGxGAt2b
   VnsYYwFEasQ+Ma53DLzX0eTA/pYzua9GmzVRtFsy0zHqGh4r8RZGZVOUr
   aGQN7u34YTZbIot5mCjy1JrSZrqiFcxbAoAtD87lO+dBWKkoss47nRj6+
   O59q3CYfQLKaU4b14vH5pWqDqpSnQA+XgZAo6RpxbObNox7xSQRAP69Nd
   I+Uf2t3+1Zx4t/m9wwMl+JJpTUfhMmFLtrhHkwHY2+LJt0w5rm/uh6PtZ
   EyVmIY12BLhA00SubNOT6xc1eB+A8qMz4jyuUZ3dPWxUkASZNNSxf49S5
   g==;
X-CSE-ConnectionGUID: ynzVERnIQKmWPsPEt8TdYg==
X-CSE-MsgGUID: 0ibdHDc9Ta60iCwm60/znw==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397369"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:32 +0200
X-CheckPoint: {67F4ECF4-19-2417938-F0170C2B}
X-MAIL-CPID: C7C12BB62A1A0985F39A56B6586A990E_2
X-Control-Analysis: str=0001.0A00639A.67F4ECEF.006B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A53AD169635;
	Tue,  8 Apr 2025 11:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVN//MuR4wm6RUmqVn0fG6wm0+/9v921P5UHDogrHwg=;
	b=Z5562KSnIZtr6IocODh6/+XRXyiIs7RhQvVrNwFTpj9ss/L/yKT9mFtUb0dd5VH6O68e9w
	6I8rWGkt707mn4pwOTHIpybPi8HJz7tU2L8IJEJMJl644Az71xMYKE5YZfEiM6ljE6/tDX
	3BlqjK3A926Gu+bqSOYF24LvGiIZAR3cvwwmMnSyllbTLg5TTRbNL+lZjp/jToPYKGGwN0
	ix2QasvSfKhSQIqb0Y8tCH6JWHS/m4eOpFLNiZmI6bmiR06aM7c/RgcV+Uo1U4hyd4669c
	VAahsrY7Cqpz8+zDuWM2RMVpFbRJw69d0O/LrpqL/mWOczw/h91yqeRkNwaFug==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 3/7] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
Date: Tue,  8 Apr 2025 11:30:50 +0200
Message-ID: <20250408093059.551700-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

