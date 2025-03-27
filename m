Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AE218592;
	Thu, 27 Mar 2025 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086510; cv=none; b=EWujyVJdqsvr6EjEtc/l+fxzp82Hsymps4NI7Sb/D/fCq3pWgXEtf0WYxH9DIUs5k2mVFrLwYxWkzlvFnPUoX2KbvIcvk4Gj4ql510/AYYPsbe8pv/DFWIA3bgHrLSJNGkhisz61Q2CN9BqnWX219vth2Q2THRZrChDDaunLYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086510; c=relaxed/simple;
	bh=/bE7gVD0WmPHBirJZnAIgGK1EcBT5Gqc9kWWYeXbsQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdpxo/wPORJmF40peufWGMKUEs+GPQ3prF2ZXpHDEOdGrTmj6c8FeRDT4vO6juK5PlaHQ1aKZSDNuIxJ9S4ZWBt7b2KWYl3Hlg/cCzI2IF5h2rxhw9xB+B/NbFFltS6ljdxGf4bdqaB3S0DtUu5lRl2pJOQ/5fJaXnMLTxsHN00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KO5AkRsk; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TY5X0g23 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KO5AkRsk";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TY5X0g23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086508; x=1774622508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lko4S3JXCbaDPFC67x8f+DdUyvpSccgX1F0nFB9KHqk=;
  b=KO5AkRskZ7MSvoBcM8k8Rmtq/ov4Q2kFjLR7c3gp8agOfj6rduQY8F6Y
   mnKtCVSp8D6lXVtKbUR4HA6EKWnkWowkLw8pQT2gzMWOFEd6wM2JGOISF
   4X5MHyIWpi3qNCEzaZdvn//6HEoU+qnxsmIJHhQNf6qXdKQqlogtCi0Wb
   +aV5nStHTsrq2G+ufzEgxvhz0w2XLGQUCB+Mhy4NzTNw8JWong5G8M6cT
   F9wADpkSQFpZ9/Z4XedgnYoQY6J9gdVSLhNf6XviuuRksD/7CyHSULYuK
   bKirHmmxLg0tlKLxGWISGtcBQLni/foXkaEj/m89tK6ysaKcvyYBU2XQS
   g==;
X-CSE-ConnectionGUID: dMFUxNSQTY2H3YJbn8He0Q==
X-CSE-MsgGUID: +msudIjTQFq1QwyZnlTCfg==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199507"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:41 +0100
X-CheckPoint: {67E563A5-17-7141A0B0-E6EDEC14}
X-MAIL-CPID: B57B04C1DD94BB85C77A4C766094C62D_3
X-Control-Analysis: str=0001.0A006397.67E5639E.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 379D816C181;
	Thu, 27 Mar 2025 15:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lko4S3JXCbaDPFC67x8f+DdUyvpSccgX1F0nFB9KHqk=;
	b=TY5X0g23Q+YmYeDMOKgTjh1xMwFkiLrS8sOWDei2PWP/yjNRaUX1t4J1o3qbg8zUt2CiCg
	ZoAEnY+rDpi2RoMbAJy6wWav537sC2LaBaYBVMm9WFVRsOQx7OCT9gnDnxbyRiveGzXjOB
	jN4FBuMfFa6Wr36vFA9MbbD1H6m+BTGe5V3XBda6QWWGo2PmawI4mIEWpKktMTYHNp5eC5
	x06Jt+KZ2k1aTOcVccqJfxFYwafl4goEWSCo+w+qX2WxE6OBXoG2NPGYsG5l5jy5uk7Rll
	aKoflzewZcCXgXRBnsveSTPArzg0/7cELp5aDxtZFIvEdfnv0DfoG2zmiFLUAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: ls1021a-tqmals1021a: Fix license
Date: Thu, 27 Mar 2025 15:41:07 +0100
Message-ID: <20250327144118.504260-2-alexander.stein@ew.tq-group.com>
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

With commit 784bdc6f2697c ("ARM: dts: ls1021a: change to use SPDX
identifiers") the SoC .dtsi specifies the license using SPDX tags.
Fix license according to the ls1021a.dtsi this platform DT files
are based on.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 34636fcdfd6ad..27a55fa638128 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
index 1b13851ad9970..f7fe8581a23fa 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
  * Copyright 2013-2014 Freescale Semiconductor, Inc.
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
-- 
2.43.0

