Received: from mail-m1973179.qiye.163.com (mail-m1973179.qiye.163.com [220.197.31.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D3204863;
	Wed, 28 May 2025 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422821; cv=none; b=Sp1pmOpo+a1FKaixXjACOByU3JKiiZK2Z/25AFrOfQP9OJafacykcoyHTP357i5pfGWMKwfR9WrkC1yiHw7DrerqSDzp8H6kb04ctpXXmf1h6xEcLtgSQb+aXxD7ScChe2JMpLIfJG1+GhzZadppIgxd2VNlBv6HB5LFRbuMijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422821; c=relaxed/simple;
	bh=X/MD3G4gZsOjeMD3V8yoxH5wnIUw1/82HNss6FAyon8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MBhnO6QLhDaFTEPK2m1Kg2mYrgBkHLQTpRH0wv3sx1Y6VXN+6f72NF7loDhFvhsBIdKB7nW64iTKKZxOi5yRhDQAkLLxEYP4qmHeUPVTNPZqKHZttG8cCuVG+A34VLua5fxOmV5jV+2EplzL/1eqMHkKQpHkSpTbGpQOLC+RyY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=RWZpBAh1; arc=none smtp.client-ip=220.197.31.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="RWZpBAh1"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a660;
	Wed, 28 May 2025 16:55:06 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Ge Gordon <gordon.ge@bst.ai>,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 9/9] MAINTAINERS: add and consolidate Black Sesame Technologies (BST) ARM SoC support
Date: Wed, 28 May 2025 16:55:05 +0800
Message-Id: <20250528085505.481528-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSx9MVkhISEwaShlCGEMfGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97161a390a09cckunm659b5889397f80
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Tio6SDErUUhJUQEaA006
	Nj8KFA1VSlVKTE9DT0lJTktDS09OVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlLSEI3Bg++
DKIM-Signature:a=rsa-sha256;
	b=RWZpBAh1fGfLMJpoYTt6PtSpELwzLBsjUcJeeW26Ih/RUg/yH4ehq4TnoAsYRitc5c2pwtsACcrssFpQDe1P6JjpFK6JcgyvWSSDNrdzZ7ue1tQJzWf+b1N6gzXArVEBYnbHYKs9grlGA1e6qfghLZ2cOWYvogBYbNke81y/O8k=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=SCVFvE+0aCV815j3Mi3WbiNx63axYW383HrgjWVn7Rg=;
	h=date:mime-version:subject:message-id:from;

Add and consolidate the MAINTAINERS entry for Black Sesame Technologies
ARM SoC support. This entry covers device tree bindings, drivers, and board
files for BST SoCs, including MMC, and platform support.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48dd6726fe6..05df62c40021 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,6 +2373,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/arm/blaize.yaml
 F:	arch/arm64/boot/dts/blaize/
 
+ARM/BST SOC SUPPORT
+M:	Ge Gordon <gordon.ge@bst.ai>
+R:	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/bst.yaml
+F:	Documentation/devicetree/bindings/mmc/bst,dwcmshc-sdhci.yaml
+F:	arch/arm64/boot/dts/bst/
+F:	drivers/mmc/host/sdhci-of-bst-c1200.c
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Andre Przywara <andre.przywara@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1

