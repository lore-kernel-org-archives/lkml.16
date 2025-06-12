Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com [23.90.104.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD12256C80;
	Thu, 12 Jun 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739170; cv=none; b=srQ6qOANhjDTsi+rhCg1VkUNR/R7ZIbB5iS3IgE99prOsFZfBYhiZSyFogXgqW8aildIZaLPweJseX+ov8g6lwTtXROf5A3rCAhGiT51Yvw2q1kluyTcx5zGxXILw1tfY8vk3Z2hn3bw6vtflRN9tUfBaDSGZbP62vA8HRfJ6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739170; c=relaxed/simple;
	bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFIo9IVRqJnBkxMiamvri2vcI7QFmbsqFdY70u+oR8rBsQQKO5RAZsGdOl99tlNLOpMFIZQ2nFVhVjSdE3bVbvBWkl75lr3Z2dF0ROHHdPr7WrFLWVneeQMM+Ee2ZzClETH48v+T0dMLMyGGIcXGp8ngh9/HeplhHWtw3Dj9oDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=Omu73LlD reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="Omu73LlD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739168; x=1781275168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
  b=Omu73LlDLfotXtgfJT/UvlxaqDNQBPrh+synv5fl0DeL2K6yZqTJtCCu
   p9Zr/HW6iNFdPEkZTjBwsMXo9SqCFhWAXnA5rLHBcFKkV0oyNcAmu+dJx
   I15XMy6Wnq6Xf1yAUTlGts6O1CCFDqVVQar3LFlaQUm0s6NnDmrW8z2LA
   Ihiof6qPXDJs6e51qML3Hz+v48m4Bq8zEkLU5rCvdF8NmJD9eL11CtCcy
   oWzVseeyifz82GbPFXAjax6xZjmI20GUBhVLUxar8/rO2A2gSPE0g4wsr
   JsnIIk4v8Jf3OOo4VMUoDenf+x6suGX7qLN0eZShHVxjAwS3w4Ytzv4ns
   w==;
X-CSE-ConnectionGUID: un4Mo7nPRqidx0IW4sWGuw==
X-CSE-MsgGUID: SoOIPtFGRlWQZzle/8EKEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:17 +0300
X-CSE-ConnectionGUID: ZVDzdeJHScyNoWOTNPStaQ==
X-CSE-MsgGUID: LpmPiIX0Rj2MIafJbAzrDQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 12 Jun 2025 17:39:15 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:16 +0300
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
Subject: [PATCH v3 2/7] irqchip/riscv-aplic: use riscv_get_hart_index()
Date: Thu, 12 Jun 2025 17:39:06 +0300
Message-ID: <20250612143911.3224046-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
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

