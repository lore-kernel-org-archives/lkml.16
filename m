Received: from esa3.hc555-34.eu.iphmx.com (esa3.hc555-34.eu.iphmx.com [207.54.77.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F828C2B2;
	Tue, 10 Jun 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550005; cv=none; b=dEKnqGsI4JCMeG82/bXqrF3RMgnJiIHG7V3/GT1fuaGsVou4hmjj2PMvgh/Tzcrn+xa8HhrZPizbay4dVWqyuXyRjF/orLrbfJMchNVGcfmp55nZ1d3Vn5g9DvkDwonw8TeK48p9E0kB00Tn66OgIvVsljhyc2uMCXvtJpa/w1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550005; c=relaxed/simple;
	bh=lPz7wkEBE69zrXNtMCgnkyFvmJop4UtCSyWeiYqIwfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZciV8mi8OdhOAVA0JYQJaqRDEWx/Qc1i2ynSJGKz/lljFyIPUjEgR/4VIgwJGOgdJm3oanCNfQvc8V+eJgu6sc2z4XZ6ELuktZWJ0MYjsOpm4OzDp7UEhzcAnYasZKEnbx/fQnR8FtRjqCFoh5I/3LFdCmxj477T73UoMfVxRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=gU6U4WlK reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="gU6U4WlK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550004; x=1781086004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lPz7wkEBE69zrXNtMCgnkyFvmJop4UtCSyWeiYqIwfA=;
  b=gU6U4WlKwFNqXFAewbsenvWaMMO6i0C5WsUs2LB3I0lAOqXXY6tEyalt
   ZQj3SsSVnnG++MI9Hnibj57Nci6R8QZEWW+ex93UZvhlfhOMzM7/NtKaR
   2U9Ody0794ZSOACSZNpK4LeCdeGyK5xbM87EnEx7BLaCW3n3V29ph2H74
   V+75FAVsbhw3bh1TpzCewElqgGswSePxxyxu3D3Y5mlJgHTypfLeNuAKM
   68ZWr2fkYOy0eK5BdJhYoPcS7kw78Aqfd/FPgZncR/RzsYKwKcCKteNRR
   0S0ILH2PDw2pn8z+N2qkJpJ4hjpC2itwjSsuH98xO4aRdRilBbC4pB43m
   g==;
X-CSE-ConnectionGUID: TSqU/aK9R1y2qCI6ux7EpA==
X-CSE-MsgGUID: NojkzEXeQLe+V1qQZVgAZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:43 +0300
X-CSE-ConnectionGUID: ax2a7oOURvuO1SiclmLw5w==
X-CSE-MsgGUID: VpswVmopSHSN8kdMQv7iGg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:41 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:41 +0300
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
Subject: [PATCH v2 7/7] irqchip: aclint-sswi: remove extra includes
Date: Tue, 10 Jun 2025 13:05:40 +0300
Message-ID: <20250610100540.2834044-8-vladimir.kondratiev@mobileye.com>
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

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 3aa074004dca..dc437a4f82db 100644
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

