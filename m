Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683725C6F3;
	Thu, 12 Jun 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739174; cv=none; b=RwrX4hsDzCKJXfrna9cFC7uusm9gOgRBdPJhwP1FjNZNh0NVe0N8EHwUFXX6Ne618/jD7/a2vU5zQF7XTHUal7w1k+pOjidNTBPdMT8m7vmoIY9dx3r4Mp991GpdwRBUI43gIz/+VA2MVt9vIpAPHXupyqyGyIlGH35T/xBNb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739174; c=relaxed/simple;
	bh=qHQZtgOUSppdb/h/ZBO+JNEWe7/fBqOyl/vdXLNJOYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSVpKymn1VPkIU60q5eMqJmicmFs11Vb6+9SvpPoO0tQzU6Lo65yYmeUUhYBKsa54QXJjheKmR/eY21i/WsgNCrhMMS+UGSfEmGWYOdqsfa0EAow931WaH3CJEm/s+shIBTbQJZX2cibw7mGGpAovULk9gfnuN3FFuwLP4KDeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=kgzSfWck reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="kgzSfWck"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749739172; x=1781275172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qHQZtgOUSppdb/h/ZBO+JNEWe7/fBqOyl/vdXLNJOYQ=;
  b=kgzSfWckRi4vY3UEu1Nl1Hs0j5UGGjyJYqzhmn8MsnwG5ds24v3yrv7X
   n/v/gFB3mr44se1FYlO+G0RUA2xdNlZLVnbe64RAjVs86JwNd5LVKmjJ/
   goDiuUMo+LxLMbqL9SbhIRv7N/FU9IFg0D9KLNfqHXbITA+BlBCLxB6XQ
   nLQPezNce/hdQATjfRVHQZ6CXVNoQkK90+XG0drCg2loFNCEvfGWQq7St
   tk1s62BtAdaEWzgORmrbj4Lm0hEzzc90V2n12CxAEVdWphYzmikEIDvNn
   Gyt30dZiF7Iy/Q0CrJ1yhrofNIhIoy9fuuKEY4bWAwO4f+2tjwWLrNZpq
   Q==;
X-CSE-ConnectionGUID: TDDXB1duQWqC8XJ4q7vXag==
X-CSE-MsgGUID: cRubhSHCS3KghFXFcfDXag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 17:39:22 +0300
X-CSE-ConnectionGUID: 7KsuaaKlTxqTEHgxHTSWtg==
X-CSE-MsgGUID: pZwLk6cwTG2vxbWmD9CagA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces02_data.me-corp.lan with SMTP; 12 Jun 2025 17:39:21 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Thu, 12 Jun 2025 17:39:21 +0300
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
Subject: [PATCH v3 7/7] irqchip/aclint-sswi: remove extra includes
Date: Thu, 12 Jun 2025 17:39:11 +0300
Message-ID: <20250612143911.3224046-8-vladimir.kondratiev@mobileye.com>
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

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index a604c7e1e416..51ecb509a984 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -7,15 +7,9 @@
 
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
-#include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pci.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
 #include <linux/string_choices.h>
-- 
2.43.0

