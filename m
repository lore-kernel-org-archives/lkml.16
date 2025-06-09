Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7A25D21A;
	Mon,  9 Jun 2025 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477079; cv=none; b=pFQh9OvCeerhrlvmM4q99U8HfXucXeiSGlm1eYPvYLkiyrpcApesCeNYkbDJy6rkGehy/Ahm7FpKj/bSRFELE0Y0edgh4gIFUaRcS2xb89IMdE2pTd4/qUuzRDxEz2CcUMbP4YlU5SRUWYHQu8KWibKpOTOrydxniQSAKXziOuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477079; c=relaxed/simple;
	bh=fqYRG7jDDx4YQw7aVy2wUKiuTgsr4Es3ewSbJM3zybc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZRhhnDb17qd3WcjS9n73gLh8M1fnl6raD9L6JvxrSC8YY/LsUx+nHAQy/W/ysv7C7ERIIL/Q6ZR5nziV45ciE25Iw5H8hH3SSogMBJECc3nZHm2F0nt6AKhzZ73SEZbXLUdm0MeDt5fkoA8Hi681k5+bnidgE5VHmBXZhXUHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=f/PZ6Y2h reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="f/PZ6Y2h"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749477077; x=1781013077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fqYRG7jDDx4YQw7aVy2wUKiuTgsr4Es3ewSbJM3zybc=;
  b=f/PZ6Y2hp/TcjqrNwBdL7h/Omgs3I5FK5b9Qs3FLAQdDa8p0dH0V5USk
   pX0vjexfaPfMCN+TuutWBDFm2CDf/riyPeJ58wis2DkeWzafzhJz7EYjN
   jiPy7Wz/0kM1OSZ25rUNwo2sTZR+8N0CoX0ELIgfNgnc7fTVxLHIPoRfb
   jKnrzVcfi8fTUquBSe8ZLrcaxSm26ENNiRvVTQRCtJGyTGGNV71CFywPN
   TfffURtEPBhV+CvFaLYKvWS1JafMUDRo/dDj9YAkGfB+IfSauas1p5KMS
   jRs9lKL4pM2cthscIt5YLECw64QVQWVjxJqOU484O1jhWaZifOazurldC
   w==;
X-CSE-ConnectionGUID: jiJ3+IoTQGWyA+Syk7PYXA==
X-CSE-MsgGUID: raQ8CAdvQZGygOHeG7021w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:05 +0300
X-CSE-ConnectionGUID: VUf2VHQNSVqxtMvZppHXIA==
X-CSE-MsgGUID: NLKxT+TjQ76acWYYljOq3A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 09 Jun 2025 16:48:03 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:48:04 +0300
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
Subject: [PATCH v1 7/7] irqchip: aclint-sswi: remove extra includes
Date: Mon,  9 Jun 2025 16:47:49 +0300
Message-ID: <20250609134749.1453835-8-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
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
index 92237fb44855..9c0f75df6e8e 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -6,15 +6,9 @@
 #define pr_fmt(fmt) "aclint-sswi: " fmt
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

