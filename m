Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24C25B301;
	Thu, 12 Jun 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739171; cv=none; b=fxBtWEgnMTA/Fl4fllm5k36QvQFysELiYngLe7IAwXG8q1Lk/Ihs89P+0SCIItsX5/WCuJLpsnGmS3oEUy/Kdkyc83/dInYwScuh2oj2NpaLOIKOJMEgvVTtbC7mCTGsBAehhM06gJNTGPY8414IDR5rAJVdAr9vpEyDdndW0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739171; c=relaxed/simple;
	bh=6/mZP00EM9rJ5UOmw5xRb/tAHJW+hgPGA9vOCXCI5fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1z2NeJ4bcH9qWDW8vhC9lcDMUbrLBtmNQFlYr80WfEroTYZS/2/j6jVLXgj52Z26kqpoSS6HmYzGvfogOc3kR+i+a/mcFtKCwvRoomhCoymF/nyY5lQ9iKmOM/GkQVdB0KnaBdqg4PaQIEzgei+A9qe6hrsBblq/fb/fnXoBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=VH4DPmyT reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="VH4DPmyT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739169; x=1781275169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6/mZP00EM9rJ5UOmw5xRb/tAHJW+hgPGA9vOCXCI5fo=;
  b=VH4DPmyTHFos//MKp2YWs9r4hvoBIw3NtX6P40Gt3227ue6OMOFCLFKY
   BI+CGwjpp0S2yo7d+fxMMX1vDTcLA3zP+MPp3h8df54KfDIhK+8Qcu1nN
   HVSHj8dq7/KIW7J4D7dBXPqGk+MeDMW5qfvzec+kKkI7F8InoWxfeG+Rf
   8C57CsPQGjwle9DTUL4+UbCZk1b34INCcKbdVIjuQvCeN5HxlOlUC3+4L
   Oy2aqLNNyUdBbiTPGrArt95gMKSCKUyN4dmbC7MeMjKfcwWfkaf/DW4OV
   QBp6GbI/B2Wqk6VY1vND4F08zXYd6y/ZY0/q43STDTgOoxYI9qOkRP8oD
   A==;
X-CSE-ConnectionGUID: TDDXB1duQWqC8XJ4q7vXag==
X-CSE-MsgGUID: 3tM+JvTuSrKjBRyJf9JdkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:22 +0300
X-CSE-ConnectionGUID: coDxqz9uTa2+dzqVxqKfCA==
X-CSE-MsgGUID: JoxQzBbCSY2r56AZOvU54A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:19 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:20 +0300
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
Subject: [PATCH v3 6/7] irqchip/aclint-sswi: reduce data scope
Date: Thu, 12 Jun 2025 17:39:10 +0300
Message-ID: <20250612143911.3224046-7-vladimir.kondratiev@mobileye.com>
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

Move variables to the innermost scope where it is used

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 81d28a53635e..a604c7e1e416 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -68,11 +68,7 @@ static int aclint_sswi_dying_cpu(unsigned int cpu)
 static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 					void __iomem *reg)
 {
-	struct of_phandle_args parent;
-	unsigned long hartid;
-	u32 contexts, i;
-	int rc, cpu;
-	u32 hart_index;
+	u32 contexts;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -80,7 +76,12 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
-	for (i = 0; i < contexts; i++) {
+	for (u32 i = 0; i < contexts; i++) {
+		struct of_phandle_args parent;
+		unsigned long hartid;
+		int rc, cpu;
+		u32 hart_index;
+
 		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
 		if (rc)
 			return rc;
-- 
2.43.0

