Received: from mail-m49214.qiye.163.com (mail-m49214.qiye.163.com [45.254.49.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CC7274672
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422808; cv=none; b=Zy6qiSXBlMMC/b3tgM4ZF95MbTnr/UiGB1n41C5TdqCTyncDR6DjspHZNtH9gGBfk6BIJUm8PYNwr8sTHtWfs7+e/YOrC8ROnmDunGGrR2vYml6Vl/rt5JTx/0qWh5gu9HI0lrOkuozI9uBh7/Nh2H+6qQk1htvb727lv3swf5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422808; c=relaxed/simple;
	bh=EuXuYkDo1o5KrLt25JOmWK/qp2TMdbRtUyt21UKJNgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=erKP3l3mUc1pn/SldDv6p483gcfhAWZWYd2wWXivVtLwfn6VDj23vO+qwL/LS6KuciMugHgXyYjzp+B2tCbiAl3kzgPRr4loEN2WavQwxpGs6XLTaO4fnjhRE/GbUvjto46LBmjyy+oYSapGjv+kV9l2im2Fc5r+EYwUqGmo4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=fzbcvMbE; arc=none smtp.client-ip=45.254.49.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="fzbcvMbE"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a600;
	Wed, 28 May 2025 16:54:50 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 3/9] arm64: Kconfig: add ARCH_BST for bst silicons
Date: Wed, 28 May 2025 16:54:48 +0800
Message-Id: <20250528085448.481215-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkweVkxIHk5NQ0odGEtIHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619f7fb09cckunm1df45544397d65
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6Tww*ATE9SUgaUQ4eOTwo
	ARYaCTBVSlVKTE9DT0lJT0JKSUtCVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlKS0M3Bg++
DKIM-Signature:a=rsa-sha256;
	b=fzbcvMbEvlYVr0wt5EPNZgCA5rXTs2U7dhvQJAbRtzgVHAsCS5Cvg4hOxwgBUrd8CRJFibFzto2IjKmYqN17IH0V3JMwBpxiv2grOGxbBOt0m/+FqMUYNtmj+wdxTOpqbcI5g1knbQfesXvU6BJVdwYe9EIxfwM/+h+jFSX9NlM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=iEZLHnOAnC5Fjxf5PftzrFh1zmB57EKpYCQRLtF1988=;
	h=date:mime-version:subject:message-id:from;

Add ARCH_BST for bst SoC series support.
Add ARCH_BSTC1200 for BSTC1200 platform.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/Kconfig.platforms | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..b94c8c5d038c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -402,4 +402,23 @@ config ARCH_ZYNQMP
 	help
 	  This enables support for Xilinx ZynqMP Family
 
+config ARCH_BSTC1200
+	bool "BSTC1200 Platforms"
+	select SOC_NONCOHERENT
+	help
+	  This enables support for Black Sesame Technologies C1200 series SoCs.
+	  The BST C1200 is an automotive-grade SoC designed for ADAS and
+	  autonomous driving applications. It features ARM Cortex-A78 cores,
+	  dedicated AI accelerators, and various automotive interfaces.
+
+config ARCH_BST
+	bool "BST Platforms"
+	select SOC_NONCOHERENT
+	help
+	  This enables support for Black Sesame Technologies (BST) SoC family.
+	  BST is a leading provider of automotive-grade AI chips and solutions.
+	  Their SoC products integrate high-performance CPU cores, AI accelerators,
+	  and comprehensive automotive interfaces for ADAS and autonomous driving
+	  applications.
+
 endmenu # "Platform selection"
-- 
2.25.1

