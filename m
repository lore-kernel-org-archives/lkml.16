Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280928BAB8;
	Tue, 10 Jun 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550004; cv=none; b=AT/vkFpIOeTz8UdqDHfFZzHmkXZ0CBJ9R/tTJO2tMNQFKHXjEhrF8e6dFWatFJNG750u4wWnHgy86qCctPPE826VMtSJobUNN5+hW5U8Wi+Tctvd8D2Eb3hTaALWlY8dgz2k/9Sxr24s3IntprOWwRLCsqkhEybf/waYUXd2fiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550004; c=relaxed/simple;
	bh=yrAUwdd2dTnCDhtIRwLaXhkYCRfkmhb5FNwQyH1E6+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8az24gQq22UfP5cZ1GSO6Mthdjylg+6ObGFu63WwDNduzi+u4GL+BzFWwb7vbiWwviUOa/tBLHDlEqsD0kkEgQnj8t20W25MZiX+Ucq7v4MwU1fX1hVj73Hc3emwOrIorpiqdMRspaCLexAPqeO5Y4ZN1PxAQlCxmnk7SpnBDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=sAzYpHYv reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="sAzYpHYv"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550003; x=1781086003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yrAUwdd2dTnCDhtIRwLaXhkYCRfkmhb5FNwQyH1E6+k=;
  b=sAzYpHYvDpwjEpddg5J0RJZZ4XE6HzPVsDur84vwLy5fqLbbVjWS6jfQ
   YwQ+zZc4uvuHM8/lQlOByBZvY92hS1LnjSGaeFHhPOTek7IrdN2yraRcW
   I4sT/QH7CkI0yX7XHf2VM4dHQ19IoLFT1sayzJNqmlJaz/VUuIjlCROlm
   0xIKNP47dfa/7z8pYvge/1V5hrzZfvk83aRsECa1c238+6r8Q+NO1yk4T
   oyRy0lQcvb4ZwAyDyhD83x3fIyGGxKTeAUmB6eFwhGXry/+n/R7GHEJvR
   CFusY/o2oSP6gI7rLXD8YRleGl0TtOufZoFkNjMXc/Gf2ymN88U0gRu7N
   w==;
X-CSE-ConnectionGUID: K96KZstaSDax28xZBAQa8w==
X-CSE-MsgGUID: 3t1RRN/LTgmSQNvZxosJ3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:40 +0300
X-CSE-ConnectionGUID: kf7t9c2kS5OjhTjsVC/tJQ==
X-CSE-MsgGUID: m1n8WQB0R5K04I6yn90eAw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 10 Jun 2025 13:06:39 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:39 +0300
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
Subject: [PATCH v2 5/7] irqchip: aslint-sswi: resolve hart index
Date: Tue, 10 Jun 2025 13:05:38 +0300
Message-ID: <20250610100540.2834044-6-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve hart index according to assignment in the
"riscv,hart-indexes" property as defined in [1]

Link: https://github.com/riscvarchive/riscv-aclint [1]
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ec21785df518..186a021beaef 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -71,6 +71,7 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	unsigned long hartid;
 	u32 contexts, i;
 	int rc, cpu;
+	u32 hart_index;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -92,6 +93,11 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
+		rc = riscv_get_hart_index(fwnode, i, &hart_index);
+		if (rc) {
+			pr_warn("%pfwP: hart index [%d] not found\n", fwnode, i);
+			return -EINVAL;
+		}
 		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
-- 
2.43.0

