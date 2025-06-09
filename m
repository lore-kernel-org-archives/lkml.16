Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C1253944;
	Mon,  9 Jun 2025 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476953; cv=none; b=j4vAcAodbfIwxRWcutBxQ9Hql9TedKuls9fYC8e7/PASsB+nbEWW8v1bPT/Q5IewxUYGWB2p2UNuwhQDTc5OT9NLfkbkxlEtXljYiN4rHScKp6RvaYK2Z613oSGFTCc/4A2Rus0V+KuDqWUO2RZ6dj7aN5jsboYepp0/U3aAptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476953; c=relaxed/simple;
	bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QU/YcWNeYwwtIFMAkMcz5L+qnpE5l6luvj7E7PP/HzmBjwIf3utMCOdLV5Vzqe0XrfXgI9WxlxHXkBhiBxn3jXmOZm4UnfW24XOKUfvt/2vxAvKlt4GF8s/TpQgCRnFgrpt1m+iCtDwLH4X9wm+55ne77vWkHOtbZQLePUnA7GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=TSRcAYQC reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="TSRcAYQC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476950; x=1781012950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
  b=TSRcAYQCbruyGjMvgPbs7oeI31Qs2ScB6v4ZI9I/YM4u9gT2N/ZejgVS
   lbe+1bUpCSTu8IOeEiUvu6L6TIuboS9iAkI48sGRRnx38ZSyaJ3Gq4HnT
   CTETh2A06uRGH7fg6ZXUvPeJ0zpEMW+xBaKg+sufXhpnzqPYnIDvt7xmU
   wcTDvBzUXi3kpU50wcRZZpWux5FSp8XBlt1roIRTdrFy/lL4Rjhgloay6
   YMWdbw9GPf6Zd8a1wrHYihrkbmDp81H8ypNEA9sKWK6otjOcXJHMxUo/D
   VpbnNNvKiLDHekCp3jzSDkT4vTq4nIQuw/vo6xxK37n96x+B46OuBzVmG
   A==;
X-CSE-ConnectionGUID: 77rEMxDSR6CSt0vSI5PimA==
X-CSE-MsgGUID: qFo4EjTmT9uLjsefXHmH7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:00 +0300
X-CSE-ConnectionGUID: MmBbESj0RKu5qeYrABKKYA==
X-CSE-MsgGUID: sLOGAL7lTY+pxthLsT5BwQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:57 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:58 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 2/7] irqchip: riscv aplic: use riscv_get_hart_index()
Date: Mon,  9 Jun 2025 16:47:44 +0300
Message-ID: <20250609134749.1453835-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use global helper function instead of the local
implementation

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 205ad61d15e4..c2a75bf3d20c 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -219,20 +219,6 @@ static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
 	return 0;
 }
 
-static int aplic_direct_get_hart_index(struct device *dev, u32 logical_index,
-				       u32 *hart_index)
-{
-	const char *prop_hart_index = "riscv,hart-indexes";
-	struct device_node *np = to_of_node(dev->fwnode);
-
-	if (!np || !of_property_present(np, prop_hart_index)) {
-		*hart_index = logical_index;
-		return 0;
-	}
-
-	return of_property_read_u32_index(np, prop_hart_index, logical_index, hart_index);
-}
-
 int aplic_direct_setup(struct device *dev, void __iomem *regs)
 {
 	int i, j, rc, cpu, current_cpu, setup_count = 0;
@@ -279,7 +265,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 		cpumask_set_cpu(cpu, &direct->lmask);
 
 		idc = per_cpu_ptr(&aplic_idcs, cpu);
-		rc = aplic_direct_get_hart_index(dev, i, &idc->hart_index);
+		rc = riscv_get_hart_index(dev->fwnode, i, &idc->hart_index);
 		if (rc) {
 			dev_warn(dev, "hart index not found for IDC%d\n", i);
 			continue;
-- 
2.43.0

