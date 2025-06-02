Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25104191F95;
	Mon,  2 Jun 2025 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748842583; cv=none; b=hGxZdbUv4WidfJMcqpZM9tlv2gFKO8CcEt7BB19MblD1f8sE8TPx+usNw4gingCGGRs+ZhEAyScGmLVUIbrGtSCr4VOtp3FtOJwDyWEyHMKDgfXhp6YTOnO/113gQEibNquMHk4Hm2BzOHy7qBd35CNLwLxB1zZvRGykbe7CZXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748842583; c=relaxed/simple;
	bh=GhL0kNqcfcle3qIVF5sXJEBnV++w7E5fWBwfkhBS8f8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HyxMXg6YXmajyOj4Elz5MourOt3E9Kdq6B1fSTmCKLm5eRZXEm4/kuhPTDYMQ4WAtMOmky1Xt62ipdBul7epzl9QV5Fn8cRYNgJyCyscrc4usaCyGkcX/OwTIbgEkzsjT1FU6EpRtlkQ3TGOggRhSiKQW4twq+wM7ulDuU9otLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=oxx2OY7j; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oxx2OY7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842582; x=1780378582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GhL0kNqcfcle3qIVF5sXJEBnV++w7E5fWBwfkhBS8f8=;
  b=oxx2OY7jxNGlb46J8Wvif1RW32yxr6T9toap6tUC/IybSJiEbB3vmH/+
   DXroV4kXqZrSOZ8ySfTAyXRD2NLLC5QoTQgz37L/tKKDUfl+K8hAHohIL
   uJRLq/gtu8eq659fs6pcAQx7aEOSHeTk9/8kZ2BrI98Ygbuz2nqIQscMm
   gldgEJchuiZjzwaaImjLBNpp98c/ANmN1Fk43Mv8Yyj0C205klqvC6ipi
   UMphPdt2MjGTEKD0i2fuhjCLQEtzxc7nX4EoSM1Md2pdTSR4VxKWBoqvv
   LXptsBR/OBrDvdxGezeL7w356bYfWll7i717XdWfgp9S6HVlQ1zxOMNeQ
   A==;
X-CSE-ConnectionGUID: eittDR1XTzS4g4o2E6Cy1A==
X-CSE-MsgGUID: j/fk5qE3SA6Kqm/N9d3YUw==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:36:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:55 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:47 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for microchip nand controller
Date: Mon, 2 Jun 2025 11:05:07 +0530
Message-ID: <20250602053507.25864-5-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add myself as maintainer for microchip nand controller driver

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd844ac8d910..53cc327b8985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16064,9 +16064,10 @@ S:	Maintained
 F:	drivers/mmc/host/atmel-mci.c
 
 MICROCHIP NAND DRIVER
+M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
 L:	linux-mtd@lists.infradead.org
-S:	Orphan
-F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/microchip,*.yaml
 F:	drivers/mtd/nand/raw/atmel/*
 
 MICROCHIP OTPC DRIVER
-- 
2.34.1

